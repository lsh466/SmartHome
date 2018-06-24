package com.example.snivy.slotsmarthome;

public class ListViewItem {
    private String time;
    private String name;
    private String file_path;

    public void setTime(String time){
        this.time = time;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setFile_path(String file_path){
        this.file_path = file_path;
    }

    public String getTime(){
        return this.time;
    }
    public String getName(){
        return this.name;
    }
    public String getFile_path(){
        return this.file_path;
    }
}
