extends CharacterBody2D

const SPEED = 30000
var screen_size = Vector2()

# The correct input sequence: Up, Up, Down, Down, Left, Right, Left, Right
var required_sequence = ["right", "right", "right", "right", "right", "right"]
var current_sequence = []

# Reference to the 'Button' node that is a sibling of 'Player'
@onready var button : Button = get_node("../Button")  # Go one level up and find the Button node

func _ready() -> void:
	# Get the size of the game window
	screen_size = get_viewport_rect().size
	
	# Initially hide the button
	button.hide()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.y = move_toward(velocity.y, 0, SPEED * delta)

	# Move the character
	move_and_slide()

	# Handle screen wrapping
	if position.x > screen_size.x:
		position.x = 0
		record_input("right")
	elif position.x < 0:
		position.x = screen_size.x
		record_input("left")
	
	if position.y > screen_size.y:
		position.y = 0
		record_input("down")
	elif position.y < 0:
		position.y = screen_size.y
		record_input("up")

func record_input(direction: String) -> void:
	# Add the new input direction to the sequence
	current_sequence.append(direction)

	# Limit the sequence length to the size of the required sequence
	if current_sequence.size() > required_sequence.size():
		current_sequence.remove_at(0)

	# Check if the current sequence matches the required sequence
	if current_sequence == required_sequence:
		button.show()  # Show the button when the sequence is correct
