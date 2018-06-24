package com.example.snivy.slotsmarthome;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;

import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.messaging.FirebaseMessaging;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class MainActivity extends AppCompatActivity {
    String TAG = "MainActivity";
    String server_url = "http://192.168.0.79/";

    String door_lock_url = "http://192.168.0.73/door_lock.php";
    String temphumi_url = server_url+"dht_info.php";
    @BindView(R.id.lock_id)
    Button lockId;
    @BindView(R.id.list_id)
    Button listId;
    @BindView(R.id.fan_id)
    Button fanId;
    @BindView(R.id.window_id)
    Button windowId;
    @BindView(R.id.humi_id)
    Button humiId;
    @BindView(R.id.dht_id)
    Button dhtId;
    @BindView(R.id.TV_id)
    Button TVId;
    @BindView(R.id.air_id)
    Button airId;
    @BindView(R.id.light_id)
    Button lightId;
    @BindView(R.id.boiler_id)
    Button boilerId;
    @BindView(R.id.gas_id)
    Button gasId;
    int width;
    int height;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        FirebaseMessaging.getInstance().subscribeToTopic("news");
        Log.d(TAG, "Refreshed token : " + FirebaseInstanceId.getInstance().getToken());
        DisplayMetrics dm = getApplicationContext().getResources().getDisplayMetrics(); //디바이스 화면크기를 구하기위해
        width = dm.widthPixels; //디바이스 화면 너비
        height = dm.heightPixels; //디바이스 화면 높이
    }

    @OnClick({R.id.lock_id, R.id.list_id, R.id.fan_id, R.id.window_id, R.id.humi_id, R.id.dht_id,
            R.id.TV_id, R.id.air_id, R.id.light_id, R.id.boiler_id, R.id.gas_id})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case R.id.lock_id:
                AlertDialog.Builder dialog = new AlertDialog.Builder(MainActivity.this);
                dialog.setTitle("도어락")
                        .setMessage("도어락 작동시키겠습니까?")
                        .setPositiveButton("예", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                MainActivity.httpRequest task1 = new MainActivity.httpRequest();
                                task1.execute(door_lock_url);
                            }
                        })
                        .setNeutralButton("아니오", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        }).create().show();
                break;
            case R.id.list_id:
                Intent list_intent = new Intent(MainActivity.this, Record_activity.class);
                startActivity(list_intent);
                break;
            case R.id.fan_id:
                Intent fan_intent = new Intent(MainActivity.this, FanActivity.class);
                startActivity(fan_intent);
                break;
            case R.id.window_id:
                Intent window_intent = new Intent(MainActivity.this, WindowActivity.class);
                startActivity(window_intent);
                break;


            //따로 인텐트 없이 다이알로그 창으로.
            case R.id.humi_id:
                AlertDialog.Builder dialog1 = new AlertDialog.Builder(MainActivity.this);
                dialog1.setTitle("가습기")
                        .setMessage("가습기 On/Off")
                        .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        })
                        .setNeutralButton("No", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        }).create().show();
                break;
            case R.id.dht_id:
                getData task2 = new getData();
                task2.execute(temphumi_url);
                break;
            case R.id.TV_id:
                AlertDialog.Builder dialog2 = new AlertDialog.Builder(MainActivity.this);
                dialog2.setTitle("TV")
                        .setMessage("TV On/Off")
                        .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        })
                        .setNeutralButton("No", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        }).create().show();
                break;

            //아직 추가 안한 것들.
            case R.id.air_id:
                break;
            case R.id.light_id:
                break;
            case R.id.boiler_id:
                break;
            case R.id.gas_id:
                break;
        }
    }



    private class getData extends AsyncTask<String, Void, String> {
        ProgressDialog progressDialog;
        String errorString = null;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(MainActivity.this,
                    "Pleasw Wait", null, true, true);
        }

        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            progressDialog.dismiss();
            Log.d(TAG, "response  - " + result);
            String TempAndHumi[] = result.split("/");
            /*
            tempId.setText(TempAndHumi[0]);
            humiId.setText(TempAndHumi[1]);*/
            CustomDialog cd;
            cd = new CustomDialog(MainActivity.this);

            WindowManager.LayoutParams wm = cd.getWindow().getAttributes();  //다이얼로그의 높이 너비 설정하기위해
            wm.copyFrom(cd.getWindow().getAttributes());  //여기서 설정한값을 그대로 다이얼로그에 넣겠다는의미
            wm.width = width*2 / 3;  //화면 너비의 절반
            wm.height = height*2 / 3;  //화면 높이의 절반
            cd.tv1.setText(TempAndHumi[0]+"℃");
            cd.tv2.setText(TempAndHumi[1]+"%");
            cd.show();
        }

        @Override
        protected String doInBackground(String... params) {
            String serverURL = params[0];
            String result;
            RequestHttp_getdata requestHttp = new RequestHttp_getdata();
            result = requestHttp.request(serverURL);
            if(result == null){
                result = "0/0";
            }
            return result;
        }
    }


    private class httpRequest extends AsyncTask<String, Void, String> {
        ProgressDialog progressDialog;
        String errorString = null;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(MainActivity.this,
                    "Pleasw Wait", null, true, true);
        }

        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            progressDialog.dismiss();
            Log.d(TAG, "response  - " + result);

        }

        @Override
        protected String doInBackground(String... params) {
            String serverURL = params[0];
            String result;
            RequestHttp requestHttp = new RequestHttp();
            result = requestHttp.request(serverURL);
            return result;
        }
    }
}
