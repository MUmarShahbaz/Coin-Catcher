extends Node

@export var fs_label: Label
@export var coins: Label
@export var game_end_sfx: AudioStreamPlayer
@export var explore_button: Button

var ended: bool = false

func _process(delta: float) -> void:
	if ended and Input.is_anything_pressed() and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_tree().change_scene_to_file("res://game.tscn")

func _on_game_end() -> void:
	if ended: return
	game_end_sfx.play()
	fs_label.text = "Game Over\n\nYou earned " + coins.text + " Coins\n\nPress anything to continue"
	fs_label.show()
	explore_button.show()
	ended = true


func _on_explore_pressed() -> void:
	get_tree().change_scene_to_file("res://explore.tscn")
