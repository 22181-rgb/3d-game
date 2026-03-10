extends Node

var coins = 0
const TARGET_SCORE = 5 
var time_elapsed = 0.0  
var game_active = true # You need to define this for the timer to work

func _process(delta):
	# Only count time if the game is active
	if game_active:
		time_elapsed += delta

func add_coin():
	coins += 1
	if coins >= TARGET_SCORE:
		win_game()

func win_game():
	game_active = false # Stop the clock first
	get_tree().paused = true # Pause the world
	
	# Find the UI
	var win_ui = get_tree().root.find_child("WinScreen", true, false)
	if win_ui:
		win_ui.visible = true
		
		# Find the label and set the text
		var time_label = win_ui.find_child("FinalTimeLabel", true, false)
		if time_label:
			time_label.text = "Your Time: " + str(snapped(time_elapsed, 0.01)) + "s"
	
	# Make mouse visible so they can click Restart
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_restartd_pressed():
	coins = 0 # Reset score
	time_elapsed = 0.0 # Reset timer
	game_active = true # Reactivate timer
	get_tree().paused = false # Unpause
	get_tree().reload_current_scene() # Restart level
