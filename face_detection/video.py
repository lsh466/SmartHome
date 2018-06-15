import cv2


vidcap=cv2.VideoCapture('3333.mp4')
count=0
while True:
	success,image=vidcap.read()
	if not success:
		break
	print('Read a new frame : ', success)
	fname="{},jpg".format("{0:05d}".format(count))
	print('1')
	print(fname)
	cv2.imwrite('/home/lee/'+ fname+'.jpg',image)
	print('2')	
	count+=1

