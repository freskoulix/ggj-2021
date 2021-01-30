extends MeshInstance

onready var tween = get_node("Tween")
onready var material = self.get_surface_material(0)

func _ready():
	tween.interpolate_property(material, "emission_energy", 0, 7, 0.7, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
