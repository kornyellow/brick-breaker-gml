/// @description Paddle drawing

draw_self()

// Draw ball in ready state
if (state == state_ready) {
	var _dir_x = lengthdir_x(sprite_get_width(spr_ball), image_angle-90)
	var _dir_y = lengthdir_y(sprite_get_width(spr_ball), image_angle-90)
	draw_sprite_ext(spr_ball, 0, x-_dir_x, y-_dir_y, 1, 1, image_angle-90, c_white, 1)
}