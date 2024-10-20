extends Node2D  # Assuming the root node of your introPage scene is Node2D

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://introPage.tscn")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI_dialogue.tscn")
