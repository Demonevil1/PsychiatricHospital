extends KinematicBody2D

onready var HUDTouchLeft = get_node('HUDTouch/Control/TouchScreenButtonLeft')
onready var HUDTouchRight = get_node('HUDTouch/Control/TouchScreenButtonRight')
onready var HUDTouchSpeed = get_node('HUDTouch/Control4/TouchScreenButtonRunSpeed')
onready var HUDTouchKeys = get_node('HUDTouch/Control4/TouchkeysButton')

onready var HUDTouchflashlightButton = get_node('HUDTouch/Control4/TouchflashlightButton')

#new
onready var HUDBarenduranc = get_node('HUD/Control/HBoxContainer/VBoxContainer/TextureRect/TexBarEnduranc')
onready var HUDAvatars = get_node('HUD/Control/HBoxContainer/TextureRect/TexRectAvatars')

const UP = Vector2(0, -1)
const Grav = 20
export(int, 0, 300, 2) var Speed = 140
export(int, 200, 500, 2) var Runspeed = 300
const Jump_h =- 400


#new
const currentbarendurance = 100 # вынос бег
const regendurance = 15 # рег вын

var motion = Vector2()

var walkspeedRignt
var walkspeedLeft
var fastspeed
var boolendurance
var boolendurancefatigue

var isflashlight = false
var isclickflashlightboo



var arrayAvatars = {
	1 : load("res://textures/avatars/avatar00.png"),
	2 : load("res://textures/avatars/avatar01.png"),
	3 : load("res://textures/avatars/avatar02.png"),
	4 : load("res://textures/avatars/avatar03.png")
}

var arrayFlashlightTextures = {
	1 : load("res://textures/touch/Flashlight_0.png"),
	2 : load("res://textures/touch/Flashlight_1.png")
}

var isL_R=null
var isfast = false

var playing = false
var playingfast = false

var iskeyL = false
var iskeyR = false

var iskeyfastSTA = false


func _ready():
	$Sprite.play("idle")
	HUDAvatars.set_texture(arrayAvatars[1])
	HUDBarenduranc.set_value(100)
	boolendurancefatigue = false
	readyColorScreen()


#	if is_on_floor(): важно кнопка 1 раз  это только пол


func _physics_process(delta):
	motion.y += 10
	HUDBarenduranc.value = currentbarendurance
	
	if boolendurance and iskeyfastSTA:
		if currentbarendurance > 0:
			currentbarendurance -= 000.1 / 0.3
			if currentbarendurance > 75:
				HUDAvatars.set_texture(arrayAvatars[1])
			elif currentbarendurance > 15:
				HUDAvatars.set_texture(arrayAvatars[2])
			elif currentbarendurance > 1:
				HUDAvatars.set_texture(arrayAvatars[3])
			elif currentbarendurance > 0:
				HUDTouchSpeed.hide()

	if !boolendurance:
		if currentbarendurance < 100:
			currentbarendurance += regendurance * delta
			if currentbarendurance < 75:
				HUDAvatars.set_texture(arrayAvatars[4])
			elif currentbarendurance < 99:
				HUDAvatars.set_texture(arrayAvatars[2])
			elif currentbarendurance < 100:
				HUDAvatars.set_texture(arrayAvatars[1])
				HUDTouchSpeed.show()

# управленіе анімацію
	if isL_R==true:
		playerAnim(1)
	elif isL_R==false:
		playerAnim(2)
	else:
		playerAnim(0)
	
	if isclickflashlightboo and $Sprite.is_flipped_h() and !isfast:
		$Light2DLeft.enabled = true
		$Light2DRight.enabled = false
	elif isclickflashlightboo and !$Sprite.is_flipped_h() and !isfast:
		$Light2DLeft.enabled = false
		$Light2DRight.enabled = true
	else:
		$Light2DLeft.enabled = false
		$Light2DRight.enabled = false

	Speed = clamp(Speed, 0, Runspeed)
	currentbarendurance = clamp(currentbarendurance, 0, 100)
	motion = move_and_slide(motion, UP)



func _input(event):
	
	if event.is_action_pressed('ui_left') and !iskeyL:
		isL_R=false
		iskeyR=true
		iskeyfastSTA=true
	elif event.is_action_released('ui_left') and !iskeyL:
		isL_R=null
		iskeyR=false
		iskeyfastSTA=false
	elif event.is_action_pressed('ui_right') and !iskeyR:
		isL_R=true
		iskeyL=true
		iskeyfastSTA=true
	elif event.is_action_released('ui_right') and !iskeyR:
		isL_R=null
		iskeyL=false
		iskeyfastSTA=false
	
	
	if event.is_action_pressed('ui_run'):
		isfast = true
		boolendurance = true
		HUDTouchflashlightButton.hide()
	elif event.is_action_released('ui_run'):
		isfast = false
		boolendurance = false
		HUDTouchflashlightButton.show()
		
	
	if event.is_action_pressed('ui_keys'):
		Global.emit_signal('enterkeyopen')
		Global.emit_signal('doorexitkey')
	
	if event.is_action_pressed('ui_flashlight'):
		flashlight()



func playerAnim(value):
	if value==0: # стоім
		idle_flashlight(isflashlight)
	elif value==1: # пешком right
		walk_flashlight(isflashlight,true,isfast)
	elif value==2: # пешком left
		walk_flashlight(isflashlight,false,isfast)


func idle_flashlight(value):
	if !value:
		$Sprite.play("idle")
	elif value:
		$Sprite.play("idle_flashlight")
		$Light2DRight.position=$Pos2D_R_light_idle.position
		$Light2DLeft.position=$Pos2D_L_light_idle.position
		
	motion.x = 0


func walk_flashlight(value,value2,value3fast):
	if !value3fast:
		if value2==true:
			$Sprite.flip_h = false
			motion.x = Speed
			if value:
				$Light2DRight.position=$Pos2D_R_light_walk.position
				if playing == false:
					$Sprite.play("walk_flashlight")
					playing = true
				playing = false
			elif !value:
				if playing == false:
					$Sprite.play("walk")
					playing = true
				playing = false
		elif value2==false:
			$Sprite.flip_h = true
			motion.x = -Speed
			if value:
				$Light2DLeft.position=$Pos2D_L_light_walk.position
				if playing == false:
					$Sprite.play("walk_flashlight")
					playing = true
				playing = false
			elif !value:
				if playing == false:
					$Sprite.play("walk")
					playing = true
				playing = false
	
	elif value3fast:
		if value2==true:
			$Sprite.flip_h = false
			motion.x = Runspeed
			if playingfast == false:
				$Sprite.play("fast")
				playingfast = true
			playingfast = false

		elif value2==false:
			$Sprite.flip_h = true
			motion.x = -Runspeed
			if playingfast == false:
				$Sprite.play("fast")
				playingfast = true
			playingfast = false

func flashlight():
	if isflashlight:
		isflashlight = false
		HUDTouchflashlightButton.set_texture(arrayFlashlightTextures[1])
		isclickflashlightboo = false
	
	elif !isflashlight:
		isflashlight = true
		HUDTouchflashlightButton.set_texture(arrayFlashlightTextures[2])
		isclickflashlightboo = true

func readyColorScreen():
	if Global.indexkey.has('001'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('002'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('003'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('004'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('005'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('011'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('012'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('013'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('014'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('015'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('021'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('022'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('023'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('024'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('025'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('031'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('032'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('033'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('034'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('035'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('041'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('042'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('043'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('044'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')
	elif Global.indexkey.has('045'):
		$HUDColorScreen/Control/AnimationPlayer.play('end')