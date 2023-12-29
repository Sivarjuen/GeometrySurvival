extends Node2D

func set_animation_speed(value):
	%AnimationPlayer.speed_scale = value

func play_walk():
	%AnimationPlayer.play("walk")

func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
