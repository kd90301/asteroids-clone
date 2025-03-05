extends Area2D

@export var velocity := Vector2(0,0)
@export var speed := 10.0


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	rotation = randf_range(0, PI*2)

# Tween enemy position toward player position at spawn 

func _on_area_entered(area_that_entered : Area2D) -> void:
	if area_that_entered.is_in_group("bullet"):
		queue_free()
		# need to generate pickups with this function 

func _process(delta: float) -> void:
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
	
	position += velocity  * delta
	
