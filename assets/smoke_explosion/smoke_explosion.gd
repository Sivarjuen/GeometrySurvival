extends Node2D


func _ready():
	%Smoke.material.set_shader_parameter("texture_offset", Vector2(randfn(0.0, 1.0), randfn(0.0, 1.0)))
	%AnimationPlayer.play("explosion")

func _on_animation_player_animation_finished(anim_name):
	queue_free()
