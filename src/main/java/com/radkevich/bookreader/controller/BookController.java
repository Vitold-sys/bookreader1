package com.radkevich.bookreader.controller;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.model.Comment;
import com.radkevich.bookreader.repository.BookRepo;
import com.radkevich.bookreader.repository.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private BookRepo bookRepo;

    @GetMapping("/book")
    public String mainBook(@RequestParam(required = false, defaultValue = "") String filter, Map<String, Object> model) {
        Iterable<Book> books = bookRepo.findAll();
        if (filter != null && !filter.isEmpty()) {
            books = bookRepo.findByTag(filter);
        } else {
            books = bookRepo.findAll();
        }
        model.put("books", books);
        model.put("filter", filter);
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


/*    @PostMapping("/book/edit/{book}")
    public String bookUpdate(@PathVariable Book book,
                             @RequestParam(required = false) Long id,
                             @RequestParam("bookname") String bookname,
                             @RequestParam("descripton") String description,
                             @RequestParam("text") String text,
                             @RequestParam("tag") String tag,
                             @RequestParam("genre") String genre,
                             Model model
                             ){
        model.addAttribute("book", book);
        bookRepo.save(book);
        return "bookEdit";
    }*/

/*    @PostMapping("/book/edit/{book}")
    public String bookUpdate(@PathVariable("book") Long id, @RequestBody @Valid Book book, Model model
    ){
        model.addAttribute("book", book);
        bookRepo.save(book);
        return "redirect:/book/edit/" + book.getId();
    }*/

    @PostMapping("/book/edit/{book.id}")
    public String bookUpdate(@PathVariable(name="book.id") Book book, Model model
    ){
        model.addAttribute("book", book);
        bookRepo.save(book);
        return "booklist";
    }

    @PostMapping("/book")
    public String addBook(@RequestParam String bookname,
                          @RequestParam String description,
                          @RequestParam String text,
                          @RequestParam String tag,
                          @RequestParam String genre,
                          Map<String, Object> model) {
      Book book = new Book(bookname, description, text, tag, genre);
      bookRepo.save(book);
        Iterable<Book> books = bookRepo.findAll();
        model.put("books", books);
        return "booklist";
    }

    @PostMapping("filterBook")
    public String filterBook(@RequestParam String filter, Map<String, Object> model){
        Iterable<Book> books;
        if (filter != null && filter.isEmpty()) {
            books = bookRepo.findByTag(filter);
        }
        else {
            books = bookRepo.findAll();
        }
        model.put("books", books);
        return "booklist";
    }
}