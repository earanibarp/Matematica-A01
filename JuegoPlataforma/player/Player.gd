extends KinematicBody2D

var speed = 150
#var velo_x
#var velo_y
var velocity = Vector2(0,0)

enum {JUMP, RUN, HURT, IDLE}

var state
var current_animation
var new_animation


var jump = -300
var gravity = 500

func _ready():
	OS.center_window()
	transition_to(IDLE)
	
func _physics_process(delta):
	if current_animation != new_animation:
		current_animation = new_animation
		$AnimationPlayer.play(current_animation)
	
	velocity.x = 0
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$Sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$Sprite.flip_h = true
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump
		transition_to(JUMP)
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if state == IDLE and velocity.x != 0:
		transition_to(RUN)
	if state == RUN and velocity.x == 0:
		transition_to(IDLE)
	if state == JUMP and is_on_floor():
		transition_to(IDLE)
	if state in [IDLE, RUN] and !is_on_floor():
		transition_to(RUN)

func transition_to(new_state):
	state = new_state
	match state:
		JUMP:
			new_animation = "jump"
		RUN:
			new_animation = "run"
		HURT:
			new_animation = "hurt"
		IDLE:
			new_animation = "idle"
