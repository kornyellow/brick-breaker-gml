/// @description Paddle processing

if (keyboard_check_pressed(ord("R"))) {
	game_restart()	
}

// State
if (state == PADDLE_STATE.PADDLE_READY) {
	if (mouse_check_button_pressed(mb_left)) {
		state = PADDLE_STATE.PADDLE_FREE
		
		var _dir_x = lengthdir_x(sprite_get_width(spr_ball), image_angle-90)
		var _dir_y = lengthdir_y(sprite_get_width(spr_ball), image_angle-90)
		var _ball = instance_create_layer(x - _dir_x, y - _dir_y, "Ball", obj_ball)
		_ball.direction = image_angle - 90
		_ball.x_velocity = lengthdir_x(BALL_SPEED, _ball.direction)
		_ball.y_velocity = lengthdir_y(BALL_SPEED, _ball.direction)
	}
}

// Movement
recoil = lerp(recoil, 0, 0.1)
y = ystart + recoil

image_angle += (x - mouse_x) / 5
image_angle = lerp(image_angle, 0, 0.2)
image_angle = clamp(image_angle, -45, 45)

x = lerp(x, mouse_x, 0.5)

// Clamp
x = clamp(x, sprite_width/2, room_width - sprite_width/2)