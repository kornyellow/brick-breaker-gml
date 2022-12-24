/// @description Paddle initialization

window_set_fullscreen(true)

// Constant
PADDLE_SPEED = 400

PADDLE_WIDTH = 96
PADDLE_HEIGHT = 64

PADDLE_X_START = room_width*0.5 - PADDLE_WIDTH*0.5
PADDLE_Y_START = room_height-128

// Variables
velocity = 0

// Setup
x = PADDLE_X_START
y = PADDLE_Y_START
left = x
right = x+PADDLE_WIDTH
top = y
bottom = y+PADDLE_HEIGHT