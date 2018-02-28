package org.zerock.domain;

import java.util.Date;

public class ReplyVO {

	  private Integer num;
	  private Integer id;
	  private String replytext;
	  private String replyer;

	  private Date regdate;
	  private Date updatedate;
	  
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
	  return "ReplyVO [num=" + num + ", id=" + id + ", replytext=" + replytext + ", replyer=" + replyer + ", regdate="
	        + regdate + ", updatedate=" + updatedate + "]";
	}
	
}
