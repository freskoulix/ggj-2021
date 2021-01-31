extends Label

var bones = 0

func _ready():
	text = String(bones)

func _on_coin_boneCollected():
	print("collected")
	bones = bones + 1
	_ready()
