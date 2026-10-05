@tool
extends Control
class_name Card

const CARD_SIZE:Vector2 = Vector2(308.0,416.0)
func _property_can_revert(property:StringName) -> bool:
	if property == &"size":
		return true
	return false
func _property_get_revert(property:StringName):
	if property == &"size":
		return CARD_SIZE
	return null

static var card_desc2info:Dictionary = {
	"属于": CardInfo.get_basic_card("∈"),
	"包含": CardInfo.get_basic_card("⊇"),
	"并": CardInfo.get_basic_card("∪"),
	"空集公理": CardInfo.new("∃s(∀x,x∉s)", Vector2(720,410), 48, 128)
}

@export var input_desc:String = "":
	set(new_val):
		if input_desc == new_val:
			return
		input_desc = new_val
		set_card()
@export var input_symbol:String = "":
	set(new_val):
		if input_symbol == new_val:
			return
		input_symbol = new_val
		set_card()
@export var input_up_ratio:float = 2.49:
	set(new_val):
		if input_up_ratio == new_val:
			return
		input_up_ratio = new_val
		set_ratio()
@export var input_desc_font:float = 48.0:
	set(new_val):
		if input_desc_font == new_val:
			return
		input_desc_font = new_val
		set_card()
@export var input_symbol_font:float = 128.0:
	set(new_val):
		if input_symbol_font == new_val:
			return
		input_symbol_font = new_val
		set_card()
@export var using_card_info:bool = true:
	set(new_val):
		if using_card_info == new_val:
			return
		using_card_info = new_val
		set_card()

func set_card():
	var symbol:Label = get_node_or_null("Panel/VBoxContainer/Up/Symbol")
	var desc:Label = get_node_or_null("Panel/VBoxContainer/Down/MarginContainer/Description")
	if symbol == null or desc == null: return
	desc.text = input_desc
	
	var info : CardInfo = card_desc2info.get(input_desc,CardInfo.new("?",Vector2.ZERO,0,0))
	symbol.text = info.symbol if input_symbol == "" else input_symbol
	
	if using_card_info:
		if info.card_size != Vector2.ZERO :  size = info.card_size
		set_label_font_size(desc, input_desc_font, info.desc_font)
		set_label_font_size(symbol, input_symbol_font, info.symbol_font)

func set_label_font_size(label:Label, base_font:float, info_font:float):
	var final_font : float = base_font if info_font == 0 else info_font
	label.set("theme_override_font_sizes/font_size", final_font)

func set_ratio():
	var up:Panel = get_node_or_null("Panel/VBoxContainer/Up")
	if up == null: return
	up.size_flags_stretch_ratio = input_up_ratio

func _ready() -> void:
	set_card()
	set_ratio()
