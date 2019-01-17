extends Node

var lesnica00 = 0
var lesnica01 = 0
var lesnica02 = 0
var lesnica03 = 0
var lesnica04 = 0
var lesnica05 = 0
var lesnica06 = 0
var lesnica07 = 0
var lesnica08 = 0
var lesnica09 = 0
var lesnica10 = 0

##======================================== это тест
#var test = {
#	1:'hello',
#	2:'world',
#	3:'you'
#}
#
#
#enum testt {adasd = -1}
#
#onready var dict = {"10": "hello", 2:3}
##===========================================

func _ready():
#	print(test[3])
	pass

func _on_Area2DLesnica_00_body_entered(body):
	if body.name == 'player':
		if lesnica00 == 0:
			lesnica00 +=1
			$CollLesnica/StaticBody2D_0/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal/CollisionShape2D.disabled = false
		elif lesnica00 ==1:
			lesnica00 -=1
			$CollLesnica/StaticBody2D_0/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal/CollisionShape2D.disabled = true

func _on_Area2DLesnica_01_body_entered(body):
	if body.name == 'player':
		if lesnica01 == 0:
			lesnica01 +=1
			$Area/StaticBody2D_05Signal/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_0/CollisionShape2D.disabled = true
		elif lesnica01 ==1:
			lesnica01 +=1
			$CollLesnica/StaticBody2D_1/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal2/CollisionShape2D.disabled = true
		elif lesnica01 == 2:
			lesnica01 -=2
			$Area/StaticBody2D_05Signal/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_1/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal2/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_0/CollisionShape2D.disabled = false

func _on_Area2DLesnica_02_body_entered(body):
	if body.name == 'player':
		if lesnica02 == 0:
			lesnica02 +=1
			$CollLesnica/StaticBody2D_1/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal2/CollisionShape2D.disabled = false
		elif lesnica02 == 1:
			lesnica02 +=1
			$CollLesnica/StaticBody2D_3/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal3/CollisionShape2D.disabled = true
			#new
			$Area/StaticBody2D_05Signal2/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_1/CollisionShape2D.disabled = true
		elif lesnica02 == 2:
			lesnica02 -=2
			$Area/StaticBody2D_05Signal2/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal3/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_3/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_1/CollisionShape2D.disabled = false

func _on_Area2DLesnica_03_body_entered(body):
	if body.name == 'player':
		if lesnica03 == 0:
			lesnica03 += 1
			$Area/StaticBody2D_05Signal3/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_3/CollisionShape2D.disabled = true
		elif lesnica03 == 1:
			lesnica03 += 1
			$CollLesnica/StaticBody2D_2/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal4/CollisionShape2D.disabled = true
		elif lesnica03 == 2:
			lesnica03 -= 2
			$Area/StaticBody2D_05Signal3/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_2/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_3/CollisionShape2D.disabled = false

func _on_Area2DLesnica_04_body_entered(body):
	if body.name == 'player':
		if lesnica04 == 0:
			lesnica04 +=1
			$CollLesnica/StaticBody2D_2/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal4/CollisionShape2D.disabled = false
			
		elif lesnica04 ==1:
			lesnica04 +=1
			$CollLesnica/StaticBody2D_4/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal5/CollisionShape2D.disabled = true
			
		elif lesnica04 ==2:
			lesnica04 -=2
			$CollLesnica/StaticBody2D_4/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_2/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal4/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal5/CollisionShape2D.disabled = false

func _on_Area2DLesnica_05_body_entered(body):
	if body.name == 'player':
		if lesnica05 == 0:
			lesnica05 +=1
			$Area/StaticBody2D_05Signal5/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_4/CollisionShape2D.disabled = true
		elif lesnica05 == 1:
			lesnica05 -=1
			$Area/StaticBody2D_05Signal5/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_4/CollisionShape2D.disabled = false

func _on_Area2DLesnica_06_body_entered(body):
	if body.name == 'player':
		if lesnica06 == 0:
			lesnica06 += 1
			$CollLesnica/StaticBody2D_5/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal6/CollisionShape2D.disabled = true
		elif lesnica06 == 1:
			lesnica06 -= 1
			$CollLesnica/StaticBody2D_5/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal6/CollisionShape2D.disabled = false

func _on_Area2DLesnica_07_body_entered(body):
	if body.name == 'player':
		if lesnica07 == 0:
			lesnica07 += 1
			$CollLesnica/StaticBody2D_5/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal6/CollisionShape2D.disabled = false
		elif lesnica07 == 1:
			lesnica07 += 1
			$CollLesnica/StaticBody2D_6/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal7/CollisionShape2D.disabled = true
		elif lesnica07 == 2:
			lesnica07 -= 2
			$CollLesnica/StaticBody2D_6/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_5/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal6/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal7/CollisionShape2D.disabled = false

func _on_Area2DLesnica_08_body_entered(body):
	if body.name == 'player':
		if lesnica08 == 0:
			lesnica08 += 1
			$Area/StaticBody2D_05Signal7/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_6/CollisionShape2D.disabled = true
		elif lesnica08 == 1:
			lesnica08 += 1
			$CollLesnica/StaticBody2D_7/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal8/CollisionShape2D.disabled = true
		elif lesnica08 == 2:
			lesnica08 -= 2
			$Area/StaticBody2D_05Signal7/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_6/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_7/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal8/CollisionShape2D.disabled = false

func _on_Area2DLesnica_09_body_entered(body):
	if body.name == 'player':
		if lesnica09 == 0:
			lesnica09 += 1
			$Area/StaticBody2D_05Signal8/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_7/CollisionShape2D.disabled = true
		elif lesnica09 == 1:
			lesnica09 += 1
			$CollLesnica/StaticBody2D_8/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal9/CollisionShape2D.disabled = true
		elif lesnica09 == 2:
			lesnica09 -= 2
			$Area/StaticBody2D_05Signal8/CollisionShape2D.disabled = true
			$CollLesnica/StaticBody2D_7/CollisionShape2D.disabled = false
			$CollLesnica/StaticBody2D_8/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal9/CollisionShape2D.disabled = false

func _on_Area2DLesnica_10_body_entered(body):
	if body.name == 'player':
		if lesnica10 == 0:
			lesnica10 += 1
			$CollLesnica/StaticBody2D_8/CollisionShape2D.disabled = true
			$Area/StaticBody2D_05Signal9/CollisionShape2D.disabled = false
		elif lesnica10 == 1:
			lesnica10 -= 1
			$CollLesnica/StaticBody2D_8/CollisionShape2D.disabled = false
			$Area/StaticBody2D_05Signal9/CollisionShape2D.disabled = true

func _on_SignalReturn_01_body_entered(body):
	if body.name == 'player':
		lesnica01 = 2

func _on_SignalReturn_02_body_entered(body):
	if body.name == 'player':
		lesnica01 = 2
		lesnica02 = 2

func _on_SignalReturn_03_body_entered(body):
	if body.name == 'player':
		lesnica01 = 2
		lesnica02 = 2
		lesnica03 = 2

func _on_SignalReturn_04_body_entered(body):
	if body.name == 'player':
		lesnica01 = 2
		lesnica02 = 2
		lesnica03 = 2
		lesnica04 = 2

func _on_SignalReturn_05_body_entered(body):
	if body.name == 'player':
		lesnica01 = 2
		lesnica02 = 2
		lesnica03 = 2
		lesnica04 = 2
		lesnica05 = 1

func _on_SignalReturn_06_body_entered(body):
	if body.name == 'player':
		lesnica10 = 1
		lesnica09 = 2
		lesnica08 = 2
		lesnica07 = 2
		lesnica06 = 1

func _on_SignalReturn_07_body_entered(body):
	if body.name == 'player':
		lesnica09 = 2
		lesnica08 = 2
		lesnica07 = 2
		lesnica06 = 1

func _on_SignalReturn_08_body_entered(body):
	if body.name == 'player':
		lesnica08 = 2
		lesnica07 = 2
		lesnica06 = 1

func _on_SignalReturn_09_body_entered(body):
	if body.name == 'player':
		lesnica07 = 2
		lesnica06 = 1

