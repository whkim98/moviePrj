package data.dto;

public class ActorDto {
	
	private int actor_no;
	private String actor_name;
	private int mov_info;
	
	public ActorDto(int actor_no, String actor_name, int mov_info) {
		super();
		this.actor_no = actor_no;
		this.actor_name = actor_name;
		this.mov_info = mov_info;
	}

	public int getActor_no() {
		return actor_no;
	}

	public void setActor_no(int actor_no) {
		this.actor_no = actor_no;
	}

	public String getActor_name() {
		return actor_name;
	}

	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}

	public int getMov_info() {
		return mov_info;
	}

	public void setMov_info(int mov_info) {
		this.mov_info = mov_info;
	}
	

}
