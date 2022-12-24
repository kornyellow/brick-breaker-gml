/// @description Paddle processing

var _dt = delta_time / 1000000

// Movement
left = x
right = x+PADDLE_WIDTH
top = y
bottom = y+PADDLE_HEIGHT

var _key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))

var _move = _key_right - _key_left

velocity = _move * PADDLE_SPEED
x += velocity * _dt

// Clamp
x = clamp(x, 0, room_width-PADDLE_WIDTH)