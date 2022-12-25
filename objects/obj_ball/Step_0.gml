/// @description Ball processing

var _dt = delta_time / 1000000
var _paddle_half = sprite_get_width(spr_paddle)*0.5

// Update image_angle
image_angle = direction

#region // Horizontal Collision

// Collision with paddle
if (place_meeting(x + x_velocity * _dt, y, obj_paddle)) {
	while (!place_meeting(x + sign(x_velocity), y, obj_paddle)) {
		x += sign(x_velocity)	
	}
	direction = point_direction(x, y, obj_paddle.x, obj_paddle.y)
	direction = clamp(direction, 225, 315) + obj_paddle.image_angle
	x_velocity = -lengthdir_x(BALL_SPEED, direction)
	y_velocity = -lengthdir_y(BALL_SPEED, direction)
	
	obj_paddle.recoil = ((_paddle_half-abs(x - obj_paddle.x)) / _paddle_half) * 8
	obj_paddle.image_angle += ((obj_paddle.x - x) / _paddle_half) * 8
}

// Collision with walls
if (place_meeting(x + x_velocity * _dt, y, obj_wall)) {
	while (!place_meeting(x + sign(x_velocity), y, obj_wall)) {
		x += sign(x_velocity)	
	}
	x_velocity = -x_velocity
}
x += x_velocity * _dt

#endregion
#region // Vertical Collision

// Collision with paddle
if (place_meeting(x, y + y_velocity * _dt, obj_paddle)) {
	while (!place_meeting(x, y + sign(y_velocity), obj_paddle)) {
		y += sign(y_velocity)
	}
	direction = point_direction(x, y, obj_paddle.x, obj_paddle.y)
	direction = clamp(direction, 225, 315) + obj_paddle.image_angle
	x_velocity = -lengthdir_x(BALL_SPEED, direction)
	y_velocity = -lengthdir_y(BALL_SPEED, direction)
	
	obj_paddle.recoil = ((_paddle_half-abs(x - obj_paddle.x)) / _paddle_half) * 8
	obj_paddle.image_angle += ((obj_paddle.x - x) / _paddle_half) * 8
}

// Collision with walls
if (place_meeting(x, y + y_velocity * _dt, obj_wall)) {
	while (!place_meeting(x, y + sign(y_velocity), obj_wall)) {
		y += sign(y_velocity)
	}
	y_velocity = -y_velocity
}
y += y_velocity * _dt

#endregion