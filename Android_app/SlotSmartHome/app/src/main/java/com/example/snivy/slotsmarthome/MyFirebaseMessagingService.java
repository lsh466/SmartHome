package com.example.snivy.slotsmarthome;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.PowerManager;
import android.support.v4.app.NotificationCompat;
import android.util.Log;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;


public class MyFirebaseMessagingService extends FirebaseMessagingService {

    private static final String TAG = "MyFirebase";
    String channelId = "channel";
    String channelName = "Channel Name";
    int importance = NotificationManager.IMPORTANCE_LOW;

    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {  //data payload로 보내면 실행

        String title = remoteMessage.getData().get("title");
        String message = remoteMessage.getData().get("message");
        String what = remoteMessage.getData().get("what");
        String time = remoteMessage.getData().get("time");
        sendNotification(title, message, what, time);
    }


    private  void sendNotification(String title, String messageBody, String what, String time){
        Uri defaultSoundUri= RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
        NotificationManager notifManager = (NotificationManager) getSystemService (Context.NOTIFICATION_SERVICE);

        if (title == null){
            //제목이 없는 payload이면
            title = "FCM Noti"; //기본제목을 적어 주자.
        }
        //전달된 액티비티에 따라 분기하여 해당 액티비티를 오픈하도록 한다.
        Intent intent;
        if (what.equals("2")) {
            intent = new Intent(this, Record_activity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            intent.putExtra("key", 1);
            intent.putExtra("time",  time);
        }
        else {
            intent = new Intent(this, MainActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        }

        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            int importance = NotificationManager.IMPORTANCE_HIGH;
            NotificationChannel mChannel = new NotificationChannel(
                    channelId, channelName, importance);
            notifManager.createNotificationChannel(mChannel);
        }
        NotificationCompat.Builder builder = new NotificationCompat.Builder(getApplicationContext(), channelId);
        builder.setContentTitle(title) //타이틀 설정
                .setSmallIcon(R.mipmap.ic_launcher) //아이콘 설정
                .setContentText(messageBody) //메시지 설정
                .setDefaults(Notification.DEFAULT_ALL) // 알림, 사운드 진동 설정
                .setAutoCancel(true)
                .setSound(defaultSoundUri)
                .setContentIntent(pendingIntent);

        notifManager.notify(0, builder.build());

        Log.d(TAG, "메세지 : " + messageBody);
    }


}