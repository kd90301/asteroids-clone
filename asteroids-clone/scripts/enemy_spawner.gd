extends Node2D

var enemy = preload("res://scenes/enemy.tscn")

func _ready() -> void:
	get_node("Timer").timeout.connect(on_timer_timeout)
	
func on_timer_timeout() -> void:
	var enemy_instance := enemy.instantiate()
	add_child(enemy_instance)
	var viewport_size := get_viewport_rect().size
	var random_position := Vector2(0, 0)
	random_position.x = randf_range(0, viewport_size.x)
	random_position.y = randf_range(0, viewport_size.y)
	enemy_instance.position = random_position
	
