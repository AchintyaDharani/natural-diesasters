extends StaticBody2D

var hp = 100
var mancount = 4



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	
func take_damage(damage):
	hp -= damage
	Global.coins += 10
