# -*- coding: utf-8 -*-
import gspeech
import time
import string

def main():
    i=0
    gsp = gspeech.Gspeech()
    while True:
        stt = gsp.getText()
        if stt is None:
            break
        print(stt)
        time.sleep(0.01)
        
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
        
        if ('종료' in stt):
            break


if __name__ == '__main__':
    main()
