extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(_body: Node2D) -> void:
	print('die')
	get_tree().reload_current_scene()
