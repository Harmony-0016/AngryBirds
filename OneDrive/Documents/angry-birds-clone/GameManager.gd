extends Node

var pigs_remaining = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.pigs_remaining = get_tree().get_nodes_in_group("pigs").size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
