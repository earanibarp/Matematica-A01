extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += 220 * delta
	if Input.is_action_pressed("ui_left"):
		position.x += -220 * delta
	if Input.is_action_pressed("ui_up"):
		position.y += -220 * delta
	if Input.is_action_pressed("ui_down"):
		position.y += 220 * delta
		
	if position.x > 480:
		position.x = 480
	if position.x < 0:
		position.x = 0
	if position.y > 720:
		position.y = 720
	if position.y < 0:
		position.y = 0
