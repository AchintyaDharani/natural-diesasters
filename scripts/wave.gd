extends Area2D

var damage = 5
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
			damage = 5

		1:
			damage = 8

		2: 
			damage = 12 

		3:
			damage = 15

		4:
			damage = 18

		5:
			damage = 25

func _process(_delta: float) -> void:
	level = Global.wave_level

func increase_flood_level():
	if Global.flood_level == 0 and Global.wave_level == 1:
		Global.flood_level +=1
		levelscn.flood()
		for i in list:
			i.flood()
		
	if Global.flood_level == 1 and Global.wave_level == 3:
		Global.flood_level +=1
		levelscn.flood()
		for i in list:
			i.flood()
			
	if Global.flood_level == 2 and Global.wave_level == 5:
		Global.flood_level +=1
		levelscn.flood()
		for i in list:
			i.flood()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage, "flood")
	list.append(body)
