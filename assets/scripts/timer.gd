extends Label

var started: bool = false
@export var seconds: float = 60.0

signal game_end()

func _process(delta: float) -> void:
	if started:
		seconds -= delta
		text = format_time(seconds)
	if seconds < 0:
		started = false
		emit_signal("game_end")

func _on_game_start() -> void:
	started = true

func format_time(s: float) -> String:
	var int_s = int(s)
	var mm:int = int_s / 60
	var ss:int = int_s % 60 
	return "%02d:%02d" % [mm, ss]
