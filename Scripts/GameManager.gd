extends Node2D

@export var target_skor: int = 7
@export var batas_waktu: float = 20.0
@export_file("*.tscn") var scene_menang: String = "res://Scene/win.tscn"
@export_file("*.tscn") var scene_kalah: String = "res://Scene/lose.tscn"

# Sesuaikan node path UI kamu
@onready var label_skor: Label = $Player/Camera2D/coin
@onready var label_timer: Label = $Player/Camera2D/time

var skor_saat_ini: int = 0
var sisa_waktu: float = 0.0
var game_selesai: bool = false

func _ready() -> void:
	sisa_waktu = batas_waktu
	perbarui_ui()

func _process(delta: float) -> void:
	if game_selesai:
		return
		
	sisa_waktu -= delta
	perbarui_ui()
	
	# Cek batas waktu habis
	if sisa_waktu <= 0:
		sisa_waktu = 0
		game_selesai = true
		cek_kondisi_game()

func tambah_skor(jumlah: int = 1) -> void:
	if game_selesai:
		return
		
	skor_saat_ini += jumlah
	perbarui_ui()
	
	# Langsung menang jika mencapai target sebelum waktu habis
	if skor_saat_ini >= target_skor:
		game_selesai = true
		get_tree().change_scene_to_file(scene_menang)

func cek_kondisi_game() -> void:
	if skor_saat_ini >= target_skor:
		get_tree().change_scene_to_file(scene_menang)
	else:
		get_tree().change_scene_to_file(scene_kalah)

func perbarui_ui() -> void:
	if label_skor:
		label_skor.text = "Skor: " + str(skor_saat_ini) + " / " + str(target_skor)
	if label_timer:
		label_timer.text = "Waktu: " + str(ceil(sisa_waktu)) + "s"
