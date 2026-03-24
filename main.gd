extends Node3D


@onready var death_screen = $CanvasLayer/deathscreen
@onready var player = $player
func _ready():
	if player and death_screen:
		player.player_died.connect(death_screen.show_death_screen)

func _on_restartd_pressed():
	GameManager.coins = 0
	GameManager.time_elapsed = 0.0
	GameManager.game_active = true
	get_tree().paused = false
	get_tree().reload_current_scene()
