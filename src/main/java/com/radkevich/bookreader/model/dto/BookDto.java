package com.radkevich.bookreader.model.dto;

import com.radkevich.bookreader.model.Book;

public class BookDto {
    private Long id;
    private String bookname;
    private String description;
    private String text;
    private String tag;
    private String genre;
    private Long Likes;
    private Boolean meLiked;


    public BookDto(Book book, Long likes, Boolean meLiked) {
        this.id = book.getId();
        this.bookname = book.getBookname();
        this.description = book.getDescription();
        this.text = book.getText();
        this.tag = book.getTag();
        this.genre = book.getGenre();
        Likes = likes;
        this.meLiked = meLiked;
    }

    public Long getId() {
        return id;
    }

    public String getBookname() {
        return bookname;
    }

    public String getDescription() {
        return description;
    }

    public String getText() {
        return text;
    }

    public String getTag() {
        return tag;
    }

    public String getGenre() {
        return genre;
    }

    public Long getLikes() {
        return Likes;
    }

    public Boolean getMeLiked() {
        return meLiked;
    }

    @Override
    public String toString() {
        return "BookDto{" +
                "Likes=" + Likes +
                ", meLiked=" + meLiked +
                '}';
    }
}
