extends Control

# Ubah path ini sesuai letak file scene game kamu
@export_file("*.tscn") var game_scene_path: String = "res://Scene/main.tscn"

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(game_scene_path)


func _on_quit_pressed() -> void:
	get_tree().quit()
