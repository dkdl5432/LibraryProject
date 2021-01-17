package vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class Resolce_SearchVO {
	private int idx;
	private String book_name;
	private String category;
	private String company;
	private String content;
	private String author;
	private String book_year;
	private String isbl;
	private MultipartFile photo;
	private Date receiving;
	private int hits;
	private int rent;
	private int reserve;
	private int rec;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBook_year() {
		return book_year;
	}
	public void setBook_year(String book_year) {
		this.book_year = book_year;
	}
	public String getIsbl() {
		return isbl;
	}
	public void setIsbl(String isbl) {
		this.isbl = isbl;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public int getReserve() {
		return reserve;
	}
	public void setReserve(int reserve) {
		this.reserve = reserve;
	}
	public Date getReceiving() {
		return receiving;
	}
	public void setReceiving(Date receiving) {
		this.receiving = receiving;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	
	
}
