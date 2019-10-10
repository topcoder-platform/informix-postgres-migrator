SET search_path TO jive;

create extension if not exists postgres_fdw;
create server if not exists common_oltp_server foreign data wrapper postgres_fdw options(dbname 'common_oltp');
create user mapping if not exists for current_user server common_oltp_server;

create foreign table if not exists foreign_user (
      user_id decimal(10,0) not null,
      first_name varchar(64),
      last_name varchar(64),
      create_date timestamp default current_timestamp,
      modify_date timestamp default current_timestamp,
      handle varchar(50) not null,
      last_login timestamp,
      status varchar(3) not null,
      activation_code varchar(32),
      middle_name varchar(64),
      handle_lower varchar(50),
      timezone_id decimal(5,0),
      last_site_hit_date timestamp,
      name_in_another_language varchar(64),
      password varchar(16),
      open_id varchar(200),
      reg_source varchar(20),
      utm_source varchar(50),
      utm_medium varchar(50),
      utm_campaign varchar(50)
)
server common_oltp_server options (schema_name 'public', table_name 'user');

create foreign table if not exists foreign_email (
      user_id decimal(10,0),
      email_id decimal(10,0),
      email_type_id decimal(5,0),
      address varchar(100),
      create_date timestamp default current_timestamp,
      modify_date timestamp default current_timestamp,
      primary_ind decimal(1,0),
      status_id decimal(3,0)
)
server common_oltp_server options (schema_name 'public', table_name 'email');

create foreign table if not exists foreign_corona_event (
  corona_event_id serial not null,
  corona_event_type_id decimal(3, 0) not null,
  user_id decimal(10, 0) not null,
  scanned_ind decimal(1,0) default 0 NOT NULL,
  corona_event_timestamp timestamp default current_timestamp
)
server common_oltp_server options (schema_name 'public', table_name 'corona_event');

drop function if exists millis_to_time;
create function millis_to_time(milli_val decimal(14,0)) returns timestamp(3) as $$
declare
   retval timestamp(3);
begin
   retval:= to_timestamp(trunc(milli_val/1000,0)) at time zone 'UTC';
   return retval;
end;
$$ language plpgsql immutable;


drop view if exists jiveuser;
create view jiveuser (userid,username,passwordhash,name,namevisible,email,emailvisible,creationdate,modificationdate) as
  select x0.user_id ,x0.handle ,'' ,'' ,0 ,x1.address,0 ,0 ,0 from foreign_user x0 ,foreign_email x1 where ((x0.user_id = x1.user_id ) AND  (x1.primary_ind = 1. ) ) ;

drop trigger if exists trig_jivemessage_insert on jivemessage cascade;
drop function if exists trig_jivemessage_insert_event;
create function trig_jivemessage_insert_event() returns trigger as $$
begin
    perform setval('foreign_corona_event_corona_event_id_seq', max(corona_event_id)) from foreign_corona_event;
    insert into foreign_corona_event (corona_event_type_id,user_id) values (2, new.userid);
	return new;
end;
$$ language plpgsql;
create trigger trig_jivemessage_insert after insert on jivemessage for each row execute procedure trig_jivemessage_insert_event();
