package com.radkevich.bookreader.service;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.repository.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class BookService  {
    @Autowired
    private BookRepo bookRepo;

public void addBook(Book book){
    bookRepo.save(book);
}

    public Iterable<Book> filterBook(@RequestParam String filter){
        Iterable<Book> books;
        if (!filter.isEmpty()) {
            books = bookRepo.findByTag(filter);
        }
        else {
            books = bookRepo.findAll();
        }
        return books;
    }
}

