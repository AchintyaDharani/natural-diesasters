extends StaticBody2D

var hp = 200
var mancount = 4
var destroyed := false
var disasters = ["tornado", "earthquake", "lightning"]
var multipliers = [2, 2, .5]


func _ready() -> void:
	$Broken3.hide()

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
		$Building3.hide()
		$Broken3.show()
