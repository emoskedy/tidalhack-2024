extends Control

# Define your dialogue lines
var dialogue_lines : Array = [
	"*The scientist wipes his brow and turns to a glowing core, pulsing faintly on the table.*",
	"Scientist: Ah, now we've come to the most critical part of our creation—the **API Key**. Think of this as the **energy core** that powers the monster’s mind.",
	"Scientist: Without it, the monster cannot think, speak, or respond. This small yet powerful key grants access to the brain, the artificial intelligence that brings it all together.",
	"*He taps the glowing core, and it flickers to life.*",
	"Scientist: You see, the API Key connects the monster to a vast network of knowledge. It allows it to process language, learn from conversations, and respond intelligently. But, like any powerful tool, it must be handled with care.",
	"Scientist: This energy core is **private and personal**. If misused or exposed, it could fall into the wrong hands, or worse—leave the monster powerless. That's why we must be vigilant in protecting it.",
	"*He leans closer, his voice serious.*",
	"Scientist: Imagine if this core were stolen. The monster could be corrupted or fail completely. So, our job is to keep it **secure and private**, using it only when necessary.",
	"*He steps back, watching as you approach the core.*",
	"Scientist: Before we can complete the monster, you must insert the API Key into its chest, like an energy core into a machine. But this isn't a simple task.",
	"Scientist: You’ll need to solve a puzzle, a test of your responsibility, before the energy core can be safely installed.",
	"*He gestures to the console before you.*",
	"Scientist: Solve this puzzle, and ensure that the core is safely and securely placed. Remember, this is the heart of our creation. Without it, there can be no life, no thought, no interaction.",
	"*The core flickers again, awaiting your input.*",
	"Scientist: When you're ready, insert the API Key, and the monster will awaken with the knowledge of the world."
]

var current_line : int = 0

# Reference to the Label and Button using @onready
@onready var dialogue_label : Label = $Panel/Label
@onready var next_button : Button = $Panel/Button

# Function to display the current line of dialogue
func show_dialogue() -> void:
	dialogue_label.text = dialogue_lines[current_line]

# When the button is pressed, advance to the next line
func _on_next_button_pressed() -> void:
	current_line += 1
	if current_line < dialogue_lines.size():
		show_dialogue()
	else:
		# Hide or close the dialogue box after the last line
		$Panel.hide()

# Initialize the first line of dialogue when the scene starts
func _ready() -> void:
	show_dialogue()
	next_button.pressed.connect(_on_next_button_pressed)
