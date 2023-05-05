extends ColorRect

@export var title:String = ""
@export var limited :Array = []

const file_explorer = preload("res://scenes/file_explorer.tscn")

signal cancel
signal open(path:String)

func _ready():
	$title.text = title

func new_path(path:String):
	$path.text = path

func _on_browse_pressed():
	var nExplor = file_explorer.instantiate()
	get_parent().add_child(nExplor)
	nExplor.limited = limited
	nExplor.done.connect(new_path)


func _on_open_pressed():
	emit_signal("open", $path.text)

func _on_cancel_pressed():
	emit_signal("cancel")
