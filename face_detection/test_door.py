#!/usr/bin/python
"""
This program is demonstration for face and object detection using haar-like features.
The program finds faces in a camera image or video stream and displays a red box around them.

Original C implementation by:  ?
Python implementation by: Roman Stanchak, James Bowman
"""
import sys
import cv2.cv as cv
import time
import requests
import RPi.GPIO as GPIO
import threading
import datetime
import re
import RPi.GPIO as GPIO
import time

count=0
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO_BUZZER = 4
GPIO.setup(GPIO_BUZZER, GPIO.OUT)
GPIO.output(GPIO_BUZZER, False)
   
from optparse import OptionParser

# Parameters for haar detection
# From the API:
# The default parameters (scale_factor=2, min_neighbors=3, flags=0) are tuned 
# for accurate yet slow object detection. For a faster operation on real video 
# images the settings are: 
# scale_factor=1.2, min_neighbors=2, flags=CV_HAAR_DO_CANNY_PRUNING, 
# min_size=<minimum possible face size

min_size = (20, 20)
image_scale = 2
haar_scale = 1.2
min_neighbors = 2
haar_flags = 0
op=0

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.OUT) #pin 16

#LED
def lock_on():
    GPIO.output(23, False)
    time.sleep(1)
    GPIO.output(23, True)


def detect_and_draw(img, cascade, jpg_cnt):
	global count
    # allocate temporary images
	gray = cv.CreateImage((img.width,img.height), 8, 1)
	small_img = cv.CreateImage((cv.Round(img.width / image_scale),
			       cv.Round (img.height / image_scale)), 8, 1)

    # convert color input image to grayscale
	cv.CvtColor(img, gray, cv.CV_BGR2GRAY)

    # scale input image for faster processing
	cv.Resize(gray, small_img, cv.CV_INTER_LINEAR)

	cv.EqualizeHist(small_img, small_img)

	if(cascade):
		t = cv.GetTickCount()
		faces = cv.HaarDetectObjects(small_img, cascade, cv.CreateMemStorage(0),
                                     haar_scale, min_neighbors, haar_flags, min_size)
		t = cv.GetTickCount() - t
		#print "detection time = %gms" % (t/(cv.GetTickFrequency()*10000))
		if faces:
			for ((x, y, w, h), n) in faces:
				
				# the input to cv.HaarDetectObjects was resized, so scale the 
				# bounding box of each face and convert it to two CvPoints
				pt1 = (int(x * image_scale), int(y * image_scale))

				pt2 = (int((x + w) * image_scale), int((y + h) * image_scale))
				cv.Rectangle(img, pt1, pt2, cv.RGB(255, 0, 0), 3, 8, 0)
				
				if jpg_cnt%10==1:
					print('capture completed')
					cv.SaveImage('test_'+str(jpg_cnt)+'.jpg',img)
					#print("aaa1")
					url= 'http://210.94.185.52:8080/d/upload.php'
					#files={ 'upfiles' : open('/home/lee/test_'+str(jpg_cnt)+'.jpg','rb')}
					files={ 'upfiles' : open('/home/pi/Desktop/ubuntu_backup/test_'+str(jpg_cnt)+'.jpg','rb')}
					r = requests.post(url, files = files)
					print(r.text)
                                        global recog_name
                                        global recog_confi
                                        
                                        for i in r.text.split('/'):
                                            if i=='kim'or i=='lee'or i=='you' or i=='min' or i == 'unknown':
                                                recog_name =str(i)
                                                #print(recog_name)
                                            elif len(i)==5 :                              
						recog_confi = float(i)
                                                # recog_confi=i
                                                #print(recog_confi)

			    
					#LED
					if (recog_name=='kim' or recog_name=='lee' or recog_name=='you' or recog_name=='min') and recog_confi >= 0.90:
						lock_on()
						recog_confi = 0
						count = 0
					else:
						for i in range(2):
							GPIO.output(GPIO_BUZZER, True)
							time.sleep(0.5)
							GPIO.output(GPIO_BUZZER, False)
							time.sleep(0.5)
						count = count + 1
						if count >= 3:
							data = {'warning':'*Intruder Warning*'}
							r = requests.post('http://snivy92.cafe24.com/fcm/push_notification.php', data)
						
				
	cv.ShowImage("result", img)

		
	

if __name__ == '__main__':
	jpg_cnt=0

	parser = OptionParser(usage = "usage: %prog [options] [filename|camera_index]")
	parser.add_option("-c", "--cascade", action="store", dest="cascade", type="str", help="Haar cascade file, default %default", default = "../data/haarcascades/haarcascade_frontalface_alt.xml")
	(options, args) = parser.parse_args()

	cascade = cv.Load(options.cascade)
    
	if len(args) != 1:
		parser.print_help()
		sys.exit(1)

	input_name = args[0]
	if input_name.isdigit():
		capture = cv.CreateCameraCapture(int(input_name))
	else:
		capture = None

	cv.NamedWindow("result", 1)

	width = 320 #leave None for auto-detection
	height = 240 #leave None for auto-detection

	if width is None:
		width = int(cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FRAME_WIDTH))
	else:
		cv.SetCaptureProperty(capture,cv.CV_CAP_PROP_FRAME_WIDTH,width)    

	if height is None:
		height = int(cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FRAME_HEIGHT))
	else:
		cv.SetCaptureProperty(capture,cv.CV_CAP_PROP_FRAME_HEIGHT,height) 

	if capture:
		frame_copy = None
		while True:

			frame = cv.QueryFrame(capture)
			if not frame:
				cv.WaitKey(0)
				break
			if not frame_copy:
				frame_copy = cv.CreateImage((frame.width,frame.height),
                                            cv.IPL_DEPTH_8U, frame.nChannels)

#                frame_copy = cv.CreateImage((frame.width,frame.height),
#                                            cv.IPL_DEPTH_8U, frame.nChannels)

			if frame.origin == cv.IPL_ORIGIN_TL:
				cv.Copy(frame, frame_copy)
			else:
				cv.Flip(frame, frame_copy, 0)
			detect_and_draw(frame_copy, cascade,jpg_cnt)
			jpg_cnt+=1
			#print(jpg_cnt)
			

			if cv.WaitKey(10) >= 0:
				break
	else:
		image = cv.LoadImage(input_name, 1)
		detect_and_draw(image, cascade,jpg_cnt)
		jpg_cnt+=1
		cv.WaitKey(0)

	cv.DestroyWindow("result")
