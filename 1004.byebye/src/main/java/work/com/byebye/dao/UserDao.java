package work.com.byebye.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work.com.byebye.dto.UserDto;


@Repository
public class UserDao {
   private FactoryDAODataSource factory;

   @Autowired
   private SqlSessionTemplate sqlSession;

   @Autowired
   public void setFactory(FactoryDAODataSource factory) {
      this.factory = factory;
   }

   private static UserDao instance = new UserDao();

   public static UserDao getInstance() {
      return instance;
   }
   
   UserDto dto;

   /** 기본 생성자 */
   private UserDao() {}

   /** 로그인 시 아이디 중복 체크 */
   public String loginCheck(String userid) {
      return sqlSession.selectOne("loginCheck", userid);
   }
   
   /** 카카오 회원 등록 */
   public int insertKakao(String userid, String nickname, String userimg, String grade) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("userid", userid);
      map.put("nickname", nickname);
      map.put("userimg", userimg);
      map.put("grade", grade);
      return sqlSession.insert("insertKakao", map);
   }
   
   /** 네이버 회원 등록 */
   public int insertNaver(String userid, String nickname, String userimg, String grade) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("userid", userid);
      map.put("nickname", nickname);
      map.put("userimg", userimg);
      map.put("grade", grade);
      return sqlSession.insert("insertNaver", map);
   }
   
   /** 페이스북 회원 등록 */
   public int insertFacebook(String userid, String nickname, String userimg, String grade) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("userid", userid);
      map.put("nickname", nickname);
      map.put("userimg", userimg);
      map.put("grade", grade);
      return sqlSession.insert("insertFacebook", map);
   }
   
   /** 회원 정보 조회 */
   public UserDto getUser(String userid) {
	   System.out.println("userid : " + userid);
	   dto = sqlSession.selectOne("getUser", userid);
	   return dto;
   }
   
   
   /** 회원 탈퇴 */
   public int deletUser(String userid) {
	   return sqlSession.delete("deleteUser", userid);
   }

public int newLogin(String userid, String nickname, String userimg, String grade) {
	HashMap<String, String> map = new HashMap<String, String>();
    map.put("userid", userid);
    map.put("nickname", nickname);
    map.put("userimg", userimg);
    map.put("grade", grade);
    return sqlSession.insert("newLogin", map);
}
   
   
   
   
   
   
   
   
}