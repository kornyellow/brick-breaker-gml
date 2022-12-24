/// @description Ball drawing

draw_set_colour(c_white)
draw_circle(x, y, BALL_RADIUS, false)

draw_set_colour(c_red)
draw_circle(left, y, 2, false)
draw_circle(right, y, 2, false)
draw_circle(x, top, 2, false)
draw_circle(x, bottom, 2, false)