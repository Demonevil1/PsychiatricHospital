extends Area2D

export(int, 0, 10) var indexid setget set_indexid

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_indexid(value):
	var testin = value