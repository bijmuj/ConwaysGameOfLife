extends CanvasLayer

signal restarted
signal continued

onready var control = $Control

func _on_Quit_pressed():
	get_tree().quit()


func _on_Restart_pressed():
	control.hide()
	emit_signal("restarted")


func _on_Continue_pressed():
	control.hide()
	emit_signal("continued")
