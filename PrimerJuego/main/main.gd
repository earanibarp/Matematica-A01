extends Node2D

export (PackedScene) var Gema

var level = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_gems()

func _process(delta):
	if $gemContainer.get_child_count() == 0:
		level += 1
		spawn_gems()

func spawn_gems():
	if Gema != null:
		for i in range(5 + level):
			var gem = Gema.instance()
			gem.position = Vector2(rand_range(0, 480), rand_range(0, 720))
			$gemContainer.add_child(gem)
