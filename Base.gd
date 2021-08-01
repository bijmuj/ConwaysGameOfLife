extends Node2D

enum{
	STARTING
	READY,
	PAUSED,
	PLAYING
}


onready var Grid = preload("res://Grid/Grid.tscn")
onready var pause_menu = $PauseMenu
onready var start_menu = $StartMenu
onready var step_timer = $StepTimer

var grid
var state = STARTING
var step = 0.01

func _ready():
	pause_menu.control.hide()
	OS.set_window_size(Vector2(1000, 1000))

func _physics_process(delta):
	match state:
		STARTING:
			pass
			
		READY:
			if Input.is_action_pressed("left_click"):
				grid.edit_cell(1)
			if Input.is_action_pressed("right_click"):
				grid.edit_cell(0)
			if Input.is_action_just_pressed("ui_accept"):
				state = PLAYING
				
		PAUSED:
			grid.hide()
			pause_menu.control.show()
		
		PLAYING:
			grid.show()
			if Input.is_action_just_pressed("ui_cancel"):
				state = PAUSED
			elif step_timer.time_left==0:
				step_timer.start(step)
				grid.step()
				

func _on_StartMenu_start():
	var size = start_menu.get_values()
	state = READY
	grid = Grid.instance()
	add_child(grid)
	grid.make_grid(Vector2(size[0], size[1]))
	step = size[2]


func _on_PauseMenu_continued():
	pause_menu.control.hide()
	state = PLAYING


func _on_PauseMenu_restarted():
	pause_menu.control.hide()
	state = STARTING
	grid.queue_free()
	start_menu.control.show()
