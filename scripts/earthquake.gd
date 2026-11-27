extends Area2D

var building = []
var damage = 10

@onready var hitbox = $CollisionShape2D
@onready var redraw = false
var level:int = -1:
	set(value):
		if value == level:
			return
		level = value
		_on_level_changed()


func _on_level_changed():
	match level:
		0:
			damage = 10
			self.scale = Vector2(.1, .1)
		1:
			damage = 15
			self.scale = Vector2(.3, .3)
		2:
			damage = 20
			self.scale = Vector2(.4, .4)
		3:
			damage = 25
			self.scale = Vector2(.4, .4)
		4:
			damage = 30
			self.scale = Vector2(0.6,0.6)
		5:
			damage = 45
			self.scale = Vector2(0.8,0.8)


func _ready() -> void:
	process_mode = PROCESS_MODE_DISABLED


func _draw() -> void:
	var s = 1
	match Global.earthquake_level:
		0:
			s = 0.1
		1:
			s = 0.3
		2:
			s = 0.4
		3:
			s = 0.4
		4:
			s = 0.6
		5:
			s = 0.8
	if redraw == false:
		draw_circle(Vector2(0,0),hitbox.shape.radius * 3 * s, Color.RED)


func _process(_delta: float) -> void:
	if redraw != true:
		redraw = true
		queue_redraw()
	level = Global.earthquake_level

func _on_body_entered(body: Node2D) -> void:
	building.append(body)

func deal_damage():
	for i in building:
		i.take_damage(damage, "earthquake")


func activate():
	process_mode = PROCESS_MODE_INHERIT
