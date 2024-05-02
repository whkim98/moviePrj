package data.dto;

public class InfoDto {
	
	private int info_no;
	private String info_title;
	private String info_subtitle;
	private String info_img;
	private int info_age;
	private String info_open;
	private String info_author;
	private int info_time; //122분 이런 식
	private String info_description;
	private int location_no;
	
	public InfoDto(int info_no, String info_title, String info_subtitle, String info_img, int info_age,
			String info_open, String info_author, int info_time, String info_description, int location_no) {
		super();
		this.info_no = info_no;
		this.info_title = info_title;
		this.info_subtitle = info_subtitle;
		this.info_img = info_img;
		this.info_age = info_age;
		this.info_open = info_open;
		this.info_author = info_author;
		this.info_time = info_time;
		this.info_description = info_description;
		this.location_no = location_no;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_subtitle() {
		return info_subtitle;
	}

	public void setInfo_subtitle(String info_subtitle) {
		this.info_subtitle = info_subtitle;
	}

	public String getInfo_img() {
		return info_img;
	}

	public void setInfo_img(String info_img) {
		this.info_img = info_img;
	}

	public int getInfo_age() {
		return info_age;
	}

	public void setInfo_age(int info_age) {
		this.info_age = info_age;
	}

	public String getInfo_open() {
		return info_open;
	}

	public void setInfo_open(String info_open) {
		this.info_open = info_open;
	}

	public String getInfo_author() {
		return info_author;
	}

	public void setInfo_author(String info_author) {
		this.info_author = info_author;
	}

	public int getInfo_time() {
		return info_time;
	}

	public void setInfo_time(int info_time) {
		this.info_time = info_time;
	}

	public String getInfo_description() {
		return info_description;
	}

	public void setInfo_description(String info_description) {
		this.info_description = info_description;
	}

	public int getLocation_no() {
		return location_no;
	}

	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}

}
