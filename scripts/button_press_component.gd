extends Node
class_name ButtonComponent

var parent

func _ready() -> void:
	parent = get_parent()

func _press_button():
	if !parent:
		return

	parent.pivot_offset_ratio = Vector2(0.5, 0.5)

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(parent, "scale", Vector2(1.2, 1.2), 0.2).from(Vector2.ONE)
	tween.parallel().tween_property(parent, "rotation", randf_range(-0.2, 0.2), 0.2)
	tween.tween_property(parent, "scale", Vector2.ONE, 0.2)
	tween.parallel().tween_property(parent, "rotation", 0.0, 0.2)
