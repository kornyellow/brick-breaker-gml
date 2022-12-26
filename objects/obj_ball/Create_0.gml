/// @description Ball initialization

// Constant
#macro BALL_SPEED 250

// Variables
x_velocity = 0
y_velocity = 0

#region // Functions
function horizontal_collision (_with_obj, _action) {
	var _dt = delta_time / 1000000
	var _inst = instance_place(x + x_velocity * _dt, y, _with_obj)
	if (_inst != noone) {
		var _tries = abs(x_velocity * _dt)*2
		while (!place_meeting(x + sign(x_velocity), y, _with_obj) and _tries > 0) {
			x += sign(x_velocity)
			_tries -= 1
		}
		_action(_inst)
	}
}
function vertical_collision (_with_obj, _action) {
	var _dt = delta_time / 1000000
	var _inst = instance_place(x, y + y_velocity * _dt, _with_obj)
	if (_inst != noone) {
		var _tries = abs(y_velocity * _dt)*2
		while (!place_meeting(x, y + sign(y_velocity), _with_obj) and _tries > 0) {
			y += sign(y_velocity)
			_tries -= 1
		}
		_action(_inst)
	}
}
function ball_reflect () {
	var _paddle_half = sprite_get_width(spr_paddle)*0.5
	direction = point_direction(x, y, obj_paddle.x, obj_paddle.y)
	direction = clamp(direction, 225, 315) + obj_paddle.image_angle
	x_velocity = -lengthdir_x(BALL_SPEED, direction)
	y_velocity = -lengthdir_y(BALL_SPEED, direction)
	
	obj_paddle.recoil = ((_paddle_half-abs(x - obj_paddle.x)) / _paddle_half) * 8
	obj_paddle.image_angle += ((obj_paddle.x - x) / _paddle_half) * 8
}
function destroy_brick(_inst) {
	if (_inst.object_index == obj_brick)
		_inst.life -= 1
}
function destroy_brick_x(_inst) {
	x_velocity = -x_velocity
	destroy_brick(_inst)
}
function destroy_brick_y(_inst) {
	y_velocity = -y_velocity
	destroy_brick(_inst)
}
#endregion