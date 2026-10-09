extends StaticBody2D

var hp = 100
var mancount = 4
var destroyed := false
var disasters = ["tornado", "earthquake", "lightning"]
var multipliers = [2, 2, .5]

func _ready() -> void:
	$Broken1.hide()

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
		$Building1.hide()
		$Broken1.show()
 
