/// @description Ball initialization

// Constant
BALL_SPEED = 400

BALL_RADIUS = 8

BALL_X_START = room_width*0.5
BALL_Y_START = room_height*0.5

// Variables
direction = random(360)
x_velocity = lengthdir_x(BALL_SPEED, direction)
y_velocity = lengthdir_y(BALL_SPEED, direction)

// Setup
x = BALL_X_START
y = BALL_Y_START
left = x-BALL_RADIUS
right = x+BALL_RADIUS
top = y-BALL_RADIUS
bottom = y+BALL_RADIUS