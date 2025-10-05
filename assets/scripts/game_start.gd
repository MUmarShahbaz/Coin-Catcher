extends Node

@export var intro: Label
signal begin()

var intro_messages: Array[String] = [
	"The Coin Fairy is filthy rich.\nCoins literally fall out of her pockets!\n\nPress anything.....",
	"You on the other hand, are broke.\nReally broke.\n\nPress anything.....",
	"You are a negative millionaire.\nThis term was invented just to describe you.\n\nPress anything.....",
	"Collect as many coins as you can in 2 minutes\nor the IRS might krchhhkk you.\n\nPress anything.....",
	"AD for Left and Right\nSpace for Jump\nIJKL to Move Camera\n\nPress anything to start......"
]

var current_message = -1

var anything_released := false

func _input(event: InputEvent) -> void:
	if not event.is_pressed() and not (event is InputEventMouse):
		anything_released = true

func _process(delta: float) -> void:
	if anything_released:
		anything_released = false
		current_message += 1
		if current_message == intro_messages.size():
			intro.hide()
			emit_signal("begin")
			queue_free()
			return
		intro.text = intro_messages[current_message]
