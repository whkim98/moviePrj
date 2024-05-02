package data.dto;

public class LocationDto {
	
	private int location_no;
	private String location_city;
	private String location_detail;
	
	public LocationDto(int location_no, String location_city, String location_detail) {
		super();
		this.location_no = location_no;
		this.location_city = location_city;
		this.location_detail = location_detail;
	}
	
	public LocationDto(int location_no, String location_city) {
		super();
		this.location_no = location_no;
		this.location_city = location_city;
	}
	
	public LocationDto(int location_no) {
		super();
		this.location_no = location_no;
	}

	public int getLocation_no() {
		return location_no;
	}

	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}

	public String getLocation_city() {
		return location_city;
	}

	public void setLocation_city(String location_city) {
		this.location_city = location_city;
	}

	public String getLocation_detail() {
		return location_detail;
	}

	public void setLocation_detail(String location_detail) {
		this.location_detail = location_detail;
	}

}
