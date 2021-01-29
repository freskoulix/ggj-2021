extends Node

const TRACKS = [ 'loki_music_1', 'loki_music_2',]

onready var musicStream : AudioStreamPlayer = $"music_player"


func play_random():
	var rand_nb = randi() % TRACKS.size()
	var _musicRandom = load('res://audio/music/' + TRACKS[rand_nb] + '.wav')
	get_node("music_player").set_stream(_musicRandom)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	play_random()
	musicStream.play()
	pass # Replace with function body.



func _on_music_player_finished():
	play_random()
	musicStream.play()
	pass # Replace with function body.
