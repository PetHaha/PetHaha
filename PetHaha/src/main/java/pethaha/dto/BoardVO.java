package pethaha.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {

	private int BNUM;
	private int CATEGORY;
	private String SUBJECT;
	private String CONTENT;
	private Timestamp INDATE;
	private String BIMG1;
	private String BIMG2;
	private String BIMG3;
	private int VIEWS;
	private int THUMBS;
	private int REPORT;
	private String ID;
	private String NICK;
}
