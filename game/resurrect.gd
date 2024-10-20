extends Node2D  # Assuming the root node of your introPage scene is Node2D

func _on_texture_button_pressed() -> void:
	OS.shell_open("http://localhost:8501")

# Make the background a gif
# Preload the textures (replace the paths with your actual image paths)
@export var image1 : Texture2D = preload("res://img/greenFire.png")
@export var image2 : Texture2D = preload("res://img/greenFire2.png")

# Reference to the Sprite2D or TextureRect that will display the images
@onready var image_display : TextureRect = $TextureRect  # Adjust this if you're using TextureRect

# Boolean to track which image is currently being displayed
var showing_first_image : bool = true

# Timer to handle the image swapping
@onready var timer : Timer = $Timer

# Function to swap the images
func swap_images() -> void:
	if showing_first_image:
		image_display.texture = image2
	else:
		image_display.texture = image1


	# Toggle the boolean to alternate images
	showing_first_image = not showing_first_image

# Start the image loop when the scene is ready
func _ready() -> void:
	# Show the first image initially
	image_display.texture = image1
	
	# Connect the timer timeout signal to swap_images function
	#timer.timeout.connect(swap_images)
	
	# Start the timer with a loop (you can adjust the wait time in the Timer node or set it here)
	#timer.start()
	
	if timer != null:
		timer.timeout.connect(swap_images)
		timer.start(0.5)
