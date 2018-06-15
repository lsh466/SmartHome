# -*- coding: utf-8 -*-
import gspeech
import time
import string
import os

turnon_fan =u'선풍기 틀어 줘'
turnon_fan2 =u'선풍기 켜 줘'
turnon_fan3 =u'선풍기 틀어줘'
turnon_fan4 =u'선풍기 켜줘'
turnoff_fan =u'선풍기 꺼 줘'
turnoff_fan2 =u'선풍기 꺼줘'
open_window =u'창문 열어 줘'
open_window2 =u'창문 열어줘'
close_window =u'창문 닫아 줘'
close_window2 =u'창문 닫아줘'


def main():
    i=0
    gsp = gspeech.Gspeech()
    while True:
        stt = gsp.getText()
	#stt = u'선풍기 틀어 줘'
        if stt is None:
            break
        print(stt)
	
	
	if stt == turnon_fan or stt == turnon_fan2 stt == turnon_fan3 or stt == turnon_fan4 :
		os.system("irsend SEND_ONCE sunp KEY_POWER")
	elif stt== turnoff_fan or stt == turnoff_fan2:
		os.system("irsend SEND_ONCE sunp KEY_STOP")
	elif stt == open_window or stt==open_window2:
		os.system("irsend SEND_ONCE window KEY_OPEN")
	elif stt == close_window or stt == close_window2:
		os.system("irsend SEND_ONCE window KEY_CLOSE")
        time.sleep(0.01)
        '''
        if(len(stt)==2000):
            sms_file = open('/home/pi/Desktop/smartcane/main/sms.py','r+')
            lines = sms_file.readlines()
            sms_file.close()
            sms_file = open('/home/pi/Desktop/smartcane/main/sms.py','w+')
            Text = "      params['to'] = '{}'\n"
            replaceText = Text.format(stt)
            print(lines[46])
            print(replaceText)
            lines[46] = replaceText
            lines[53] = replaceText

            for line in lines:
                sms_file.write(lines[i])
                i+=1       
            
            sms_file.close()
            
            break
        else:
            break
        '''
        if ('종료' in stt):
            break


if __name__ == '__main__':
    main()
