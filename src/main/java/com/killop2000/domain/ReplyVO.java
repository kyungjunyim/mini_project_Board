package com.killop2000.domain;

import java.util.Date;

public class ReplyVO {
	private Integer replyNumber;
	private Integer boardNumber;
	private String replyText;
	private String replyWriter;
	private Date replyRegDate;
	private Date replyUpdateDate;
	public ReplyVO() {
		super();
	}
	public ReplyVO(Integer replyNumber, Integer boardNumber, String replyText, String replyWriter, Date replyRegDate,
			Date replyUpdateDate) {
		super();
		this.replyNumber = replyNumber;
		this.boardNumber = boardNumber;
		this.replyText = replyText;
		this.replyWriter = replyWriter;
		this.replyRegDate = replyRegDate;
		this.replyUpdateDate = replyUpdateDate;
	}
	public Integer getReplyNumber() {
		return replyNumber;
	}
	public void setReplyNumber(Integer replyNumber) {
		this.replyNumber = replyNumber;
	}
	public Integer getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(Integer boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public Date getReplyUpdateDate() {
		return replyUpdateDate;
	}
	public void setReplyUpdateDate(Date replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNumber=" + replyNumber + ", boardNumber=" + boardNumber + ", replyText=" + replyText
				+ ", replyWriter=" + replyWriter + ", replyRegDate=" + replyRegDate + ", replyUpdateDate="
				+ replyUpdateDate + "]";
	}
}
