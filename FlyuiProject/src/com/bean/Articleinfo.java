package com.bean;

import java.util.*;

public class Articleinfo {

  
  private int id;

 
  private String title;

  private int istop;

  private int isgood;

  private int isdone;

  private int remarknum;


  private int visitnum;


  private int userid;

  private int paykiss;


  private int type;


  private Date releasetime;

  private String content;
  
   public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title){
    this.title = title;
  }

  public int getIstop() {
    return istop;
  }
  public void setIstop(int istop){
    this.istop = istop;
  }
  public int getIsgood() {
    return isgood;
  }
  public void setIsgood(int isgood){
    this.isgood = isgood;
  }
  public int getIsdone() {
    return isdone;
  }
  public void setIsdone(int isdone){
    this.isdone = isdone;
  }
  public int getRemarknum() {
    return remarknum;
  }
  public void setRemarknum(int remarknum){
    this.remarknum = remarknum;
  }
  public int getVisitnum() {
    return visitnum;
  }
  public void setVisitnum(int visitnum){
    this.visitnum = visitnum;
  }
  public int getUserid() {
    return userid;
  }
  public void setUserid(int userid){
    this.userid = userid;
  }
  public int getPaykiss() {
    return paykiss;
  }
  public void setPaykiss(int paykiss){
    this.paykiss = paykiss;
  }
  public int getType() {
    return type;
  }
  public void setType(int type){
    this.type = type;
  }
  public Date getReleasetime() {
    return releasetime;
  }
  public void setReleasetime(Date releasetime){
    this.releasetime = releasetime;
  }
}
