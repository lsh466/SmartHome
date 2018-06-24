package com.example.snivy.slotsmarthome;

import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import static com.google.android.gms.common.internal.safeparcel.SafeParcelable.NULL;

public class RequestHttp_getdata {
    private String TAG = "requestHttp class";
    public String request(String addr){
        try{
            URL url = new URL(addr);
            HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();

            httpURLConnection.setReadTimeout(5000);
            httpURLConnection.setConnectTimeout(5000);
            httpURLConnection.connect();

            int responseStatusCode = httpURLConnection.getResponseCode();
            Log.d(TAG, "response code - " + responseStatusCode);

            InputStream inputStream;
            if(responseStatusCode == HttpURLConnection.HTTP_OK) {
                inputStream = httpURLConnection.getInputStream();
            }
            else{
                inputStream = httpURLConnection.getErrorStream();
            }

            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            StringBuilder sb = new StringBuilder();
            String line;

            while((line = bufferedReader.readLine()) != null){
                sb.append(line);
            }
            bufferedReader.close();
            if(sb.toString().trim() == null){
                return null;
            }else {
                return sb.toString().trim();
            }
        } catch (Exception e) {
            Log.d(TAG, "InsertData: Error ", e);
            return null;
        }
    }
}