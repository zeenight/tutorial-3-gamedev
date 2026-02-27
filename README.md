untuk fitur mekanika pergerakan saya memilih fitur double jump karena implemtasi menurut saya paling straight forward
```
	velocity.y += delta * gravity

	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		
	if not is_on_floor() and double_jump and Input.is_action_just_pressed('ui_up'):
		velocity.y = 1 * jump_speed
		double_jump = false
		
	if is_on_floor():
		double_jump = true
```
berikut kodenya 
intinya kalau player lagi di udara atau not touching floor maka bisa jump sekali.
saya membuat variabel double_jump agar player tidak bisa spam double jump infinitely.
