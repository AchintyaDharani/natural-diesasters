extends StaticBody2D

var hp = 100



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	
func take_damage():
	hp -= 10
	Global.coins += 10
	print(Global.coins)
	
