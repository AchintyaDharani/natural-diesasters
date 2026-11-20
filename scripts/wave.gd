extends Area2D

var damage = 120
@onready var level = $".."
var list = []



func increase_flood_level():
	Global.flood_level +=1
	level.flood()
	for i in list:
		i.flood()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage, "flood")
	list.append(body)
