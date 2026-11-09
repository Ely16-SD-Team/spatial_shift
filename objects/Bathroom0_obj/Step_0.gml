_dt = min(0.1, delta_time / 1000000);

if (interacted == 1 && DelayC <= 0) {
	DelayC = Delay;
	interacted = -1;
	// SOUND смыв унитаза
}

if (DelayC > 0) { DelayC -= _dt image_index = 1 } else { DelayC = 0; interacted = 0; _dt = 0; image_index = 0 }

