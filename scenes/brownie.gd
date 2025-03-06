extends Area2D

var sprite

func _ready():
	add_to_group("bau")
	connect("body_entered", _on_body_entered)
	
	sprite = get_parent().get_node("AnimatedSprite2D")
	
	if not sprite:
		var potential_sprite = get_node("../AnimatedSprite2D")
		if potential_sprite:
			sprite = potential_sprite

func _on_body_entered(body):
	if body.is_in_group("player"):
		if sprite:
			sprite.play("open")
			sprite.connect("animation_finished", _on_animation_finished)
		else:
			_on_animation_finished()

func _on_animation_finished():
	self.visible = false
	var parent_node = get_parent()
	for child in parent_node.get_children():
		child.visible = false
	parent_node.queue_free()
