package member;

public class idDTO {
	private String basicid;
	public idDTO() { }
	public idDTO(String basicid) {
		super();
		this.basicid = basicid;
	}
	public String getBasicid() {
		return basicid;
	}
	public void setBasicid(String basicid) {
		this.basicid = basicid;
	}
	@Override
	public String toString() {
		return "idDTO [basicid=" + basicid + "]";
	}
	

}
