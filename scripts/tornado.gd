extends CharacterBody2D


var speed = 300.0
var damage = 10
var rng = RandomNumberGenerator.new()

func _ready():
	var n1 = rng.randf_range(-1, 1)
	var n2 = rng.randf_range(-1, 1)
	velocity = Vector2(n1,n2).normalized() * speed


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())




func _on_area_2d_body_entered(body) -> void:
	body.take_damage(damage)
