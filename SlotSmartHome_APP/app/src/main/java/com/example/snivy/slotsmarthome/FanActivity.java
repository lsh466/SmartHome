package com.example.snivy.slotsmarthome;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class FanActivity extends AppCompatActivity {
    private static String TAG = "Fan_Activity";

    String server_url = "http://192.168.0.79/";

    String turn_on_url = server_url + "power_fan.php";
    String turn_off_url = server_url + "stop_fan.php";
    String mode_url = server_url + "mode_fan.php";
    String direction_url = server_url + "move_fan.php";
    String save_on_url = server_url + "save_mode.php?sw=1";
    String save_off_url = server_url + "save_mode.php?sw=0";

    @BindView(R.id.bt_turnon)
    Button btTurnon;
    @BindView(R.id.bt_turnoff)
    Button btTurnoff;
    @BindView(R.id.bt_mode)
    Button btMode;
    @BindView(R.id.bt_direction)
    Button btDirection;
    @BindView(R.id.bt_saveon)
    Button btSaveon;
    @BindView(R.id.bt_saveoff)
    Button btSaveoff;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fan);
        ButterKnife.bind(this);
    }

    @OnClick({R.id.bt_turnon, R.id.bt_turnoff, R.id.bt_mode, R.id.bt_direction, R.id.bt_saveon, R.id.bt_saveoff})
    public void onViewClicked(View view) {
        httpRequest task = new httpRequest();
        switch (view.getId()) {
            case R.id.bt_turnon:
                task.execute(turn_on_url);
                break;
            case R.id.bt_turnoff:
                task.execute(turn_off_url);
                break;
            case R.id.bt_mode:
                task.execute(mode_url);
                break;
            case R.id.bt_direction:
                task.execute(direction_url);
                break;
            case R.id.bt_saveon:
                AlertDialog.Builder dialog = new AlertDialog.Builder(FanActivity.this);
                dialog.setTitle("절전모드")
                        .setMessage("10초간 사람이 감지되지않으면 자동으로 꺼집니다")
                        .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                httpRequest task1 = new httpRequest();
                                task1.execute(save_on_url);
                                btSaveon.setEnabled(false);
                            }
                        })
                        .setNeutralButton("No", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        }).create().show();

                break;
            case R.id.bt_saveoff:
                task.execute(save_off_url);
                btSaveon.setEnabled(true);
                break;
        }
    }

    private class httpRequest extends AsyncTask<String, Void, String> {
        ProgressDialog progressDialog;
        String errorString = null;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(FanActivity.this,
                    "Pleasw Wait", null, true, true);
        }

        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            progressDialog.dismiss();
            Log.d(TAG, "response  - " + result);

        }

        @Override
        protected String doInBackground(String... params) {
            String URL = params[0];
            String result;
            RequestHttp requestHttp = new RequestHttp();
            result = requestHttp.request(URL);
            return result;
        }
    }
}
