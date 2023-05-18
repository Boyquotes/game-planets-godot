extends CharacterBody2D

# this is our main player script
# movement is based on https://www.youtube.com/watch?v=Xf62e3VrLOg&t=59s

@export var max_speed = 300
@export var acceleration = 1500
@export var friction = 1200
@onready var axis = Vector2.ZERO

func _physics_process(delta):
	move(delta)


func get_input_axis():
	axis = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return axis.normalized()


func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(friction * delta)
	else:
		apply_movement(axis * acceleration * delta)
		
	move_and_slide()


func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(max_speed)
