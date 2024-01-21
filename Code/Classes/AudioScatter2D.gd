extends Marker2D
class_name AudioScatter2D


@export var instance_count: int = 10;
@export var sounds: Array[AudioStream];

@onready var end_point = get_children()[0].position;
func _ready():

	for i in range(instance_count):
		var new_stream = AudioStreamPlayer2D.new();
		new_stream.stream = sounds.pick_random();
		new_stream.position.x = end_point.x * randf()
		new_stream.position.y = end_point.y * randf()
		add_child(new_stream)
		new_stream.play()
		new_stream.max_distance = 100
		new_stream.finished.connect(stream_finished.bind(new_stream))

func _physics_process(_delta):
	end_point = get_children()[0].position;

func stream_finished(stream: AudioStreamPlayer2D):
	stream.position.x = end_point.x * randf()
	stream.position.y = end_point.y * randf()
	stream.play()

