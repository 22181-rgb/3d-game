extends Control

@export var sensitivity: float = 0.03 
@export var smoothness: float = 0.07 
@export var margin_buffer: float = 50.0 

@onready var background = $TextureRect

func _ready():

	background.pivot_offset = background.size / 2
	background.scale = Vector2(1.1, 1.1)
	background.position = Vector2.ZERO

func _process(_delta):

	var center = get_viewport_rect().size / 2

	var mouse_pos = get_viewport().get_mouse_position()
	var distance = mouse_pos - center

	var target_pos = -distance * sensitivity

	background.position = background.position.lerp(target_pos, smoothness)


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	GameManager.coins = 0
	GameManager.time_elapsed = 0.0

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
func _on_quit_button_pressed():
	get_tree().quit()
