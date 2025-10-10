extends Node2D

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_51_pressed() -> void:
	OS.shell_open("/scenes/51/")

func _on_72_pressed() -> void:
	OS.shell_open("/scenes/72/")

func _on_75_pressed() -> void:
	OS.shell_open("/scenes/75/")

func _on_80_pressed() -> void:
	OS.shell_open("/scenes/80/")
