package store.bean;

public class ResponseResult {
    private Integer state;
    private String message;
    private Object data;
    
    public static final int SUCCESS = 0;
    public static final int ERROR = 1;
    
    public ResponseResult() {}
    
    public ResponseResult(Integer state, String message, Object data) {
        this.state = state;
        this.message = message;
        this.data = data;
    }
    
    public static ResponseResult success() {
        return new ResponseResult(SUCCESS, "操作成功", null);
    }
    
    public static ResponseResult success(Object data) {
        return new ResponseResult(SUCCESS, "操作成功", data);
    }
    
    public static ResponseResult error(String message) {
        return new ResponseResult(ERROR, message, null);
    }
    
    // getter和setter方法
    public Integer getState() {
        return state;
    }
    public void setState(Integer state) {
        this.state = state;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public Object getData() {
        return data;
    }
    public void setData(Object data) {
        this.data = data;
    }
}