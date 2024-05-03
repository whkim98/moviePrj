package data.dto;

public class SitDto {
	
	private int sit_no;
	private String sit_name;
	
	public SitDto(int sit_no, String sit_name) {
		super();
		this.sit_no = sit_no;
		this.sit_name = sit_name;
	}

	public SitDto() {
		
	}
	
	public int getSit_no() {
		return sit_no;
	}

	public void setSit_no(int sit_no) {
		this.sit_no = sit_no;
	}

	public String getSit_name() {
		return sit_name;
	}

	public void setSit_name(String sit_name) {
		this.sit_name = sit_name;
	}

}
