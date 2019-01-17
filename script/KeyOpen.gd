extends Node

var keyboolanim

var isenter = false


func _ready():
	Global.connect('enterkeyopen', self, 'enterkeydoors')

func _on_Area2D_body_entered(body):
	if body.name == 'player':
		keyboolanim = true
		isenter = true
		$TimerAnimEnd.set_one_shot(false)
		if keyboolanim:
			$AnimationPlayer.play('keyanim')
			$TimerAnimEnd.start()
		

func _on_Area2D_body_exited(body):
	if body.name == 'player':
		keyboolanim = false
		isenter = false
		$TimerAnimEnd.set_one_shot(true)


func _on_TimerAnimEnd_timeout():
	$AnimationPlayer.play('keyanim')

func enterkeydoors():
	if Global.indexkey.has('001') and isenter and self.name == 'KeyOpen000':
		get_tree().change_scene("res://screens/Maps/Room001.tscn")
	elif Global.indexkey.has('002') and isenter and self.name == 'KeyOpen001':
		get_tree().change_scene("res://screens/Maps/Room001.tscn")

