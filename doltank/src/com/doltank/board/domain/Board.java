package com.doltank.board.domain;

import java.io.Serializable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Board implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
//	private static final long serialVersionUID = -5419719246689020293L;
    
	

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private User author;

    @Persistent
    private String boardType;
    
    @Persistent
    private String content;

    @Persistent
    private Date date;

    public Board(User author, String boardType, String content, Date date) {
        this.author = author;
        this.content = content;
        this.boardType = boardType;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public Date getDate() {
        return date;
    }
    
    public String getBoardType() {
        return boardType;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }
}