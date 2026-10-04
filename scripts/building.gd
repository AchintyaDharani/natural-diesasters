extends StaticBody2D

var hp = 100
var mancount = 4
var destroyed := false

func _ready() -> void:
	$Broken1.hide()

func take_damage(damage):
	if destroyed:
		return

	hp = hp - damage
	print(hp)
	Global.coins += 10

	if hp <= 0:
		destroyed = true
		$Building1.hide()
		$Broken1.show()
 
