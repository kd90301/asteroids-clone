extends Area2D


@export var speed := 850

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func on_bullet_object_entered(object_entered) -> void:
	if object_entered.is_in_group("enemy"):
		object_entered.queue_free()
	queue_free()
