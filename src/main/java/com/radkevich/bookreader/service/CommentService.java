package com.radkevich.bookreader.service;

import com.radkevich.bookreader.repository.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public class CommentService {
    @Service
    public class MessageService {
        @Autowired
        private CommentRepo commentRepo;
    }
}
