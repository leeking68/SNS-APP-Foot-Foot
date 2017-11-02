package work.com.byebye.exception;

public class AuthorizationException extends Exception {
	public AuthorizationException() {
		super("해당 서비스에 대한 접근 권한이 없습니다.");
	}
	
	public AuthorizationException(String key) {
		super(key + " : 해당 서비스에 대한 접근 권한이 없습니다.");
	}
}

