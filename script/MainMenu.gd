extends Node

onready var hudcoloranim = $HUDColor/AnimationPlayer
onready var hudcolor = $HUDColor/Control/ColorRect

export(String) var langeng
export(String) var langrus

var clicklang = null

func _ready():
	$Timercolorstart.start()
	hudcolor.color = Color(0,0,0,255)
	$HUDlang/Control/Panel.hide()
	$HUDlang/Control/Container.visible = false

func _on_Timercolorstart_timeout():
	hudcoloranim.play('colorstart')
	yield(hudcoloranim,"animation_finished")
	$HUDlang/Control/AnimationPlayer.play('HUDaminLaugstart')

func _on_ButtonENG_pressed():
	lang(0)

func _on_ButtonRUS_pressed():
	lang(1)

func lang(amount):
	$HUDlang/Control/Panel.show()
	if amount == 0:
		$HUDlang/Control/Panel/Label_lang_yes_or_no.set_text(langeng)
		clicklang = 0
	elif amount == 1:
		$HUDlang/Control/Panel/Label_lang_yes_or_no.set_text(langrus)
		clicklang = 1

func _on_Button_ok_pressed():
	clickOKLang()
	$HUDlang/Control/AnimationPlayer.play('HUDanimLaugend')
	yield($HUDlang/Control/AnimationPlayer,"animation_finished")
	hudcoloranim.play('colorend')
	yield(hudcoloranim,"animation_finished")
	print('start game')


func _on_Button_cancel_pressed():
	$HUDlang/Control/Panel.hide()

func clickOKLang():
	if clicklang == 0:
		Global.global_language = 0
	elif clicklang == 1:
		Global.global_language = 1