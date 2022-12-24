/// @function ball_intersect(paddle, ball);
/// @param paddle
/// @param ball
function ball_intersect(paddle, ball) {
    return not (ball.left > paddle.right or
				ball.right < paddle.left or
				ball.top > paddle.bottom or
				ball.bottom < paddle.top)
}