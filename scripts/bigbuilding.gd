extends StaticBody2D

var hp = 1200
var mancount = 20
var destroyed := false
var disasters = ["tornado", "earthquake", "lightning", "flood"]
var multipliers = [.5, .5, 2, 2]
var local_scale = Vector2(.6,.6)
signal destroyed_building
@onready var f1: Polygon2D = $Flooding_1
@onready var f2: Polygon2D = $Flooding_2
@onready var f3: Polygon2D = $Flooding_3
@onready var sfx = $AudioStreamPlayer

func _ready() -> void:
	$Broken2.hide()

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
		$Building2.hide()
		$CollisionPolygon2D.queue_free()
		$Broken2.show()
		destroyed_building.emit()
		sfx.play()

func damage_effect() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", local_scale * 1.15, 0.05).from(local_scale)
	tween.tween_property(self, "scale", local_scale, 0.05).from(local_scale * 1.15)
	
func flood():
	match Global.flood_level:
		1:
			f1.visible = true
		2:
			f2.visible = true
		3:
			f3.visible = true
		_:
			pass
 
