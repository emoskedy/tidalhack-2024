extends CharacterBody2D

const SPEED = 30000
var screen_size = Vector2()

# The correct input sequence: Up, Up, Down, Down, Left, Right, Left, Right
var required_sequence = ["up", "up", "down", "left", "right"]
var current_sequence = []

var success_messages = [
	"Mwahaha! Brilliant! You've chosen correctly, and our creation is almost complete!",
	"Splendid! You've got the hands of a true monster-maker!",
	"Yes, yes! Perfect! Our creature will rise thanks to your masterful selections!",
	"Excellent choice, my little apprentice! The creature stirs!",
	"Magnificent! You're truly becoming a master of monstrous arts!"
]

# Reference to the 'Button' node that is a sibling of 'Player'
@onready var mad_scientist_label : Label = get_node("../Panel/Label")
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
		
func show_success_message():
	# Choose a random success message
	var message = success_messages[randi() % success_messages.size()]
	mad_scientist_label.text = message
	
func record_input(direction: String) -> void:
	# Add the new input direction to the sequence
	current_sequence.append(direction)

	# Limit the sequence length to the size of the required sequence
	if current_sequence.size() > required_sequence.size():
		current_sequence.remove_at(0)

	# Check if the current sequence matches the required sequence
	if current_sequence == required_sequence:
		show_success_message()
		button.show()  # Show the button when the sequence is correct
