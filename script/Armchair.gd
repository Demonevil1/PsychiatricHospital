extends Sprite

var random = 0




func _on_Area2D_body_entered(body):
	if body.name == 'player':
		randomize()
		random = randi()%2


func _on_Area2D_body_exited(body):
	if body.name == 'player':
		if random == 0:
			$AnimationPlayer.play('idle')
		elif random == 1:
			$AnimationPlayer.play('walk')
