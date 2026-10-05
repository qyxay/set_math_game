extends Node2D
func _ready() -> void:
	var card_scene:PackedScene = load("res://scenes/card.tscn")
	var card := card_scene.instantiate() as Card
	card.input_desc = "属于"
	card.position = Vector2(640,360)
	$CanvasLayer.add_child(card)
