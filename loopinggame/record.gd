extends Node2D

@export var textureImage: Texture2D = preload("res://sprites/rockDrumsRecord.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = textureImage


func _physics_process(delta: float) -> void:
	rotation+=1/60.0
