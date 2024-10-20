extends Control

# Define your dialogue lines for the UI-building process
var interface_dialogue = [
	"*The scientist steps forward, tools in hand, looking at the scattered parts of the monster.*",
	"Scientist: Welcome, fellow creator! Before we can bring this monster to life, we must first build something just as important—its **front-end interface**.",
	"*He picks up a piece of the monster’s body, examining it closely.*",
	"Scientist: The front-end is like the surface of the monster. It's what people will see and use to interact with our creation. In a chatbot, this is called the **User Interface**, or UI.",
	"Scientist: Imagine the chatbot as a mind, hidden behind the scenes. The UI is the face it shows to the world—the buttons, text boxes, and design elements that let users communicate with it.",
	"*He places the piece down and looks at you thoughtfully.*",
	"Scientist: Just like assembling a body from these parts, we need to **build the front-end from different components**. Each piece has a purpose: input boxes for user questions, buttons for sending commands, and labels to display responses.",
	"Scientist: For example, this head? It’s like the **input box**—where the user will type their questions. The hands? Those represent **buttons**, guiding the conversation. Even the monster’s eyes are like visual feedback elements, showing users what's happening in real-time.",
	"*He gestures to you, handing over the tools.*",
	"Scientist: Now, it's your turn to start building. Piece by piece, you’ll put together the UI, deciding how the user will interact with the chatbot.",
	"Scientist: This is not just about function, but also **user experience**. A well-designed front-end helps the user feel connected, makes everything clear, and provides a smooth way to interact with the chatbot's mind.",
	"Scientist: Once we assemble this interface, the real magic begins. The chatbot will be ready to communicate, to think, and to respond... But only after you've built the bridge between it and the user.",
	"*He stands back, watching you work.*",
	"Scientist: Let’s begin the assembly. With every piece you place, you're bringing the chatbot closer to life."
]

var current_line = 0

# Reference to the Label and Button
@onready var dialogue_label : Label = $Panel/Label
@onready var next_button : Button = $Panel/Button

# Function to display the current line of dialogue
func show_dialogue():
	dialogue_label.text = interface_dialogue[current_line]

# When the button is pressed, advance to the next line
func _on_Button_pressed():
	current_line += 1
	if current_line < interface_dialogue.size():
		show_dialogue()
	else:
		# Hide or close the dialogue box after the last line
		$Panel.hide()

# Initialize the first line of dialogue when the scene starts
func _ready():
	show_dialogue()
	next_button.pressed.connect(_on_Button_pressed) 
