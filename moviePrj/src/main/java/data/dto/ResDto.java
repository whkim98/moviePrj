package data.dto;

public class ResDto {
	
	private int res_no;
	private int user_no;
	private int time_no;
	private int sit_no;
	
	public ResDto(int res_no, int user_no, int time_no, int sit_no) {
		super();
		this.res_no = res_no;
		this.user_no = user_no;
		this.time_no = time_no;
		this.sit_no = sit_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getSit_no() {
		return sit_no;
	}

	public void setSit_no(int sit_no) {
		this.sit_no = sit_no;
	}

}
