extends Card

var anim := Animate.new(self,"move_to",{"position":Vector2(100,100)})
func _ready() -> void:
	anim.play()
