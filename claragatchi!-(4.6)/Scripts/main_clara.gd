extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@export var minigame = ["Bed!", "Window!", "TV!"]
var minigame_index = 0
var tv_channel = ["res://Scenes/tv_news.tscn", "res://Scenes/tv_minigame.tscn"]
var channel_index

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MainMoveLeft", "MainMoveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("MainMoveLeft"):
		$IdleClara.flip_h = true
	if Input.is_action_just_pressed("MainMoveRight"):
		$IdleClara.flip_h = false
	move_and_slide()

	


# Minigame Selections #############
	
func _on_bed_area_body_exited(body: Node2D) -> void:
	$Blabs/BlabTextBox.hide()
	$Notifications/NotificationText.text = ""

	
func _on_window_area_body_exited(body: Node2D) -> void:
	$Blabs/BlabTextBox.hide()
	$Notifications/NotificationText.text = ""
func _on_window_area_area_entered(area: Area2D) -> void:
	$Blabs/BlabTextBox.show()
	$Blabs/BlabText.text = ""
	$Notifications/NotificationText.text = minigame[1]

	
func _on_tv_area_body_exited(body: Node2D) -> void:
	$Blabs/BlabTextBox.hide()
	$Notifications/NotificationText.text = ""
func _on_tv_area_area_entered(area: Area2D) -> void:
	channel_index = minigame[2]
	$Blabs/BlabTextBox.show()
	$Blabs/BlabText.text = ""
	$Notifications/NotificationText.text = minigame[2]
	if Input.is_action_pressed("MainSelect"):
		get_tree().change_scene_to_file("res://Scenes/tv_news.tscn")

func _on_bed_area_area_entered(area: Area2D) -> void:
	channel_index = minigame[0]
	$Blabs/BlabTextBox.show()
	$Blabs/BlabText.text = ""
	$Notifications/NotificationText.text = minigame[0]






	#if minigame[2]:	
		#if Input.is_action_pressed("MainSelect"):
			#channel_index = randi_range(0, 1)
			#if channel_index == 0:
				#get_tree().change_scene_to_file("res://Scenes/tv_news.tscn")
			#if channel_index == 1:
				#get_tree().change_scene_to_file("res://Scenes/tv_minigame.tscn")
