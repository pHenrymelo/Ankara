extends Control

var music_player: AudioStreamPlayer

func _ready() -> void:
		AudioController.play_music()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/medieval.tscn")

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
