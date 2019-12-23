package com.radkevich.bookreader.model.util;

import org.springframework.security.core.userdetails.User;

public abstract class BookHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}