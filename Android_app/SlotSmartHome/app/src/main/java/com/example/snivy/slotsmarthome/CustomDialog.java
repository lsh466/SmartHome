package com.example.snivy.slotsmarthome;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class CustomDialog extends Dialog {
    TextView tv1,tv2;
    Button btn;
    public CustomDialog(Context context) {
        super(context);
        requestWindowFeature(Window.FEATURE_NO_TITLE);   //다이얼로그의 타이틀바를 없애주는 옵션입니다.
        getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));  //다이얼로그의 배경을 투명으로 만듭니다.
        setContentView(R.layout.customdialog);     //다이얼로그에서 사용할 레이아웃입니다.
        tv1 = (TextView) findViewById(R.id.temp_tv);
        tv2 = (TextView) findViewById(R.id.humi_tv);
        btn = (Button) findViewById(R.id.dialog_bt);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dismiss();   //다이얼로그를 닫는 메소드입니다.
            }
        });

    }
}


