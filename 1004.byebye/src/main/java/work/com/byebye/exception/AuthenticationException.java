package work.com.byebye.exception;

/**
 * 사용자 인증 예외 클래스
 * 
 * @author 임경혜
 * @version ver.1.0
 * @since jdk 1.7
 * @see java.lang.Exception
 */
public class AuthenticationException extends Exception {
	public AuthenticationException() {
		super("사용자 인증에 실패했습니다.");
	}
	
	public AuthenticationException(String message) {
		super(message);
	}	
}
