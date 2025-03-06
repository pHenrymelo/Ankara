extends Node2D

@export var mute: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not mute:
		play_music()


func play_music():
	if not mute:
		$music.play()

func play_level():
	if not mute:
		$music.stop()
		$level1_music.play()
		
