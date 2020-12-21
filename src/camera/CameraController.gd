extends KinematicBody

export(float) var camera_movement_speed = 5.0

var player:Player
var target_position:Spatial
var look_at_target:Spatial

var velocity:Vector3 = Vector3.ZERO

func _ready() -> void:
	connect_signals()


func _physics_process(delta:float) -> void:
	if !look_at_target:
		if player:
			_look_at_and_follow_player()

func _look_at_and_follow_player() -> void:
	print("looking")
	look_at(player.global_transform.origin, Vector3.UP)
	var direction:Vector3 = global_transform.origin.direction_to(player.get_camera_anchor().global_transform.origin)
	velocity = direction * camera_movement_speed
	velocity = move_and_slide(velocity)


func connect_signals() -> void:
	EventBus.connect("player_entered_scene", self, "player_entered_scene")


func player_entered_scene(player:Player) -> void:
	print(player)
	self.player = player
	look_at_target = null
