extends Node3D

# Increased speed since delta is a small fraction (e.g., 0.016)
const ROT_SPEED = 120 

func _process(delta):
	# Multiplying by delta ensures it rotates at the same speed 
	# regardless of whether the player has 30 or 144 FPS.
	rotate_y(deg_to_rad(ROT_SPEED * delta))

func _on_body_entered(_body: Node3D) -> void:
	# 'queue_free' removes the object safely at the end of the frame.
	queue_free()
