extends KinematicBody

export(NodePath) var animationtree

onready var _anim_tree = get_node(animationtree)

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		_anim_tree["parameters/playback"].travel("char05_Running")
	else:
			_anim_tree["parameters/playback"].travel("char05_Idle")
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
