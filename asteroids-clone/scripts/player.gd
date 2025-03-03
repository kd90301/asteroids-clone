extends Area2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var marker_2d: Marker2D = $Sprite2D/Marker2D

@export var max_speed := 100.0
var velocity := Vector2(0,0)
var steering_factor := 10.0

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	

func _process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	
	if direction.length() > 0.0:
		get_node("Sprite2D").rotation = velocity.angle()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	 
	

func _on_area_entered(area_that_entered : Area2D) -> void:
	if area_that_entered.is_in_group("enemy"):
		queue_free()


func shoot() -> void:
	var bullet = BULLET.instantiate()
	get_tree().root.add_child(bullet)
	bullet.transform = marker_2d.global_transform
	
