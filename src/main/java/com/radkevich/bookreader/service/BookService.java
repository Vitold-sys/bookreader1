package com.radkevich.bookreader.service;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.repository.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;


public class BookService  {
    @Autowired
    private BookRepo bookRepo;


}