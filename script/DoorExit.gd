extends Sprite

export(PackedScene) var scenesexit

var door

func _ready():
	door = null
	Global.connect('doorexitkey',self,'doorexit')


func _on_Area2D_body_entered(body):
	if body.name == 'player':
		door = true
	
	
func _on_Area2D_body_exited(body):
	if body.name == 'player':
		door = false

func doorexit():
	if door:
		get_tree().change_scene_to(scenesexit)
