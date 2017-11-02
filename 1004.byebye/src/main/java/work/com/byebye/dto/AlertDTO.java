//AlertDTO

package work.com.byebye.dto;

import org.json.simple.JSONObject;

public class AlertDTO {
private String userid;
private String picFile;
private String alertDate;
private String docDate;
private double distance;
private int docNum;
private String lately;

public int getDocNum() {
	return docNum;
}

public void setDocNum(int docNum) {
	this.docNum = docNum;
}

public String getLately() {
	return lately;
}

public void setLately(String lately) {
	this.lately = lately;
}

public int getDoc_num() {
	return docNum;
}

public void setDoc_num(int doc_num) {
	this.docNum = doc_num;
}

public AlertDTO(){}

public String getUserid() {
   return userid;
}

public void setUserid(String userid) {
   this.userid = userid;
}

public String getPicFile() {
   return picFile;
}

public void setPicFile(String picFile) {
   this.picFile = picFile;
}

public String getAlertDate() {
   return alertDate;
}

public void setAlertDate(String alertDate) {
   this.alertDate = alertDate;
}

public String getDocDate() {
   return docDate;
}

public void setDocDate(String docDate) {
   this.docDate = docDate;
}

public double getDistance() {
   return distance;
}

public void setDistance(double distance) {
   this.distance = distance;
}

@Override
public String toString() {
	JSONObject json = new JSONObject();
	
	json.put("userid", userid);
	json.put("picFile", picFile);
	json.put("alertDate", alertDate);
	json.put("docDate", docDate);
	json.put("distance", distance);
	json.put("docNum", docNum);
	json.put("lately", lately);
	
	return json.toString();
}




}