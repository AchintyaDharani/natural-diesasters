extends StaticBody2D

var hp = 200
var mancount = 4
var destroyed := false

func _ready() -> void:
	$Broken3.hide()

func take_damage(damage):
	if destroyed:
		return

	hp = hp - damage
	print(hp)
	Global.coins += 10

	if hp <= 0:
		destroyed = true
		$Building3.hide()
		$Broken3.show()
