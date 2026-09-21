extends Area2D


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(_body: Node2D) -> void:
	Koin.reset_skor()
	get_tree().call_deferred("change_scene_to_file", "res://Scene/lose.tscn")
