package com.example.snivy.slotsmarthome;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.GregorianCalendar;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class Record_activity extends AppCompatActivity {

    String imgUrl = "http://210.94.185.52:8080";
    Bitmap bmImg;
    String g_time;
    Intent intent;
    private static String TAG = "Record_Activity";
    private static final String TAG_JSON="webnautes";
    private static final String TAG_TIME = "time";
    private static final String TAG_NAME = "name";
    private static final String TAG_PATH = "file_path";

    @BindView(R.id.tv_date)
    TextView tvDate;
    @BindView(R.id.bt_date)
    Button btDate;
    @BindView(R.id.listview1)
    ListView listview1;
    String mJsonString;
    ListViewAdapter adapter;
    TextView tv;
    ImageView iv;

    int num;
    String time_push;
    private int nyear;
    private int nmonth;
    private int nday;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_record_activity);
        ButterKnife.bind(this);


        Calendar cal = new GregorianCalendar();
        nyear = cal.get(Calendar.YEAR);
        nmonth = cal.get(Calendar.MONTH) + 1;  //month는 특이하게 0부터 시작하므로  +1을 해줘야함
        nday = cal.get(Calendar.DAY_OF_MONTH);
        UpdateNow();
        intent = getIntent();
        num = intent.getIntExtra("key", 0);
        time_push = intent.getStringExtra("time");

        if(num==1){
            Toast.makeText(Record_activity.this, "푸쉬받음", Toast.LENGTH_SHORT).show();


        }
        //리스트뷰 클릭 이벤트
        listview1.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                ListViewItem item = (ListViewItem) parent.getItemAtPosition(position);

                String img_path =  item.getFile_path().replace("mnt/", "");
                back task = new back();
                task.execute(imgUrl, img_path, item.getTime());

            }
        });
    }


    public DatePickerDialog.OnDateSetListener dsl = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
            nyear = year;
            nmonth = monthOfYear + 1;
            nday = dayOfMonth;
            UpdateNow();
        }
    };

    @OnClick(R.id.bt_date)
    public void onViewClicked() {
        new DatePickerDialog(Record_activity.this, dsl, nyear, nmonth-1, nday).show();
    }

    //날짜 업데이트
    void UpdateNow() {
        String date = String.format("%d-%02d-%02d", nyear, nmonth, nday);
        String url = "http://snivy92.cafe24.com/door_list.php?date="+date;

        tvDate.setText(date);
        getData task = new getData();
        task.execute(url);

    }

    //날짜 업데이트
    private class getData extends AsyncTask<String, Void, String> {
        ProgressDialog progressDialog;
        String errorString = null;

        @Override
        protected void onPreExecute(){
            super.onPreExecute();
            progressDialog = ProgressDialog.show(Record_activity.this,
                    "Pleasw Wait", null, true, true);
        }
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            progressDialog.dismiss();
            Log.d(TAG, "response  - " + result);
            if (result == null){ //error
            }
            else {
                mJsonString = result;
                showResult();
            }
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


    private void showResult(){
        try {
            JSONObject jsonObject = new JSONObject(mJsonString);
            JSONArray jsonArray = jsonObject.getJSONArray(TAG_JSON);
            adapter = new ListViewAdapter();

            for(int i=0;i<jsonArray.length();i++){

                JSONObject item = jsonArray.getJSONObject(i);

                String time = item.getString(TAG_TIME);
                String name = item.getString(TAG_NAME);
                String file_path = item.getString(TAG_PATH);
                adapter.addItem(time, name, file_path);
            }

            listview1.setAdapter(adapter);

        } catch (JSONException e) {
            Log.d(TAG, "showResult : ", e);
        }
    }

    //이미지 불러오기
    private class back extends AsyncTask<String, Integer,Bitmap>{

        @Override
        protected Bitmap doInBackground(String... params) {
            try{
                URL image_url = new URL(params[0]+params[1]);

                g_time = params[2]; // 시간(primary key)
                HttpURLConnection conn = (HttpURLConnection)image_url.openConnection();
                conn.setReadTimeout(3000);
                conn.setConnectTimeout(3000);
                conn.connect();

                InputStream is = conn.getInputStream();
                bmImg = BitmapFactory.decodeStream(is);
                Log.d(TAG, "response  - " + bmImg);
            }catch(IOException e){
                e.printStackTrace();
            }
            return bmImg;
        }
        protected void onPostExecute(Bitmap img){

            Dialog dialog = new Dialog(Record_activity.this);
            dialog.setContentView(R.layout.image_dialog);
            dialog.setTitle("Image");
            tv = (TextView)dialog.findViewById(R.id.image_text);
            tv.setText(g_time);
            iv = (ImageView)dialog.findViewById(R.id.image_id);
            iv.setImageBitmap(bmImg);
            dialog.show();

        }
    }

}
