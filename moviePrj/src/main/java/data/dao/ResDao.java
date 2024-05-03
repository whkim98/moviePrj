package data.dao;

import java.util.List;
import java.util.Vector;

import data.dto.ResDto;
import db.common.MySqlConnect;

public class ResDao {

	MySqlConnect db = new MySqlConnect();
	
	public List<ResDto> reservation(){
		List<ResDto> list = new Vector<>();
		String sql = """
				
				""";
		return list;
	}
	
}
