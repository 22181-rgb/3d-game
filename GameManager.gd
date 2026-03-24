extends Node

var coins = 0
const TARGET_SCORE = 5 
var time_elapsed = 0.0  
var game_active = true 

# Grab references to your audio players
@onready var coin_sound = $CoinSound
@onready var win_sound = $WinSound
@onready var death_sound = $DeathSound

func _process(delta):
	if game_active:
		time_elapsed += delta

func add_coin():
	coins += 1
	coin_sound.play() # Play the ding!
	
	if coins >= TARGET_SCORE:
		win_game()

func win_game():
	game_active = false
	win_sound.play() # Play the win sound!
	get_tree().paused = true 
	
	var win_ui = get_tree().root.find_child("WinScreen", true, false)
	if win_ui:
		win_ui.visible = true
		var time_label = win_ui.find_child("FinalTimeLabel", true, false)
		if time_label:
			time_label.text = "Your Time: " + str(snapped(time_elapsed, 0.01)) + "s"
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Add a function specifically for dying so we can play the sound
func player_died():
	death_sound.play() # Play the death sound!
	game_active = false
	# You can add your death screen logic here!
