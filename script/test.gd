extends Node2D

func _ready() -> void:
	var anim = Animate.new($Card)
	anim.move_to(Vector2(200,200),2)
