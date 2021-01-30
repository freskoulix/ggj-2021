extends Node

const TRACKS = [
	'loki_music_1',
	'loki_music_2',
	'loki_music_3'
]

onready var musicStream : AudioStreamPlayer = $"Music"

func play_random():
	var rand_nb = randi() % TRACKS.size()
	var _musicRandom = load('res://audio/music/' + TRACKS[rand_nb] + '.ogg')
	get_node("Music").set_stream(_musicRandom)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	play_random()
	musicStream.play()

func _on__music_finished():
	play_random()
	musicStream.play()
