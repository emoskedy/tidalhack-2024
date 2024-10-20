extends Control

# Define the correct pieces based on your setup
var correct_pieces = ["Char7", "Char8", "Char9"]
var selected_pieces = []

# Reference the mad scientist's dialogue label
@onready var mad_scientist_label = $Panel/MadScientistLabel
@onready var next_button = $Panel/next_button

# Array of random success messages
var success_messages = [
	"Mwahaha! Brilliant! You've chosen correctly, and our creation is almost complete!",
	"Splendid! You've got the hands of a true monster-maker!",
	"Yes, yes! Perfect! Our creature will rise thanks to your masterful selections!",
	"Excellent choice, my little apprentice! The creature stirs!",
	"Magnificent! You're truly becoming a master of monstrous arts!"
]


func _ready():
	randomize()
	
	next_button.visible = false

	# Connect the signals from Area2D nodes for each piece
	$Char1.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char1"))
	$Char2.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char2"))
	$Char3.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char3"))
	$Char4.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char4"))
	$Char5.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char5"))
	$Char6.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char6"))
	$Char7.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char7"))
	$Char8.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char8"))
	$Char9.connect("input_event", Callable(self, "_on_piece_clicked").bind("Char9"))

# Function to handle clicks
func _on_piece_clicked(viewport, event, shape_idx, piece_name):
	if event is InputEventMouseButton and event.pressed:
		var area2d = get_node(piece_name)
		if piece_name in correct_pieces:
			if piece_name not in selected_pieces:
				selected_pieces.append(piece_name)
				
				selected_pieces.sort()
				
				#Prvodie visual feedback
				area2d.get_node("Sprite").modulate = Color(1,1,1,0.5)

				# Check if the user has selected the correct three pieces
				if selected_pieces.size() == 3 and selected_pieces == correct_pieces:
					show_success_message()
					# Clear selected pieces for the next attempt
					clear_feedback()
					selected_pieces.clear()

		else:
			# Reset if a wrong piece is clicked
			selected_pieces.clear()
			clear_feedback()
			mad_scientist_label.text = "Oh no! That's not quite right! Try again, my clever apprentice!"


# Function to reset feedback visuals (restore opacity)
func clear_feedback():
	for i in range(1, 10):
		var area2d = get_node("Char" + str(i))
		area2d.get_node("Sprite").modulate = Color(1, 1, 1, 1)  # Full opacity

# Function to show the success message
func show_success_message():
	# Choose a random success message
	var message = success_messages[randi() % success_messages.size()]
	mad_scientist_label.text = message
	
	
	#Make the next button visible
	next_button.visible = true


func _on_next_button_pressed() -> void:
	var next_scene_path = "res://API.tscn" 
	get_tree().change_scene_to_file(next_scene_path)
