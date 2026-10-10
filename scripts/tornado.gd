extends CharacterBody2D


var speed = 300.0
var damage = 10
var rng = RandomNumberGenerator.new()
var nullvector = Vector2(0, 0)
var level:int = 0:
	set(value):
		if value == level:
			return
		level = value
		_on_level_changed()


func _on_level_changed():
	match level:
		0:
			damage = 10
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass

func _ready():
	velocity = nullvector.normalized() * speed
	process_mode = PROCESS_MODE_DISABLED



func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


func _process(_delta: float) -> void:
	level = Global.tornado_level

func update_direction(direction):
	if direction == nullvector:
		var n1 = rng.randf_range(-1,1)
		var n2 = rng.randf_range(-1,1)
		direction = Vector2(n1,n2) 
	velocity = direction.normalized() * speed


func _on_area_2d_body_entered(body) -> void:
	body.take_damage(damage, "tornado")

func activate():
	process_mode = PROCESS_MODE_INHERIT


func _on_timer_timeout() -> void:
	self.queue_free()
