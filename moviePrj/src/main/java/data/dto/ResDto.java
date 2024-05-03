package data.dto;

import java.sql.Timestamp;

public class ResDto {
	
	private int res_no;
	private int user_no;
	private int time_no;
	private int sit_no;
	private int info_no;
	private int location_no;
	private String user_name;
	private Timestamp time_time;
	private String sit_name;
	private String info_title;
	private String info_img;
	private String location_detail;
	
	public ResDto(int res_no, int user_no, int time_no, int sit_no, int info_no, int location_no) {
		super();
		this.res_no = res_no;
		this.user_no = user_no;
		this.time_no = time_no;
		this.sit_no = sit_no;
		this.info_no = info_no;
		this.location_no = location_no;
	}
	
	public ResDto() {
		
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

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public int getLocation_no() {
		return location_no;
	}

	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Timestamp getTime_time() {
		return time_time;
	}

	public void setTime_time(Timestamp time_time) {
		this.time_time = time_time;
	}

	public String getSit_name() {
		return sit_name;
	}

	public void setSit_name(String sit_name) {
		this.sit_name = sit_name;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_img() {
		return info_img;
	}

	public void setInfo_img(String info_img) {
		this.info_img = info_img;
	}

	public String getLocation_detail() {
		return location_detail;
	}

	public void setLocation_detail(String location_detail) {
		this.location_detail = location_detail;
	}
	
	
	
}
