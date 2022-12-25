/// @description Paddle initialization

window_set_fullscreen(true)

// Constant
enum PADDLE_STATE {
	PADDLE_READY,
	PADDLE_FREE,
	PADDLE_LOCK
}

// Variables
recoil = 0

state = PADDLE_STATE.PADDLE_READY
health = 3