package com.ydy.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


public class RestVO {
    private int rest_id;
    private String rest_name;
    private String address_road;
    private String address;
    private String city;
    private double lat;
    private double lng;
    private int fav;
    private int visit;
    private String memo;
    private String file_name;
    private MultipartFile upload;
    
	public int getRest_id() {
		return rest_id;
	}
	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	@Override
	public String toString() {
		return "RestVO [rest_id=" + rest_id + ", rest_name=" + rest_name + ", address_road=" + address_road
				+ ", address=" + address + ", city=" + city + ", lat=" + lat + ", lng=" + lng + ", fav=" + fav
				+ ", visit=" + visit + ", memo=" + memo + ", file_name=" + file_name + ", upload=" + upload
				+ ", getRest_id()=" + getRest_id() + ", getRest_name()=" + getRest_name() + ", getAddress_road()="
				+ getAddress_road() + ", getAddress()=" + getAddress() + ", getCity()=" + getCity() + ", getLat()="
				+ getLat() + ", getLng()=" + getLng() + ", getFav()=" + getFav() + ", getVisit()=" + getVisit()
				+ ", getMemo()=" + getMemo() + ", getFile_name()=" + getFile_name() + ", getUpload()=" + getUpload()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}






	
}
