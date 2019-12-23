package com.radkevich.bookreader.controller;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.model.Comment;
import com.radkevich.bookreader.repository.BookRepo;
import com.radkevich.bookreader.repository.CommentRepo;
import com.radkevich.bookreader.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private BookRepo bookRepo;

    @GetMapping("/book")
    public String mainBook(@RequestParam(required = false, defaultValue = "") String filter, Map<String, Object> model) {
        Iterable<Book> books = bookService.filterBook(filter);
        model.put("books", books);
        return "booklist";
    }

    @GetMapping("/book/{book}")
    public String bookVievForm(@PathVariable Book book, Model model){
        Iterable<Comment> comments = commentRepo.findAll();
        model.addAttribute("comments", comments);
        model.addAttribute("book", book);
        return "book";
    }

    @GetMapping("/book/edit/{book}")
    public String bookEditForm(@PathVariable Book book, Model model){
        model.addAttribute("book", book);
        return "bookEdit";
    }

    @PostMapping("/book/edit/{book.id}")
    public String bookUpdate(@PathVariable(name="book.id") Book book, Model model
    ){
        model.addAttribute("book", book);
        bookRepo.save(book);
        Iterable<Comment> comments = commentRepo.findAll();
        model.addAttribute("comments", comments);
        return "book";
    }

    @PostMapping("/book")
    public String addBook(@RequestParam String bookname,
                          @RequestParam String description,
                          @RequestParam String text,
                          @RequestParam String tag,
                          @RequestParam String genre,
                          Map<String, Object> model) {
      Book book = new Book(bookname, description, text, tag, genre);
      bookService.addBook(book);
        Iterable<Book> books = bookRepo.findAll();
        model.put("books", books);
        return "booklist";
    }
}