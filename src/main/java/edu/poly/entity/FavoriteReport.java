package edu.poly.entity;

import java.util.Date;

public class FavoriteReport {
	private String videoTitle;
	private Long favoriteCount;
	private Date newest, oldest;
	public FavoriteReport() {
	}

	public FavoriteReport(String videoTitle, Long favoriteCount, Date newest, Date oldest) {
		super();
		this.videoTitle = videoTitle;
		this.favoriteCount = favoriteCount;
		this.newest = newest;
		this.oldest = oldest;
	}

	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public Long getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(Long favoriteCount) {
		this.favoriteCount = favoriteCount;
	}

	public Date getNewest() {
		return newest;
	}

	public void setNewest(Date newest) {
		this.newest = newest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
	
}