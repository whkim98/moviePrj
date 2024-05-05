package data.dto;

public class BoardDto {
	
	private int board_no;
	private String board_title;
	private String board_content;
	private int board_hit;
	private int user_no;
	private int info_no;
	private String user_id;
	private String info_title;
	
	public BoardDto(int board_no, String board_title, String board_content, int board_hit, int user_no, int info_no, String user_id, String info_title) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_hit = board_hit;
		this.user_no = user_no;
		this.info_no = info_no;
		this.user_id = user_id;
		this.info_title = info_title;
	}
	
	public BoardDto() {
		
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

}
