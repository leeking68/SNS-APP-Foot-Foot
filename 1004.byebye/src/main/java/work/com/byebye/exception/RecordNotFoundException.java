package work.com.byebye.exception;
/**
 * ## 사용자 정의 예외클래스 규칙
 * 1. extends Exception
 * 2. super("예외메세지");
 * 
 * 레코드 없는경우 예외 클래스
 * 
 * @author 임경혜
 * @version ver.1.0
 * @since jdk 1.7
 * @see java.lang.Exception
 */
public class RecordNotFoundException extends Exception {
	public RecordNotFoundException() {
		super("해당 레코드를 찾을 수 없습니다.");
	}
	
	public RecordNotFoundException(String key) {
		super(key + " : 해당 레코드를 찾을 수 없습니다.");
	}
}
