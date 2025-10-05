extends Area2D

signal game_end()

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		emit_signal("game_end")
	else: body.queue_free()
