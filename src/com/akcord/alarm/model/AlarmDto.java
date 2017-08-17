package com.akcord.alarm.model;

public class AlarmDto {
   
   private String target_id;
   private String key;
   private String logtime;
   private String flag;
   private int seq;
   

   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public String getTarget_id() {
      return target_id;
   }
   public void setTarget_id(String target_id) {
      this.target_id = target_id;
   }
   public String getKey() {
      return key;
   }
   public void setKey(String key) {
      this.key = key;
   }
   public String getLogtime() {
      return logtime;
   }
   public void setLogtime(String logtime) {
      this.logtime = logtime;
   }
   public String getFlag() {
      return flag;
   }
   public void setFlag(String flag) {
      this.flag = flag;
   }

   
} 