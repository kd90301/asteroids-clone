extends Area2D


@export var speed := 850

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _ready() -> void:
	area_entered.connect(on_bullet_object_entered)

func on_bullet_object_entered(area_entered) -> void:
	if area_entered.is_in_group("enemy"):
		queue_free()
	else:
		pass
		
