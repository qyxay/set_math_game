extends Control
class_name DialogueUi

@export_group("UI")
@export var text_box : Label
@export var left_avatar : TextureRect
@export var right_avatar : TextureRect

@export_group("对话")
@export var main_dialogue : DialogueGroup


var dialogue_index := 0
var typing_tween : Tween

func display_next_dialogue(single_time:float = 0.05):
	if dialogue_index >= len(main_dialogue.dialogue_list):
		visible = false
		return
	var dialogue := main_dialogue.dialogue_list[dialogue_index]
	
	if typing_tween and typing_tween.is_running():
		typing_tween.kill()
		text_box.text = dialogue.content
		dialogue_index += 1
		return
	
	typing_tween = get_tree().create_tween()
	text_box.text = ""
	build_typing_tween(dialogue.content,typing_tween,single_time)
	
	if dialogue.show_on_left : 
		left_avatar.texture = dialogue.avatar
		right_avatar.texture = null
	else :
		right_avatar.texture = dialogue.avatar
		left_avatar.texture = null

func append_character(character : String):
	text_box.text += character

func build_typing_tween(content:String, tween:Tween, single_time:float):
	var regex = RegEx.new()
	regex.compile("\\\\([a-zA-Z0-9])([^\\\\]*)\\\\")

	var ptr = 0
	var len_text = content.length()
	
	while ptr < len_text:
		var match = regex.search(content,ptr)
		if not match or match.get_start() != ptr:
			tween.tween_callback(append_character.bind(content[ptr]))\
			.set_delay(single_time)
			ptr += 1
		else:
			var tag_id : String = match.get_string(1)
			var tag_param : String = match.get_string(2)
			match_tag(tag_id,tag_param,tween)
			
			ptr = match.get_end()
	
	tween.tween_callback(func(): dialogue_index += 1)

func match_tag(id:String, param:String, tween:Tween):
	match id:
		"p": # pause
			if param.is_valid_int():
				var wait_sec = param.to_int() / 1000.0
				tween.tween_interval(wait_sec)
			else :
				push_error("等待ms数非整数")

func _ready() -> void:
	display_next_dialogue()

func on_click(event: InputEvent) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		display_next_dialogue()
