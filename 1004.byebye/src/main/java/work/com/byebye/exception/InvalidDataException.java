package work.com.byebye.exception;

public class InvalidDataException extends Exception {
	public InvalidDataException() {
		super("데이터를 올바르게 입력하시기 바랍니다.");
	}
	
	public InvalidDataException(String key) {
		super(key + " : 데이터를 올바르게 입력하시기 바랍니다.");
	}
}

