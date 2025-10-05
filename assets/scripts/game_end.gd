extends Node

@export var fs_label: Label
@export var coins: Label
@export var game_end_sfx: AudioStreamPlayer

var ended: bool = false

func _process(delta: float) -> void:
	if ended and Input.is_anything_pressed():
		get_tree().change_scene_to_file("res://game.tscn")

func _on_game_end() -> void:
	if ended: return
	game_end_sfx.play()
	fs_label.text = "Game Over\n\nYou earned " + coins.text + " Coins\n\nPress anything to continue"
	fs_label.show()
	ended = true
