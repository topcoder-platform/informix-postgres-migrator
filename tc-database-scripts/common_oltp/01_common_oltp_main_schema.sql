create table if not exists "user" (
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
    utm_campaign varchar(50),
    constraint u175_45 primary key (user_id)
);
create table if not exists email (
    user_id decimal(10,0),
    email_id decimal(10,0),
    email_type_id decimal(5,0),
    address varchar(100),
    create_date timestamp default current_timestamp,
    modify_date timestamp default current_timestamp,
    primary_ind decimal(1,0),
    status_id decimal(3,0),
    constraint u110_23 primary key (email_id)
);
create table if not exists corona_event (
  corona_event_id SERIAL not null,
  corona_event_type_id decimal(3, 0) not null,
  user_id decimal(10, 0) not null,
  scanned_ind decimal(1,0) default 0 not null,
  corona_event_timestamp timestamp default current_timestamp,
  constraint corona_event_type_pkey primary key (corona_event_id)
);
