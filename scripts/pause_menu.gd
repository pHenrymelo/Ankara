extends CanvasLayer

@onready var resume_btn = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer/VBoxContainer/continuar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('esc'):
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()
		

func _on_continuar_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_sair_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main menu.tscn")
