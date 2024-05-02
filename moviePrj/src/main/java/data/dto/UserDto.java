package data.dto;

public class UserDto {
	
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_addr1;
	private String user_addr2;
	private String user_residentno;
	private String user_phone;
	private String user_postal;
	
	public UserDto(int user_no, String user_id, String user_password, String user_name, String user_addr1,
			String user_addr2, String user_residentno, String user_phone, String user_postal) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_residentno = user_residentno;
		this.user_phone = user_phone;
		this.user_postal = user_postal;
	}
	
	public UserDto() {
		
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_addr1() {
		return user_addr1;
	}

	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}

	public String getUser_addr2() {
		return user_addr2;
	}

	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}

	public String getUser_residentno() {
		return user_residentno;
	}

	public void setUser_residentno(String user_residentno) {
		this.user_residentno = user_residentno;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_postal() {
		return user_postal;
	}

	public void setUser_postal(String user_postal) {
		this.user_postal = user_postal;
	}
	

}
