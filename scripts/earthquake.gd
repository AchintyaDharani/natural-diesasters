extends Area2D

var building = []
var damage = 50
@onready var hitbox = $CollisionShape2D
@onready var redraw = false
var level:int = 0:
	set(value):
		if value == level:
			return
		level = value
		_on_level_changed()


func _on_level_changed():
	match level:
		0:
			damage = 50
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


func _ready() -> void:
	process_mode = PROCESS_MODE_DISABLED


func _draw() -> void:
	if redraw == false:
		draw_circle(Vector2(0,0),hitbox.shape.radius * 3, Color.RED)


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
