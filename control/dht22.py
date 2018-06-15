import Adafruit_DHT as dht

h, t = dht.read_retry(dht.DHT22, 4)

h, t = dht.read_retry(dht.DHT22, 4)

h1 = round(h, 1)
t1 = round(t, 1)

print('Temp = %f  Humidity = %f'%(t1, h1))
