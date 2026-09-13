extends CharacterBody2D


var speed = 300.0
var damage = 10
var rng = RandomNumberGenerator.new()
var nullvector = Vector2(0, 0)

func _ready():
	velocity = nullvector.normalized() * speed



func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


func update_direction(direction):
	velocity = direction.normalized() * speed


func _on_area_2d_body_entered(body) -> void:
	body.take_damage(damage)
