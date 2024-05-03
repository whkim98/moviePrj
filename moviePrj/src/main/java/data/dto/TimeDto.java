package data.dto;

import java.sql.Timestamp;

public class TimeDto {
	
	private int time_no;
	private int info_no;
	private Timestamp time_time;
	
	public TimeDto(int time_no, int info_no, Timestamp time_time) {
		super();
		this.time_no = time_no;
		this.info_no = info_no;
		this.time_time = time_time;
	}
	
	public TimeDto() {
		
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public Timestamp getTime_time() {
		return time_time;
	}

	public void setTime_time(Timestamp time_time) {
		this.time_time = time_time;
	}

}
