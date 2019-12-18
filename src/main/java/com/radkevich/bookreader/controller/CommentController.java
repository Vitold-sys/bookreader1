package com.radkevich.bookreader.controller;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.model.Comment;
import com.radkevich.bookreader.model.User;
import com.radkevich.bookreader.repository.BookRepo;
import com.radkevich.bookreader.repository.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    @Autowired
    private BookRepo bookRepo;

    @Autowired
    private CommentRepo commentRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        Iterable<Book> books = bookRepo.findAll();
        model.put("books", books);
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Comment> comments = commentRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            comments = commentRepo.findByTag(filter);
        } else {
            comments = commentRepo.findAll();
        }

        model.addAttribute("comments", comments);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String addComment(@AuthenticationPrincipal User user, @Valid Comment comment, BindingResult bindingResult, Model model) {
            comment.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("comments", comment);
        } else {
            commentRepo.save(comment);
        }
        Iterable<Comment> comments = commentRepo.findAll();
        model.addAttribute("comments", comments);

        return "main";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model){
        Iterable<Comment> comments;
        if (filter != null && filter.isEmpty()) {
            comments = commentRepo.findByTag(filter);
        }
        else {
            comments = commentRepo.findAll();
        }
        model.put("comments", comments);
        return "main";
    }
}