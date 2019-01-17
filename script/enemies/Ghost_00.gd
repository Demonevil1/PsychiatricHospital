extends KinematicBody2D

onready var player =get_parent().get_parent().get_node('player')

export(int, 50, 400, 1) var enemy_speed = 50

const UP = Vector2(0, -1)
const Grav = 20

var motion = Vector2()

var spriteanim =true
var isattack =false
var isinvisble =false
var isidle =false
var iswalk =false
var traget =null

func _ready():
	$SpriteAnim.play('idle')


func _physics_process(delta):
	motion.y += 10
	
	var tragetattack = player.get_global_position().x - self.position.x
	
	if tragetattack < 60 and 0 < tragetattack:
		print('stop right')
		isattack =true
		_attack()
		motion.x =0
	elif tragetattack > -60 and 0 > tragetattack:
		print('stop left')
		isattack =true
		_attack()
		motion.x =0
	else:
		print('null')
		isattack =false
	
	if traget:
		if player.get_global_position() < self.position and !isattack:
			motion.x = -enemy_speed
			$SpriteAnim.flip_h = false
			_walk()
		
		elif player.get_global_position() > self.position and !isattack:
			motion.x = enemy_speed
			$SpriteAnim.flip_h = true
			_walk()
	else:
		$SpriteAnim.play('idle')
		motion.x =0
		print('stop walk')
	
	
	
	
#	motion.x = 0
	motion = move_and_slide(motion, UP)
#	print(tragetattack)


func _on_Area2D_invisible_body_entered(body):
	if body.name =='player':
		isinvisble =true
		$AnimationPlayer.play('invisible_start')


func _on_Area2D_invisible_body_exited(body):
	if body.name =='player':
		isinvisble =false
		$AnimationPlayer.play('invisible_end')


func _on_Area2D_walk_player_body_entered(body):
	if body.name =='player':
		iswalk =true


func _on_Area2D_walk_player_body_exited(body):
	if body.name =='player':
		iswalk =false

func _walk():
	if spriteanim:
		spriteanim=false
		$SpriteAnim.play('walk')
	else:
		spriteanim=true

func _attack():
	if spriteanim:
		spriteanim=false
		$SpriteAnim.play('attack')
	else:
		spriteanim=true



func _on_Area2D_traget_player_body_entered(body):
	if body.name =='player':
		traget = body


func _on_Area2D_traget_player_body_exited(body):
	if body == traget:
		traget = null
