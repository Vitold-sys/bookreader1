package com.radkevich.bookreader.repository;

import com.radkevich.bookreader.model.Book;
import com.radkevich.bookreader.model.Comment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookRepo extends CrudRepository<Book, Long> {
    List<Book> findByTag(String tag);
}
