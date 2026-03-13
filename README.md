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


=======================


Tutorial 5

https://pixabay.com/music/search/pixel%20game/ untuk lagu ost backround
Jika pemain terkena zombie, maka permainan akan berakhir.

list yang diadd:

movement player,
jump system improvised,
zombie AI,
animation improvised,
game over,
sound/music,

Pada tutorial ini dilakukan proses pengembangan game platformer sederhana menggunakan Godot Engine. Proses pengerjaan dimulai dengan membuat scene utama yang berisi karakter pemain, lingkungan permainan, serta musuh berupa zombie.

Langkah pertama adalah mengimplementasikan sistem pergerakan pemain menggunakan node CharacterBody2D. Pemain dapat bergerak ke kiri dan kanan menggunakan input keyboard serta dapat melakukan lompatan dengan memanfaatkan sistem gravitasi bawaan dari Godot. Selain itu ditambahkan juga mekanisme double jump untuk meningkatkan interaktivitas permainan.

Selanjutnya dibuat musuh berupa zombie yang bergerak secara otomatis menggunakan script sederhana. Zombie berjalan ke satu arah dan akan berbalik arah ketika menabrak dinding. Pada tahap berikutnya ditambahkan animasi berjalan menggunakan AnimatedSprite2D agar karakter zombie terlihat lebih hidup saat bergerak di dalam permainan.

Setelah sistem pergerakan dan animasi selesai, ditambahkan mekanisme interaksi antara pemain dan zombie. Ketika pemain bersentuhan dengan zombie, maka pemain akan menghilang dan permainan dianggap selesai (game over). Mekanisme ini dibuat menggunakan node Area2D untuk mendeteksi tabrakan antara pemain dan musuh.

Tahap terakhir adalah menambahkan elemen audio berupa background music dan sound effect untuk meningkatkan pengalaman bermain. Audio diputar menggunakan node AudioStreamPlayer sehingga musik dapat berjalan secara otomatis ketika permainan dimulai.

Melalui tahapan tersebut, tutorial ini berhasil menghasilkan sebuah game platformer sederhana yang memiliki sistem pergerakan karakter, musuh dengan perilaku dasar, animasi, serta elemen audio.
