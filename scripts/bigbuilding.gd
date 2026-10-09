extends StaticBody2D

var hp = 400
var mancount = 20
var destroyed := false
var disasters = ["tornado", "earthquake", "lightning"]
var multipliers = [.5, .5, 2]

func _ready() -> void:
	$Broken2.hide()

func take_damage(damage, type):
	if destroyed:
		return
	
	for i in disasters:
		if i == type:
			hp = hp - damage * multipliers[disasters.find(i)]
			print(hp)
			Global.coins += damage

	if hp <= 0:
		destroyed = true
		$Building2.hide()
		$CollisionPolygon2D.queue_free()
		$Broken2.show()
