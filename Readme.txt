김형준
SmartHome/smart_window_ver2
스마트 윈도우에 장착된 아두이노에서 돌아가는 아두이노 파일(.ino).

SmartHome/SlotSmartHome_APP
실내 가전 기기들을 제어할 수 있는 안드로이드 어플리케이션 프로젝트. 

SmartHome/control/
서버화된 라즈베리 파이 내에서 http 요청을 받아 수행하게 될 명령어들이 있는 php파일.
ex) open_window.php : 창문을 여는 적외선 값을 라즈베리파이가 송신 할 수 있도록 함.



유한상
SmartHome/smart_window_ver2
스마트 윈도우에 장착된 아두이노에서 돌아가는 아두이노 파일들(.ino).

SmartHome/face_detection/
웹캠을 통한 도어락 안면인식 캡쳐 및 제어.

SmartHome/control/
각종 가전기기를 웹 통신으로 명령을 내릴 수 있도록 생성한 php파일.
ex) dht_info.php : 'dht_info.py'를 실행시켜서 온습도 값을 출력.




민상기
SmartHome/face_detection 
웹캠을 통해 라즈베리파이 내 Opencv를 이용하여 face detection 하는 데 사용되는 파일, 서버에서 받아온 정확도를 이용해 도어락을 개폐하게 된다. 

SmartHome/Openface 
딥러닝 라이브러리인 Openface를 통해 다량의 사진을 학습시키고, 
그 학습된 데이터를 기반으로 입력 이미지와 비교를 함으로써 정확도를 얻어내는 파일 