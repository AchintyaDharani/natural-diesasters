extends CharacterBody2D


var speed = 300.0
var damage = 10

func _ready():
	velocity = Vector2(200,200).normalized() * speed


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())




func _on_area_2d_body_entered(body) -> void:
	body.take_damage(damage)
=======
func _on_area_2d_body_entered(body) -> void:
	body.take_damage()
