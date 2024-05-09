package edu.poly.entity;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name="Videos")
@NamedQuery(name="Video.findAll", query="SELECT v FROM Video v")
public class Video implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="VideoId")
	private String videoId;

	@Column(name="Active")
	private boolean active;

	@Column(name="DaoDien")
	private String daoDien;

	@Column(name="Description")
	private String description;

	@Column(name="NgayCongChieu")
	private Date ngayCongChieu;

	@Column(name="PhuDe")
	private String phuDe;

	@Column(name="Poster")
	private String poster;

	@Column(name="ThoiLuong")
	private int thoiLuong;

	@Column(name="Title")
	private String title;

	@Column(name="Trailer")
	private String trailer;

	@Column(name="Views")
	private int views;

	//bi-directional many-to-one association to Favorite
	@OneToMany(mappedBy="video")
	private List<Favorite> favorites;

	//bi-directional many-to-one association to Share
	@OneToMany(mappedBy="video")
	private List<Share> shares;

	public Video() {
	}

	public String getVideoId() {
		return this.videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public boolean getActive() {
		return this.active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDaoDien() {
		return this.daoDien;
	}

	public void setDaoDien(String daoDien) {
		this.daoDien = daoDien;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getNgayCongChieu() {
		return this.ngayCongChieu;
	}

	public void setNgayCongChieu(Date ngayCongChieu) {
		this.ngayCongChieu = ngayCongChieu;
	}

	public String getPhuDe() {
		return this.phuDe;
	}

	public void setPhuDe(String phuDe) {
		this.phuDe = phuDe;
	}

	public String getPoster() {
		return this.poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getThoiLuong() {
		return this.thoiLuong;
	}

	public void setThoiLuong(int thoiLuong) {
		this.thoiLuong = thoiLuong;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTrailer() {
		return this.trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public int getViews() {
		return this.views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public List<Favorite> getFavorites() {
		return this.favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	public Favorite addFavorite(Favorite favorite) {
		getFavorites().add(favorite);
		favorite.setVideo(this);

		return favorite;
	}

	public Favorite removeFavorite(Favorite favorite) {
		getFavorites().remove(favorite);
		favorite.setVideo(null);

		return favorite;
	}

	public List<Share> getShares() {
		return this.shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public Share addShare(Share share) {
		getShares().add(share);
		share.setVideo(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setVideo(null);

		return share;
	}

}