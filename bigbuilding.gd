extends StaticBody2D

var hp = 400
var mancount = 20



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	
func take_damage(damage):
	hp -= damage
	print(hp)
	Global.coins += 10
