extends Sprite

var alive = 0 setget set_alive

func set_alive(val):
	alive = val
	if val==1:
		visible = true
	else:
		visible = false
