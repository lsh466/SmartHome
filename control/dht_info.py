import urllib2
import Adafruit_DHT as dht


#GPIO4 (pin no: #7)    210.94.185.52

h, t = dht.read_retry(dht.DHT22, 4)
h, t = dht.read_retry(dht.DHT22, 4)


if h is not None and t is not None:
	h1 =round(h, 1)
	t1 = round(t, 1)
	print('%.1f/%.1f'%(t1, h1))
	#url = "http://210.94.185.52:8080/d/savedata.php?temp="+str(t1)+"&humi="+str(h1)
	#request = urllib2.Request(url)
	#data = urllib2.urlopen(request).read()
	
else:
	print "Failed to get reading."
