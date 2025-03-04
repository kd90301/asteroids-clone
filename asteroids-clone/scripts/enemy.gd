extends Area2D

@export var velocity : Vector2 = Vector2(50,50)


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area_that_entered : Area2D) -> void:
	if area_that_entered.is_in_group("bullet"):
		queue_free()

func _process(delta: float) -> void:

	pass
	
