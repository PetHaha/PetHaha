package pethaha.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int RNUM;
	private int RTHUMBS;
	private int RREPORT;
	private int BNUM;
	private String RWRITER;
	private String CONTENT;
	private String ID;
	private String NICK;
	private Timestamp INDATE;
}
