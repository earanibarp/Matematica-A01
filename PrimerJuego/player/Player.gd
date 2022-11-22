extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()


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
		
	if Input.is_action_pressed("ui_left") == true:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_right") == true:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_up") == true:
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_down") == true:
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")


func _on_Player_area_entered(area):
	if area.is_in_group("gem"):
		area.pickup()
