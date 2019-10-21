CREATE schema IF NOT EXISTS corporate_oltp authorization postgres;

--Create users/roles
DO
$$
BEGIN
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'coder') THEN

      CREATE ROLE coder ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'db_sales_im') THEN

      CREATE ROLE db_sales_im ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'veredox') THEN

      CREATE ROLE veredox ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'openaim') THEN

      CREATE ROLE openaim ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'truveo') THEN

      CREATE ROLE truveo ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'cockpit') THEN

      CREATE ROLE cockpit ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                       
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'winformula') THEN

      CREATE ROLE winformula ;
   END IF;
   
   IF NOT EXISTS (
      SELECT                      
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'openxtraz') THEN

      CREATE ROLE openxtraz ; 
   END IF;
END;
$$;

SET search_path TO corporate_oltp;

CREATE ROLE readonly;

GRANT USAGE ON SCHEMA corporate_oltp TO coder ;
GRANT USAGE ON SCHEMA corporate_oltp TO readonly ;
GRANT USAGE ON SCHEMA corporate_oltp TO veredox ;
GRANT USAGE ON SCHEMA corporate_oltp TO openaim ;
GRANT USAGE ON SCHEMA corporate_oltp TO truveo ;
GRANT USAGE ON SCHEMA corporate_oltp TO winformula ;
GRANT USAGE ON SCHEMA corporate_oltp TO openxtraz ;
GRANT USAGE ON SCHEMA corporate_oltp TO cockpit ;

create table corporate_oltp.unit_type_lu
  (
    unit_type_id decimal(10,0) not null ,
    unit_type_desc varchar(128),
    create_date timestamp(3) default now(),
    modify_date timestamp(3) default now(),
    primary key (unit_type_id)
  );

revoke all on corporate_oltp.unit_type_lu from public;


create table corporate_oltp.dual
  (
    value integer
  );
revoke all on corporate_oltp.dual from public;

create table corporate_oltp.data_type
  (
    data_type_id decimal(5,0),
    data_type_desc varchar(16),
    primary key (data_type_id)
  );

revoke all on corporate_oltp.data_type from public;

create table corporate_oltp.input_lu
  (
    input_id decimal(10,0),
    input_code varchar(25),
    data_type_id decimal(5,0),
    input_desc varchar(100),
    primary key (input_id)
  );

revoke all on corporate_oltp.input_lu from public;

create table corporate_oltp.query
  (
    query_id decimal(10,0),
    text text,
    name varchar(100),
    ranking integer,
    column_index integer,
    primary key (query_id)
  );

revoke all on corporate_oltp.query from public;

create table corporate_oltp.command
  (
    command_id decimal(10,0),
    command_desc varchar(100),
    command_group_id decimal(5,0),
    primary key (command_id)
  );

revoke all on corporate_oltp.command from public;

create table corporate_oltp.command_group_lu
  (
    command_group_id decimal(5,0) not null ,
    command_group_name varchar(100),
    primary key (command_group_id)
  );

revoke all on corporate_oltp.command_group_lu from public;


create table corporate_oltp.query_input_xref
  (
    query_id decimal(10,0),
    optional char(1),
    default_value varchar(100),
    input_id decimal(10,0),
    sort_order decimal(3,0),
    primary key (query_id,input_id)
  );
revoke all on corporate_oltp.query_input_xref from public;

create table corporate_oltp.command_query_xref
  (
    command_id decimal(10,0),
    query_id decimal(10,0),
    sort_order decimal(3,0),
    primary key (command_id,query_id)
  );
revoke all on corporate_oltp.command_query_xref from public;

create table corporate_oltp.unit
  (
    unit_id decimal(10,0) not null ,
    unit_desc varchar(128),
    unit_type_id decimal(5,0) not null ,
    create_date timestamp(3) default now(),
    modify_date timestamp(3) default now(),
    primary key (unit_id)
  );
revoke all on corporate_oltp.unit from public;

create table corporate_oltp.product
  (
    product_id decimal(10,0) not null ,
    product_desc varchar(128),
    cost decimal(9,2) not null ,
    create_date timestamp(3) default now(),
    modify_date timestamp(3) default now(),
    redirect_url varchar(255),
    terms_of_use_id decimal(10,0),
    primary key (product_id)
  );
revoke all on corporate_oltp.product from public;

create table corporate_oltp.product_role_xref
  (
    product_id decimal(10,0) not null ,
    role_id decimal(18) not null ,
    create_date timestamp(3) default now(),
    primary key (product_id,role_id)
  );
revoke all on corporate_oltp.product_role_xref from public;

create table corporate_oltp.purchase
  (
    purchase_id decimal(10,0) not null ,
    company_id decimal(10,0),
    product_id decimal(10,0) not null ,
    start_date timestamp(3),
    end_date timestamp(3),
    create_date timestamp(3) default now(),
    modify_date timestamp(3) default now(),
    paid decimal(9,2) not null ,
    user_id decimal(10,0) not null ,
    primary key (purchase_id)
  );
revoke all on corporate_oltp.purchase from public;

create table corporate_oltp.product_unit_xref
  (
    product_id decimal(10,0) not null ,
    unit_id decimal(10,0) not null ,
    num_units decimal(5,0) not null ,
    create_date timestamp(3) default now(),
    modify_date timestamp(3) default now(),
    primary key (product_id,unit_id)
  );

revoke all on corporate_oltp.product_unit_xref from public;

create table corporate_oltp.product_country_eligibility
  (
    product_id decimal(10,0),
    country_code varchar(3),
    eligible decimal(1,0),
    primary key (product_id,country_code)
  );
revoke all on corporate_oltp.product_country_eligibility from public;

create table corporate_oltp.command_execution
  (
    command_id decimal(10,0),
    "timestamp" timestamp(3) default now(),
    execution_time integer,
    inputs varchar(2000)
  );
revoke all on corporate_oltp.command_execution from public;


create table corporate_oltp.tc_direct_project
  (
    project_id integer not null ,
    name varchar(200) not null ,
    description varchar(10000),
    project_status_id INT default 1 not null,
    user_id integer not null ,
    project_forum_id VARCHAR(255),
    create_date timestamp(3) not null ,
    modify_date timestamp(3),
	direct_project_type_id INT,
	direct_project_category_id INT,
	completion_date timestamp(0),
	fixed_bug_contest_fee DECIMAL(5,0),
	percentage_bug_contest_fee DECIMAL(7,2),
    demand_work_id varchar(100),
    primary key (project_id)
  );
revoke all on corporate_oltp.tc_direct_project from public;


create table corporate_oltp.tc_direct_project_status_lu (
    project_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date timestamp(3) not null,
    modify_user VARCHAR(64) not null,
    modify_date timestamp(3) not null
);

revoke all on tc_direct_project_status_lu from public;


create table corporate_oltp.permission_type
  (
    permission_type_id decimal(10, 0) not null ,
    name varchar(254) not null ,
    primary key (permission_type_id)
  );
revoke all on corporate_oltp.permission_type from public;


create table corporate_oltp.user_permission_grant
  (
    user_permission_grant_id decimal(10) not null ,
    user_id decimal(10,0) not null ,
    resource_id decimal(10,0) not null ,
    permission_type_id decimal(10,0) not null ,
    is_studio smallint,
    primary key (user_permission_grant_id)
  );
revoke all on corporate_oltp.user_permission_grant from public;


create table corporate_oltp.spec_review_status_type_lu
(
    review_status_type_id decimal(3,0) NOT NULL,
    name varchar(254),
    PRIMARY KEY (review_status_type_id)
);
revoke all on corporate_oltp.spec_review_status_type_lu from public;

create table corporate_oltp.spec_review_section_type_lu (
    review_section_type_id decimal(3,0) NOT NULL,
    is_studio SMALLINT,
    name varchar(254),
    PRIMARY KEY (review_section_type_id)
);
revoke all on corporate_oltp.spec_review_section_type_lu from public;

create table corporate_oltp.spec_review_user_role_type_lu (
    review_user_role_type_id decimal(3, 0) NOT NULL,
    name varchar(254),
    PRIMARY KEY(review_user_role_type_id)
);
revoke all on corporate_oltp.spec_review_user_role_type_lu from public;


create table corporate_oltp.spec_review
(
    spec_review_id decimal(10,0) NOT NULL,
    contest_id decimal(10,0) NOT NULL ,
    is_studio SMALLINT NOT NULL,
    review_status_type_id decimal(3, 0) NOT NULL, -- READY, REVIEWER_ASSIGNED
    creation_time timestamp(3),
    creation_user VARCHAR(64),
    modification_time timestamp(3),
    modification_user VARCHAR(64),
    ready_for_review_time timestamp(3),
    review_done_time timestamp(3),
    PRIMARY KEY (spec_review_id),
    FOREIGN KEY (review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id)
);

revoke all on corporate_oltp.spec_review from public;

create table corporate_oltp.spec_review_reviewer_xref
(
    spec_review_reviewer_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_user_id decimal(10,0),
    review_start_time timestamp(3) NOT NULL,
    is_active SMALLINT, -- Would be true only for the last active reviewer.
    creation_user VARCHAR(64),
    creation_time timestamp(3),
    PRIMARY KEY (spec_review_reviewer_id),
    FOREIGN KEY (spec_review_id) REFERENCES spec_review(spec_review_id)
);

revoke all on spec_review_reviewer_xref from public;

create table corporate_oltp.spec_section_review (
    spec_section_review_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_status_type_id decimal(3, 0) NOT NULL,
    review_section_type_id decimal(3, 0) NOT NULL,
    create_time timestamp(3),
    create_user VARCHAR(64),
    modification_time timestamp(3),
    modification_user VARCHAR(64),
    PRIMARY KEY (spec_section_review_id),
    FOREIGN KEY (spec_review_id) REFERENCES spec_review(spec_review_id),
    FOREIGN KEY (review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id),
    FOREIGN KEY (review_section_type_id) REFERENCES spec_review_section_type_lu(review_section_type_id)
);

revoke all on spec_section_review from public;

create table corporate_oltp.spec_section_review_comment
(
    comment_id decimal(10,0) NOT NULL,
    spec_section_review_id decimal(10,0) NOT NULL,
    review_comment VARCHAR(1000) NOT NULL,
    review_user_role_type_id decimal(3, 0) NOT NULL,
    create_user varchar(64),
    create_time timestamp(3) NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (spec_section_review_id) REFERENCES spec_section_review(spec_section_review_id),
    FOREIGN KEY (review_user_role_type_id) REFERENCES spec_review_user_role_type_lu(review_user_role_type_id)
);
revoke all on corporate_oltp.spec_section_review_comment from public;

create table corporate_oltp.spec_review_comment_view  (
    view_id decimal(10,0) NOT NULL,
    comment_id decimal(10,0) NOT NULL,
    view_user VARCHAR(64),
    view_time timestamp(3) NOT NULL,
    PRIMARY KEY(view_id),
    FOREIGN KEY(comment_id) REFERENCES spec_section_review_comment(comment_id)
);
revoke all on corporate_oltp.spec_review_comment_view from public;


create table corporate_oltp.direct_project_type
(
    direct_project_type_id INT not null,
    name VARCHAR(64) not null,
    PRIMARY KEY (direct_project_type_id)
);
revoke all on corporate_oltp.direct_project_type from public;


create table corporate_oltp.direct_project_category (
    direct_project_category_id INT not null,
    direct_project_type_id INT not null,
    name VARCHAR(64) not null,
    PRIMARY KEY(direct_project_category_id)
);
revoke all on corporate_oltp.direct_project_category from public;


create table corporate_oltp.direct_project_account  (
    direct_project_account_id INT not null,
    project_id INT not null,
    billing_account_id INT not null,
    PRIMARY KEY(direct_project_account_id)
);
revoke all on corporate_oltp.direct_project_account from public;


CREATE TABLE corporate_oltp.project_question(
	question_id INT NOT NULL,
	question_text VARCHAR(1000) NOT NULL,
	direct_project_type_id INT NOT NULL,
	answer_html_id VARCHAR(45),
	multiple_answers_html_xpath VARCHAR(100)
);
revoke all on corporate_oltp.project_question from public;

CREATE TABLE corporate_oltp.project_question_option(
	question_option_id INT NOT NULL,
	question_id INT NOT NULL,
	question_option_text VARCHAR(1000) NOT NULL,
	answer_html_id VARCHAR(45),
	has_associated_textbox BOOLEAN NOT NULL,
	associated_textbox_html_id VARCHAR(45)
);
revoke all on corporate_oltp.project_question_option from public;

CREATE TABLE corporate_oltp.project_answer(
	answer_id INT NOT NULL,
	question_id INT NOT NULL,
	textual_answer VARCHAR(4000),
	tc_direct_project_id INT NOT NULL
);
revoke all on corporate_oltp.project_answer from public;

CREATE TABLE corporate_oltp.project_multiple_answer(
	project_multiple_answer_id INT NOT NULL,
	answer_id INT NOT NULL,
	answer_value VARCHAR(255)
);
revoke all on corporate_oltp.project_multiple_answer from public;

CREATE TABLE corporate_oltp.project_answer_option(
	project_answer_option_id INT NOT NULL,
	answer_id INT NOT NULL,
	question_option_id INT NOT NULL,
	answer_html_value VARCHAR(1000)
);
revoke all on corporate_oltp.project_answer_option from public;

create table corporate_oltp.tc_direct_project_audit (
	tc_direct_project_audit_id DECIMAL(10, 0) NOT NULL,
	tc_direct_project_id DECIMAL(10, 0) NOT NULL,
	audit_action_type_id INT NOT NULL,				-- the operation type (create, update, delete), refer to audit_action_type_lu
    action_user_id DECIMAL(10,0) NOT NULL,		-- who made the change
    field_name VARCHAR(30) NOT NULL,		-- the field of the change
    old_value VARCHAR(254),		-- the old value of the field
    new_value VARCHAR(254),		-- the new value of the field
    "timestamp" timestamp(3) default now()	-- the timestamp
);

revoke all on tc_direct_project_audit from public;


create table corporate_oltp.user_permission_grant_audit (
    user_permission_grant_audit_id DECIMAL(10, 0) NOT NULL,
    user_permission_grant_id DECIMAL(10, 0) NOT NULL,
    audit_action_type_id  INT NOT NULL,                -- the operation type (create, update, delete), refer to audit_action_type_lu
    user_id DECIMAL(10,0) NOT NULL,
    resource_id DECIMAL(10,0) NOT NULL,
    action_user_id DECIMAL(10,0) NOT NULL,        -- who made the change
    field_name VARCHAR(30) NOT NULL,        -- the field of the change
    old_value VARCHAR(254),        -- the old value of the field
    new_value VARCHAR(254),        -- the new value of the field
    "timestamp" timestamp(3) default now()   -- the timestamp
);
revoke all on user_permission_grant_audit from public;


create table corporate_oltp.audit_action_type_lu (
    audit_action_type_id INT not null,
    name VARCHAR(50) not null,
    description VARCHAR(50) not null,
    create_user VARCHAR(64) not null,
    create_date timestamp(3) default now() not null,
    modify_user VARCHAR(64) not null,
    modify_date timestamp(3) default now() not null
);
revoke all on corporate_oltp.audit_action_type_lu from public;

grant select on corporate_oltp.unit_type_lu to public;
grant update on corporate_oltp.unit_type_lu to public;
grant insert on corporate_oltp.unit_type_lu to public;
grant delete on corporate_oltp.unit_type_lu to public;
grant select on corporate_oltp.dual to public;
grant update on corporate_oltp.dual to public;
grant insert on corporate_oltp.dual to public;
grant delete on corporate_oltp.dual to public;
grant select on corporate_oltp.data_type to public;
grant update on corporate_oltp.data_type to public;
grant insert on corporate_oltp.data_type to public;
grant delete on corporate_oltp.data_type to public;
grant select on corporate_oltp.input_lu to public;
grant update on corporate_oltp.input_lu to public;
grant insert on corporate_oltp.input_lu to public;
grant delete on corporate_oltp.input_lu to public;
grant select on corporate_oltp.query to public;
grant update on corporate_oltp.query to public;
grant insert on corporate_oltp.query to public;
grant delete on corporate_oltp.query to public;
grant select on corporate_oltp.command to public;
grant update on corporate_oltp.command to public;
grant insert on corporate_oltp.command to public;
grant delete on corporate_oltp.command to public;
grant select on corporate_oltp.command_group_lu to public;
grant update on corporate_oltp.command_group_lu to public;
grant insert on corporate_oltp.command_group_lu to public;
grant delete on corporate_oltp.command_group_lu to public;
grant select on corporate_oltp.query_input_xref to public;
grant update on corporate_oltp.query_input_xref to public;
grant insert on corporate_oltp.query_input_xref to public;
grant delete on corporate_oltp.query_input_xref to public;
grant select on corporate_oltp.command_query_xref to public;
grant update on corporate_oltp.command_query_xref to public;
grant insert on corporate_oltp.command_query_xref to public;
grant delete on corporate_oltp.command_query_xref to public;
grant select on corporate_oltp.unit to public;
grant update on corporate_oltp.unit to public;
grant insert on corporate_oltp.unit to public;
grant delete on corporate_oltp.unit to public;
grant select on corporate_oltp.product to public;
grant update on corporate_oltp.product to public;
grant insert on corporate_oltp.product to public;
grant delete on corporate_oltp.product to public;
grant select on corporate_oltp.product_role_xref to public;
grant update on corporate_oltp.product_role_xref to public;
grant insert on corporate_oltp.product_role_xref to public;
grant delete on corporate_oltp.product_role_xref to public;
grant select on corporate_oltp.purchase to public;
grant update on corporate_oltp.purchase to public;
grant insert on corporate_oltp.purchase to public;
grant delete on corporate_oltp.purchase to public;
grant select on corporate_oltp.product_unit_xref to public;
grant update on corporate_oltp.product_unit_xref to public;
grant insert on corporate_oltp.product_unit_xref to public;
grant delete on corporate_oltp.product_unit_xref to public;
grant select on corporate_oltp.product_country_eligibility to public;
grant update on corporate_oltp.product_country_eligibility to public;
grant insert on corporate_oltp.product_country_eligibility to public;
grant delete on corporate_oltp.product_country_eligibility to public;
grant select on corporate_oltp.command_execution to public;
grant update on corporate_oltp.command_execution to public;
grant insert on corporate_oltp.command_execution to public;
grant delete on corporate_oltp.command_execution to public;
grant select on corporate_oltp.tc_direct_project to public;
grant update on corporate_oltp.tc_direct_project to public;
grant insert on corporate_oltp.tc_direct_project to public;
grant delete on corporate_oltp.tc_direct_project to public;
grant select on corporate_oltp.permission_type to public;
grant update on corporate_oltp.permission_type to public;
grant insert on corporate_oltp.permission_type to public;
grant delete on corporate_oltp.permission_type to public;
grant select on corporate_oltp.user_permission_grant to public;
grant update on corporate_oltp.user_permission_grant to public;
grant insert on corporate_oltp.user_permission_grant to public;
grant delete on corporate_oltp.user_permission_grant to public;

grant select on corporate_oltp.spec_review_status_type_lu to public;
grant update on corporate_oltp.spec_review_status_type_lu to public;
grant insert on corporate_oltp.spec_review_status_type_lu to public;
grant delete on corporate_oltp.spec_review_status_type_lu to public;

grant select on corporate_oltp.spec_review_section_type_lu to public;
grant update on corporate_oltp.spec_review_section_type_lu to public;
grant insert on corporate_oltp.spec_review_section_type_lu to public;
grant delete on corporate_oltp.spec_review_section_type_lu to public;


grant select on corporate_oltp.spec_review_user_role_type_lu to public;
grant update on corporate_oltp.spec_review_user_role_type_lu to public;
grant insert on corporate_oltp.spec_review_user_role_type_lu to public;
grant delete on corporate_oltp.spec_review_user_role_type_lu to public;

grant select on corporate_oltp.spec_review to public;
grant update on corporate_oltp.spec_review to public;
grant insert on corporate_oltp.spec_review to public;
grant delete on corporate_oltp.spec_review to public;

grant select on corporate_oltp.spec_section_review to public;
grant update on corporate_oltp.spec_section_review to public;
grant insert on corporate_oltp.spec_section_review to public;
grant delete on corporate_oltp.spec_section_review to public;

grant select on corporate_oltp.spec_review_reviewer_xref to public;
grant update on corporate_oltp.spec_review_reviewer_xref to public;
grant insert on corporate_oltp.spec_review_reviewer_xref to public;
grant delete on corporate_oltp.spec_review_reviewer_xref to public;

grant select on corporate_oltp.spec_section_review_comment to public;
grant update on corporate_oltp.spec_section_review_comment to public;
grant insert on corporate_oltp.spec_section_review_comment to public;
grant delete on corporate_oltp.spec_section_review_comment to public;

grant select on corporate_oltp.spec_review_comment_view to public;
grant update on corporate_oltp.spec_review_comment_view to public;
grant insert on corporate_oltp.spec_review_comment_view to public;
grant delete on corporate_oltp.spec_review_comment_view to public;


create sequence corporate_oltp.project_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20;
Alter sequence corporate_oltp.project_sequence restart with 1245;

revoke all on corporate_oltp.project_sequence from public;

create sequence corporate_oltp.competition_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20;
Alter sequence corporate_oltp.competition_sequence restart with 490;

revoke all on corporate_oltp.competition_sequence from public;

create sequence corporate_oltp.permission_type_seq increment by 1 maxvalue 9223372036854775807 minvalue 1 cache 20;
Alter sequence corporate_oltp.permission_type_seq restart with 30;

revoke all on corporate_oltp.permission_type_seq from public;

create sequence corporate_oltp.permission_seq increment by 1 maxvalue 9223372036854775807 minvalue 700 cache 20;
Alter sequence corporate_oltp.permission_seq restart with 822;

revoke all on corporate_oltp.permission_seq from public;

CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_SEQ from public;

CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_REVIEWER_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_REVIEWER_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_SECTION_REVIEW_SEQ;
revoke all on corporate_oltp.SPEC_SECTION_REVIEW_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_STATUS_TYPE_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_STATUS_TYPE_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_SECTION_TYPE_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_SECTION_TYPE_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_SECTION_REVIEW_COMMENT_SEQ;
revoke all on corporate_oltp.SPEC_SECTION_REVIEW_COMMENT_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_USER_ROLE_TYPE_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_USER_ROLE_TYPE_SEQ from public;
CREATE SEQUENCE corporate_oltp.SPEC_REVIEW_COMMENT_VIEW_SEQ;
revoke all on corporate_oltp.SPEC_REVIEW_COMMENT_VIEW_SEQ from public;

create sequence corporate_oltp.direct_project_type_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

create sequence corporate_oltp.direct_project_category_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

create sequence corporate_oltp.direct_project_account_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;


grant select on corporate_oltp.project_sequence to public;
grant select on corporate_oltp.competition_sequence to public;
grant select on corporate_oltp.permission_type_seq to public;
grant select on corporate_oltp.permission_seq to public;
grant select on corporate_oltp.SPEC_REVIEW_SEQ to public;
grant select on corporate_oltp.SPEC_REVIEW_STATUS_TYPE_SEQ to public;
grant select on corporate_oltp.SPEC_REVIEW_SECTION_TYPE_SEQ to public;
grant select on corporate_oltp.SPEC_SECTION_REVIEW_COMMENT_SEQ to public;
grant select on corporate_oltp.SPEC_REVIEW_USER_ROLE_TYPE_SEQ to public;
grant select on corporate_oltp.SPEC_REVIEW_COMMENT_VIEW_SEQ to public;
grant select on corporate_oltp.SPEC_SECTION_REVIEW_SEQ to public;
grant select on corporate_oltp.SPEC_REVIEW_REVIEWER_SEQ to public;

grant select on corporate_oltp.tc_direct_project_status_lu to public;

grant select on corporate_oltp.direct_project_type to public;
grant update on corporate_oltp.direct_project_type to public;
grant insert on corporate_oltp.direct_project_type to public;
grant delete on corporate_oltp.direct_project_type to public;

grant select on corporate_oltp.direct_project_category to public;
grant update on corporate_oltp.direct_project_category to public;
grant insert on corporate_oltp.direct_project_category to public;
grant delete on corporate_oltp.direct_project_category to public;

grant select on corporate_oltp.direct_project_account to public;
grant update on corporate_oltp.direct_project_account to public;
grant insert on corporate_oltp.direct_project_account to public;
grant delete on corporate_oltp.direct_project_account to public;

grant select on corporate_oltp.project_question to public;
grant update on corporate_oltp.project_question to public;
grant insert on corporate_oltp.project_question to public;
grant delete on corporate_oltp.project_question to public;

grant select on corporate_oltp.project_question_option to public;
grant update on corporate_oltp.project_question_option to public;
grant insert on corporate_oltp.project_question_option to public;
grant delete on corporate_oltp.project_question_option to public;

grant select on corporate_oltp.project_answer to public;
grant update on corporate_oltp.project_answer to public;
grant insert on corporate_oltp.project_answer to public;
grant delete on corporate_oltp.project_answer to public;

grant select on corporate_oltp.project_multiple_answer to public;
grant update on corporate_oltp.project_multiple_answer to public;
grant insert on corporate_oltp.project_multiple_answer to public;
grant delete on corporate_oltp.project_multiple_answer to public;

grant select on corporate_oltp.project_answer_option to public;
grant update on corporate_oltp.project_answer_option to public;
grant insert on corporate_oltp.project_answer_option to public;
grant delete on corporate_oltp.project_answer_option to public;

CREATE SEQUENCE project_question_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_question_option_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_answer_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_multiple_answer_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
CREATE SEQUENCE project_answer_option_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;

grant select on tc_direct_project_audit to public;
grant insert on tc_direct_project_audit to public;
grant update on tc_direct_project_audit to public;
grant delete on tc_direct_project_audit to public;

grant select on user_permission_grant_audit to public;
grant insert on user_permission_grant_audit to public;
grant update on user_permission_grant_audit to public;
grant delete on user_permission_grant_audit to public;

grant select on corporate_oltp.audit_action_type_lu to public;
grant update on corporate_oltp.audit_action_type_lu to public;
grant insert on corporate_oltp.audit_action_type_lu to public;
grant delete on corporate_oltp.audit_action_type_lu to public;

create sequence corporate_oltp.tc_direct_project_audit_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20;
create sequence corporate_oltp.user_permission_grant_audit_sequence increment by 1 start with 1 maxvalue 9223372036854775807 minvalue 1 cache 20;
