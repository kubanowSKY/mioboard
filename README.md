# mioboard
Simulate keyboard (3 keys) using EMG signal.

# What actually works:

	Simulation keyboard movements from sample movements of hand
	Playable game included (works only on Linux)
	Bluetooth connection

# What does it do now:

	Averages probes
	Filters 50 Hz from probes
	Bandpass 10-45 Hz from probes
	Loads prepared movement samples (hand-close, index)
	Detects movements from sum/av/var_ex from channels
	During steering_test it simulates keyboard
	Tests bluetooth connection and receives signals from it
