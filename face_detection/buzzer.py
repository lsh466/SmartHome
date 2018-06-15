import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO_BUZZER = 4
GPIO.setup(GPIO_BUZZER, GPIO.OUT)
GPIO.output(GPIO_BUZZER, False)

for i in range(5):
        GPIO.output(GPIO_BUZZER, True)
        time.sleep(0.5)
        GPIO.output(GPIO_BUZZER, False)
        time.sleep(0.5)
