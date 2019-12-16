package com.radkevich.bookreader.repository;

import com.radkevich.bookreader.model.Comment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentRepo extends CrudRepository<Comment, Long> {

    List<Comment> findByTag(String tag);

}