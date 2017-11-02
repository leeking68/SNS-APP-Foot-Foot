package work.com.byebye.exception;

/**
 * 올바르지 않은 데이터에 대한 예외 클래스
 * 
 * @author 임경혜
 * @version ver.1.0
 * @since jdk 1.7
 * @see java.lang.Exception
 */
public class RequiredException extends Exception {
	public RequiredException() {
		super("필수 항목에 대한 데이터를 입력하시기 바랍니다.");
	}
	
	public RequiredException(String key) {
		super(key + " : 필수 항목에 대한 데이터를 입력하시기 바랍니다.");
	}
}

