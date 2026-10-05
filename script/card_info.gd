extends Node
class_name CardInfo

const CARD_SIZE:Vector2 = Vector2(308.0,416.0)
const DESC_FONT:float = 48
const SYMBOL_FONT:float = 128

var symbol:String
var card_size:Vector2
var desc_font:float
var symbol_font:float

func _init(input_symbol:String, input_card_size:Vector2, input_desc_font:float, input_symbol_font) -> void:
	symbol = input_symbol
	card_size = input_card_size
	desc_font = input_desc_font
	symbol_font = input_symbol_font

static func get_basic_card(_symbol:String):
	return new(_symbol,CARD_SIZE,DESC_FONT,SYMBOL_FONT)
