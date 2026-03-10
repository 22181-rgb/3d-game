extends CanvasLayer

@onready var label = $Control/CoinLabel
func _process(_delta):
	label.text = "Coins: " + str(GameManager.coins)
	Coinlabel.text = "Coins: " + str(GameManager.coins)
	TimeLabel.text = "Time: " + str(snapped(GameManager.time_elapsed, 0.1))
@onready var Coinlabel = $Control/CoinLabel
@onready var TimeLabel = $Control/TimeLabel
