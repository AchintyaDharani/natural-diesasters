extends Area2D

var damage = 25
@onready var levelscn = $".."
var list = []

var level:int = -1:
	set(value):
		if value == level:
			return
		level = value
		_on_level_changed()


func _on_level_changed():
	match level:
		0:
			damage = 25

		1:
			damage = 45

		2: 
			damage = 50

		3:
			damage = 65

		4:
			damage = 78

		5:
			damage = 90

func _process(_delta: float) -> void:
	level = Global.wave_level

func increase_flood_level():
	Global.flood_level +=1
	levelscn.flood()
	for i in list:
		i.flood()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage, "flood")
	list.append(body)
