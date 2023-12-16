extends Node

var dummy = preload("res://Resources/Block/Dummy/Tile_item.tres")
var concrete = preload("res://Resources/Block/Concrete/Tile_item.tres")

func get_item_from_name(item_name:String):
	return get(item_name)
	
func get_tran_from_name(item_name:String):
	return get(item_name).item_name
func get_icon_from_name(item_name:String):
	return get(item_name).item_icon
