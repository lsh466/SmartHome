package com.example.snivy.slotsmarthome;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class ListViewAdapter extends BaseAdapter {
    private ArrayList<ListViewItem> listViewItemList = new ArrayList<ListViewItem>();
    public ListViewAdapter(){

    }

    public int getCount(){
        return listViewItemList.size();
    }

    public View getView(int position, View convertView, ViewGroup parent){
        final int pos = position;
        final Context context = parent.getContext();
//R.id.textView_list_time, R.id.textView_list_name
        if(convertView == null){
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.item_list, parent, false);
        }
        TextView time_tv =(TextView)convertView.findViewById(R.id.textView_list_time);
        TextView name_tv =(TextView)convertView.findViewById(R.id.textView_list_name);

        ListViewItem listViewItem = listViewItemList.get(position);

        time_tv.setText(listViewItem.getTime());
        name_tv.setText(listViewItem.getName());
        return convertView;
    }

    public long getItemId(int position){
        return position;
    }
    public Object getItem(int position){
        return listViewItemList.get(position);
    }

    public void addItem(String time, String name, String file_path){
        ListViewItem item = new ListViewItem();
        item.setTime(time);
        item.setName(name);
        item.setFile_path(file_path);

        listViewItemList.add(item);
    }
}