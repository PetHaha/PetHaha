package pethaha.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	
	private int MSnum;
	private String toNick;
	private String id;
	private String nick;
	private String Mcontent;
	private Timestamp INDATE;
	private int Mcheck;

}
