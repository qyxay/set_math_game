class_name Animate
var object
var para:Dictionary

func _init(_object):
	object = _object

func move_to(target_pos: Vector2, duration: float):
	var tween : Tween = object.create_tween()
	tween.tween_property(object, "position", target_pos, duration)

func rotate_to(target_angle: float, duration: float):
	var tween : Tween = object.create_tween()
	tween.tween_property(object, "rotation_degrees", target_angle, duration)

func rotate_to_short(target_deg: float, duration: float):
	var current_deg = object.rotation_degrees
	var delta = angle_difference(deg_to_rad(current_deg), deg_to_rad(target_deg))
	var real_target_rad = object.rotation + delta
	var tween : Tween = object.create_tween()
	tween.tween_property(object, "rotation", real_target_rad, duration)
