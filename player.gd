extends CharacterBody3D

signal player_died

@onready var head = $head
var current_speed = 5.0
const walking_speed = 5.0
const sprinting_speed = 8.0
const jump_velocity = 8
const mouse_sens = 0.25

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_dead = false

func _ready():
	# Ensure game is running and mouse is locked on start
	get_tree().paused = false
	is_dead = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if get_tree().paused or is_dead: return
	
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta):
	if is_dead: return

	# Fall death check
	if position.y < -10: 
		die()

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()

func die():
	is_dead = true
	velocity = Vector3.ZERO
	player_died.emit() # This triggers the UI
