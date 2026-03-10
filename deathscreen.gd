extends Control

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS 
func show_death_screen():
	print("Death Screen: Attempting to show...")
	show()
	self.visible = true
	get_tree().paused = true 
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("Death Screen: Game Paused and Mouse Visible.")
func _on_restart_button_pressed():
	print("Restarting...")
	get_tree().paused = false
	get_tree().reload_current_scene()
	GameManager.coins = 0
	GameManager.time_elapsed = 0.0
func _on_mainmenu_pressed():
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://menu.tscn")
