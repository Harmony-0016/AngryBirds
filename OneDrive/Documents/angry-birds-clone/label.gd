extends Label

func _ready():
	visible = false # Stay hidden while there are still pigs [cite: 178]

func _process(_delta):
	# Check the global brain 60 times a second
	if GameManager.pigs_remaining <= 0:
		visible = true # Show "Level Clear!" [cite: 191]
