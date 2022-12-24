/// @description Ball processing

var _dt = delta_time / 1000000

// Collision with walls
if (left + x_velocity*_dt <= 0 or right + x_velocity*_dt >= room_width) {
	x_velocity = -x_velocity
}
x += x_velocity * _dt

// Collision with walls
if (top + y_velocity*_dt <= 0 or bottom + y_velocity*_dt >= room_height) {
	y_velocity = -y_velocity
}
y += y_velocity * _dt

// Movement
left = x-BALL_RADIUS
right = x+BALL_RADIUS
top = y-BALL_RADIUS
bottom = y+BALL_RADIUS

// Collision with paddle
if (instance_number(obj_paddle) != 0) {
	if (left >= obj_paddle.left and right <= obj_paddle.right and top >= obj_paddle.top and bottom <= obj_paddle.bottom) {
		var angle_of_incidence = (x - (obj_paddle.x + obj_paddle.PADDLE_WIDTH*0.5)) / (obj_paddle.PADDLE_WIDTH*0.5)
        var angle_of_reflection = -angle_of_incidence
        
        x_velocity = BALL_SPEED * cos(angle_of_reflection)
        y_velocity = -abs(BALL_SPEED * sin(angle_of_reflection))
	}
}