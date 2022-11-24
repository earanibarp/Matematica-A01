extends Node2D

export (PackedScene) var Gema

var level = 0
var time_left = 0
var score = 0

func _ready():
	randomize()
	spawn_gems()
	time_left = 30
	$HUD.update_timer(time_left)
	$HUD/LabelGameOver.visible = false

func _process(delta):
	if $gemContainer.get_child_count() == 0:
		level += 1
		time_left += 5
		spawn_gems()

func spawn_gems():
	if Gema != null:
		for i in range(5 + level):
			var gem = Gema.instance()
			gem.position = Vector2(rand_range(0, 480), rand_range(0, 720))
			$gemContainer.add_child(gem)



func _on_Timer_timeout():
	time_left -= 1 # time_left = time_left - 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		game_over()


func _on_Player_picked():
	score += 1
	$HUD.update_score(score)
	
func game_over():
	$Timer.stop()
	$HUD/LabelGameOver.visible = true
	$Player.game_over()
