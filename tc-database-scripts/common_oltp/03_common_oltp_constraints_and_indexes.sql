alter table corona_event drop constraint if exists corona_event_user_fk;
alter table corona_event add constraint corona_event_user_fk foreign key (user_id) references "user"(user_id);

create index if not exists email_user_id_idx on email(user_id, primary_ind);






