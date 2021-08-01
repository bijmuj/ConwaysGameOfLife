extends CanvasLayer


onready var width = $Control/GridContainer/Width
onready var height = $Control/GridContainer/Height
onready var step = $Control/GridContainer/Step
onready var control = $Control

signal start


func get_values():
	control.hide()
	return [width.value, height.value, step.value]


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_StartButton_pressed():
	emit_signal("start")
