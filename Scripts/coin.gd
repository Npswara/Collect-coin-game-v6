extends Area2D
class_name Koin

# Node Label dipanggil otomatis saat scene siap (ready)
@onready var label: Label = $"../../Player/Camera2D/coin"

static var skor: int = 0
const TARGET_SKOR: int = 7

static func reset_skor() -> void:
	skor = 0
	
func _on_body_entered(_body: Node2D) -> void:
	skor += 1
	
	if label:
		label.text = "Coin :" + str(skor)
	
	if skor >= TARGET_SKOR:
		get_tree().call_deferred("change_scene_to_file", "res://Scene/win.tscn")

	queue_free()
