import RPi.GPIO as GPIO
import time
import sys
import os

GPIO.setmode(GPIO.BCM)
sensor = 23
GPIO.setup(sensor, GPIO.IN)


off = 0

while True:
	f = open('manual_mode.txt', 'r')
	val = f.read()
	if val == '0':
		f.close()
		sys.exit(0)

	if GPIO.input(sensor) == 0:
		off = 1
		timeout = time.time() + 10
		while timeout - time.time() > 0:
			if GPIO.input(sensor) == 1:
				f = open('manual_mode.txt', 'r')
				val = f.read()
				if val == '0':
					f.close()
					sys.exit(0)
					break
				off = 0
				print("aa")
				break

		if off == 1:
			print("sunpoongi off")
			os.system("irsend SEND_ONCE sunp KEY_STOP")
			off = 0

