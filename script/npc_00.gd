extends Node2D

export(String) var NPC_chat_rus
export(String) var NPC_chat_eng



export(float,0,2,0.1) var speed_chat = 1

var visibecharstext

func _ready():
	visibecharstext = 0
	language(int(Global.languageNPC_00))
	$Timerspeedchat.set_wait_time(speed_chat)
	$Control/AnimationPlayer.play('chat_0')

func _process(delta):
	$Control/Panel/RichTextLabel.set_visible_characters(visibecharstext)

func anin_chat_start():
	$Timerspeedchat.start()

func _on_Timerspeedchat_timeout():
	visibecharstext += 1
	if $Control/Panel/RichTextLabel.get_visible_characters() > $Control/Panel/RichTextLabel.get_total_character_count():
		$Timerspeedchat.stop()


func _on_Area2Dchat_start_end_body_entered(body):
	if body.name == 'player':
		$Control/AnimationPlayer.play('chat_1')


func _on_Area2Dchat_start_end_body_exited(body):
	if body.name == 'player':
		$Control/AnimationPlayer.play('chat_2')
		visibecharstext = 0
		$Timerspeedchat.stop()

func language(amount):
	if amount == 0:
		$Control/Panel/RichTextLabel.set_bbcode(NPC_chat_eng)
	elif amount == 1:
		$Control/Panel/RichTextLabel.set_bbcode(NPC_chat_rus)