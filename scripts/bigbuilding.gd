extends StaticBody2D

var hp = 400
var mancount = 20
var destroyed := false

func _ready() -> void:
	$Broken2.hide()

func take_damage(damage):
	if destroyed:
		return

	hp = hp - damage
	print(hp)
	Global.coins += 10

	if hp <= 0:
		destroyed = true
		$Building2.hide()
		$Broken2.show()
