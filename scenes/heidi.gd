extends RigidBody2D

@export var speed := 400  # Speed of horizontal movement
@export var jump_force := 900  # Strength of the jump

@onready var ground_check := $RayCast2D  # RayCast2D node to check if player is on the ground

func _ready():
	# Ensure RayCast2D is enabled
	ground_check.enabled = true
	# Make sure gravity_scale is correctly set (affects gravity strength)
	gravity_scale = gravity_scale

func _physics_process(delta: float) -> void:
	var direction := 0.0
	
	# Horizontal movement based on key input
	if Input.is_action_pressed("heidi_left"):
		direction -= 1
	if Input.is_action_pressed("heidi_right"):
		direction += 1
	
	# Set horizontal velocity directly for continuous movement
	linear_velocity.x = direction * speed
	
	# Jumping logic: Only jump if on the floor (RayCast2D detects the ground)
	if Input.is_action_just_pressed("heidi_jump") and is_on_floor():
		jump()

func jump():
	# Apply a vertical velocity for jumping (sets the vertical speed directly)
	linear_velocity.y = -jump_force  # This overrides any current vertical velocity to simulate a jump

func is_on_floor() -> bool:
	# Check if RayCast2D is colliding with the ground
	return ground_check.is_colliding()
