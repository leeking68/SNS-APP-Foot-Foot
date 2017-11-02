package work.com.byebye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import work.com.byebye.dao.AlertDAO;
import work.com.byebye.dto.AlertDTO;

@Service
public class AlertService {
   private AlertDAO dao;
   
   @Autowired
   public void setDao(AlertDAO alertDAO) {
      this.dao = alertDAO;
   }
   
   public AlertService() {}
   
   public AlertDTO alert(String lat, String lon, String userid){
      return dao.alert(lat, lon, userid);
   }

   public int alertOff(int docNum) {
	   // TODO Auto-generated method stub
	   return dao.alertOff(docNum);
   }
}