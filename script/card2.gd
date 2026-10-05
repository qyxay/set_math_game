@tool
extends Control
class_name Card2

var content = {
	"welcome":["欢迎你游玩此游戏！","","  在此游戏中，你会通过卡牌上的指示，收集或制作必要的卡牌，完成相应的任务，从零创造一个世界。
  建议游玩时长：两个月。",90.0,42.0,35.0,0.71,true]
}

const CARD_SIZE:Vector2 = Vector2(792.0,300.0)
func _property_can_revert(property:StringName) -> bool:
	if property == &"size":
		return true
	return false
func _property_get_revert(property:StringName):
	if property == &"size":
		return CARD_SIZE
	return null

@export var input_title1:String = "":
	set(new_val):
		if input_title1 == new_val:
			return
		input_title1 = new_val
		set_card()
@export var input_title2:String = "":
	set(new_val):
		if input_title2 == new_val:
			return
		input_title2 = new_val
		set_card()
@export_multiline var input_desc:String = "":
	set(new_val):
		if input_desc == new_val:
			return
		input_desc = new_val
		set_card()
@export var input_title1_font:float = 90.0:
	set(new_val):
		if input_title1_font == new_val:
			return
		input_title1_font = new_val
		set_card()
@export var input_title2_font:float = 42.0:
	set(new_val):
		if input_title2_font == new_val:
			return
		input_title2_font = new_val
		set_card()
@export var input_desc_font:float = 35.0:
	set(new_val):
		if input_desc_font == new_val:
			return
		input_desc_font = new_val
		set_card()
@export var input_up_ratio:float = 0.59:
	set(new_val):
		if input_up_ratio == new_val:
			return
		input_up_ratio = new_val
		set_ratio()
@export var is_middle:bool = false:
	set(new_val):
		if is_middle == new_val:
			return
		is_middle = new_val
		set_card()

func set_card():
	var title1:Label = get_node_or_null("Panel/VBoxContainer/Up/HBoxContainer/MarginContainer/Title1")
	var title2:Label = get_node_or_null("Panel/VBoxContainer/Up/HBoxContainer/MarginContainer2/Title2")
	var desc:RichTextLabel = get_node_or_null("Panel/VBoxContainer/Down/MarginContainer/Description")
	
	if title1 == null or title2 == null or desc == null: return
	
	title1.text = input_title1
	title2.text = input_title2
	desc.text = input_desc
	
	title1.set("theme_override_font_sizes/font_size", input_title1_font)
	title2.set("theme_override_font_sizes/font_size", input_title2_font)
	desc.set("theme_override_font_sizes/font_size", input_desc_font)
	
	title1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER if is_middle else HORIZONTAL_ALIGNMENT_LEFT

func set_ratio():
	var up:Panel = get_node_or_null("Panel/VBoxContainer/Up")
	if up == null: return
	up.set("size_flags_stretch_ratio",input_up_ratio)

func _ready() -> void:
	set_card()
