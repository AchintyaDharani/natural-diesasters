extends StaticBody2D

var hp = 100
var mancount = 4
var destroyed := false
var disasters = ["tornado", "earthquake", "lightning"]
var multipliers = [2, 2, .5]
var local_scale = Vector2(.6,.6)

func _ready() -> void:
	$Broken1.hide()

func take_damage(damage, type):
	if destroyed:
		return
	damage_effect()
	for i in disasters:
		if i == type:
			hp = hp - damage * multipliers[disasters.find(i)]
			print(hp)
			Global.coins += damage

	if hp <= 0:
		destroyed = true
		$Building1.hide()
		$Broken1.show()
		
func damage_effect() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", local_scale * 1.15, 0.05).from(local_scale)
	tween.tween_property(self, "scale", local_scale, 0.05).from(local_scale * 1.15)
 
