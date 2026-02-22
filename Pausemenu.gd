extends Control

func _ready():
	# Ensure the menu is hidden when the game starts
	hide()
	# Ensure the script keeps running when the game pauses
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		# Get the name of the root node of the current scene
		var current_scene_name = get_tree().current_scene.name
		
		# IF THE SCENE IS THE MAIN MENU, DO NOTHING
		# Change "MainMenu" to exactly what your menu scene's root node is named
		if current_scene_name == "MainMenu" or current_scene_name == "menu":
			return
			
		toggle_pause()

func toggle_pause():
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	
	if new_pause_state:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_resume_pressed():
	toggle_pause()

func _on_main_menu_pressed():
	# Unpause and hide before switching so the next scene isn't frozen
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://menu.tscn")
