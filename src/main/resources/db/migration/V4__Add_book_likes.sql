create table book_likes (
  user_id bigint not null references usr,
  book_id bigint not null references book,
  primary key (user_id, book_id)
)