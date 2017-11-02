//AlertDAO

package work.com.byebye.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work.com.byebye.dto.AlertDTO;


@Repository
public class AlertDAO {
   private FactoryDAODataSource factory;

   @Autowired
   private SqlSessionTemplate sqlSession;

   @Autowired
   public void setFactory(FactoryDAODataSource factory) {
      this.factory = factory;
   }

   private static AlertDAO instance = new AlertDAO();

   public static AlertDAO getInstance() {
      return instance;
   }

   AlertDTO dto;
   
   private AlertDAO() {}

   public AlertDTO alert(String lat, String lon, String userid){
      HashMap<String,String> map = new HashMap<String,String>();
      map.put("lat", lat);
      map.put("lon", lon);
      map.put("userid", userid);
      return sqlSession.selectOne("alertPlace", map);
   }

   public int alertOff(int docNum) {
	   // TODO Auto-generated method stub
	   return sqlSession.update("alertOff",docNum);
   }
}