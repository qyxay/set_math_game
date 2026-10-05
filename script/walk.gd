extends Node
class_name Walk
static func play(object, target_pos: Vector2, duration: float):
	var tween : Tween = object.create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(object, "position", target_pos, duration)
