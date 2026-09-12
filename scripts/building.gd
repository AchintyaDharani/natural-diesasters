extends StaticBody2D

var hp = 100
var mancount = 4



func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	if hp == 0:
		queue_free()
	
func take_damage(damage):
	hp -= damage
	Global.coins += 10
