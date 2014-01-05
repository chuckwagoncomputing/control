import RPi.GPIO as GPIO
import os
pin = os.system('~/control/config.sh water pins')
GPIO.setmode(GPIO.BCM)
GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
def increment(channel):
  os.system('bash -c "echo $((`cat ~/control/tmp/water` + 1 )) > ~/control/tmp/water"')
GPIO.add_event_detect(pin, GPIO.RISING, callback=increment)
try:
  while True: pass
except KeyboardInterrupt:
  GPIO.cleanup()
