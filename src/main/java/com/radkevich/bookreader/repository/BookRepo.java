package com.radkevich.bookreader.repository;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.model.Comment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.User;

import java.util.List;

public interface BookRepo extends CrudRepository<Book, Long> {
    List<Book> findByTag(String tag);
   
}
