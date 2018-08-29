package com.bean;

import java.util.*;



public class Userinfo {

  private int id;
  private String nickname;
  private String password;
  private String head_url;
  private String email;
  private String sex;
  private String city;
  private String sign;
  private int phone;
  private int kissnum;
  private int power;
  private int experience;
  private Date regtime;
  private int active;
  private String activecode;
  private Date signintime;
  private int signinnum;
  private int signflg;
  
  public int getSignflg() {
	return signflg;
}
public void setSignflg(int signflg) {
	this.signflg = signflg;
}
public Date getSignintime() {
	return signintime;
}
public void setSignintime(Date signintime) {
	this.signintime = signintime;
}
public int getSigninnum() {
	return signinnum;
}
public void setSigninnum(int signinnum) {
	this.signinnum = signinnum;
}
public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname){
    this.nickname = nickname;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password){
    this.password = password;
  }
 
  public String getHead_url() {
	return head_url;
}
public void setHead_url(String head_url) {
	this.head_url = head_url;
}
public String getEmail() {
    return email;
  }
  public void setEmail(String email){
    this.email = email;
  }
  public String getSex() {
    return sex;
  }
  public void setSex(String sex){
    this.sex = sex;
  }
  public String getCity() {
    return city;
  }
  public void setCity(String city){
    this.city = city;
  }
  public String getSign() {
    return sign;
  }
  public void setSign(String sign){
    this.sign = sign;
  }
  public int getPhone() {
    return phone;
  }
  public void setPhone(int phone){
    this.phone = phone;
  }
  public int getKissnum() {
    return kissnum;
  }
  public void setKissnum(int kissnum){
    this.kissnum = kissnum;
  }
  public int getPower() {
    return power;
  }
  public void setPower(int power){
    this.power = power;
  }
  public int getExperience() {
    return experience;
  }
  public void setExperience(int experience){
    this.experience = experience;
  }
  public Date getRegtime() {
    return regtime;
  }
  public void setRegtime(Date regtime){
    this.regtime = regtime;
  }
  public int getActive() {
    return active;
  }
  public void setActive(int active){
    this.active = active;
  }
  public String getActivecode() {
    return activecode;
  }
  public void setActivecode(String activecode){
    this.activecode = activecode;
  }
}
