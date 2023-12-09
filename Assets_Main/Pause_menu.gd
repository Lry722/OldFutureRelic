extends ColorRect

var current_menu = "Pause"
var escape_released = false
@onready var animation = $AnimationPlayer

func _ready():
	animation.play("RESET")

func _process(delta):
	pass


func _on_visibility_changed():
	get_tree().paused = visible

func _unhandled_input(event):
	if Input.is_action_just_released("pause") :
		if escape_released == false :
			escape_released = true
		elif current_menu == "Pause":
			escape_released = false
			_on_resume_button_pressed()
func _on_resume_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_parent().current_menu = "HUD"
	visible = false
	
func _on_options_button_pressed():
	current_menu = "Options"
	escape_released = false
	animation.play("Options")
func _on_back_button_pressed():
	if current_menu == "Options":
		current_menu = "Pause"
		animation.play_backwards("Options")
	
func _on_exit_button_pressed():
	current_menu = "Exit"
	escape_released = false
	animation.play("Exit")
func _on_confirm_button_pressed():
	Global.back_to_title()
	visible = false
func _on_cancel_button_pressed():
	if current_menu == "Exit":
		current_menu = "Pause"
		animation.play_backwards("Exit")