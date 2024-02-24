extends KinematicBody2D

var velocity = Vector2()
export var speed = 500
# export를 사용해서 우측의 인스펙터에서 수정할 수 있다.

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
		
	velocity = velocity.normalized() * speed
	# 두 키를 눌러서 대각선으로 갈 때 더 빠른 현상 막아준다.
	
	velocity = move_and_slide(velocity)
