extends StaticBody2D

var hp = 400
var mancount = 20



func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	if hp == 0:
		queue_free()
	
func take_damage(damage):
	hp -= damage
	print(hp)
	Global.coins += 10
