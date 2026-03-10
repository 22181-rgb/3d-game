extends Node3D

const ROT_SPEED = 120 
func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED * delta))
func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		GameManager.add_coin()
		queue_free()
