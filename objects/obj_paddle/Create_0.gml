/// @description Paddle initialization

window_set_fullscreen(true)

#region // States
state_ready = function () {
	if (mouse_check_button_pressed(mb_left)) {
		create_ball()
		state = state_free
	}
	movement()
}
state_free = function () {
	if (instance_number(obj_ball) == 0) {
		state = state_ready
		life -= 1
		if (life == 0) {
			state = state_lock	
		}
	}
	movement()
}
state_lock = function () {
	move_to_center()	
}
#endregion

// Variables
recoil = 0
state = state_ready
life = 3

#region // Functions
function movement () {
	image_index = 0
	
	recoil = lerp(recoil, 0, 0.1)
	y = ystart + recoil

	image_angle += (x - mouse_x) / 5
	image_angle = lerp(image_angle, 0, 0.2)
	image_angle = clamp(image_angle, -45, 45)

	x = lerp(x, mouse_x, 0.5)
	x = clamp(x, sprite_width/2, room_width - sprite_width/2)	
}
function move_to_center () {
	image_index = 1
	
	recoil = lerp(recoil, 0, 0.1)
	image_angle = lerp(image_angle, 0, 0.2)
	x = lerp(x, room_width/2, 0.5)
}
function create_ball () {
	var _dir_x = lengthdir_x(sprite_get_width(spr_ball), image_angle-90)
	var _dir_y = lengthdir_y(sprite_get_width(spr_ball), image_angle-90)
	var _ball = instance_create_layer(x - _dir_x, y - _dir_y, "Ball", obj_ball)
	_ball.direction = image_angle - 90
	_ball.x_velocity = lengthdir_x(BALL_SPEED, _ball.direction)
	_ball.y_velocity = lengthdir_y(BALL_SPEED, _ball.direction)
}
#endregion