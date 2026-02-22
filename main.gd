extends Node3D


@onready var death_screen = $CanvasLayer/deathscreen
@onready var player = $player


func _ready():
	if player and death_screen:
		# Connect the 'player_died' signal to the 'show_death_screen' function
		player.player_died.connect(death_screen.show_death_screen)
