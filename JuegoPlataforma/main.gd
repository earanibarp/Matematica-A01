extends Node2D

var score = 0

func _ready():
	OS.center_window()
	$CanvasLayer/Button.visible = false
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = true
		$CanvasLayer/Button.visible = true


func _on_Button_pressed():
	get_tree().paused = false
	$CanvasLayer/Button.visible = false
