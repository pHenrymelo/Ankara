extends Area2D

func _ready():
	add_to_group("moeda")
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Colisão detectada com o jogador!")
		self.visible = false
		var parent_node = get_parent()
		for child in parent_node.get_children():
			child.visible = false
		parent_node.queue_free()  # Remove o Node2D inteiro
