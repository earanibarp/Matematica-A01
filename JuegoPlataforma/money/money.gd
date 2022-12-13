extends Area2D

func _on_money_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		get_parent().score += 1
