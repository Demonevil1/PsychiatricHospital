extends Area2D

export(String) var Keyindex

export(Texture) var Keytextures

func _ready():
	$Sprite.set_texture(Keytextures)


func _on_Keyindex_body_entered(body):
	if body.name == 'player':
		queue_free()
		if Global.indexkey.size() < 200:
			Global.indexkey.append(Keyindex)
