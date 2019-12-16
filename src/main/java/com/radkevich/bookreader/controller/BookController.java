package com.radkevich.bookreader.controller;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.repository.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class BookController {

        @Autowired
        private BookRepo bookRepo;

        @GetMapping("/booklist")
        public String main(@RequestParam(required = false, defaultValue = "") Map <String, Object> model) {
            Iterable<Book> books = bookRepo.findAll();
            model.put("books", books);

            return "booklist";
        }

    @PostMapping("/booklist")
    public String addComment(Book book, Model model) {
        model.addAttribute("books", book);
        bookRepo.save(book);
        Iterable<Book> books = bookRepo.findAll();
        model.addAttribute("books", books);
        return "booklist";
    }
    }