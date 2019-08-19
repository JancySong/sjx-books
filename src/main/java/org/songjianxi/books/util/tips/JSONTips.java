package org.songjianxi.books.util.tips;

public class JSONTips {

	private boolean success = true;
	private String message;
	private Object object = null;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public JSONTips() {
		// TODO Auto-generated constructor stub
	}
}
