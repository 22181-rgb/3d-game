extends TextureRect

@export var sway_amount = 15.0 # How far it moves (change this in the Inspector!)
var original_pos: Vector2

func _ready():
	# Remember where the menu started so it doesn't float away
	original_pos = position

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var screen_size = get_viewport().get_visible_rect().size
	
	# Calculate how far the mouse is from the center of the screen
	var center_offset = (mouse_pos - (screen_size / 2.0)) / (screen_size / 2.0)
	
	# Figure out where the menu SHOULD be based on the mouse
	var target_pos = original_pos - (center_offset * sway_amount)
	
	# Smoothly glide to that position
	position = position.lerp(target_pos, delta * 5.0)
