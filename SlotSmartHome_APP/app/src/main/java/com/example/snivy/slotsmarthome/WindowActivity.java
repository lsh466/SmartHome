package com.example.snivy.slotsmarthome;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class WindowActivity extends AppCompatActivity {
    String TAG = "FanActivity";
    String server_url = "http://192.168.0.79/";

    String open_window_url = server_url + "open_window.php";
    String close_window_url = server_url + "close_window.php";
    @BindView(R.id.bt_open)
    Button btOpen;
    @BindView(R.id.bt_close)
    Button btClose;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_window);
        ButterKnife.bind(this);
    }

    @OnClick({R.id.bt_open, R.id.bt_close})
    public void onViewClicked(View view) {
        httpRequest task = new httpRequest();
        switch (view.getId()) {
            case R.id.bt_open:
                task.execute(open_window_url);
                break;
            case R.id.bt_close:
                task.execute(close_window_url);
                break;
        }
    }


    private class httpRequest extends AsyncTask<String, Void, String> {
        ProgressDialog progressDialog;
        String errorString = null;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(WindowActivity.this,
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
