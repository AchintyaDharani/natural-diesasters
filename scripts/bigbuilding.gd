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
	Global.coins += damage

	if hp <= 0:
		destroyed = true
		$Building2.hide()
		$CollisionPolygon2D.queue_free()
		$Broken2.show()
