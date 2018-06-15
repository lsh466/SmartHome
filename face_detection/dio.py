import requests

try : 
	print('aa')
	url = 'http://210.94.185.52/upload.php'
	print('bb')	
	files= {'upfiles' : open('/home/lee/t11.jpg','rb')}
	print('cc')	
	r= requests.post(url, files=files)
	print('dd')	
	print(r.text)

except:
	print("holy shet")
