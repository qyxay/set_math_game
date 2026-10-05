extends Node2D

@onready var dialogue_ui: DialogueUi = $CanvasLayer/DialogueUI

func play_dialogue_for_times(times:int):
	for i in range(times):
		await dialogue_ui.typing_tween.finished
		dialogue_ui.display_next_dialogue(0.09)

func auto_play_dialogue():
	while dialogue_ui.dialogue_index < len(dialogue_ui.main_dialogue.dialogue_list):
		await dialogue_ui.typing_tween.finished
		dialogue_ui.display_next_dialogue()

func _ready() -> void:
	play_dialogue_for_times(5)
	var card := Glo.card_scene.instantiate() as Card
	card.input_desc = "属于"
	card.position = Vector2(0,0)
	$CanvasLayer.add_child(card)
