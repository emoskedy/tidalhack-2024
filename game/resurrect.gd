extends Node2D  # Assuming the root node of your introPage scene is Node2D

func _on_texture_button_pressed() -> void:
	OS.shell_open("http://localhost:8501")
