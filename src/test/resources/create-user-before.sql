delete from user_role;
delete from usr;

insert into usr(id, username, password, active) values
(1, 'admin', '56b1d712-33a8-444f-bc63-b92f6e2136af', true),
(2, 'vitold', '1bc2de1a-e396-48b2-b992-957c69cf28ed', true);

insert into user_role(user_id, roles) values
(1, 'ADMIN'), (1, 'USER'),
(2, 'USER');