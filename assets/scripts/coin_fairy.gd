extends Area2D

@export var coin_scene: PackedScene
@export var collider: CollisionShape2D
@export var count: Label
@export var coin_sfx: AudioStreamPlayer

@export var SPEED: float = 10
@export var base_drop_time: float = 0.5

var last_coin_time:float = 0.0
var started: bool = false

func _process(delta: float) -> void:
	if started:
		last_coin_time += delta
		if last_coin_time > ((randf()/4) * randi_range(-1, 1)) + base_drop_time:
			last_coin_time = 0
			spawn_coin()
		global_position.x += SPEED * delta

func spawn_coin():
	var rect: RectangleShape2D = collider.shape
	var extents = rect.extents
	var rand_x = randf_range(-extents.x, extents.x)
	var rand_y = randf_range(-extents.y, extents.y)
	var local_pos = Vector2(rand_x, rand_y)
	var new_coin: Coin = coin_scene.instantiate()
	new_coin.global_position = local_pos + global_position
	new_coin.collected.connect(Callable(self, "coin_collected"))
	add_sibling(new_coin)

func coin_collected():
	count.text = str(int(count.text) + 1)
	coin_sfx.play()

func start():
	started = true
