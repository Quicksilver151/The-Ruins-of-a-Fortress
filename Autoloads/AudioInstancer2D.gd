extends Node2D


func play_sound(sound: String, position: Vector2 = Vector2.ZERO):
  if position == Vector2.ZERO:
    var new_player: AudioStreamPlayer = AudioStreamPlayer.new()
    new_player.stream = load("res://Assets/Audio/"+sound+".ogg")
    add_child(new_player)
    new_player.play()
    await new_player.finished
    new_player.queue_free()
  else:
    var new_player: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
    new_player.stream = load("res://Assets/Audio/"+sound+".ogg")
    new_player.position = position
    add_child(new_player)
    new_player.play()
    await new_player.finished
    new_player.queue_free()

