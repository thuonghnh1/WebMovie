package edu.poly.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the Shares database table.
 * 
 */
@Entity
@Table(name="Shares")
@NamedQuery(name="Share.findAll", query="SELECT s FROM Share s")
public class Share implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ShareId")
	private int shareId;

	@Column(name="Emails")
	private String emails;

	@Column(name="SharedDate")
	private Date sharedDate;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="VideoId")
	private Video video;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Username")
	private User user;

	public Share() {
	}

	public int getShareId() {
		return this.shareId;
	}

	public void setShareId(int shareId) {
		this.shareId = shareId;
	}

	public String getEmails() {
		return this.emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	public Date getSharedDate() {
		return this.sharedDate;
	}

	public void setSharedDate(Date sharedDate) {
		this.sharedDate = sharedDate;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}