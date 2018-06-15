import os
import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)

GPIO.setup(24, GPIO.IN)

while True:
	if GPIO.input(24) == 0:
		print("oo")
		os.system("python /home/pi/stt/practice_0530.py")
	time.sleep(1)
