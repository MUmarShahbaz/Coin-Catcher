extends RigidBody2D
class_name Coin

signal collected()

func _ready() -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		emit_signal("collected")
		queue_free()
