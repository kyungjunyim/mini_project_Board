package com.killop2000.domain;

import java.util.Date;

public class BoardVO {
	private Integer boardNumber;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Date boardRegDate;
	private int boardViewCnt;
	public BoardVO() {
		super();
	}
	public BoardVO(Integer boardNumber, String boardTitle, String boardContent, String boardWriter, Date boardRegDate,
			int boardViewCnt) {
		super();
		this.boardNumber = boardNumber;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.boardRegDate = boardRegDate;
		this.boardViewCnt = boardViewCnt;
	}
	public Integer getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(Integer boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public Date getBoardRegDate() {
		return boardRegDate;
	}
	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}
	public int getBoardViewCnt() {
		return boardViewCnt;
	}
	public void setBoardViewCnt(int boardViewCnt) {
		this.boardViewCnt = boardViewCnt;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNumber=" + boardNumber + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardWriter=" + boardWriter + ", boardRegDate=" + boardRegDate + ", boardViewCnt=" + boardViewCnt
				+ "]";
	}
}
