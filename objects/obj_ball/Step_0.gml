/// @description Ball processing

// Deltatime
var _dt = delta_time / 1000000

// Update image_angle
image_angle = direction

// Horizontal Collision
horizontal_collision(obj_paddle, ball_reflect)
horizontal_collision(obj_wall, destroy_brick_x)
x += x_velocity * _dt

// Vertical Collision
vertical_collision(obj_paddle, ball_reflect)
vertical_collision(obj_wall, destroy_brick_y)
y += y_velocity * _dt