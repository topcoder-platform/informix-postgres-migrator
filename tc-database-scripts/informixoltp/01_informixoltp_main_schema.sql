-- Create schema (database)
--CREATE schema informixoltp authorization postgres;
CREATE schema IF NOT EXISTS informixoltp authorization postgres;

--set path to informixoltp schema

SET search_path TO informixoltp;

--Create users/roles
CREATE ROLE coder ;
CREATE ROLE db_sales_im ;
CREATE ROLE veredox ;
CREATE ROLE openaim ;
CREATE ROLE truveo ;
CREATE ROLE cockpit ;
CREATE ROLE winformula ;
CREATE ROLE openxtraz ;

-- Grant access
GRANT USAGE ON SCHEMA informixoltp TO coder ;
GRANT USAGE ON SCHEMA informixoltp TO veredox ;
GRANT USAGE ON SCHEMA informixoltp TO openaim ;
GRANT USAGE ON SCHEMA informixoltp TO truveo ;
GRANT USAGE ON SCHEMA informixoltp TO winformula ;
GRANT USAGE ON SCHEMA informixoltp TO openxtraz ;
-- User public does not have connect privilege;
CREATE TABLE IF NOT EXISTS informixoltp.access (
    access_id DECIMAL(2,0),
    access_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.access FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.chat_history (
    coder_id DECIMAL(10,0),
    message VARCHAR(255),
    timestamp TIMESTAMP,
    round_id DECIMAL(6,0),
    room_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.chat_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.education (
    education_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    degree_id DECIMAL(4,0),
    major VARCHAR(128),
    graduation_year DECIMAL(4,0),
    graduation_month DECIMAL(2,0),
    school_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.education FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_skill (
    coder_id DECIMAL(10,0),
    skill_id DECIMAL(5,0),
    ranking DECIMAL(2,0) not null,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.coder_skill FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.connection_lock (
    round_id DECIMAL(6,0),
    room_id DECIMAL(10,0),
    locking_column DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.connection_lock FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contact_us (
    contact_us_id DECIMAL(10,0),
    contact_us_subject_id DECIMAL(3,0),
    coder_id DECIMAL(10,0),
    from_address VARCHAR(64),
    message TEXT not null,
    response_sent CHAR(1) default 'N',
    timestamp TIMESTAMP not null,
    responder_id DECIMAL(10,0),
    reference_id DECIMAL(8,0),
    system CHAR(1)
)
;

REVOKE ALL ON informixoltp.contact_us FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contact_us_response (
    contact_us_id DECIMAL(10,0) not null,
    responder_id DECIMAL(10,0) not null,
    response TEXT not null,
    contact_us_subject_id DECIMAL(3,0) not null,
    timestamp TIMESTAMP not null
)
;

REVOKE ALL ON informixoltp.contact_us_response FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contact_us_subject (
    contact_us_subject_id DECIMAL(3,0),
    subject_desc VARCHAR(32) not null,
    status CHAR(1) not null,
    sort_order DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.contact_us_subject FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.data_type (
    data_type_id DECIMAL(5,0),
    data_type_desc VARCHAR(16)
)
;

REVOKE ALL ON informixoltp.data_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.degree (
    degree_id DECIMAL(4,0),
    degree_desc VARCHAR(128),
    sort DECIMAL(4,0),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.degree FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.difficulty (
    difficulty_id DECIMAL(2,0),
    difficulty_level VARCHAR(15),
    difficulty_desc VARCHAR(50),
    point_value DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.difficulty FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.group (
    group_id DECIMAL(10,0),
    group_desc VARCHAR(50) not null,
    access_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.group FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.group_user (
    group_id DECIMAL(10,0),
    user_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.group_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.permission (
    secure_object_id DECIMAL(10,0),
    sector_id DECIMAL(10,0),
    access_id DECIMAL(2,0)
)
;

REVOKE ALL ON informixoltp.permission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.question_type (
    question_type_id DECIMAL(3,0),
    question_type_desc VARCHAR(25) not null,
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.question_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.rating_history (
    column_name VARCHAR(16),
    old_value DECIMAL(8,0),
    new_value DECIMAL(8,0),
    timestamp TIMESTAMP not null,
    round_id DECIMAL(6,0),
    coder_id DECIMAL(10,0),
    modify_date TIMESTAMP,
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0) default 0,
    new_vol DECIMAL(5,0) default 0,
    old_rating_no_vol DECIMAL(5,0) default 0,
    new_rating_no_vol DECIMAL(5,0) default 0,
    new_num_ratings DECIMAL(6,0),
    old_num_ratings DECIMAL(6,0)
)
;

REVOKE ALL ON informixoltp.rating_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.room (
    room_id DECIMAL(10,0),
    round_id DECIMAL(10,0) not null,
    name VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    region_code VARCHAR(3),
    division_id DECIMAL(3,0),
    room_type_id DECIMAL(3,0),
    eligible DECIMAL(1,0),
    unrated DECIMAL(1,0),
    room_limit DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.room FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_component (
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    submit_order DECIMAL(3,0) default 0,
    division_id DECIMAL(3,0),
    difficulty_id DECIMAL(2,0),
    points DECIMAL(7,2),
    open_order DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.round_component FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.segment_type (
    segment_type_id DECIMAL(3,0),
    segment_type_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.segment_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_segment (
    round_id DECIMAL(10,0),
    segment_id DECIMAL(10,0),
    start_time TIMESTAMP not null,
    end_time TIMESTAMP not null,
    status CHAR(1) not null
)
;

REVOKE ALL ON informixoltp.round_segment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sector (
    sector_id DECIMAL(10,0),
    sector_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.sector FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.secure_object (
    secure_object_id DECIMAL(10,0),
    secure_object_type CHAR(1)
)
;

REVOKE ALL ON informixoltp.secure_object FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.skill_type (
    skill_type_id DECIMAL(3,0),
    skill_type_desc VARCHAR(30),
    skill_type_order DECIMAL(3,0) not null,
    status CHAR(1) not null,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.skill_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.language (
    language_id DECIMAL(3,0),
    language_name VARCHAR(30) not null,
    status CHAR(1) not null,
    language_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.language FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_type (
    user_type_id DECIMAL(3,0),
    user_type_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.user_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contest_nav (
    contest_id DECIMAL(5,0),
    contest_nav_id DECIMAL(1,0),
    task VARCHAR(30),
    command VARCHAR(30)
)
;

REVOKE ALL ON informixoltp.contest_nav FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mail_log (
    coder_id DECIMAL(10,0),
    reason VARCHAR(255),
    timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.mail_log FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.news (
    news_id DECIMAL(10,0),
    news_type_id CHAR(1),
    headline VARCHAR(255),
    news TEXT,
    new_posting CHAR(1),
    status CHAR(1),
    posting_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.news FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.audit_coder (
    user_id DECIMAL(10,0),
    column_name VARCHAR(30),
    old_value VARCHAR(150),
    new_value VARCHAR(150),
    timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.audit_coder FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.dispute (
    corporate_id DECIMAL(10,0),
    inquiry_id DECIMAL(10,0),
    dispute_id DECIMAL(10,0),
    comment TEXT,
    create_date TIMESTAMP,
    response_date TIMESTAMP,
    response_comment TEXT
)
;

REVOKE ALL ON informixoltp.dispute FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.corporate (
    corporate_id DECIMAL(10,0),
    company_id DECIMAL(10,0),
    contact_id DECIMAL(10,0),
    since TIMESTAMP default now(),
    default_billing_id DECIMAL(10,0),
    last_login TIMESTAMP,
    activation_code VARCHAR(17)
)
;

REVOKE ALL ON informixoltp.corporate FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.ad (
    ad_id DECIMAL(10,0),
    ad_desc VARCHAR(100),
    hit_count DECIMAL(6,0)
)
;

REVOKE ALL ON informixoltp.ad FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.inquiry (
    corporate_id DECIMAL(10,0),
    inquiry_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    comment TEXT,
    create_date TIMESTAMP,
    response_date TIMESTAMP,
    status CHAR(1),
    job_posting_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.inquiry FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.watch (
    corporate_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    status CHAR(1),
    timestamp TIMESTAMP,
    expire_date TIMESTAMP,
    rating DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.watch FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.subscription_region (
    subscription_id DECIMAL(10,0),
    region_code VARCHAR(3)
)
;

REVOKE ALL ON informixoltp.subscription_region FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.subscription (
    subscription_id DECIMAL(10,0),
    corporate_id DECIMAL(10,0),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    maximum_inquiries DECIMAL(6,0),
    rating_percent DECIMAL(3,2),
    amount_paid DECIMAL(7,2),
    billing_contact_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.subscription FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.region_state (
    region_code VARCHAR(3),
    state_code VARCHAR(2),
    user_type_id DECIMAL(2,0)
)
;

REVOKE ALL ON informixoltp.region_state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contest (
    contest_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    status CHAR(1) default 'I',
    language_id DECIMAL(3,0),
    group_id DECIMAL(10,0) default -1,
    region_code VARCHAR(3),
    ad_text VARCHAR(250),
    ad_start TIMESTAMP,
    ad_end TIMESTAMP,
    ad_task VARCHAR(30),
    ad_command VARCHAR(30),
    activate_menu DECIMAL(3,0),
    season_id DECIMAL(6,0)
)
;

REVOKE ALL ON informixoltp.contest FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder (
    coder_id DECIMAL(10,0),
    member_since TIMESTAMP default now(),
    quote VARCHAR(255),
    modify_date TIMESTAMP default now(),
    language_id DECIMAL(3,0),
    coder_type_id DECIMAL(3,0),
    date_of_birth TIMESTAMP,
    home_country_code VARCHAR(3),
    comp_country_code VARCHAR(3),
    contact_date DATE,
    display_quote smallint DEFAULT 1,
    quote_location VARCHAR(255) DEFAULT 'md',
    quote_color VARCHAR(255) DEFAULT '#000000',
    display_banner smallint DEFAULT 0,
    banner_style VARCHAR(255) DEFAULT 'bannerStyle1'
)
;

REVOKE ALL ON informixoltp.coder FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jiveword (
    wordid DECIMAL(32,0) not null,
    word VARCHAR(30) not null
)
;

REVOKE ALL ON informixoltp.jiveword FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jiveuserperm (
    forumid DECIMAL(32,0) not null,
    userid DECIMAL(32,0) not null,
    permission DECIMAL(32,0) not null
)
;

REVOKE ALL ON informixoltp.jiveuserperm FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivethread (
    threadid DECIMAL(32,0) not null,
    forumid DECIMAL(32,0),
    rootmessageid DECIMAL(32,0) not null,
    name VARCHAR(255),
    creationdate VARCHAR(15),
    modifieddate VARCHAR(15),
    approved DECIMAL(32,0) not null,
    userid DECIMAL(32,0)
)
;

REVOKE ALL ON informixoltp.jivethread FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivemessageword (
    messageid DECIMAL(32,0) not null,
    wordid DECIMAL(32,0) not null,
    wordcount DECIMAL(32,0) not null,
    forumid DECIMAL(32,0) not null
)
;

REVOKE ALL ON informixoltp.jivemessageword FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivemessagetree (
    parentid DECIMAL(32,0) not null,
    childid DECIMAL(32,0) not null
)
;

REVOKE ALL ON informixoltp.jivemessagetree FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivemessageprop (
    messageid DECIMAL(32,0) not null,
    name VARCHAR(50) not null,
    propvalue VARCHAR(255) not null
)
;

REVOKE ALL ON informixoltp.jivemessageprop FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivemessage (
    messageid DECIMAL(32,0) not null,
    threadid DECIMAL(32,0) default -1,
    subject VARCHAR(255),
    userid DECIMAL(32,0) not null,
    body TEXT,
    modifieddate VARCHAR(15),
    creationdate VARCHAR(15),
    approved DECIMAL(32,0) not null
)
;

REVOKE ALL ON informixoltp.jivemessage FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jivefilter (
    forumid DECIMAL(32,0) not null,
    filterindex DECIMAL(32,0) not null,
    filterobject bytea
)
;

REVOKE ALL ON informixoltp.jivefilter FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jmsconsumer (
    consumerid DECIMAL(12,0),
    clientname VARCHAR(40),
    consumername VARCHAR(40),
    destid DECIMAL(12,0),
    selector VARCHAR(100),
    nolocal DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.jmsconsumer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jmsdestination (
    destid DECIMAL(12,0),
    desttype DECIMAL(12,0),
    destname VARCHAR(60)
)
;

REVOKE ALL ON informixoltp.jmsdestination FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jmsmessage (
    messageid DECIMAL(12,0),
    timetolive DECIMAL(12,0),
    destid DECIMAL(12,0),
    state DECIMAL(1,0),
    message TEXT
)
;

REVOKE ALL ON informixoltp.jmsmessage FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jmsmessagequeue (
    consumerid DECIMAL(12,0),
    messageid DECIMAL(12,0),
    state DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.jmsmessagequeue FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jmstableid (
    tablename VARCHAR(16),
    tableid DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.jmstableid FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.dual (
    value INT
)
;

REVOKE ALL ON informixoltp.dual FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.referral (
    referral_id DECIMAL(3,0),
    referral_desc VARCHAR(50),
    sort DECIMAL(4,0),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.referral FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.editor (
    editor_id DECIMAL(1,0),
    editor_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.editor FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.pay_period (
    pay_period_id DECIMAL(1,0),
    pay_period_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.pay_period FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.title (
    title_id DECIMAL(3,0),
    title VARCHAR(18),
    title_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.title FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.press_release (
    press_release_id DECIMAL(10,0),
    press_release_desc VARCHAR(100),
    hit_count DECIMAL(6,0)
)
;

REVOKE ALL ON informixoltp.press_release FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.division (
    division_id DECIMAL(3,0),
    division_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.division FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.server_connection (
    server_id DECIMAL(5,0),
    connection_id DECIMAL(10,0),
    coder_id DECIMAL(10,0) not null,
    handle VARCHAR(15),
    create_date TIMESTAMP,
    client_ip VARCHAR(15)
)
;

REVOKE ALL ON informixoltp.server_connection FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sector_access (
    sector_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    access TIMESTAMP not null,
    authorized CHAR(1) not null
)
;

REVOKE ALL ON informixoltp.sector_access FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sector_file (
    sector_id DECIMAL(10,0) not null,
    file VARCHAR(50) not null,
    system VARCHAR(25),
    status CHAR(1),
    language_cd VARCHAR(2),
    path VARCHAR(255),
    link VARCHAR(255),
    country_code VARCHAR(3),
    modify_by DECIMAL(10,0),
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.sector_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sector_agreement (
    sector_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    agree_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.sector_agreement FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.segment (
    segment_id DECIMAL(10,0),
    segment_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.segment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.experience (
    coder_id DECIMAL(10,0),
    experience_id DECIMAL(10,0),
    company VARCHAR(100) not null,
    title VARCHAR(100) not null,
    description VARCHAR,
    start_month DECIMAL(2,0) not null,
    start_year DECIMAL(4,0) not null,
    end_month DECIMAL(2,0),
    end_year DECIMAL(4,0),
    city VARCHAR(64) not null,
    state_code VARCHAR(2),
    country_code VARCHAR(3) not null,
    title_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.experience FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.corporate_contact_us (
    corporate_contact_us_id DECIMAL(8,0) not null,
    subject_id DECIMAL(3,0),
    company_name VARCHAR(30),
    company_size DECIMAL(7,0),
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    title VARCHAR(30),
    phone VARCHAR(30),
    email VARCHAR(70),
    response_sent CHAR(1) default 'N',
    timestamp TIMESTAMP default now(),
    responder_id DECIMAL(10,0),
    state_code VARCHAR(2),
    comment TEXT
)
;

REVOKE ALL ON informixoltp.corporate_contact_us FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    num_iterations DECIMAL(8,0),
    processing_time DECIMAL(14,0),
    deduction_amount DECIMAL(6,2),
    timestamp TIMESTAMP default now(),
    viewable CHAR(1) default 'N',
    received bytea,
    succeeded DECIMAL(1,0),
    message VARCHAR(100),
    failure_type_id DECIMAL(3,0),
    score DECIMAL(14,2)
)
;

REVOKE ALL ON informixoltp.system_test_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_type (
    coder_type_id DECIMAL(3,0),
    coder_type_desc VARCHAR(50),
    status VARCHAR(1)
)
;

REVOKE ALL ON informixoltp.coder_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_referral (
    coder_id DECIMAL(10,0),
    referral_id DECIMAL(3,0),
    reference_id DECIMAL(10,0),
    other VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.coder_referral FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_statement_history (
    problem_id DECIMAL(10,0),
    problem_statement TEXT,
    modify_date TIMESTAMP,
    user_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.problem_statement_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_status_lu (
    problem_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.problem_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.correspondence (
    correspondence_id DECIMAL(10,0),
    from_coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    group_id DECIMAL(10,0),
    message TEXT,
    sent_time TIMESTAMP default now(),
    reply_id DECIMAL(10,0),
    component_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.correspondence FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.correspondence_status (
    correspondence_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.correspondence_status FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mpsqas_chat_history (
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp TIMESTAMP default now(),
    message TEXT
)
;

REVOKE ALL ON informixoltp.mpsqas_chat_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_user_xref (
    component_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    user_type_id DECIMAL(2,0),
    paid DECIMAL(7,2),
    pending_payment DECIMAL(7,2)
)
;

REVOKE ALL ON informixoltp.component_user_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.solution (
    solution_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    solution_text TEXT,
    modify_date TIMESTAMP,
    solution_class bytea,
    language_id DECIMAL(3,0),
    package VARCHAR(255),
    has_check_answer boolean default 'f'
)
;

REVOKE ALL ON informixoltp.solution FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    system_test_version DECIMAL(10,0) default 1 not null
)
;

REVOKE ALL ON informixoltp.component_state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_solution (
    problem_id DECIMAL(10,0),
    solution_id DECIMAL(10,0),
    primary_solution CHAR(1)
)
;

REVOKE ALL ON informixoltp.problem_solution FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.development_application_status (
    dev_app_status_id DECIMAL(3,0),
    dev_app_status_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.development_application_status FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.development_application (
    dev_app_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    user_type_id DECIMAL(3,0),
    dev_app_status_id DECIMAL(3,0),
    message TEXT
)
;

REVOKE ALL ON informixoltp.development_application FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.challenge (
    challenge_id DECIMAL(10,0),
    defendant_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    succeeded DECIMAL(1,0),
    submit_time DECIMAL(15,0) not null,
    challenger_id DECIMAL(10,0) not null,
    args bytea,
    message VARCHAR(255),
    challenger_points DECIMAL(7,2),
    defendant_points DECIMAL(7,2),
    expected bytea,
    received bytea,
    status_id DECIMAL(3,0),
    check_answer_response varchar(255)
)
;

REVOKE ALL ON informixoltp.challenge FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.invite_list (
    coder_id DECIMAL(10,0),
    seed DECIMAL(4,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    contest_id DECIMAL(10,0),
    tournament_rating DECIMAL(5,0),
    round_id DECIMAL(10,0),
    region_code VARCHAR(3),
    invite_type CHAR(1)
)
;

REVOKE ALL ON informixoltp.invite_list FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.current_school (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    modify_date TIMESTAMP default now(),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    viewable DECIMAL(1,0) default 1
)
;

REVOKE ALL ON informixoltp.current_school FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.current_job (
    coder_id DECIMAL(10),
    record_no DECIMAL(10),
    title VARCHAR(100),
    company VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.current_job FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sub_template (
    template_id DECIMAL(10,0),
    sub_template_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.sub_template FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.student_rep (
    school_id DECIMAL(10,0),
    coder_id DECIMAL(10,0) not null,
    handle VARCHAR(15),
    division DECIMAL(2,0),
    school_name VARCHAR(50),
    event_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.student_rep FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.solution_history (
    solution_id DECIMAL(10,0),
    solution TEXT,
    modify_date TIMESTAMP,
    user_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.solution_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.room_type (
    room_type_id DECIMAL(3,0),
    room_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.room_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_registration (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp TIMESTAMP,
    eligible DECIMAL(3,0),
    team_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.round_registration FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.question_style (
    question_style_id DECIMAL(3,0),
    question_style_desc VARCHAR(25) not null,
    status_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.question_style FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.answer (
    answer_id DECIMAL(10,0),
    question_id DECIMAL(10,0) not null,
    answer_text VARCHAR(250) not null,
    sort_order DECIMAL(3,0),
    correct DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.answer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.survey_question (
    survey_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.survey_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_question (
    round_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.round_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.correspondence_read_xref (
    correspondence_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    timestamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.correspondence_read_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_user_request (
    request_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    user_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.problem_user_request FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contract_type_lu (
    contract_type_id DECIMAL(3,0),
    contract_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.contract_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.image_type_lu (
    image_type_id DECIMAL(3,0),
    image_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.image_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.image (
    image_id DECIMAL(10,0),
    file_name VARCHAR(50),
    image_type_id DECIMAL(3,0),
    path_id DECIMAL(10,0),
    link VARCHAR(255),
    height DECIMAL(5,0),
    width DECIMAL(5,0),
    modify_date TIMESTAMP default now(),
    original_file_name VARCHAR(254)
)
;

REVOKE ALL ON informixoltp.image FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_image_xref (
    coder_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.coder_image_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jiveforum (
    forumid DECIMAL(32,0) not null,
    name VARCHAR(255),
    description VARCHAR,
    modifieddate VARCHAR(15),
    creationdate VARCHAR(15),
    moderated DECIMAL(32,0) not null,
    userid DECIMAL(32,0)
)
;

REVOKE ALL ON informixoltp.jiveforum FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.login (
    login_id DECIMAL(10,0),
    user_id DECIMAL(10,0) not null,
    login_date TIMESTAMP not null,
    logout_date TIMESTAMP,
    login_message VARCHAR(255),
    logout_message VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.login FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project (
    project_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    project_desc VARCHAR(200) not null,
    start_date TIMESTAMP,
    deadline_date TIMESTAMP,
    status_id DECIMAL(3,0) not null,
    creation_date TIMESTAMP not null,
    modify_date TIMESTAMP not null,
    completion_date TIMESTAMP,
    tech_lead DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.project FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project_issue (
    project_issue_id DECIMAL(10,0),
    issue_text TEXT not null,
    open_date TIMESTAMP not null,
    close_date TIMESTAMP,
    project_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.project_issue FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project_task (
    project_task_id DECIMAL(10,0),
    project_id DECIMAL(10,0) not null,
    name VARCHAR(50) not null,
    project_task_desc VARCHAR(200) not null,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    status_id DECIMAL(3,0) not null,
    milestone DECIMAL(3,0) not null,
    creation_date TIMESTAMP not null,
    modify_date TIMESTAMP not null,
    completion_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.project_task FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project_user (
    project_user_id DECIMAL(10,0),
    project_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    role_id DECIMAL(10,0) not null,
    status_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.project_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project_user_task (
    project_user_task_id DECIMAL(10,0),
    project_user_id DECIMAL(10,0) not null,
    project_task_id DECIMAL(10,0) not null,
    assign_date TIMESTAMP not null,
    status_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.project_user_task FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.project_user_update (
    project_user_update_id DECIMAL(10,0),
    project_user_id DECIMAL(10,0) not null,
    project_task_id DECIMAL(10,0),
    update_notes TEXT not null,
    creation_date TIMESTAMP not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON informixoltp.project_user_update FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.status_type_lu (
    status_type_id DECIMAL(3,0),
    status_type_desc VARCHAR(50) not null
)
;

REVOKE ALL ON informixoltp.status_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.request_type_lu (
    request_type_id DECIMAL(3,0),
    request_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.request_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.path (
    path_id DECIMAL(10,0),
    path VARCHAR(255),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.path FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_type_lu (
    round_type_id DECIMAL(3,0),
    round_type_desc VARCHAR(100),
    algo_rating_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.round_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_content (
    content_id DECIMAL(10,0),
    content_group_id DECIMAL(10,0),
    content TEXT not null,
    content_name VARCHAR(50) not null,
    status_id DECIMAL(3,0),
    language_cd VARCHAR(2),
    country_code VARCHAR(3),
    modify_by DECIMAL(10,0),
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.web_content FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_file (
    file_id DECIMAL(10,0),
    file_desc VARCHAR(100),
    image_height DECIMAL(5,0),
    image_width DECIMAL(5,0),
    modify_by DECIMAL(10,0),
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.web_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_problem (
    problem_id DECIMAL(10,0),
    result_type_id DECIMAL(5,0) not null,
    method_name VARCHAR(32) not null,
    class_name VARCHAR(32) not null,
    status DECIMAL(3,0),
    default_solution TEXT,
    language_id DECIMAL(3,0),
    param_types bytea,
    problem_text TEXT,
    group_id DECIMAL(10,0),
    modify_date TIMESTAMP,
    proposed_division_id DECIMAL(3,0),
    proposed_difficulty_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.staging_problem FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.request (
    request_id DECIMAL(10,0),
    request_type_id DECIMAL(3,0),
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    open_window TIMESTAMP,
    open_period TIMESTAMP,
    connection_id DECIMAL(10,0),
    server_id DECIMAL(5,0),
    timestamp TIMESTAMP,
    close_window TIMESTAMP,
    last_request_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.request FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_rating (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(6,0),
    rating DECIMAL(5,0) default 0,
    last_rated_event TIMESTAMP,
    num_ratings DECIMAL(6,0),
    modify_date TIMESTAMP default now(),
    vol DECIMAL(5,0) default 0,
    rating_no_vol DECIMAL(5,0) default 0,
    backup_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_room (
    room_id DECIMAL(10,0),
    round_id DECIMAL(10,0) not null,
    name VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    region_code VARCHAR(3),
    division_id DECIMAL(3,0),
    room_type_id DECIMAL(3,0),
    eligible DECIMAL(1,0),
    unrated DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.staging_room FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_round_problem (
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    submit_order DECIMAL(3,0) default 0,
    division_id DECIMAL(3,0),
    difficulty_id DECIMAL(2,0),
    points DECIMAL(7,2),
    open_order DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.staging_round_problem FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_round_segment (
    round_id DECIMAL(10,0),
    segment_id DECIMAL(10,0),
    start_time TIMESTAMP not null,
    end_time TIMESTAMP not null,
    status CHAR(1) not null
)
;

REVOKE ALL ON informixoltp.staging_round_segment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_contest (
    contest_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    status CHAR(1) default 'I',
    language_id DECIMAL(3,0),
    group_id DECIMAL(10,0) default -1,
    region_code VARCHAR(3),
    ad_text VARCHAR(250),
    ad_start TIMESTAMP,
    ad_end TIMESTAMP,
    ad_task VARCHAR(30),
    ad_command VARCHAR(30),
    activate_menu DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.staging_contest FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_challenge (
    challenge_id DECIMAL(10,0),
    defendant_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    succeeded DECIMAL(1,0),
    submit_time DECIMAL(15,0) not null,
    challenger_id DECIMAL(10,0) not null,
    args bytea,
    message VARCHAR(255),
    challenger_points DECIMAL(7,2),
    defendant_points DECIMAL(7,2),
    expected bytea,
    received bytea,
    status_id DECIMAL(3,0),
    backup_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_challenge FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_invite_list (
    coder_id DECIMAL(10,0),
    seed DECIMAL(4,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    contest_id DECIMAL(10,0),
    tournament_rating DECIMAL(5,0),
    round_id DECIMAL(10,0),
    region_code VARCHAR(3)
)
;

REVOKE ALL ON informixoltp.staging_invite_list FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_round_registration (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    timestamp TIMESTAMP,
    eligible DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.staging_round_registration FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_survey (
    survey_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date TIMESTAMP not null,
    end_date TIMESTAMP not null,
    status_id DECIMAL(3,0) not null,
    text VARCHAR
)
;

REVOKE ALL ON informixoltp.staging_survey FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_question (
    question_id DECIMAL(10,0),
    question_text VARCHAR not null,
    status_id DECIMAL(3,0) not null,
    keyword VARCHAR(64),
    question_type_id DECIMAL(3,0) not null,
    question_style_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.staging_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_answer (
    answer_id DECIMAL(10,0),
    question_id DECIMAL(10,0) not null,
    answer_text VARCHAR(250) not null,
    sort_order DECIMAL(3,0),
    correct DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.staging_answer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_response (
    user_id DECIMAL(10,0),
    question_id DECIMAL(10,0),
    answer_id DECIMAL(10,0),
    response TEXT
)
;

REVOKE ALL ON informixoltp.staging_response FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_survey_question (
    survey_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_survey_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_round_question (
    round_id DECIMAL(10,0),
    question_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_round_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_round (
    round_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    name VARCHAR(64) not null,
    status CHAR(1),
    ran_ratings DECIMAL(1,0),
    paid_money DECIMAL(1,0),
    registration_limit DECIMAL(6,0),
    notes VARCHAR,
    invitational DECIMAL(3,0),
    round_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.staging_round FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2),
    room_seed DECIMAL(3,0),
    paid DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    room_placed DECIMAL(3,0),
    attended CHAR(1),
    advanced CHAR(1),
    overall_rank DECIMAL(6,0),
    division_seed DECIMAL(6,0),
    division_placed DECIMAL(6,0),
    round_payment_id DECIMAL(10,0),
    rated_flag DECIMAL(1,0),
    backup_id DECIMAL(10,0),
    new_vol DECIMAL(5,0),
    old_vol DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.staging_room_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.affidavit_type_lu (
    affidavit_type_desc VARCHAR(100),
    affidavit_type_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.affidavit_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contract_payment_xref (
    contract_id DECIMAL(10,0) not null,
    payment_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.contract_payment_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_tax_form_xref (
    tax_form_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    date_filed TIMESTAMP,
    withholding_amount DECIMAL(12,2),
    withholding_percentage DECIMAL(5,5),
    status_id DECIMAL(3,0),
    use_percentage DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.user_tax_form_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_note_xref (
    note_id DECIMAL(10,0) not null,
    payment_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.payment_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.affidavit_note_xref (
    note_id DECIMAL(10,0) not null,
    affidavit_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.affidavit_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contract_note_xref (
    contract_id DECIMAL(10,0) not null,
    note_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.contract_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid TIMESTAMP,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(255),
    payment_type_id DECIMAL(3,0),
    date_modified TIMESTAMP,
    date_due TIMESTAMP,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    cockpit_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1,
    digital_run_track_id DECIMAL(10,0),
    jira_issue_id VARCHAR(100),
    create_user DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    has_global_ad boolean,
    create_date TIMESTAMP default now() not null,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.payment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_address (
    payment_address_id DECIMAL(10,0),
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(30),
    state_code VARCHAR(2),
    zip VARCHAR(10),
    country_code VARCHAR(3),
    address3 VARCHAR(254),
    province VARCHAR(64)
)
;

REVOKE ALL ON informixoltp.payment_address FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_xref (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_release (
    payment_release_id serial NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    total_net_amount DECIMAL(12,2) NOT NULL,
    payment_method_id DECIMAL(3,0) NOT NULL,
    release_date TIMESTAMP NOT NULL
)
;

REVOKE ALL ON informixoltp.payment_release FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_release_xref (
    payment_release_id INT,
    payment_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_release_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.modification_rationale_lu (
    modification_rationale_id DECIMAL(3,0),
    modification_rationale_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.modification_rationale_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.affidavit (
    round_id DECIMAL(10,0),
    affidavit_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0),
    status_id DECIMAL(3,0),
    notarized INT,
    affirmed INT,
    payment_id DECIMAL(10,0),
    affidavit_desc VARCHAR(100),
    affidavit_type_id DECIMAL(3,0),
    text TEXT,
    date_created TIMESTAMP,
    date_affirmed TIMESTAMP
)
;

REVOKE ALL ON informixoltp.affidavit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_tax_form_note_xref (
    user_id DECIMAL(10,0),
    tax_form_id DECIMAL(10,0),
    note_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.user_tax_form_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.tax_form (
    name VARCHAR(30),
    tax_form_id DECIMAL(10,0) not null,
    text TEXT,
    status_id DECIMAL(3,0),
    tax_form_desc VARCHAR(100),
    default_withholding_amount DECIMAL(12,2),
    default_withholding_percentage DECIMAL(5,5),
    use_percentage DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.tax_form FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.contract (
    contract_id DECIMAL(10,0) not null,
    name VARCHAR(100),
    contracted_user_id DECIMAL(10,0),
    text TEXT,
    creation_date TIMESTAMP,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    contract_desc VARCHAR(100),
    status_id DECIMAL(3,0),
    contract_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.contract FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.affidavit_template (
    affidavit_template_id DECIMAL(10,0),
    country_code VARCHAR(3),
    affidavit_type_id DECIMAL(3,0),
    text TEXT
)
;

REVOKE ALL ON informixoltp.affidavit_template FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.query (
    query_id DECIMAL(10,0),
    text TEXT,
    name VARCHAR(100),
    ranking INT,
    column_index INT
)
;

REVOKE ALL ON informixoltp.query FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.command (
    command_id DECIMAL(10,0),
    command_desc VARCHAR(100),
    command_group_id DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.command FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.command_query_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.query_input_xref (
    query_id DECIMAL(10,0),
    optional CHAR(1),
    default_value VARCHAR(100),
    input_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.query_input_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.input_lu (
    input_id DECIMAL(10,0),
    input_code VARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.input_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_job_type_lu (
    sched_job_type_id DECIMAL(5,0) not null,
    job_type_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.sched_job_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_job_status_lu (
    sched_job_status_id DECIMAL(3,0) not null,
    sched_job_status_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.sched_job_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_job_detail_status_lu (
    sched_job_detail_status_id DECIMAL(3,0) not null,
    sched_job_detail_status_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.sched_job_detail_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_job (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_type_id DECIMAL(5,0) not null,
    sched_job_status_id DECIMAL(3,0) not null,
    start_after_date TIMESTAMP,
    end_before_date TIMESTAMP,
    email_job_group_id DECIMAL(5,0) not null
)
;

REVOKE ALL ON informixoltp.sched_job FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_job_group_lu (
    email_job_group_id DECIMAL(5,0) not null,
    email_job_group_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.email_job_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_template_group_lu (
    email_template_group_id DECIMAL(5,0) not null,
    email_template_group_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.email_template_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_template (
    email_template_id DECIMAL(10,0) not null,
    email_template_group_id DECIMAL(5,0) not null,
    email_template_name VARCHAR(100),
    data TEXT
)
;

REVOKE ALL ON informixoltp.email_template FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_list_group_lu (
    email_list_group_id DECIMAL(5,0) not null,
    email_list_group_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.email_list_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_list (
    email_list_id DECIMAL(10,0) not null,
    email_list_group_id DECIMAL(5,0) not null,
    email_list_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.email_list FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.email_list_detail (
    email_list_detail_id DECIMAL(10,0) not null,
    email_list_id DECIMAL(10,0) not null,
    data TEXT
)
;

REVOKE ALL ON informixoltp.email_list_detail FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_email_job (
    sched_email_job_id DECIMAL(10,0) not null,
    email_template_id DECIMAL(10,0) not null,
    command_id DECIMAL(10,0) not null,
    email_list_id DECIMAL(10,0) not null,
    from_address VARCHAR(200),
    from_personal VARCHAR(255),
    subject VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.sched_email_job FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.command_param (
    command_param_id DECIMAL(10,0) not null,
    sched_email_job_id DECIMAL(10,0) not null,
    input_id DECIMAL(10,0) not null,
    param VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.command_param FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.command_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_status_lu (
    user_status_id VARCHAR(3),
    user_status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.user_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.link_hit (
    link_id DECIMAL(10,0),
    link VARCHAR(255),
    refer VARCHAR(255),
    timestamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.link_hit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.status_lu (
    status_id DECIMAL(3,0),
    status_desc VARCHAR(200),
    status_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.broadcast_type_lu (
    broadcast_type_id DECIMAL(3,0),
    broadcast_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.broadcast_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.broadcast (
    broadcast_id DECIMAL(10,0),
    date_sent TIMESTAMP,
    message TEXT,
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    sent_by_user_id DECIMAL(10,0),
    broadcast_type_id DECIMAL(3,0),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.broadcast FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_payment (
    round_payment_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    paid DECIMAL(12,2),
    payment_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.round_payment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_control (
    sched_control_id DECIMAL(10,0) not null,
    sched_job_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.sched_control FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.job_type_lu (
    job_type_id DECIMAL(3,0),
    job_type_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.job_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.job (
    job_id DECIMAL(10,0) not null,
    job_desc VARCHAR(255),
    company_id DECIMAL(10,0),
    link VARCHAR(255),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.job FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.hit_type_lu (
    hit_type_id DECIMAL(3,0),
    hit_type_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.hit_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.job_hit (
    job_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    hit_type_id DECIMAL(3,0),
    timestamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.job_hit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.monitor_function_type_lu (
    monitor_function_type_id DECIMAL(3,0),
    monitor_function_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.monitor_function_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.monitor_function (
    monitor_function_id DECIMAL(10,0),
    name VARCHAR(100),
    monitor_function_desc VARCHAR(255),
    monitor_function_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.monitor_function FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.monitor_user_round_xref (
    user_id DECIMAL(10,0),
    round_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.monitor_user_round_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.group_monitor_function_xref (
    group_id DECIMAL(10,0),
    monitor_function_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.group_monitor_function_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.company_user_xref (
    company_id DECIMAL(10,0),
    company_user_code VARCHAR(50),
    user_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.company_user_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.company_image_xref (
    company_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    status DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.company_image_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_confirmation (
    coder_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    code VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.coder_confirmation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_type_lu (
    component_type_id DECIMAL(3,0),
    component_type_desc VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.component_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_type_lu (
    problem_type_id DECIMAL(3,0) not null,
    problem_type_desc VARCHAR(255) not null
)
;

REVOKE ALL ON informixoltp.problem_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.parameter (
    parameter_id DECIMAL(10,0) not null,
    component_id DECIMAL(10,0) not null,
    data_type_id DECIMAL(5,0) not null,
    name VARCHAR(50) not null,
    sort_order DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.parameter FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_solution_xref (
    component_id DECIMAL(10,0) not null,
    solution_id DECIMAL(10,0) not null,
    primary_solution DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.component_solution_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_status_lu (
    component_status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.component_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.data_type_mapping (
    language_id DECIMAL(3,0) not null,
    display_value VARCHAR(50),
    data_type_id DECIMAL(5,0) not null
)
;

REVOKE ALL ON informixoltp.data_type_mapping FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_service (
    web_service_id DECIMAL(10,0),
    web_service_name VARCHAR(100),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.web_service FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_service_file_type (
    web_service_file_type_id DECIMAL(10,0),
    description VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.web_service_file_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_service_source_file (
    web_service_source_file_id DECIMAL(10,0),
    web_service_file_type_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0),
    language_id DECIMAL(3,0),
    path VARCHAR(255),
    source TEXT
)
;

REVOKE ALL ON informixoltp.web_service_source_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_service_compilation (
    web_service_source_file_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    web_service_file_type_id DECIMAL(10,0),
    path VARCHAR(255),
    class_file bytea
)
;

REVOKE ALL ON informixoltp.web_service_compilation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_web_service_xref (
    component_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.component_web_service_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_payment (
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    paid DECIMAL(6,2),
    pending DECIMAL(6,2)
)
;

REVOKE ALL ON informixoltp.problem_payment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component (
    component_id DECIMAL(10,0) not null,
    problem_id DECIMAL(10,0) not null,
    result_type_id DECIMAL(5,0) not null,
    method_name VARCHAR(32) not null,
    class_name VARCHAR(32) not null,
    default_solution TEXT,
    component_type_id DECIMAL(3,0),
    component_text TEXT,
    status_id DECIMAL(3,0),
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.component FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.file_type_lu (
    file_type_id DECIMAL(3,0),
    file_type_desc VARCHAR(100),
    mime_type VARCHAR(40),
    sort DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.file_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.resume (
    resume_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    file_name VARCHAR(100),
    file_type_id DECIMAL(3,0),
    timestamp TIMESTAMP default now(),
    file bytea
)
;

REVOKE ALL ON informixoltp.resume FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.campaign (
    campaign_id DECIMAL(10,0),
    campaign_name VARCHAR(100),
    company_id DECIMAL(10,0),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    status_id DECIMAL(3,0),
    campaign_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.campaign FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.activity (
    activity_id DECIMAL(10,0),
    activity_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.activity FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.campaign_activity_xref (
    campaign_id DECIMAL(10,0),
    activity_id DECIMAL(10,0),
    timestamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.campaign_activity_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.campaign_job_xref (
    campaign_id DECIMAL(10,0),
    job_id DECIMAL(10,0),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.campaign_job_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem (
    problem_id DECIMAL(10,0),
    name VARCHAR(32) not null,
    status_id DECIMAL(3,0),
    problem_text TEXT,
    modify_date TIMESTAMP default now(),
    proposed_division_id DECIMAL(3,0),
    problem_type_id DECIMAL(3,0),
    proposed_difficulty_id DECIMAL(3,0),
    create_date TIMESTAMP,
    accept_submissions DECIMAL(1,0) default 1
)
;

REVOKE ALL ON informixoltp.problem FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.sched_job_detail (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_detail_id DECIMAL(10,0) not null,
    sched_job_detail_status_id DECIMAL(3,0) not null,
    data TEXT,
    reason VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.sched_job_detail FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_image_xref (
    round_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.round_image_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.wl_coder (
    round_id INT,
    coder_id INT,
    team_id INT,
    points_sum DECIMAL(6,2),
    qual_points DECIMAL(7,2),
    room_no INT,
    badge_id VARCHAR(128)
)
;

REVOKE ALL ON informixoltp.wl_coder FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.wl_round (
    round_id INT,
    prize_threshold DECIMAL(7,2)
)
;

REVOKE ALL ON informixoltp.wl_round FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.wl_team (
    team_id INT,
    team_name VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.wl_team FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.team_type_lu (
    team_type_id DECIMAL(3,0) not null,
    team_type_desc VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.team_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.team_coder_component_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null,
    component_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    active DECIMAL(3,0),
    time_stamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.team_coder_component_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.team_coder_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null,
    captain DECIMAL(10,0),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.team_coder_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_web_service_xref (
    problem_id DECIMAL(10,0) not null,
    web_service_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.problem_web_service_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.web_service_java_doc (
    web_service_java_doc_id DECIMAL(10,0),
    web_service_id DECIMAL(10,0),
    path VARCHAR(255),
    content TEXT
)
;

REVOKE ALL ON informixoltp.web_service_java_doc FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.compilation (
    component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    saved_time DECIMAL(14,0),
    compiled_time DECIMAL(14,0),
    compilation_text TEXT,
    compilation_class_file bytea,
    language_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.compilation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.submission (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submission_class_file bytea,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(7,2),
    language_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.submission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.donation_type_lu (
    donation_type_id DECIMAL(3,0),
    donation_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.donation_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.charity_donation (
    coder_id DECIMAL(10,0),
    amount DECIMAL(9,2),
    donation_type_id DECIMAL(3,0),
    create_date TIMESTAMP,
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.charity_donation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.question (
    question_id DECIMAL(10,0),
    question_text VARCHAR not null,
    status_id DECIMAL(3,0) not null,
    keyword VARCHAR(64),
    question_type_id DECIMAL(3,0) not null,
    question_style_id DECIMAL(3,0) not null,
    is_required DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_rating_question (
    question_id DECIMAL(10,0),
    question VARCHAR(255),
    question_desc VARCHAR(254),
    modify_date TIMESTAMP,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.problem_rating_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_rating (
    question_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    problem_rating INT,
    modify_date TIMESTAMP,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.problem_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.question_image_xref (
    question_id DECIMAL(10,0),
    image_id DECIMAL(10,0),
    display_flag DECIMAL(3,0),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.question_image_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.staging_component_state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_room_assignment (
    round_id DECIMAL(10,0),
    coders_per_room DECIMAL(10,0),
    algorithm DECIMAL(2,0),
    by_division DECIMAL(1,0),
    by_region DECIMAL(1,0),
    final DECIMAL(1,0),
    p DECIMAL(10,2)
)
;

REVOKE ALL ON informixoltp.round_room_assignment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_terms (
    round_id DECIMAL(10,0),
    terms_content TEXT
)
;

REVOKE ALL ON informixoltp.round_terms FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_terms_acceptance (
    round_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    timestamp TIMESTAMP
)
;

REVOKE ALL ON informixoltp.round_terms_acceptance FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.backup (
    backup_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    timestamp TIMESTAMP not null,
    comment VARCHAR(254)
)
;

REVOKE ALL ON informixoltp.backup FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.backup_tables (
    backup_id DECIMAL(10,0) not null,
    table_name VARCHAR(18) not null
)
;

REVOKE ALL ON informixoltp.backup_tables FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_category_lu (
    component_category_id DECIMAL(3,0) not null,
    component_category_desc VARCHAR(255) not null
)
;

REVOKE ALL ON informixoltp.component_category_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.component_category_xref (
    component_id DECIMAL(10,0) not null,
    component_category_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.component_category_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.campaign_round_xref (
    campaign_id DECIMAL(10,0) not null,
    round_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.campaign_round_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.campaign_type_lu (
    campaign_type_id DECIMAL(3,0) not null,
    campaign_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.campaign_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.skill (
    skill_id DECIMAL(5,0),
    skill_type_id DECIMAL(3,0),
    skill_desc VARCHAR(128) not null,
    status CHAR(1) not null,
    skill_order DECIMAL(3,0) not null,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.skill FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.coder_skill_type_note_xref (
    coder_id DECIMAL(10,0) not null,
    skill_type_id DECIMAL(3,0) not null,
    note_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.coder_skill_type_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_submission (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    submission_text TEXT,
    submission_class_file bytea,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(7,2),
    language_id DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.staging_submission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_compilation (
    component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    compilation_text TEXT,
    compilation_class_file bytea,
    language_id DECIMAL(3,0),
    backup_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.staging_compilation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    problem_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    num_iterations DECIMAL(8,0),
    processing_time DECIMAL(14,0),
    deduction_amount DECIMAL(6,2),
    timestamp TIMESTAMP default now(),
    viewable CHAR(1) default 'N',
    received bytea,
    succeeded DECIMAL(1,0),
    message VARCHAR(100),
    backup_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_system_test_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_system_test_case (
    test_case_id DECIMAL(10,0),
    problem_id DECIMAL(10,0) not null,
    args bytea,
    expected_result bytea,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.staging_system_test_case FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.system_test_case (
    test_case_id DECIMAL(10,0),
    component_id DECIMAL(10,0) not null,
    args bytea,
    expected_result bytea,
    modify_date TIMESTAMP default now(),
    status DECIMAL(3,0),
    example_flag DECIMAL(1,0),
    system_flag DECIMAL(1,0) default 0 not null,
    test_number DECIMAL(6,0) default 0
)
;

REVOKE ALL ON informixoltp.system_test_case FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.country_affidavit_template_xref (
    country_code VARCHAR(3),
    affidavit_template_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.country_affidavit_template_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.practice_room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2)
)
;

REVOKE ALL ON informixoltp.practice_room_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.practice_component_state (
    component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(7,2),
    status_id DECIMAL(3,0),
    language_id DECIMAL(3,0),
    submission_number DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.practice_component_state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.message_status_lu (
    message_status_id DECIMAL(3,0),
    message_status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.message_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.message (
    message_id DECIMAL(10,0),
    message TEXT,
    begin_date TIMESTAMP,
    end_date TIMESTAMP,
    status_id DECIMAL(3,0),
    create_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.message FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_message_status_lu (
    user_message_status_id DECIMAL(3,0),
    user_message_status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.user_message_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_message (
    message_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    status_id DECIMAL(3,0),
    create_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.user_message FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.failure_type_lu (
    failure_type_id DECIMAL(3,0),
    failure_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.failure_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jms_messages (
    messageid INT not null,
    destination VARCHAR(150) not null,
    txid INT,
    txop CHAR(1),
    messageblob bytea
)
;

REVOKE ALL ON informixoltp.jms_messages FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jms_transactions (
    txid INT
)
;

REVOKE ALL ON informixoltp.jms_transactions FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jms_users (
    userid VARCHAR(32) not null,
    passwd VARCHAR(32) not null,
    clientid VARCHAR(128)
)
;

REVOKE ALL ON informixoltp.jms_users FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jms_roles (
    roleid VARCHAR(32) not null,
    userid VARCHAR(32) not null
)
;

REVOKE ALL ON informixoltp.jms_roles FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.jms_subscriptions (
    clientid VARCHAR(128) not null,
    subname VARCHAR(128) not null,
    topic VARCHAR(255) not null,
    selector VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.jms_subscriptions FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.solution_class_file (
    solution_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file bytea
)
;

REVOKE ALL ON informixoltp.solution_class_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.survey (
    survey_id DECIMAL(10,0),
    name VARCHAR(50) not null,
    start_date TIMESTAMP not null,
    end_date TIMESTAMP not null,
    status_id DECIMAL(3,0) not null,
    text VARCHAR,
    results_viewable DECIMAL(1,0) default 1
)
;

REVOKE ALL ON informixoltp.survey FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_queue_status_lu (
    status_id DECIMAL(1,0),
    description VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.long_test_queue_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.intro_event_property_lu (
    property_id DECIMAL(5,0),
    property_desc VARCHAR(100),
    property_type_id DECIMAL(3,0),
    mandatory_ind DECIMAL(1,0) default 1,
    default_value VARCHAR(50),
    explanation VARCHAR(100),
    viewable_ind DECIMAL(1,0) default 1 not null
)
;

REVOKE ALL ON informixoltp.intro_event_property_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.intro_event_config (
    event_id DECIMAL(10,0),
    property_id DECIMAL(5,0),
    property_value VARCHAR
)
;

REVOKE ALL ON informixoltp.intro_event_config FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.intro_event (
    event_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    forum_id DECIMAL(10,0),
    timezone_id DECIMAL(5,0) default 143,
    image_id DECIMAL(10,0),
    eligibility_command_id DECIMAL(10,0),
    prize_desc VARCHAR(100),
    competition_round_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.intro_event FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.system_test_output (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    stdout TEXT,
    stderr TEXT
)
;

REVOKE ALL ON informixoltp.system_test_output FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_component_state (
    long_component_state_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    points DECIMAL(14,2),
    status_id DECIMAL(3,0),
    submission_number DECIMAL(3,0),
    example_submission_number DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.long_component_state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_compilation (
    long_component_state_id DECIMAL(10,0),
    open_time DECIMAL(14,0),
    compilation_text TEXT,
    language_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.long_compilation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_comp_result (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(14,2),
    attended CHAR(1),
    placed DECIMAL(6,0),
    system_point_total DECIMAL(14,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    rated_ind DECIMAL(1,0) default 0,
    advanced CHAR(1) default 'N'
)
;

REVOKE ALL ON informixoltp.long_comp_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_submission (
    long_component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    submission_text TEXT,
    open_time DECIMAL(14,0),
    submit_time DECIMAL(14,0),
    submission_points DECIMAL(14,2),
    language_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.long_submission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_system_test_result (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    processing_time DECIMAL(14,0),
    timestamp TIMESTAMP default now(),
    fatal_errors bytea,
    score FLOAT,
    test_action DECIMAL(2,0) default 10 not null,
    peak_memory_used DECIMAL(32,0) default -1
)
;

REVOKE ALL ON informixoltp.long_system_test_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_system_test_output (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    stdout TEXT,
    stderr TEXT
)
;

REVOKE ALL ON informixoltp.long_system_test_output FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_queue (
    long_component_state_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    status_id DECIMAL(1,0),
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now(),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    test_action DECIMAL(2,0) default 10 not null,
    language_id DECIMAL(3,0),
    round_type_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.long_test_queue FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.compilation_class_file (
    component_state_id DECIMAL(10,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file bytea
)
;

REVOKE ALL ON informixoltp.compilation_class_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.submission_class_file (
    component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file bytea
)
;

REVOKE ALL ON informixoltp.submission_class_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.archive_sched_job_detail (
    sched_job_id DECIMAL(10,0) not null,
    sched_job_detail_id DECIMAL(10,0) not null,
    sched_job_detail_status_id DECIMAL(3,0) not null,
    data TEXT,
    insert_date TIMESTAMP,
    reason VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.archive_sched_job_detail FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_submission_class_file (
    long_component_state_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    sort_order DECIMAL(3,0),
    path VARCHAR(255),
    class_file bytea
)
;

REVOKE ALL ON informixoltp.long_submission_class_file FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.ltg_type_lu (
    type_id DECIMAL(3,0) not null,
    type VARCHAR(100) not null
)
;

REVOKE ALL ON informixoltp.ltg_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.ltg_status_lu (
    status_id DECIMAL(3,0) not null,
    status VARCHAR(100) not null
)
;

REVOKE ALL ON informixoltp.ltg_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_group (
    ltg_id DECIMAL(12,0) not null,
    type_id DECIMAL(3,0) not null,
    status_id DECIMAL(3,0) not null,
    pending_tests DECIMAL(4,0) not null,
    last_ltc_id DECIMAL(12,0),
    component_id DECIMAL(10,0) not null,
    solution_id DECIMAL(10,0),
    status_date TIMESTAMP not null
)
;

REVOKE ALL ON informixoltp.long_test_group FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.ltc_status_lu (
    status_id DECIMAL(3,0) not null,
    status VARCHAR(100) not null
)
;

REVOKE ALL ON informixoltp.ltc_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_case (
    ltc_id DECIMAL(12,0) not null,
    status_id DECIMAL(3,0) not null,
    arg TEXT,
    test_case_id DECIMAL(10,0),
    ltg_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON informixoltp.long_test_case FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_result (
    success DECIMAL(1,0) not null,
    message TEXT,
    score FLOAT not null,
    create_date TIMESTAMP not null,
    stdout TEXT,
    stderr TEXT,
    ltc_id DECIMAL(12,0) not null,
    processing_time DECIMAL(14,0),
    peak_memory_used DECIMAL(32,0) default -1
)
;

REVOKE ALL ON informixoltp.long_test_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_queue_mpsqas (
    language_id DECIMAL(3,0) not null,
    round_type_id DECIMAL(3,0),
    create_date TIMESTAMP not null,
    ltc_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON informixoltp.long_test_queue_mpsqas FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mpsqas_user_ltg_xref (
    user_id DECIMAL(10,0) not null,
    ltg_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON informixoltp.mpsqas_user_ltg_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.current_school_audit (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    viewable DECIMAL(1,0) default 1,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.current_school_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.algo_rating_type_lu (
    algo_rating_type_id DECIMAL(3,0),
    algo_rating_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.algo_rating_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.algo_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.season (
    season_id DECIMAL(6,0),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    name VARCHAR(254),
    season_type_id DECIMAL(3,0),
    event_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.season FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.season_type_lu (
    season_type_id DECIMAL(3,0),
    season_type_desc VARCHAR(254)
)
;

REVOKE ALL ON informixoltp.season_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.season_algo_rating (
    coder_id DECIMAL(10,0),
    season_id DECIMAL(6,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.season_algo_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.region_type_lu (
    region_type_id DECIMAL(3,0),
    region_type_desc VARCHAR(80)
)
;

REVOKE ALL ON informixoltp.region_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.region (
    region_id DECIMAL(3,0),
    region_type_id DECIMAL(3,0),
    region_name VARCHAR(30)
)
;

REVOKE ALL ON informixoltp.region FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.country_region_xref (
    country_code VARCHAR(3),
    region_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.country_region_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.practice_group (
    group_id DECIMAL(3,0),
    group_name VARCHAR(80)
)
;

REVOKE ALL ON informixoltp.practice_group FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_group_xref (
    round_id DECIMAL(10,0),
    group_id DECIMAL(3,0)
)
;

REVOKE ALL ON informixoltp.round_group_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_method_lu (
    payment_method_desc VARCHAR(100),
    payment_method_id DECIMAL(3,0),
    payment_method_list_order DECIMAL(3,0),
    active boolean not null
)
;

REVOKE ALL ON informixoltp.payment_method_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.team (
    team_id DECIMAL(10,0) not null,
    team_name VARCHAR(100),
    team_type DECIMAL(3,0),
    school_id DECIMAL(10,0),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.team FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.member_contact_black_list (
    user_id DECIMAL(10,0) not null,
    blocked_user_id DECIMAL(10,0) not null,
    blocked_ind DECIMAL(1,0) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.member_contact_black_list FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.member_contact_message (
    member_contact_message_id DECIMAL(10,0) not null,
    sender_id DECIMAL(10,0) not null,
    recipient_id DECIMAL(10,0) not null,
    message_text TEXT not null,
    copy_ind DECIMAL(1,0) not null,
    sent_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON informixoltp.member_contact_message FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.staging_algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date TIMESTAMP default now(),
    backup_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.staging_algo_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round (
    round_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    name VARCHAR(64) not null,
    status CHAR(1),
    ran_ratings DECIMAL(1,0),
    paid_money DECIMAL(1,0),
    registration_limit DECIMAL(6,0),
    notes VARCHAR,
    invitational DECIMAL(3,0),
    round_type_id DECIMAL(3,0),
    link VARCHAR(255),
    short_name VARCHAR(30),
    forum_id DECIMAL(10,0),
    rated_ind DECIMAL(1,0) default 0,
    region_id DECIMAL(3,0),
    tc_direct_project_id DECIMAL(10,0),
    auto_end DECIMAL(1,0) default 0,
    editorial_link VARCHAR(255), 
    creator_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.round FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.round_prize (
    round_id DECIMAL(10,0),
        place INTEGER not null,
        amount FLOAT not null
)
;

REVOKE ALL ON informixoltp.round_prize FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.aol_alert_info (
    user_id DECIMAL(10,0) not null,
    aol_encrypted_user_id VARCHAR(254) not null
)
;

REVOKE ALL ON informixoltp.aol_alert_info FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.command_execution (
    command_id DECIMAL(10,0),
    timestamp TIMESTAMP default now(),
    execution_time INT,
    inputs VARCHAR(2000)
)
;

REVOKE ALL ON informixoltp.command_execution FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_reference_lu (
    payment_reference_id DECIMAL(3,0),
    reference_field_name VARCHAR(30) not null
)
;

REVOKE ALL ON informixoltp.payment_reference_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_test_score_id (
    round_id DECIMAL(10,0) not null,
    generation_id DECIMAL(14,0) not null
)
;

REVOKE ALL ON informixoltp.long_test_score_id FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.ryan_temp2 (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(10,0),
    rating DECIMAL(10,0),
    vol DECIMAL(10,0),
    num_ratings DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.ryan_temp2 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.travis_school (
    school_id DECIMAL(10,0),
    sort_letter CHAR(1),
    city VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    user_id DECIMAL(10,0) not null,
    name VARCHAR(100) not null,
    modify_date TIMESTAMP default now(),
    short_name VARCHAR(20),
    school_type_id DECIMAL(3,0),
    address_id DECIMAL(10,0),
    viewable DECIMAL(1,0) default 1
)
;

REVOKE ALL ON informixoltp.travis_school FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mike_school (
    school_id DECIMAL(10,0),
    sort_letter CHAR(1),
    city VARCHAR(50),
    state_code VARCHAR(2),
    country_code VARCHAR(3),
    user_id DECIMAL(10,0) not null,
    name varchar(200) not null,
    modify_date TIMESTAMP default now(),
    short_name VARCHAR(20),
    school_type_id DECIMAL(3,0),
    address_id DECIMAL(10,0),
    viewable DECIMAL(1,0) default 1
)
;

REVOKE ALL ON informixoltp.mike_school FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.response (
    response_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    question_id DECIMAL(10,0),
    answer_id DECIMAL(10,0),
    response_text TEXT,
    create_date TIMESTAMP default now(),
    response VARCHAR(10000)
)
;

REVOKE ALL ON informixoltp.response FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.visa_letter_event (
    visa_letter_event_id DECIMAL(10,0),
    event_name VARCHAR(50) not null,
    contest_id DECIMAL(10,0),
    request_start_date TIMESTAMP,
    request_end_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.visa_letter_event FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.visa_letter_request (
    visa_letter_request_id DECIMAL(10,0),
    user_id DECIMAL(10,0) not null,
    visa_letter_event_id DECIMAL(10,0),
    full_name VARCHAR(50) not null,
    address_id DECIMAL(10,0) not null,
    shipping_address_id DECIMAL(10,0) not null,
    phone_number VARCHAR(20) not null,
    request_date TIMESTAMP not null,
    sent_date TIMESTAMP,
    denied_ind DECIMAL(1,0) not null
)
;

REVOKE ALL ON informixoltp.visa_letter_request FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.royalty_temp (
    amount DECIMAL(7,2),
    description VARCHAR(254),
    royalty_date DATE,
    handle VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.royalty_temp FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.assignment_document_type_lu (
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_type_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.assignment_document_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.assignment_document_status_lu (
    assignment_document_status_id DECIMAL(3,0),
    assignment_document_status_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.assignment_document_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.assignment_document (
    assignment_document_id DECIMAL(10,0) not null,
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_status_id DECIMAL(3,0),
    assignment_document_submission_title VARCHAR(100),
    assignment_document_text TEXT,
    assignment_document_hard_copy_ind DECIMAL(1,0),
    user_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    affirmed_date TIMESTAMP,
    expire_date TIMESTAMP,
    modify_date TIMESTAMP,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.assignment_document FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.assignment_document_template (
    assignment_document_template_id DECIMAL(10,0),
    assignment_document_type_id DECIMAL(3,0),
    assignment_document_template_text TEXT,
    cur_version DECIMAL(1,0),
    assignment_document_template_name VARCHAR(50)
)
;

REVOKE ALL ON informixoltp.assignment_document_template FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_xref_pablo (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_xref_pablo FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_pablo (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    print_count DECIMAL(3,0),
    review DECIMAL(3,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0)
)
;

REVOKE ALL ON informixoltp.payment_pablo FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_pablo_dec (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid TIMESTAMP,
    date_printed TIMESTAMP,
    gross_amount DECIMAL(12,2),
    status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified TIMESTAMP,
    date_due TIMESTAMP,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    charity_ind DECIMAL(1,0) default 0 not null
)
;

REVOKE ALL ON informixoltp.payment_detail_pablo_dec FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_pablo_dec (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    print_count DECIMAL(3,0),
    review DECIMAL(3,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    create_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON informixoltp.payment_pablo_dec FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_xref_pablo_dec (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_xref_pablo_dec FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.miketemp (
    user_id DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.miketemp FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.intro_event_property_type_lu (
    property_type_id DECIMAL(3,0),
    type_desc VARCHAR(50) not null
)
;

REVOKE ALL ON informixoltp.intro_event_property_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.connection_history (
    coder_id DECIMAL(10,0),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    client_ip VARCHAR(15),
    server_id DECIMAL(5,0),
    connection_id INT
)
;

REVOKE ALL ON informixoltp.connection_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_status_lu (
    payment_status_id DECIMAL(3,0),
    payment_status_desc VARCHAR(100),
    payment_status_active_ind DECIMAL(1,0) default 1 not null
)
;

REVOKE ALL ON informixoltp.payment_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_status_reason_lu (
    payment_status_reason_id DECIMAL(10,0),
    payment_status_reason_desc VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.payment_status_reason_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_status_reason_xref (
    payment_detail_id DECIMAL(10,0),
    payment_status_reason_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_status_reason_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_accrual (
    user_id DECIMAL(12,0) NOT NULL,
    accrual_amount DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.user_accrual FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_payment_method (
    user_id DECIMAL(10,0) NOT NULL,
    payment_method_id DECIMAL(3,0) not null,
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.user_payment_method FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.user_paypal_account (
    user_id DECIMAL(10,0) NOT NULL,
    email_address VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.user_paypal_account FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_language (
    round_id DECIMAL(10,0) not null,
    language_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON informixoltp.round_language FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.nomination (
    nomination_id INT,
    nominator_id DECIMAL(10,0) not null,
    event_id DECIMAL(10,0) not null,
    email_address VARCHAR(100),
    school_name VARCHAR(100),
    name VARCHAR(100),
    field_of_instruction VARCHAR(100),
    school_url VARCHAR(100),
    text VARCHAR(10000),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.nomination FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.generic_counter_client (
    client_id DECIMAL(4) not null,
    name CHAR(30) not null
)
;

REVOKE ALL ON informixoltp.generic_counter_client FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.generic_counter (
    client_id DECIMAL(4) not null,
    counter_id CHAR(30) not null,
    value DECIMAL(12,0) not null,
    last_update_id CHAR(30),
    last_update TIMESTAMP not null
)
;

REVOKE ALL ON informixoltp.generic_counter FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_pablo (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid TIMESTAMP,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified TIMESTAMP,
    date_due TIMESTAMP,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1
)
;

REVOKE ALL ON informixoltp.payment_detail_pablo FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.timers (
    timerid VARCHAR(80) not null,
    targetid VARCHAR(80) not null,
    initialdate TIMESTAMP not null,
    timerinterval DECIMAL(18,0),
    instancepk bytea,
    info bytea
)
;

REVOKE ALL ON informixoltp.timers FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.room_result (
    round_id DECIMAL(10,0),
    room_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(7,2),
    room_seed DECIMAL(3,0),
    paid DECIMAL(10,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    room_placed DECIMAL(3,0),
    attended CHAR(1),
    advanced CHAR(1),
    overall_rank DECIMAL(6,0),
    division_seed DECIMAL(6,0),
    division_placed DECIMAL(6,0),
    round_payment_id DECIMAL(10,0),
    rated_flag DECIMAL(1,0),
    region_placed DECIMAL(5,0),
    team_points DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    old_vol DECIMAL(5,0)
)
;

REVOKE ALL ON informixoltp.room_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.classroom_status_lu (
    status_id DECIMAL(3,0) not null,
    description VARCHAR(30) not null
)
;

REVOKE ALL ON informixoltp.classroom_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.classroom (
    classroom_id DECIMAL(10,0) not null,
    professor_id DECIMAL(10,0) not null,
    school_id DECIMAL(10,0) not null,
    name VARCHAR(50) not null,
    status_id DECIMAL(3,0) not null,
    academic_period VARCHAR(50),
    description VARCHAR(200),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.classroom FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.student_classroom_status_lu (
    status_id DECIMAL(3,0) not null,
    description VARCHAR(30) not null
)
;

REVOKE ALL ON informixoltp.student_classroom_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.student_classroom_xref (
    student_id DECIMAL(10,0) not null,
    classroom_id DECIMAL(10,0) not null,
    status_id DECIMAL(3,0) not null,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.student_classroom_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.student_professor_xref (
    student_id DECIMAL(10,0) not null,
    professor_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.student_professor_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_property_type_lu (
    round_property_type_id DECIMAL(3,0) not null,
    round_property VARCHAR(50) not null
)
;

REVOKE ALL ON informixoltp.round_property_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.round_property (
    round_id DECIMAL(10,0) not null,
    round_property_type_id DECIMAL(3,0) not null,
    int_value DECIMAL(10,0),
    string_value VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.round_property FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.college_problem_set (
    problem_set_id DECIMAL(4,0) not null,
    name VARCHAR(30) not null,
    description VARCHAR(100)
)
;

REVOKE ALL ON informixoltp.college_problem_set FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.problem_set_component_xref (
    problem_set_id DECIMAL(4,0) not null,
    component_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON informixoltp.problem_set_component_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_dr20075 (
    payment_detail_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    date_paid TIMESTAMP,
    gross_amount DECIMAL(12,2),
    payment_status_id DECIMAL(3,0),
    payment_address_id DECIMAL(10,0),
    modification_rationale_id DECIMAL(3,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    date_modified TIMESTAMP,
    date_due TIMESTAMP,
    payment_method_id DECIMAL(3,0),
    client VARCHAR(100),
    algorithm_round_id DECIMAL(10,0),
    algorithm_problem_id DECIMAL(10,0),
    component_contest_id DECIMAL(10,0),
    component_project_id DECIMAL(10,0),
    studio_contest_id DECIMAL(10,0),
    digital_run_stage_id DECIMAL(10,0),
    digital_run_season_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    charity_ind DECIMAL(1,0) default 0 not null,
    total_amount DECIMAL(12,2),
    installment_number DECIMAL(3,0) default 1
)
;

REVOKE ALL ON informixoltp.payment_detail_dr20075 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_xref_dr20075 (
    payment_id DECIMAL(10,0),
    payment_detail_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_xref_dr20075 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_dr20075 (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    most_recent_detail_id DECIMAL(10,0),
    referral_payment_id DECIMAL(10,0),
    pay_referrer DECIMAL(1,0),
    create_date TIMESTAMP default now() not null,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.payment_dr20075 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_detail_status_reason_xref_dr20075 (
    payment_detail_id DECIMAL(10,0),
    payment_status_reason_id DECIMAL(10,0)
)
;

REVOKE ALL ON informixoltp.payment_detail_status_reason_xref_dr20075 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.fax_solution (
    solution_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    solution_text TEXT,
    modify_date TIMESTAMP,
    solution_class bytea,
    language_id DECIMAL(3,0),
    package VARCHAR(255)
)
;

REVOKE ALL ON informixoltp.fax_solution FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mike_temp1 (
    user_id DECIMAL(12,0),
    algo_rank DECIMAL(12,0),
    algo_rating DECIMAL(12,0),
    algo_vol DECIMAL(12,0),
    algo_lang VARCHAR(25),
    algo_comps DECIMAL(10,0),
    des_rating DECIMAL(12,0),
    des_vol DECIMAL(12,0),
    des_rank DECIMAL(12,0),
    dev_rating DECIMAL(12,0),
    dev_vol DECIMAL(12,0),
    dev_rank DECIMAL(12,0),
    earnings DECIMAL(12,2),
    des_subs DECIMAL(12,0),
    des_passed DECIMAL(12,0),
    des_wins DECIMAL(12,0),
    dev_subs DECIMAL(12,0),
    dev_passed DECIMAL(12,0),
    dev_wins DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.mike_temp1 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.temp_dr_pay_fix (
    user_id DECIMAL(10,0),
    new_payment DECIMAL(10,2),
    old_payment DECIMAL(10,2)
)
;

REVOKE ALL ON informixoltp.temp_dr_pay_fix FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.dok_algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.dok_algo_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.algo_rating_tgh (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0),
    highest_rating DECIMAL(5,0),
    lowest_rating DECIMAL(5,0),
    first_rated_round_id DECIMAL(10,0),
    last_rated_round_id DECIMAL(10,0),
    num_competitions DECIMAL(7,0)
)
;

REVOKE ALL ON informixoltp.algo_rating_tgh FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.algo_rating_tgh_hourly (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON informixoltp.algo_rating_tgh_hourly FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.mike_temp (
    user_id DECIMAL(12,0)
)
;

REVOKE ALL ON informixoltp.mike_temp FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.payment_type_lu (
    payment_type_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    payment_reference_id DECIMAL(3,0),
    show_in_profile_ind DECIMAL(1,0) default 1 not null,
    show_details_ind DECIMAL(1,0) default 1 not null,
    due_date_interval DECIMAL(3,0) not null,
    create_date TIMESTAMP default now() not null,
    modify_date TIMESTAMP default now() not null,
    requires_client_ind DECIMAL(1,0) default 0 not null,
    global_ad_ind boolean default 'f'
)
;

REVOKE ALL ON informixoltp.payment_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.algo_rating_pre_tco08 (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0),
    modify_date TIMESTAMP
)
;

REVOKE ALL ON informixoltp.algo_rating_pre_tco08 FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.long_system_test_data (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    component_id DECIMAL(10,0),
    test_case_id DECIMAL(10,0),
    submission_number DECIMAL(5,0),
    example DECIMAL(1,0),
    data bytea,
    test_action DECIMAL(2,0) default 10
)
;

REVOKE ALL ON informixoltp.long_system_test_data FROM PUBLIC;
CREATE TABLE IF NOT EXISTS informixoltp.nate_long_comp_result (
    round_id DECIMAL(10,0),
    coder_id DECIMAL(10,0),
    point_total DECIMAL(14,2),
    attended CHAR(1),
    placed DECIMAL(6,0),
    system_point_total DECIMAL(14,2),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    old_vol DECIMAL(5,0),
    new_vol DECIMAL(5,0),
    rated_ind DECIMAL(1,0) default 0,
    advanced CHAR(1) default 'N'
)
;

REVOKE ALL ON informixoltp.nate_long_comp_result FROM PUBLIC;


CREATE TABLE IF NOT EXISTS invoice_type_lu (
    invoice_type_id INTEGER NOT NULL,
    name VARCHAR(64) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    modify_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP NOT NULL
)
;
REVOKE ALL ON informixoltp.invoice_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS invoice_record (
    invoice_record_id DECIMAL(10,0) NOT NULL,
    billing_account INTEGER NOT NULL,
    contest_id INTEGER,
    cockpit_project_id INTEGER,
    invoice_type_id INTEGER NOT NULL,
    payment_id DECIMAL(10,0),
    processed BOOLEAN not null,
    invoice_amount DECIMAL(10,2),
    invoice_id DECIMAL(10,0) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    modify_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP NOT NULL,
    reference_id DECIMAL(10,0),
    jira_issue_id varchar(100)
)
;
REVOKE ALL ON informixoltp.invoice_record FROM PUBLIC;

CREATE TABLE IF NOT EXISTS invoice (
    invoice_id DECIMAL(10,0) NOT NULL,
    invoice_number VARCHAR(255) NOT NULL,
    invoice_date TIMESTAMP NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_user VARCHAR(64) NOT NULL,
    update_date TIMESTAMP NOT NULL
)
;
REVOKE ALL ON informixoltp.invoice FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.round_event (
    round_id DECIMAL(10,0),
    event_id DECIMAL(10,0),
    event_name VARCHAR(50),
    registration_url VARCHAR(255)
)
;
REVOKE ALL ON informixoltp.round_event FROM PUBLIC;

CREATE OR REPLACE VIEW informixoltp.rating (coder_id,round_id,rating,num_ratings,
       modify_date,vol,rating_no_vol) as
   select x0.coder_id ,x0.round_id ,x0.rating ,x0.num_ratings ,
       x0.modify_date ,x0.vol ,x0.vol
   from informixoltp.algo_rating x0
   where (x0.algo_rating_type_id = 1. ) ;
REVOKE ALL ON informixoltp.rating FROM PUBLIC;

CREATE OR REPLACE VIEW informixoltp.rated_members (user_id) as
   select x0.coder_id
   from informixoltp.algo_rating x0
   where (x0.num_ratings > 0. )  union select x1.user_id
      from tcs_catalog.user_rating x1
      where (x1.num_ratings > 0.0000000000000000 ) ;
REVOKE ALL ON informixoltp.rated_members FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.round_behavior (
    round_id INT not null,
    behavior_id INT default 1 not null
)
;
REVOKE ALL ON informixoltp.round_behavior FROM PUBLIC;
GRANT delete, select, insert, update ON informixoltp.round_behavior TO public;

CREATE TABLE IF NOT EXISTS informixoltp.problem_round_type_lu (
    problem_round_type_id DECIMAL(3,0) NOT NULL,
    problem_round_type_desc VARCHAR(100) NOT NULL,
    problem_type DECIMAL(3,0) NOT NULL
)
;
REVOKE ALL ON informixoltp.problem_round_type_lu FROM PUBLIC;

GRANT insert, update, select, delete ON informixoltp.problem_round_type_lu TO public;

CREATE TABLE IF NOT EXISTS informixoltp.long_component_configuration (
    component_id DECIMAL(10,0) NOT NULL,
    submission_rate DECIMAL(10,0),
    example_submission_rate DECIMAL(10,0)
)
;
REVOKE ALL ON informixoltp.long_component_configuration FROM PUBLIC;
GRANT insert, update, select, delete ON informixoltp.long_component_configuration TO public;

CREATE TABLE IF NOT EXISTS informixoltp.custom_build_setting_type_lu (
    custom_build_setting_type_id DECIMAL(3,0)  NOT NULL,
    custom_build_setting_type_desc VARCHAR(100) NOT NULL
)
;

REVOKE ALL ON informixoltp.custom_build_setting_type_lu FROM PUBLIC;

GRANT insert, update, select, delete ON informixoltp.custom_build_setting_type_lu TO public;

CREATE TABLE IF NOT EXISTS informixoltp.custom_build_setting (
    custom_build_setting_id DECIMAL(3,0)  NOT NULL,
    custom_build_setting_desc VARCHAR(50) NOT NULL,
    custom_build_setting_value VARCHAR(255) NOT NULL,
    custom_build_setting_type_id DECIMAL(3,0)  NOT NULL
)
;
REVOKE ALL ON informixoltp.custom_build_setting FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.user_api_spin (
    user_id DECIMAL(10,0),
    api_ranking DECIMAL(2,0) not null,
    api_name VARCHAR(128) not null
)
;
REVOKE ALL ON informixoltp.user_api_spin FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.docusign_envelope (
    docusign_envelope_id VARCHAR(64) not null,
    docusign_template_id VARCHAR(64) not null,
    user_id DECIMAL(10,0) not null,
    is_completed DECIMAL(1,0) not null
)
;
REVOKE ALL ON informixoltp.docusign_envelope FROM PUBLIC;

CREATE TABLE IF NOT EXISTS informixoltp.user_action_audit(
    user_action_audit_id DECIMAL(10,0) NOT NULL,
    handle VARCHAR(50) NOT NULL,
    action_name VARCHAR(100) NOT NULL,
    client VARCHAR(50) NOT NULL,
    create_date TIMESTAMP default now()
)
;
REVOKE ALL ON informixoltp.user_action_audit FROM PUBLIC;
GRANT select,update,insert,delete ON informixoltp.user_action_audit TO public;

GRANT insert, update, select, delete ON informixoltp.custom_build_setting TO public;

;

;

;

;

;

GRANT insert ON informixoltp.rating TO coder;

GRANT select ON informixoltp.rating TO coder;

GRANT update ON informixoltp.rating TO coder;

GRANT select ON informixoltp.rating TO openaim;

GRANT select ON informixoltp.rating TO truveo;

GRANT select ON informixoltp.rating TO winformula;

GRANT select ON informixoltp.rating TO openxtraz;

GRANT delete ON informixoltp.archive_sched_job_detail TO public;

GRANT insert ON informixoltp.archive_sched_job_detail TO public;

GRANT update ON informixoltp.archive_sched_job_detail TO public;

GRANT select ON informixoltp.archive_sched_job_detail TO public;

GRANT update ON informixoltp.long_submission_class_file TO public;

GRANT insert ON informixoltp.long_submission_class_file TO public;

GRANT select ON informixoltp.long_submission_class_file TO public;

GRANT delete ON informixoltp.long_submission_class_file TO public;

GRANT delete ON informixoltp.ltg_type_lu TO public;

GRANT update ON informixoltp.ltg_type_lu TO public;

GRANT insert ON informixoltp.ltg_type_lu TO public;

GRANT select ON informixoltp.ltg_type_lu TO public;



GRANT select ON informixoltp.ltg_status_lu TO public;

GRANT insert ON informixoltp.ltg_status_lu TO public;



GRANT delete ON informixoltp.ltg_status_lu TO public;

GRANT update ON informixoltp.ltg_status_lu TO public;

GRANT select ON informixoltp.long_test_group TO public;



GRANT insert ON informixoltp.long_test_group TO public;

GRANT update ON informixoltp.long_test_group TO public;

GRANT delete ON informixoltp.long_test_group TO public;

GRANT insert ON informixoltp.ltc_status_lu TO public;

GRANT delete ON informixoltp.ltc_status_lu TO public;

GRANT select ON informixoltp.ltc_status_lu TO public;

GRANT update ON informixoltp.ltc_status_lu TO public;



GRANT delete ON informixoltp.long_test_case TO public;

GRANT insert ON informixoltp.long_test_case TO public;

GRANT update ON informixoltp.long_test_case TO public;

GRANT select ON informixoltp.long_test_case TO public;



GRANT insert ON informixoltp.long_test_result TO public;

GRANT delete ON informixoltp.long_test_result TO public;

GRANT select ON informixoltp.long_test_result TO public;

GRANT update ON informixoltp.long_test_result TO public;



GRANT select ON informixoltp.long_test_queue_mpsqas TO public;



GRANT insert ON informixoltp.long_test_queue_mpsqas TO public;

GRANT delete ON informixoltp.long_test_queue_mpsqas TO public;

GRANT update ON informixoltp.long_test_queue_mpsqas TO public;



GRANT insert ON informixoltp.mpsqas_user_ltg_xref TO public;

GRANT update ON informixoltp.mpsqas_user_ltg_xref TO public;

GRANT select ON informixoltp.mpsqas_user_ltg_xref TO public;

GRANT delete ON informixoltp.mpsqas_user_ltg_xref TO public;

GRANT insert ON informixoltp.current_school_audit TO public;

GRANT delete ON informixoltp.current_school_audit TO public;



GRANT update ON informixoltp.current_school_audit TO public;

GRANT select ON informixoltp.current_school_audit TO public;

GRANT select ON informixoltp.payment_dr20075 TO public;



GRANT update ON informixoltp.payment_dr20075 TO public;

GRANT insert ON informixoltp.payment_dr20075 TO public;

GRANT delete ON informixoltp.payment_dr20075 TO public;

GRANT delete ON informixoltp.round TO public;

GRANT insert ON informixoltp.round TO public;

GRANT select ON informixoltp.round TO public;

GRANT update ON informixoltp.round TO public;

GRANT delete ON informixoltp.algo_rating_type_lu TO public;

GRANT update ON informixoltp.algo_rating_type_lu TO public;



GRANT insert ON informixoltp.algo_rating_type_lu TO public;

GRANT select ON informixoltp.algo_rating_type_lu TO public;

GRANT select ON informixoltp.algo_rating TO public;

GRANT update ON informixoltp.algo_rating TO public;

GRANT insert ON informixoltp.algo_rating TO public;



GRANT delete ON informixoltp.algo_rating TO public;

GRANT insert ON informixoltp.season TO public;



GRANT delete ON informixoltp.season TO public;

GRANT update ON informixoltp.season TO public;

GRANT select ON informixoltp.season TO public;

GRANT select ON informixoltp.season_type_lu TO public;

GRANT update ON informixoltp.season_type_lu TO public;

GRANT insert ON informixoltp.season_type_lu TO public;

GRANT delete ON informixoltp.season_type_lu TO public;



GRANT insert ON informixoltp.season_algo_rating TO public;



GRANT select ON informixoltp.season_algo_rating TO public;

GRANT delete ON informixoltp.season_algo_rating TO public;

GRANT update ON informixoltp.season_algo_rating TO public;

GRANT insert ON informixoltp.aol_alert_info TO public;

GRANT select ON informixoltp.aol_alert_info TO public;

GRANT delete ON informixoltp.aol_alert_info TO public;

GRANT update ON informixoltp.aol_alert_info TO public;



GRANT update ON informixoltp.connection_history TO public;

GRANT insert ON informixoltp.connection_history TO public;

GRANT select ON informixoltp.connection_history TO public;

GRANT delete ON informixoltp.connection_history TO public;

GRANT select ON informixoltp.region_type_lu TO public;

GRANT update ON informixoltp.region_type_lu TO public;

GRANT insert ON informixoltp.region_type_lu TO public;



GRANT delete ON informixoltp.region_type_lu TO public;

GRANT insert ON informixoltp.region TO public;

GRANT select ON informixoltp.region TO public;

GRANT update ON informixoltp.region TO public;



GRANT delete ON informixoltp.region TO public;



GRANT select ON informixoltp.payment_detail_status_reason_xref_dr20075 TO public;

GRANT insert ON informixoltp.payment_detail_status_reason_xref_dr20075 TO public;

GRANT delete ON informixoltp.payment_detail_status_reason_xref_dr20075 TO public;

GRANT update ON informixoltp.payment_detail_status_reason_xref_dr20075 TO public;

GRANT select ON informixoltp.practice_group TO public;

GRANT delete ON informixoltp.practice_group TO public;

GRANT update ON informixoltp.practice_group TO public;

GRANT insert ON informixoltp.practice_group TO public;



GRANT delete ON informixoltp.round_group_xref TO public;

GRANT select ON informixoltp.round_group_xref TO public;

GRANT insert ON informixoltp.round_group_xref TO public;

GRANT update ON informixoltp.round_group_xref TO public;





GRANT insert ON informixoltp.payment_method_lu TO public;

GRANT delete ON informixoltp.payment_method_lu TO public;

GRANT select ON informixoltp.payment_method_lu TO public;

GRANT update ON informixoltp.payment_method_lu TO public;

GRANT select ON informixoltp.team TO public;

GRANT update ON informixoltp.team TO public;

GRANT delete ON informixoltp.team TO public;

GRANT insert ON informixoltp.team TO public;

GRANT update ON informixoltp.classroom_status_lu TO public;

GRANT select ON informixoltp.classroom_status_lu TO public;



GRANT delete ON informixoltp.classroom_status_lu TO public;

GRANT insert ON informixoltp.classroom_status_lu TO public;

GRANT update ON informixoltp.member_contact_message TO public;

GRANT insert ON informixoltp.member_contact_message TO public;

GRANT delete ON informixoltp.member_contact_message TO public;

GRANT select ON informixoltp.member_contact_message TO public;



GRANT update ON informixoltp.staging_algo_rating TO public;



GRANT delete ON informixoltp.staging_algo_rating TO public;

GRANT select ON informixoltp.staging_algo_rating TO public;

GRANT insert ON informixoltp.staging_algo_rating TO public;

GRANT update ON informixoltp.ryan_temp2 TO public;

GRANT insert ON informixoltp.ryan_temp2 TO public;

GRANT select ON informixoltp.ryan_temp2 TO public;



GRANT delete ON informixoltp.ryan_temp2 TO public;

GRANT select ON informixoltp.classroom TO public;

GRANT insert ON informixoltp.classroom TO public;

GRANT update ON informixoltp.classroom TO public;

GRANT delete ON informixoltp.classroom TO public;



GRANT insert ON informixoltp.student_classroom_status_lu TO public;

GRANT update ON informixoltp.student_classroom_status_lu TO public;

GRANT select ON informixoltp.student_classroom_status_lu TO public;

GRANT delete ON informixoltp.student_classroom_status_lu TO public;



GRANT update ON informixoltp.command_execution TO public;



GRANT delete ON informixoltp.command_execution TO public;

GRANT insert ON informixoltp.command_execution TO public;

GRANT select ON informixoltp.command_execution TO public;



GRANT update ON informixoltp.student_classroom_xref TO public;

GRANT select ON informixoltp.student_classroom_xref TO public;

GRANT insert ON informixoltp.student_classroom_xref TO public;

GRANT delete ON informixoltp.student_classroom_xref TO public;



GRANT select ON informixoltp.student_professor_xref TO public;

GRANT update ON informixoltp.student_professor_xref TO public;

GRANT insert ON informixoltp.student_professor_xref TO public;

GRANT delete ON informixoltp.student_professor_xref TO public;

GRANT update ON informixoltp.round_property_type_lu TO public;

GRANT insert ON informixoltp.round_property_type_lu TO public;

GRANT delete ON informixoltp.round_property_type_lu TO public;

GRANT select ON informixoltp.round_property_type_lu TO public;



GRANT select ON informixoltp.round_property TO public;

GRANT delete ON informixoltp.round_property TO public;

GRANT insert ON informixoltp.round_property TO public;



GRANT update ON informixoltp.round_property TO public;

GRANT insert ON informixoltp.payment_reference_lu TO public;

GRANT delete ON informixoltp.payment_reference_lu TO public;



GRANT select ON informixoltp.payment_reference_lu TO public;

GRANT update ON informixoltp.payment_reference_lu TO public;



GRANT select ON informixoltp.college_problem_set TO public;

GRANT insert ON informixoltp.college_problem_set TO public;

GRANT delete ON informixoltp.college_problem_set TO public;

GRANT update ON informixoltp.college_problem_set TO public;



GRANT update ON informixoltp.problem_set_component_xref TO public;

GRANT delete ON informixoltp.problem_set_component_xref TO public;

GRANT select ON informixoltp.problem_set_component_xref TO public;

GRANT insert ON informixoltp.problem_set_component_xref TO public;

GRANT insert ON informixoltp.fax_solution TO public;



GRANT update ON informixoltp.fax_solution TO public;

GRANT delete ON informixoltp.fax_solution TO public;

GRANT select ON informixoltp.fax_solution TO public;



GRANT update ON informixoltp.long_test_score_id TO public;

GRANT delete ON informixoltp.long_test_score_id TO public;

GRANT select ON informixoltp.long_test_score_id TO public;

GRANT insert ON informixoltp.long_test_score_id TO public;



GRANT delete ON informixoltp.mike_temp1 TO public;

GRANT update ON informixoltp.mike_temp1 TO public;

GRANT insert ON informixoltp.mike_temp1 TO public;

GRANT select ON informixoltp.mike_temp1 TO public;

GRANT delete ON informixoltp.temp_dr_pay_fix TO public;

GRANT update ON informixoltp.temp_dr_pay_fix TO public;

GRANT insert ON informixoltp.temp_dr_pay_fix TO public;



GRANT select ON informixoltp.temp_dr_pay_fix TO public;

GRANT select ON informixoltp.travis_school TO public;

GRANT delete ON informixoltp.travis_school TO public;



GRANT insert ON informixoltp.travis_school TO public;

GRANT update ON informixoltp.travis_school TO public;

GRANT update ON informixoltp.dok_algo_rating TO public;

GRANT delete ON informixoltp.dok_algo_rating TO public;

GRANT insert ON informixoltp.dok_algo_rating TO public;



GRANT select ON informixoltp.dok_algo_rating TO public;

GRANT select ON informixoltp.mike_school TO public;

GRANT insert ON informixoltp.mike_school TO public;

GRANT delete ON informixoltp.mike_school TO public;

GRANT update ON informixoltp.mike_school TO public;



GRANT update ON informixoltp.algo_rating_tgh TO public;

GRANT insert ON informixoltp.algo_rating_tgh TO public;



GRANT delete ON informixoltp.algo_rating_tgh TO public;

GRANT select ON informixoltp.algo_rating_tgh TO public;

GRANT select ON informixoltp.algo_rating_tgh_hourly TO public;



GRANT insert ON informixoltp.algo_rating_tgh_hourly TO public;

GRANT delete ON informixoltp.algo_rating_tgh_hourly TO public;

GRANT update ON informixoltp.algo_rating_tgh_hourly TO public;



GRANT update ON informixoltp.mike_temp TO public;

GRANT delete ON informixoltp.mike_temp TO public;

GRANT insert ON informixoltp.mike_temp TO public;

GRANT select ON informixoltp.mike_temp TO public;

GRANT select ON informixoltp.payment_type_lu TO public;

GRANT delete ON informixoltp.payment_type_lu TO public;

GRANT update ON informixoltp.payment_type_lu TO public;

GRANT insert ON informixoltp.payment_type_lu TO public;

GRANT update ON informixoltp.algo_rating_pre_tco08 TO public;



GRANT insert ON informixoltp.algo_rating_pre_tco08 TO public;

GRANT select ON informixoltp.algo_rating_pre_tco08 TO public;

GRANT delete ON informixoltp.algo_rating_pre_tco08 TO public;

GRANT insert ON informixoltp.long_system_test_data TO public;



GRANT delete ON informixoltp.long_system_test_data TO public;

GRANT update ON informixoltp.long_system_test_data TO public;

GRANT select ON informixoltp.long_system_test_data TO public;

GRANT update ON informixoltp.nate_long_comp_result TO public;

GRANT insert ON informixoltp.nate_long_comp_result TO public;

GRANT select ON informixoltp.nate_long_comp_result TO public;



GRANT delete ON informixoltp.nate_long_comp_result TO public;

GRANT insert ON informixoltp.chat_history TO public;

GRANT delete ON informixoltp.chat_history TO public;

GRANT update ON informixoltp.chat_history TO public;

GRANT select ON informixoltp.chat_history TO public;

GRANT select ON informixoltp.education TO public;

GRANT delete ON informixoltp.education TO public;

GRANT insert ON informixoltp.education TO public;

GRANT update ON informixoltp.education TO public;

GRANT select ON informixoltp.coder_skill TO public;

GRANT delete ON informixoltp.coder_skill TO public;

GRANT insert ON informixoltp.coder_skill TO public;

GRANT update ON informixoltp.coder_skill TO public;

GRANT insert ON informixoltp.payment_status_lu TO public;



GRANT update ON informixoltp.payment_status_lu TO public;

GRANT select ON informixoltp.payment_status_lu TO public;

GRANT delete ON informixoltp.payment_status_lu TO public;

GRANT select ON informixoltp.connection_lock TO public;

GRANT update ON informixoltp.connection_lock TO public;

GRANT insert ON informixoltp.connection_lock TO public;

GRANT delete ON informixoltp.connection_lock TO public;

GRANT delete ON informixoltp.contact_us TO public;

GRANT update ON informixoltp.contact_us TO public;

GRANT insert ON informixoltp.contact_us TO public;

GRANT select ON informixoltp.contact_us TO public;

GRANT update ON informixoltp.contact_us_response TO public;

GRANT select ON informixoltp.contact_us_response TO public;

GRANT delete ON informixoltp.contact_us_response TO public;

GRANT insert ON informixoltp.contact_us_response TO public;

GRANT insert ON informixoltp.contact_us_subject TO public;

GRANT update ON informixoltp.contact_us_subject TO public;

GRANT delete ON informixoltp.contact_us_subject TO public;

GRANT select ON informixoltp.contact_us_subject TO public;

GRANT insert ON informixoltp.data_type TO public;

GRANT select ON informixoltp.data_type TO public;

GRANT delete ON informixoltp.data_type TO public;

GRANT update ON informixoltp.data_type TO public;

GRANT delete ON informixoltp.degree TO public;

GRANT insert ON informixoltp.degree TO public;

GRANT update ON informixoltp.degree TO public;

GRANT select ON informixoltp.degree TO public;

GRANT select ON informixoltp.difficulty TO public;

GRANT delete ON informixoltp.difficulty TO public;

GRANT update ON informixoltp.difficulty TO public;

GRANT insert ON informixoltp.difficulty TO public;

GRANT delete ON informixoltp.group TO public;

GRANT update ON informixoltp.group TO public;

GRANT select ON informixoltp.group TO public;

GRANT insert ON informixoltp.group TO public;

GRANT select ON informixoltp.group_user TO public;

GRANT insert ON informixoltp.group_user TO public;

GRANT delete ON informixoltp.group_user TO public;

GRANT update ON informixoltp.group_user TO public;

GRANT delete ON informixoltp.permission TO public;

GRANT select ON informixoltp.permission TO public;

GRANT insert ON informixoltp.permission TO public;

GRANT update ON informixoltp.permission TO public;

GRANT update ON informixoltp.question_type TO public;

GRANT insert ON informixoltp.question_type TO public;

GRANT select ON informixoltp.question_type TO public;

GRANT delete ON informixoltp.question_type TO public;

GRANT insert ON informixoltp.rating_history TO public;

GRANT select ON informixoltp.rating_history TO public;

GRANT delete ON informixoltp.rating_history TO public;

GRANT update ON informixoltp.rating_history TO public;

GRANT update ON informixoltp.member_contact_black_list TO public;

GRANT select ON informixoltp.member_contact_black_list TO public;

GRANT insert ON informixoltp.member_contact_black_list TO public;



GRANT delete ON informixoltp.member_contact_black_list TO public;

GRANT insert ON informixoltp.room TO public;

GRANT delete ON informixoltp.room TO public;

GRANT update ON informixoltp.room TO public;

GRANT select ON informixoltp.room TO public;

GRANT delete ON informixoltp.round_component TO public;

GRANT select ON informixoltp.round_component TO public;

GRANT update ON informixoltp.round_component TO public;

GRANT insert ON informixoltp.round_component TO public;

GRANT update ON informixoltp.segment_type TO public;

GRANT delete ON informixoltp.segment_type TO public;

GRANT insert ON informixoltp.segment_type TO public;

GRANT select ON informixoltp.segment_type TO public;

GRANT delete ON informixoltp.round_segment TO public;

GRANT insert ON informixoltp.round_segment TO public;

GRANT select ON informixoltp.round_segment TO public;

GRANT update ON informixoltp.round_segment TO public;

GRANT insert ON informixoltp.sector TO public;

GRANT select ON informixoltp.sector TO public;

GRANT update ON informixoltp.sector TO public;

GRANT delete ON informixoltp.sector TO public;

GRANT select ON informixoltp.secure_object TO public;

GRANT update ON informixoltp.secure_object TO public;

GRANT delete ON informixoltp.secure_object TO public;

GRANT insert ON informixoltp.secure_object TO public;

GRANT select ON informixoltp.skill_type TO public;

GRANT delete ON informixoltp.skill_type TO public;

GRANT insert ON informixoltp.skill_type TO public;

GRANT update ON informixoltp.skill_type TO public;

GRANT update ON informixoltp.language TO public;

GRANT insert ON informixoltp.language TO public;

GRANT delete ON informixoltp.language TO public;

GRANT select ON informixoltp.language TO public;

GRANT insert ON informixoltp.user_type TO public;

GRANT select ON informixoltp.user_type TO public;

GRANT delete ON informixoltp.user_type TO public;

GRANT update ON informixoltp.user_type TO public;

GRANT update ON informixoltp.contest_nav TO public;

GRANT delete ON informixoltp.contest_nav TO public;

GRANT insert ON informixoltp.contest_nav TO public;

GRANT select ON informixoltp.contest_nav TO public;

GRANT delete ON informixoltp.mail_log TO public;

GRANT insert ON informixoltp.mail_log TO public;

GRANT update ON informixoltp.mail_log TO public;

GRANT select ON informixoltp.mail_log TO public;

GRANT delete ON informixoltp.news TO public;

GRANT update ON informixoltp.news TO public;

GRANT insert ON informixoltp.news TO public;

GRANT select ON informixoltp.news TO public;

GRANT delete ON informixoltp.audit_coder TO public;

GRANT select ON informixoltp.audit_coder TO public;

GRANT insert ON informixoltp.audit_coder TO public;

GRANT update ON informixoltp.audit_coder TO public;

GRANT select ON informixoltp.payment_status_reason_lu TO public;

GRANT insert ON informixoltp.payment_status_reason_lu TO public;

GRANT update ON informixoltp.payment_status_reason_lu TO public;



GRANT delete ON informixoltp.payment_status_reason_lu TO public;

GRANT insert ON informixoltp.payment_detail_status_reason_xref TO public;

GRANT update ON informixoltp.payment_detail_status_reason_xref TO public;

GRANT delete ON informixoltp.payment_detail_status_reason_xref TO public;



GRANT select ON informixoltp.payment_detail_status_reason_xref TO public;

GRANT select ON informixoltp.dispute TO public;

GRANT delete ON informixoltp.dispute TO public;

GRANT insert ON informixoltp.dispute TO public;

GRANT update ON informixoltp.dispute TO public;

GRANT select ON informixoltp.corporate TO public;

GRANT update ON informixoltp.corporate TO public;

GRANT delete ON informixoltp.corporate TO public;

GRANT insert ON informixoltp.corporate TO public;

GRANT update ON informixoltp.ad TO public;

GRANT select ON informixoltp.ad TO public;

GRANT insert ON informixoltp.ad TO public;

GRANT delete ON informixoltp.ad TO public;

GRANT delete ON informixoltp.inquiry TO public;

GRANT update ON informixoltp.inquiry TO public;

GRANT insert ON informixoltp.inquiry TO public;

GRANT select ON informixoltp.inquiry TO public;

GRANT update ON informixoltp.watch TO public;

GRANT delete ON informixoltp.watch TO public;

GRANT select ON informixoltp.watch TO public;

GRANT insert ON informixoltp.watch TO public;

GRANT delete ON informixoltp.subscription_region TO public;

GRANT insert ON informixoltp.subscription_region TO public;

GRANT select ON informixoltp.subscription_region TO public;

GRANT update ON informixoltp.subscription_region TO public;

GRANT insert ON informixoltp.subscription TO public;

GRANT delete ON informixoltp.subscription TO public;

GRANT update ON informixoltp.subscription TO public;

GRANT select ON informixoltp.subscription TO public;

GRANT delete ON informixoltp.region_state TO public;

GRANT select ON informixoltp.region_state TO public;

GRANT insert ON informixoltp.region_state TO public;

GRANT update ON informixoltp.region_state TO public;

GRANT update ON informixoltp.contest TO public;

GRANT select ON informixoltp.contest TO public;

GRANT delete ON informixoltp.contest TO public;

GRANT insert ON informixoltp.contest TO public;

GRANT insert ON informixoltp.coder TO public;

GRANT delete ON informixoltp.coder TO public;

GRANT select ON informixoltp.coder TO public;

GRANT update ON informixoltp.coder TO public;

GRANT delete ON informixoltp.jiveword TO public;

GRANT insert ON informixoltp.jiveword TO public;

GRANT update ON informixoltp.jiveword TO public;

GRANT select ON informixoltp.jiveword TO public;

GRANT insert ON informixoltp.jiveuserperm TO public;

GRANT update ON informixoltp.jiveuserperm TO public;

GRANT select ON informixoltp.jiveuserperm TO public;

GRANT delete ON informixoltp.jiveuserperm TO public;

GRANT select ON informixoltp.jivethread TO public;

GRANT delete ON informixoltp.jivethread TO public;

GRANT insert ON informixoltp.jivethread TO public;

GRANT update ON informixoltp.jivethread TO public;

GRANT delete ON informixoltp.jivemessageword TO public;

GRANT select ON informixoltp.jivemessageword TO public;

GRANT insert ON informixoltp.jivemessageword TO public;

GRANT update ON informixoltp.jivemessageword TO public;

GRANT insert ON informixoltp.jivemessagetree TO public;

GRANT update ON informixoltp.jivemessagetree TO public;

GRANT delete ON informixoltp.jivemessagetree TO public;

GRANT select ON informixoltp.jivemessagetree TO public;

GRANT insert ON informixoltp.jivemessageprop TO public;

GRANT update ON informixoltp.jivemessageprop TO public;

GRANT select ON informixoltp.jivemessageprop TO public;

GRANT delete ON informixoltp.jivemessageprop TO public;

GRANT select ON informixoltp.jivemessage TO public;

GRANT insert ON informixoltp.jivemessage TO public;

GRANT delete ON informixoltp.jivemessage TO public;

GRANT update ON informixoltp.jivemessage TO public;

GRANT select ON informixoltp.jivefilter TO public;

GRANT update ON informixoltp.jivefilter TO public;

GRANT insert ON informixoltp.jivefilter TO public;

GRANT delete ON informixoltp.jivefilter TO public;

GRANT delete ON informixoltp.jmsconsumer TO public;

GRANT insert ON informixoltp.jmsconsumer TO public;

GRANT select ON informixoltp.jmsconsumer TO public;

GRANT update ON informixoltp.jmsconsumer TO public;

GRANT select ON informixoltp.jmsdestination TO public;

GRANT update ON informixoltp.jmsdestination TO public;

GRANT insert ON informixoltp.jmsdestination TO public;

GRANT delete ON informixoltp.jmsdestination TO public;

GRANT update ON informixoltp.jmsmessage TO public;

GRANT delete ON informixoltp.jmsmessage TO public;

GRANT insert ON informixoltp.jmsmessage TO public;

GRANT select ON informixoltp.jmsmessage TO public;

GRANT select ON informixoltp.jmsmessagequeue TO public;

GRANT delete ON informixoltp.jmsmessagequeue TO public;

GRANT insert ON informixoltp.jmsmessagequeue TO public;

GRANT update ON informixoltp.jmsmessagequeue TO public;

GRANT delete ON informixoltp.jmstableid TO public;

GRANT select ON informixoltp.jmstableid TO public;

GRANT insert ON informixoltp.jmstableid TO public;

GRANT update ON informixoltp.jmstableid TO public;

GRANT delete ON informixoltp.dual TO public;

GRANT insert ON informixoltp.dual TO public;

GRANT select ON informixoltp.dual TO public;

GRANT update ON informixoltp.dual TO public;

GRANT insert ON informixoltp.referral TO public;

GRANT select ON informixoltp.referral TO public;

GRANT update ON informixoltp.referral TO public;

GRANT delete ON informixoltp.referral TO public;

GRANT delete ON informixoltp.editor TO public;

GRANT select ON informixoltp.editor TO public;

GRANT update ON informixoltp.editor TO public;

GRANT insert ON informixoltp.editor TO public;

GRANT delete ON informixoltp.pay_period TO public;

GRANT insert ON informixoltp.pay_period TO public;

GRANT update ON informixoltp.pay_period TO public;

GRANT select ON informixoltp.pay_period TO public;

GRANT delete ON informixoltp.title TO public;

GRANT select ON informixoltp.title TO public;

GRANT update ON informixoltp.title TO public;

GRANT insert ON informixoltp.title TO public;

GRANT update ON informixoltp.press_release TO public;

GRANT delete ON informixoltp.press_release TO public;

GRANT insert ON informixoltp.press_release TO public;

GRANT select ON informixoltp.press_release TO public;

GRANT update ON informixoltp.division TO public;

GRANT insert ON informixoltp.division TO public;

GRANT delete ON informixoltp.division TO public;

GRANT select ON informixoltp.division TO public;

GRANT select ON informixoltp.server_connection TO public;

GRANT insert ON informixoltp.server_connection TO public;

GRANT update ON informixoltp.server_connection TO public;

GRANT delete ON informixoltp.server_connection TO public;

GRANT insert ON informixoltp.sector_access TO public;

GRANT select ON informixoltp.sector_access TO public;

GRANT delete ON informixoltp.sector_access TO public;

GRANT update ON informixoltp.sector_access TO public;

GRANT select ON informixoltp.sector_file TO public;

GRANT insert ON informixoltp.sector_file TO public;

GRANT update ON informixoltp.sector_file TO public;

GRANT delete ON informixoltp.sector_file TO public;

GRANT update ON informixoltp.sector_agreement TO public;

GRANT delete ON informixoltp.sector_agreement TO public;

GRANT insert ON informixoltp.sector_agreement TO public;

GRANT select ON informixoltp.sector_agreement TO public;

GRANT update ON informixoltp.segment TO public;

GRANT select ON informixoltp.segment TO public;

GRANT insert ON informixoltp.segment TO public;

GRANT delete ON informixoltp.segment TO public;

GRANT select ON informixoltp.experience TO public;

GRANT insert ON informixoltp.experience TO public;

GRANT delete ON informixoltp.experience TO public;

GRANT update ON informixoltp.experience TO public;

GRANT update ON informixoltp.corporate_contact_us TO public;

GRANT insert ON informixoltp.corporate_contact_us TO public;

GRANT select ON informixoltp.corporate_contact_us TO public;

GRANT delete ON informixoltp.corporate_contact_us TO public;

GRANT insert ON informixoltp.system_test_result TO public;

GRANT update ON informixoltp.system_test_result TO public;

GRANT delete ON informixoltp.system_test_result TO public;

GRANT select ON informixoltp.system_test_result TO public;

GRANT insert ON informixoltp.coder_type TO public;

GRANT select ON informixoltp.coder_type TO public;

GRANT update ON informixoltp.coder_type TO public;

GRANT delete ON informixoltp.coder_type TO public;

GRANT update ON informixoltp.coder_referral TO public;

GRANT insert ON informixoltp.coder_referral TO public;

GRANT delete ON informixoltp.coder_referral TO public;

GRANT select ON informixoltp.coder_referral TO public;

GRANT insert ON informixoltp.problem_statement_history TO public;

GRANT select ON informixoltp.problem_statement_history TO public;

GRANT update ON informixoltp.problem_statement_history TO public;

GRANT delete ON informixoltp.problem_statement_history TO public;

GRANT delete ON informixoltp.problem_status_lu TO public;

GRANT update ON informixoltp.problem_status_lu TO public;

GRANT select ON informixoltp.problem_status_lu TO public;

GRANT insert ON informixoltp.problem_status_lu TO public;

GRANT insert ON informixoltp.correspondence TO public;

GRANT update ON informixoltp.correspondence TO public;

GRANT delete ON informixoltp.correspondence TO public;

GRANT select ON informixoltp.correspondence TO public;

GRANT select ON informixoltp.correspondence_status TO public;

GRANT delete ON informixoltp.correspondence_status TO public;

GRANT update ON informixoltp.correspondence_status TO public;

GRANT insert ON informixoltp.correspondence_status TO public;

GRANT delete ON informixoltp.mpsqas_chat_history TO public;

GRANT select ON informixoltp.mpsqas_chat_history TO public;

GRANT update ON informixoltp.mpsqas_chat_history TO public;

GRANT insert ON informixoltp.mpsqas_chat_history TO public;

GRANT delete ON informixoltp.component_user_xref TO public;

GRANT update ON informixoltp.component_user_xref TO public;

GRANT select ON informixoltp.component_user_xref TO public;

GRANT insert ON informixoltp.component_user_xref TO public;

GRANT select ON informixoltp.solution TO public;

GRANT delete ON informixoltp.solution TO public;

GRANT insert ON informixoltp.solution TO public;

GRANT update ON informixoltp.solution TO public;

GRANT select ON informixoltp.component_state TO public;

GRANT delete ON informixoltp.component_state TO public;

GRANT update ON informixoltp.component_state TO public;

GRANT insert ON informixoltp.component_state TO public;

GRANT update ON informixoltp.problem_solution TO public;

GRANT delete ON informixoltp.problem_solution TO public;

GRANT insert ON informixoltp.problem_solution TO public;

GRANT select ON informixoltp.problem_solution TO public;

GRANT select ON informixoltp.development_application_status TO public;

GRANT delete ON informixoltp.development_application_status TO public;

GRANT update ON informixoltp.development_application_status TO public;

GRANT insert ON informixoltp.development_application_status TO public;

GRANT delete ON informixoltp.development_application TO public;

GRANT select ON informixoltp.development_application TO public;

GRANT insert ON informixoltp.development_application TO public;

GRANT update ON informixoltp.development_application TO public;

GRANT insert ON informixoltp.challenge TO public;

GRANT update ON informixoltp.challenge TO public;

GRANT delete ON informixoltp.challenge TO public;

GRANT select ON informixoltp.challenge TO public;

GRANT insert ON informixoltp.invite_list TO public;

GRANT select ON informixoltp.invite_list TO public;

GRANT update ON informixoltp.invite_list TO public;

GRANT delete ON informixoltp.invite_list TO public;

GRANT update ON informixoltp.current_school TO public;

GRANT select ON informixoltp.current_school TO public;

GRANT insert ON informixoltp.current_school TO public;

GRANT delete ON informixoltp.current_school TO public;

GRANT insert ON informixoltp.current_job TO public;

GRANT delete ON informixoltp.current_job TO public;

GRANT select ON informixoltp.current_job TO public;

GRANT update ON informixoltp.current_job TO public;

GRANT select ON informixoltp.sub_template TO public;

GRANT insert ON informixoltp.sub_template TO public;

GRANT update ON informixoltp.sub_template TO public;

GRANT delete ON informixoltp.sub_template TO public;

GRANT select ON informixoltp.student_rep TO public;

GRANT insert ON informixoltp.student_rep TO public;

GRANT update ON informixoltp.student_rep TO public;

GRANT delete ON informixoltp.student_rep TO public;

GRANT delete ON informixoltp.solution_history TO public;

GRANT insert ON informixoltp.solution_history TO public;

GRANT update ON informixoltp.solution_history TO public;

GRANT select ON informixoltp.solution_history TO public;

GRANT select ON informixoltp.room_type TO public;

GRANT delete ON informixoltp.room_type TO public;

GRANT update ON informixoltp.room_type TO public;

GRANT insert ON informixoltp.room_type TO public;

GRANT select ON informixoltp.user_accrual TO public;

GRANT delete ON informixoltp.user_accrual TO public;

GRANT update ON informixoltp.user_accrual TO public;

GRANT insert ON informixoltp.user_accrual TO public;



GRANT select ON informixoltp.user_payment_method TO public;

GRANT delete ON informixoltp.user_payment_method TO public;

GRANT update ON informixoltp.user_payment_method TO public;

GRANT insert ON informixoltp.user_payment_method TO public;



GRANT select ON informixoltp.user_paypal_account TO public;

GRANT delete ON informixoltp.user_paypal_account TO public;

GRANT update ON informixoltp.user_paypal_account TO public;

GRANT insert ON informixoltp.user_paypal_account TO public;



GRANT insert ON informixoltp.round_registration TO public;

GRANT delete ON informixoltp.round_registration TO public;

GRANT select ON informixoltp.round_registration TO public;

GRANT update ON informixoltp.round_registration TO public;

GRANT select ON informixoltp.question_style TO public;

GRANT update ON informixoltp.question_style TO public;

GRANT delete ON informixoltp.question_style TO public;

GRANT insert ON informixoltp.question_style TO public;

GRANT select ON informixoltp.answer TO public;

GRANT update ON informixoltp.answer TO public;

GRANT delete ON informixoltp.answer TO public;

GRANT insert ON informixoltp.answer TO public;



GRANT update ON informixoltp.round_language TO public;

GRANT select ON informixoltp.round_language TO public;

GRANT delete ON informixoltp.round_language TO public;

GRANT insert ON informixoltp.round_language TO public;

GRANT insert ON informixoltp.survey_question TO public;

GRANT delete ON informixoltp.survey_question TO public;

GRANT update ON informixoltp.survey_question TO public;

GRANT select ON informixoltp.survey_question TO public;

GRANT select ON informixoltp.round_question TO public;

GRANT delete ON informixoltp.round_question TO public;

GRANT update ON informixoltp.round_question TO public;

GRANT insert ON informixoltp.round_question TO public;

GRANT delete ON informixoltp.correspondence_read_xref TO public;

GRANT insert ON informixoltp.correspondence_read_xref TO public;

GRANT select ON informixoltp.correspondence_read_xref TO public;

GRANT update ON informixoltp.correspondence_read_xref TO public;

GRANT delete ON informixoltp.problem_user_request TO public;

GRANT select ON informixoltp.problem_user_request TO public;

GRANT update ON informixoltp.problem_user_request TO public;

GRANT insert ON informixoltp.problem_user_request TO public;

GRANT insert ON informixoltp.contract_type_lu TO public;

GRANT select ON informixoltp.contract_type_lu TO public;

GRANT update ON informixoltp.contract_type_lu TO public;

GRANT delete ON informixoltp.contract_type_lu TO public;

GRANT delete ON informixoltp.image_type_lu TO public;

GRANT update ON informixoltp.image_type_lu TO public;

GRANT insert ON informixoltp.image_type_lu TO public;

GRANT select ON informixoltp.image_type_lu TO public;

GRANT update ON informixoltp.image TO public;

GRANT select ON informixoltp.image TO public;

GRANT insert ON informixoltp.image TO public;

GRANT delete ON informixoltp.image TO public;

GRANT insert ON informixoltp.coder_image_xref TO public;

GRANT select ON informixoltp.coder_image_xref TO public;

GRANT update ON informixoltp.coder_image_xref TO public;

GRANT delete ON informixoltp.coder_image_xref TO public;

GRANT insert ON informixoltp.jiveforum TO public;

GRANT delete ON informixoltp.jiveforum TO public;

GRANT update ON informixoltp.jiveforum TO public;

GRANT select ON informixoltp.jiveforum TO public;

GRANT select ON informixoltp.login TO public;

GRANT update ON informixoltp.login TO public;

GRANT insert ON informixoltp.login TO public;

GRANT delete ON informixoltp.login TO public;

GRANT insert ON informixoltp.project TO public;

GRANT update ON informixoltp.project TO public;

GRANT delete ON informixoltp.project TO public;

GRANT select ON informixoltp.project TO public;

GRANT update ON informixoltp.project_issue TO public;

GRANT insert ON informixoltp.project_issue TO public;

GRANT delete ON informixoltp.project_issue TO public;

GRANT select ON informixoltp.project_issue TO public;

GRANT delete ON informixoltp.project_task TO public;

GRANT update ON informixoltp.project_task TO public;

GRANT select ON informixoltp.project_task TO public;

GRANT insert ON informixoltp.project_task TO public;

GRANT select ON informixoltp.project_user TO public;

GRANT delete ON informixoltp.project_user TO public;

GRANT insert ON informixoltp.project_user TO public;

GRANT update ON informixoltp.project_user TO public;

GRANT select ON informixoltp.project_user_task TO public;

GRANT insert ON informixoltp.project_user_task TO public;

GRANT delete ON informixoltp.project_user_task TO public;

GRANT update ON informixoltp.project_user_task TO public;

GRANT insert ON informixoltp.project_user_update TO public;

GRANT update ON informixoltp.project_user_update TO public;

GRANT delete ON informixoltp.project_user_update TO public;

GRANT select ON informixoltp.project_user_update TO public;

GRANT delete ON informixoltp.status_type_lu TO public;

GRANT insert ON informixoltp.status_type_lu TO public;

GRANT select ON informixoltp.status_type_lu TO public;

GRANT update ON informixoltp.status_type_lu TO public;

GRANT delete ON informixoltp.request_type_lu TO public;

GRANT update ON informixoltp.request_type_lu TO public;

GRANT select ON informixoltp.request_type_lu TO public;

GRANT insert ON informixoltp.request_type_lu TO public;

GRANT delete ON informixoltp.path TO public;

GRANT insert ON informixoltp.path TO public;

GRANT update ON informixoltp.path TO public;

GRANT select ON informixoltp.path TO public;

GRANT delete ON informixoltp.round_type_lu TO public;

GRANT insert ON informixoltp.round_type_lu TO public;

GRANT update ON informixoltp.round_type_lu TO public;

GRANT select ON informixoltp.round_type_lu TO public;

GRANT delete ON informixoltp.web_content TO public;

GRANT insert ON informixoltp.web_content TO public;

GRANT select ON informixoltp.web_content TO public;

GRANT update ON informixoltp.web_content TO public;

GRANT select ON informixoltp.web_file TO public;

GRANT update ON informixoltp.web_file TO public;

GRANT insert ON informixoltp.web_file TO public;

GRANT delete ON informixoltp.web_file TO public;

GRANT update ON informixoltp.staging_problem TO public;

GRANT insert ON informixoltp.staging_problem TO public;

GRANT delete ON informixoltp.staging_problem TO public;

GRANT select ON informixoltp.staging_problem TO public;

GRANT insert ON informixoltp.request TO public;

GRANT update ON informixoltp.request TO public;

GRANT delete ON informixoltp.request TO public;

GRANT select ON informixoltp.request TO public;

GRANT delete ON informixoltp.nomination TO public;

GRANT update ON informixoltp.nomination TO public;

GRANT select ON informixoltp.nomination TO public;

GRANT insert ON informixoltp.nomination TO public;



GRANT delete ON informixoltp.staging_rating TO public;

GRANT update ON informixoltp.staging_rating TO public;

GRANT select ON informixoltp.staging_rating TO public;

GRANT insert ON informixoltp.staging_rating TO public;

GRANT select ON informixoltp.staging_room TO public;

GRANT delete ON informixoltp.staging_room TO public;

GRANT insert ON informixoltp.staging_room TO public;

GRANT update ON informixoltp.staging_room TO public;

GRANT insert ON informixoltp.staging_round_problem TO public;

GRANT select ON informixoltp.staging_round_problem TO public;

GRANT update ON informixoltp.staging_round_problem TO public;

GRANT delete ON informixoltp.staging_round_problem TO public;

GRANT update ON informixoltp.staging_round_segment TO public;

GRANT select ON informixoltp.staging_round_segment TO public;

GRANT insert ON informixoltp.staging_round_segment TO public;

GRANT delete ON informixoltp.staging_round_segment TO public;

GRANT delete ON informixoltp.staging_contest TO public;

GRANT insert ON informixoltp.staging_contest TO public;

GRANT select ON informixoltp.staging_contest TO public;

GRANT update ON informixoltp.staging_contest TO public;

GRANT insert ON informixoltp.staging_challenge TO public;

GRANT select ON informixoltp.staging_challenge TO public;

GRANT delete ON informixoltp.staging_challenge TO public;

GRANT update ON informixoltp.staging_challenge TO public;

GRANT delete ON informixoltp.staging_invite_list TO public;

GRANT update ON informixoltp.staging_invite_list TO public;

GRANT select ON informixoltp.staging_invite_list TO public;

GRANT insert ON informixoltp.staging_invite_list TO public;

GRANT update ON informixoltp.staging_round_registration TO public;

GRANT select ON informixoltp.staging_round_registration TO public;

GRANT insert ON informixoltp.staging_round_registration TO public;

GRANT delete ON informixoltp.staging_round_registration TO public;

GRANT insert ON informixoltp.staging_survey TO public;

GRANT select ON informixoltp.staging_survey TO public;

GRANT update ON informixoltp.staging_survey TO public;

GRANT delete ON informixoltp.staging_survey TO public;

GRANT update ON informixoltp.staging_question TO public;

GRANT delete ON informixoltp.staging_question TO public;

GRANT insert ON informixoltp.staging_question TO public;

GRANT select ON informixoltp.staging_question TO public;

GRANT delete ON informixoltp.staging_answer TO public;

GRANT update ON informixoltp.staging_answer TO public;

GRANT insert ON informixoltp.staging_answer TO public;

GRANT select ON informixoltp.staging_answer TO public;

GRANT select ON informixoltp.staging_response TO public;

GRANT delete ON informixoltp.staging_response TO public;

GRANT update ON informixoltp.staging_response TO public;

GRANT insert ON informixoltp.staging_response TO public;

GRANT update ON informixoltp.staging_survey_question TO public;

GRANT delete ON informixoltp.staging_survey_question TO public;

GRANT insert ON informixoltp.staging_survey_question TO public;

GRANT select ON informixoltp.staging_survey_question TO public;

GRANT select ON informixoltp.staging_round_question TO public;

GRANT delete ON informixoltp.staging_round_question TO public;

GRANT insert ON informixoltp.staging_round_question TO public;

GRANT update ON informixoltp.staging_round_question TO public;

GRANT delete ON informixoltp.staging_round TO public;

GRANT update ON informixoltp.staging_round TO public;

GRANT select ON informixoltp.staging_round TO public;

GRANT insert ON informixoltp.staging_round TO public;

GRANT insert ON informixoltp.staging_room_result TO public;

GRANT select ON informixoltp.staging_room_result TO public;

GRANT update ON informixoltp.staging_room_result TO public;

GRANT delete ON informixoltp.staging_room_result TO public;

GRANT delete ON informixoltp.affidavit_type_lu TO public;

GRANT update ON informixoltp.affidavit_type_lu TO public;

GRANT select ON informixoltp.affidavit_type_lu TO public;

GRANT insert ON informixoltp.affidavit_type_lu TO public;

GRANT insert ON informixoltp.contract_payment_xref TO public;

GRANT delete ON informixoltp.contract_payment_xref TO public;

GRANT update ON informixoltp.contract_payment_xref TO public;

GRANT select ON informixoltp.contract_payment_xref TO public;

GRANT delete ON informixoltp.user_tax_form_xref TO public;

GRANT select ON informixoltp.user_tax_form_xref TO public;

GRANT update ON informixoltp.user_tax_form_xref TO public;

GRANT insert ON informixoltp.user_tax_form_xref TO public;

GRANT update ON informixoltp.payment_note_xref TO public;

GRANT select ON informixoltp.payment_note_xref TO public;

GRANT delete ON informixoltp.payment_note_xref TO public;

GRANT insert ON informixoltp.payment_note_xref TO public;

GRANT update ON informixoltp.affidavit_note_xref TO public;

GRANT delete ON informixoltp.affidavit_note_xref TO public;

GRANT select ON informixoltp.affidavit_note_xref TO public;

GRANT insert ON informixoltp.affidavit_note_xref TO public;

GRANT insert ON informixoltp.contract_note_xref TO public;

GRANT delete ON informixoltp.contract_note_xref TO public;

GRANT select ON informixoltp.contract_note_xref TO public;

GRANT update ON informixoltp.contract_note_xref TO public;

GRANT delete ON informixoltp.payment_detail TO public;

GRANT update ON informixoltp.payment_detail TO public;

GRANT insert ON informixoltp.payment_detail TO public;

GRANT select ON informixoltp.payment_detail TO public;

GRANT insert ON informixoltp.payment TO public;

GRANT update ON informixoltp.payment TO public;

GRANT select ON informixoltp.payment TO public;

GRANT delete ON informixoltp.payment TO public;

GRANT update ON informixoltp.payment_address TO public;

GRANT select ON informixoltp.payment_address TO public;

GRANT insert ON informixoltp.payment_address TO public;

GRANT delete ON informixoltp.payment_address TO public;

GRANT select ON informixoltp.payment_detail_xref TO public;

GRANT insert ON informixoltp.payment_detail_xref TO public;

GRANT update ON informixoltp.payment_detail_xref TO public;

GRANT delete ON informixoltp.payment_detail_xref TO public;

GRANT select,insert,update,delete ON informixoltp.payment_release TO public;

GRANT select,insert,update,delete ON informixoltp.payment_release_xref TO public;

GRANT select ON informixoltp.modification_rationale_lu TO public;

GRANT insert ON informixoltp.modification_rationale_lu TO public;

GRANT update ON informixoltp.modification_rationale_lu TO public;

GRANT delete ON informixoltp.modification_rationale_lu TO public;

GRANT delete ON informixoltp.affidavit TO public;

GRANT insert ON informixoltp.affidavit TO public;

GRANT update ON informixoltp.affidavit TO public;

GRANT select ON informixoltp.affidavit TO public;

GRANT update ON informixoltp.user_tax_form_note_xref TO public;

GRANT delete ON informixoltp.user_tax_form_note_xref TO public;

GRANT select ON informixoltp.user_tax_form_note_xref TO public;

GRANT insert ON informixoltp.user_tax_form_note_xref TO public;

GRANT delete ON informixoltp.tax_form TO public;

GRANT insert ON informixoltp.tax_form TO public;

GRANT select ON informixoltp.tax_form TO public;

GRANT update ON informixoltp.tax_form TO public;

GRANT select ON informixoltp.contract TO public;

GRANT delete ON informixoltp.contract TO public;

GRANT insert ON informixoltp.contract TO public;

GRANT update ON informixoltp.contract TO public;

GRANT update ON informixoltp.affidavit_template TO public;

GRANT insert ON informixoltp.affidavit_template TO public;

GRANT select ON informixoltp.affidavit_template TO public;

GRANT delete ON informixoltp.affidavit_template TO public;

GRANT delete ON informixoltp.query TO public;

GRANT select ON informixoltp.query TO public;

GRANT insert ON informixoltp.query TO public;

GRANT update ON informixoltp.query TO public;

GRANT update ON informixoltp.command TO public;

GRANT delete ON informixoltp.command TO public;

GRANT insert ON informixoltp.command TO public;

GRANT select ON informixoltp.command TO public;

GRANT delete ON informixoltp.command_query_xref TO public;

GRANT select ON informixoltp.command_query_xref TO public;

GRANT update ON informixoltp.command_query_xref TO public;

GRANT insert ON informixoltp.command_query_xref TO public;

GRANT select ON informixoltp.query_input_xref TO public;

GRANT update ON informixoltp.query_input_xref TO public;

GRANT insert ON informixoltp.query_input_xref TO public;

GRANT delete ON informixoltp.query_input_xref TO public;

GRANT select ON informixoltp.input_lu TO public;

GRANT delete ON informixoltp.input_lu TO public;

GRANT insert ON informixoltp.input_lu TO public;

GRANT update ON informixoltp.input_lu TO public;

GRANT update ON informixoltp.sched_job_type_lu TO public;

GRANT delete ON informixoltp.sched_job_type_lu TO public;

GRANT insert ON informixoltp.sched_job_type_lu TO public;

GRANT select ON informixoltp.sched_job_type_lu TO public;

GRANT update ON informixoltp.sched_job_status_lu TO public;

GRANT insert ON informixoltp.sched_job_status_lu TO public;

GRANT select ON informixoltp.sched_job_status_lu TO public;

GRANT delete ON informixoltp.sched_job_status_lu TO public;

GRANT delete ON informixoltp.sched_job_detail_status_lu TO public;

GRANT update ON informixoltp.sched_job_detail_status_lu TO public;

GRANT select ON informixoltp.sched_job_detail_status_lu TO public;

GRANT insert ON informixoltp.sched_job_detail_status_lu TO public;

GRANT delete ON informixoltp.sched_job TO public;

GRANT update ON informixoltp.sched_job TO public;

GRANT insert ON informixoltp.sched_job TO public;

GRANT select ON informixoltp.sched_job TO public;

GRANT select ON informixoltp.email_job_group_lu TO public;

GRANT delete ON informixoltp.email_job_group_lu TO public;

GRANT insert ON informixoltp.email_job_group_lu TO public;

GRANT update ON informixoltp.email_job_group_lu TO public;

GRANT insert ON informixoltp.email_template_group_lu TO public;

GRANT select ON informixoltp.email_template_group_lu TO public;

GRANT delete ON informixoltp.email_template_group_lu TO public;

GRANT update ON informixoltp.email_template_group_lu TO public;

GRANT select ON informixoltp.email_template TO public;

GRANT insert ON informixoltp.email_template TO public;

GRANT update ON informixoltp.email_template TO public;

GRANT delete ON informixoltp.email_template TO public;

GRANT select ON informixoltp.email_list_group_lu TO public;

GRANT delete ON informixoltp.email_list_group_lu TO public;

GRANT insert ON informixoltp.email_list_group_lu TO public;

GRANT update ON informixoltp.email_list_group_lu TO public;

GRANT insert ON informixoltp.email_list TO public;

GRANT select ON informixoltp.email_list TO public;

GRANT delete ON informixoltp.email_list TO public;

GRANT update ON informixoltp.email_list TO public;

GRANT update ON informixoltp.email_list_detail TO public;

GRANT insert ON informixoltp.email_list_detail TO public;

GRANT delete ON informixoltp.email_list_detail TO public;

GRANT select ON informixoltp.email_list_detail TO public;

GRANT select ON informixoltp.sched_email_job TO public;

GRANT insert ON informixoltp.sched_email_job TO public;

GRANT delete ON informixoltp.sched_email_job TO public;

GRANT update ON informixoltp.sched_email_job TO public;

GRANT update ON informixoltp.command_param TO public;

GRANT delete ON informixoltp.command_param TO public;

GRANT select ON informixoltp.command_param TO public;

GRANT insert ON informixoltp.command_param TO public;

GRANT update ON informixoltp.command_group_lu TO public;

GRANT select ON informixoltp.command_group_lu TO public;

GRANT insert ON informixoltp.command_group_lu TO public;

GRANT delete ON informixoltp.command_group_lu TO public;

GRANT update ON informixoltp.user_status_lu TO public;

GRANT insert ON informixoltp.user_status_lu TO public;

GRANT select ON informixoltp.user_status_lu TO public;

GRANT delete ON informixoltp.user_status_lu TO public;

GRANT insert ON informixoltp.link_hit TO public;

GRANT delete ON informixoltp.link_hit TO public;

GRANT update ON informixoltp.link_hit TO public;

GRANT select ON informixoltp.link_hit TO public;

GRANT update ON informixoltp.status_lu TO public;

GRANT select ON informixoltp.status_lu TO public;

GRANT delete ON informixoltp.status_lu TO public;

GRANT insert ON informixoltp.status_lu TO public;

GRANT select ON informixoltp.broadcast_type_lu TO public;

GRANT delete ON informixoltp.broadcast_type_lu TO public;

GRANT insert ON informixoltp.broadcast_type_lu TO public;

GRANT update ON informixoltp.broadcast_type_lu TO public;

GRANT delete ON informixoltp.broadcast TO public;

GRANT select ON informixoltp.broadcast TO public;

GRANT update ON informixoltp.broadcast TO public;

GRANT insert ON informixoltp.broadcast TO public;

GRANT update ON informixoltp.round_payment TO public;

GRANT delete ON informixoltp.round_payment TO public;

GRANT select ON informixoltp.round_payment TO public;

GRANT insert ON informixoltp.round_payment TO public;

GRANT delete ON informixoltp.sched_control TO public;

GRANT select ON informixoltp.sched_control TO public;

GRANT insert ON informixoltp.sched_control TO public;

GRANT update ON informixoltp.sched_control TO public;

GRANT select ON informixoltp.job_type_lu TO public;

GRANT update ON informixoltp.job_type_lu TO public;

GRANT insert ON informixoltp.job_type_lu TO public;

GRANT delete ON informixoltp.job_type_lu TO public;

GRANT delete ON informixoltp.job TO public;

GRANT insert ON informixoltp.job TO public;

GRANT select ON informixoltp.job TO public;

GRANT update ON informixoltp.job TO public;

GRANT select ON informixoltp.hit_type_lu TO public;

GRANT delete ON informixoltp.hit_type_lu TO public;

GRANT insert ON informixoltp.hit_type_lu TO public;

GRANT update ON informixoltp.hit_type_lu TO public;

GRANT update ON informixoltp.job_hit TO public;

GRANT insert ON informixoltp.job_hit TO public;

GRANT delete ON informixoltp.job_hit TO public;

GRANT select ON informixoltp.job_hit TO public;

GRANT update ON informixoltp.monitor_function_type_lu TO public;

GRANT insert ON informixoltp.monitor_function_type_lu TO public;

GRANT delete ON informixoltp.monitor_function_type_lu TO public;

GRANT select ON informixoltp.monitor_function_type_lu TO public;

GRANT select ON informixoltp.monitor_function TO public;

GRANT delete ON informixoltp.monitor_function TO public;

GRANT update ON informixoltp.monitor_function TO public;

GRANT insert ON informixoltp.monitor_function TO public;

GRANT insert ON informixoltp.monitor_user_round_xref TO public;

GRANT update ON informixoltp.monitor_user_round_xref TO public;

GRANT select ON informixoltp.monitor_user_round_xref TO public;

GRANT delete ON informixoltp.monitor_user_round_xref TO public;

GRANT update ON informixoltp.group_monitor_function_xref TO public;

GRANT select ON informixoltp.group_monitor_function_xref TO public;

GRANT insert ON informixoltp.group_monitor_function_xref TO public;

GRANT delete ON informixoltp.group_monitor_function_xref TO public;

GRANT update ON informixoltp.generic_counter_client TO public;

GRANT select ON informixoltp.generic_counter_client TO public;



GRANT insert ON informixoltp.generic_counter_client TO public;

GRANT delete ON informixoltp.generic_counter_client TO public;

GRANT insert ON informixoltp.company_user_xref TO public;

GRANT select ON informixoltp.company_user_xref TO public;

GRANT delete ON informixoltp.company_user_xref TO public;

GRANT update ON informixoltp.company_user_xref TO public;

GRANT update ON informixoltp.company_image_xref TO public;

GRANT insert ON informixoltp.company_image_xref TO public;

GRANT select ON informixoltp.company_image_xref TO public;

GRANT delete ON informixoltp.company_image_xref TO public;

GRANT select ON informixoltp.coder_confirmation TO public;

GRANT delete ON informixoltp.coder_confirmation TO public;

GRANT insert ON informixoltp.coder_confirmation TO public;

GRANT update ON informixoltp.coder_confirmation TO public;

GRANT insert ON informixoltp.component_type_lu TO public;

GRANT delete ON informixoltp.component_type_lu TO public;

GRANT update ON informixoltp.component_type_lu TO public;

GRANT select ON informixoltp.component_type_lu TO public;

GRANT select ON informixoltp.problem_type_lu TO public;

GRANT insert ON informixoltp.problem_type_lu TO public;

GRANT update ON informixoltp.problem_type_lu TO public;

GRANT delete ON informixoltp.problem_type_lu TO public;

GRANT update ON informixoltp.parameter TO public;

GRANT insert ON informixoltp.parameter TO public;

GRANT delete ON informixoltp.parameter TO public;

GRANT select ON informixoltp.parameter TO public;

GRANT update ON informixoltp.component_solution_xref TO public;

GRANT delete ON informixoltp.component_solution_xref TO public;

GRANT select ON informixoltp.component_solution_xref TO public;

GRANT insert ON informixoltp.component_solution_xref TO public;

GRANT insert ON informixoltp.component_status_lu TO public;

GRANT select ON informixoltp.component_status_lu TO public;

GRANT update ON informixoltp.component_status_lu TO public;

GRANT delete ON informixoltp.component_status_lu TO public;

GRANT select ON informixoltp.data_type_mapping TO public;

GRANT update ON informixoltp.data_type_mapping TO public;

GRANT delete ON informixoltp.data_type_mapping TO public;

GRANT insert ON informixoltp.data_type_mapping TO public;

GRANT insert ON informixoltp.web_service TO public;

GRANT delete ON informixoltp.web_service TO public;

GRANT select ON informixoltp.web_service TO public;

GRANT update ON informixoltp.web_service TO public;

GRANT insert ON informixoltp.web_service_file_type TO public;

GRANT update ON informixoltp.web_service_file_type TO public;

GRANT delete ON informixoltp.web_service_file_type TO public;

GRANT select ON informixoltp.web_service_file_type TO public;

GRANT delete ON informixoltp.web_service_source_file TO public;

GRANT insert ON informixoltp.web_service_source_file TO public;

GRANT update ON informixoltp.web_service_source_file TO public;

GRANT select ON informixoltp.web_service_source_file TO public;

GRANT update ON informixoltp.web_service_compilation TO public;

GRANT select ON informixoltp.web_service_compilation TO public;

GRANT insert ON informixoltp.web_service_compilation TO public;

GRANT delete ON informixoltp.web_service_compilation TO public;

GRANT select ON informixoltp.component_web_service_xref TO public;

GRANT update ON informixoltp.component_web_service_xref TO public;

GRANT insert ON informixoltp.component_web_service_xref TO public;

GRANT delete ON informixoltp.component_web_service_xref TO public;

GRANT insert ON informixoltp.problem_payment TO public;

GRANT update ON informixoltp.problem_payment TO public;

GRANT select ON informixoltp.problem_payment TO public;

GRANT delete ON informixoltp.problem_payment TO public;

GRANT update ON informixoltp.component TO public;

GRANT insert ON informixoltp.component TO public;

GRANT delete ON informixoltp.component TO public;

GRANT select ON informixoltp.component TO public;

GRANT insert ON informixoltp.file_type_lu TO public;

GRANT select ON informixoltp.file_type_lu TO public;

GRANT delete ON informixoltp.file_type_lu TO public;

GRANT update ON informixoltp.file_type_lu TO public;

GRANT delete ON informixoltp.resume TO public;

GRANT select ON informixoltp.resume TO public;

GRANT insert ON informixoltp.resume TO public;

GRANT update ON informixoltp.resume TO public;

GRANT select ON informixoltp.campaign TO public;

GRANT update ON informixoltp.campaign TO public;

GRANT insert ON informixoltp.campaign TO public;

GRANT delete ON informixoltp.campaign TO public;

GRANT delete ON informixoltp.activity TO public;

GRANT update ON informixoltp.activity TO public;

GRANT select ON informixoltp.activity TO public;

GRANT insert ON informixoltp.activity TO public;

GRANT select ON informixoltp.campaign_activity_xref TO public;

GRANT delete ON informixoltp.campaign_activity_xref TO public;

GRANT insert ON informixoltp.campaign_activity_xref TO public;

GRANT update ON informixoltp.campaign_activity_xref TO public;

GRANT delete ON informixoltp.campaign_job_xref TO public;

GRANT update ON informixoltp.campaign_job_xref TO public;

GRANT select ON informixoltp.campaign_job_xref TO public;

GRANT insert ON informixoltp.campaign_job_xref TO public;

GRANT insert ON informixoltp.problem TO public;

GRANT delete ON informixoltp.problem TO public;

GRANT select ON informixoltp.problem TO public;

GRANT update ON informixoltp.problem TO public;

GRANT insert ON informixoltp.sched_job_detail TO public;

GRANT select ON informixoltp.sched_job_detail TO public;

GRANT update ON informixoltp.sched_job_detail TO public;

GRANT delete ON informixoltp.sched_job_detail TO public;

GRANT insert ON informixoltp.round_image_xref TO public;

GRANT select ON informixoltp.round_image_xref TO public;

GRANT update ON informixoltp.round_image_xref TO public;

GRANT delete ON informixoltp.round_image_xref TO public;

GRANT select ON informixoltp.wl_coder TO public;

GRANT delete ON informixoltp.wl_coder TO public;

GRANT update ON informixoltp.wl_coder TO public;

GRANT insert ON informixoltp.wl_coder TO public;

GRANT delete ON informixoltp.wl_round TO public;

GRANT insert ON informixoltp.wl_round TO public;

GRANT update ON informixoltp.wl_round TO public;

GRANT select ON informixoltp.wl_round TO public;

GRANT select ON informixoltp.wl_team TO public;

GRANT update ON informixoltp.wl_team TO public;

GRANT insert ON informixoltp.wl_team TO public;

GRANT delete ON informixoltp.wl_team TO public;

GRANT select ON informixoltp.team_type_lu TO public;

GRANT delete ON informixoltp.team_type_lu TO public;

GRANT update ON informixoltp.team_type_lu TO public;

GRANT insert ON informixoltp.team_type_lu TO public;

GRANT update ON informixoltp.response TO public;

GRANT insert ON informixoltp.response TO public;

GRANT select ON informixoltp.response TO public;

GRANT delete ON informixoltp.response TO public;

GRANT insert ON informixoltp.team_coder_component_xref TO public;

GRANT update ON informixoltp.team_coder_component_xref TO public;

GRANT delete ON informixoltp.team_coder_component_xref TO public;

GRANT select ON informixoltp.team_coder_component_xref TO public;

GRANT insert ON informixoltp.team_coder_xref TO public;

GRANT delete ON informixoltp.team_coder_xref TO public;

GRANT update ON informixoltp.team_coder_xref TO public;

GRANT select ON informixoltp.team_coder_xref TO public;

GRANT delete ON informixoltp.problem_web_service_xref TO public;

GRANT insert ON informixoltp.problem_web_service_xref TO public;

GRANT select ON informixoltp.problem_web_service_xref TO public;

GRANT update ON informixoltp.problem_web_service_xref TO public;

GRANT update ON informixoltp.web_service_java_doc TO public;

GRANT insert ON informixoltp.web_service_java_doc TO public;

GRANT select ON informixoltp.web_service_java_doc TO public;

GRANT delete ON informixoltp.web_service_java_doc TO public;

GRANT update ON informixoltp.compilation TO public;

GRANT insert ON informixoltp.compilation TO public;

GRANT delete ON informixoltp.compilation TO public;

GRANT select ON informixoltp.compilation TO public;

GRANT update ON informixoltp.submission TO public;

GRANT insert ON informixoltp.submission TO public;

GRANT delete ON informixoltp.submission TO public;

GRANT select ON informixoltp.submission TO public;



GRANT select ON informixoltp.donation_type_lu TO public;

GRANT insert ON informixoltp.donation_type_lu TO public;

GRANT delete ON informixoltp.donation_type_lu TO public;

GRANT update ON informixoltp.donation_type_lu TO public;

GRANT select ON informixoltp.charity_donation TO public;

GRANT insert ON informixoltp.charity_donation TO public;

GRANT update ON informixoltp.charity_donation TO public;



GRANT delete ON informixoltp.charity_donation TO public;

GRANT delete ON informixoltp.question TO public;

GRANT insert ON informixoltp.question TO public;

GRANT update ON informixoltp.question TO public;

GRANT select ON informixoltp.question TO public;

GRANT delete ON informixoltp.problem_rating_question TO public;

GRANT select ON informixoltp.problem_rating_question TO public;

GRANT insert ON informixoltp.problem_rating_question TO public;

GRANT update ON informixoltp.problem_rating_question TO public;



GRANT delete ON informixoltp.problem_rating TO public;

GRANT update ON informixoltp.problem_rating TO public;

GRANT insert ON informixoltp.problem_rating TO public;



GRANT select ON informixoltp.problem_rating TO public;



GRANT update ON informixoltp.question_image_xref TO public;

GRANT select ON informixoltp.question_image_xref TO public;

GRANT delete ON informixoltp.question_image_xref TO public;

GRANT insert ON informixoltp.question_image_xref TO public;

GRANT delete ON informixoltp.visa_letter_request TO public;

GRANT insert ON informixoltp.visa_letter_request TO public;

GRANT update ON informixoltp.visa_letter_request TO public;

GRANT select ON informixoltp.visa_letter_request TO public;

GRANT delete ON informixoltp.visa_letter_event TO public;

GRANT select ON informixoltp.visa_letter_event TO public;

GRANT update ON informixoltp.visa_letter_event TO public;

GRANT insert ON informixoltp.visa_letter_event TO public;

GRANT update ON informixoltp.royalty_temp TO public;

GRANT select ON informixoltp.royalty_temp TO public;

GRANT insert ON informixoltp.royalty_temp TO public;

GRANT delete ON informixoltp.royalty_temp TO public;



GRANT delete ON informixoltp.assignment_document_type_lu TO public;

GRANT select ON informixoltp.assignment_document_type_lu TO public;

GRANT update ON informixoltp.assignment_document_type_lu TO public;



GRANT insert ON informixoltp.assignment_document_type_lu TO public;

GRANT select ON informixoltp.assignment_document_status_lu TO public;

GRANT update ON informixoltp.assignment_document_status_lu TO public;



GRANT delete ON informixoltp.assignment_document_status_lu TO public;

GRANT insert ON informixoltp.assignment_document_status_lu TO public;



GRANT update ON informixoltp.staging_component_state TO public;

GRANT delete ON informixoltp.staging_component_state TO public;

GRANT insert ON informixoltp.staging_component_state TO public;

GRANT select ON informixoltp.staging_component_state TO public;

GRANT update ON informixoltp.round_room_assignment TO public;

GRANT insert ON informixoltp.round_room_assignment TO public;

GRANT delete ON informixoltp.round_room_assignment TO public;

GRANT select ON informixoltp.round_room_assignment TO public;



GRANT delete ON informixoltp.round_terms TO public;



GRANT update ON informixoltp.round_terms TO public;

GRANT insert ON informixoltp.round_terms TO public;

GRANT select ON informixoltp.round_terms TO public;

GRANT select ON informixoltp.round_terms_acceptance TO public;

GRANT delete ON informixoltp.round_terms_acceptance TO public;

GRANT insert ON informixoltp.round_terms_acceptance TO public;



GRANT update ON informixoltp.round_terms_acceptance TO public;

GRANT delete ON informixoltp.backup TO public;

GRANT select ON informixoltp.backup TO public;

GRANT insert ON informixoltp.backup TO public;



GRANT update ON informixoltp.backup TO public;

GRANT insert ON informixoltp.backup_tables TO public;

GRANT select ON informixoltp.backup_tables TO public;

GRANT update ON informixoltp.backup_tables TO public;



GRANT delete ON informixoltp.backup_tables TO public;

GRANT select ON informixoltp.assignment_document TO public;



GRANT insert ON informixoltp.assignment_document TO public;

GRANT update ON informixoltp.assignment_document TO public;

GRANT delete ON informixoltp.assignment_document TO public;

GRANT insert ON informixoltp.component_category_lu TO public;

GRANT delete ON informixoltp.component_category_lu TO public;



GRANT update ON informixoltp.component_category_lu TO public;

GRANT select ON informixoltp.component_category_lu TO public;

GRANT update ON informixoltp.component_category_xref TO public;

GRANT select ON informixoltp.component_category_xref TO public;

GRANT insert ON informixoltp.component_category_xref TO public;

GRANT delete ON informixoltp.component_category_xref TO public;



GRANT select ON informixoltp.room_result TO public;

GRANT insert ON informixoltp.room_result TO public;

GRANT update ON informixoltp.room_result TO public;

GRANT delete ON informixoltp.room_result TO public;

GRANT select ON informixoltp.campaign_round_xref TO public;

GRANT insert ON informixoltp.campaign_round_xref TO public;

GRANT update ON informixoltp.campaign_round_xref TO public;

GRANT delete ON informixoltp.campaign_round_xref TO public;



GRANT update ON informixoltp.campaign_type_lu TO public;

GRANT insert ON informixoltp.campaign_type_lu TO public;

GRANT delete ON informixoltp.campaign_type_lu TO public;

GRANT select ON informixoltp.campaign_type_lu TO public;



GRANT delete ON informixoltp.skill TO public;

GRANT update ON informixoltp.skill TO public;

GRANT select ON informixoltp.skill TO public;

GRANT insert ON informixoltp.skill TO public;

GRANT select ON informixoltp.coder_skill_type_note_xref TO public;

GRANT insert ON informixoltp.coder_skill_type_note_xref TO public;

GRANT update ON informixoltp.coder_skill_type_note_xref TO public;

GRANT delete ON informixoltp.coder_skill_type_note_xref TO public;



GRANT insert ON informixoltp.staging_submission TO public;

GRANT select ON informixoltp.staging_submission TO public;

GRANT update ON informixoltp.staging_submission TO public;

GRANT delete ON informixoltp.staging_submission TO public;

GRANT delete ON informixoltp.staging_compilation TO public;

GRANT update ON informixoltp.staging_compilation TO public;

GRANT select ON informixoltp.staging_compilation TO public;

GRANT insert ON informixoltp.staging_compilation TO public;

GRANT update ON informixoltp.staging_system_test_result TO public;

GRANT select ON informixoltp.staging_system_test_result TO public;

GRANT insert ON informixoltp.staging_system_test_result TO public;

GRANT delete ON informixoltp.staging_system_test_result TO public;

GRANT insert ON informixoltp.staging_system_test_case TO public;

GRANT update ON informixoltp.staging_system_test_case TO public;

GRANT delete ON informixoltp.staging_system_test_case TO public;

GRANT select ON informixoltp.staging_system_test_case TO public;

GRANT select ON informixoltp.system_test_case TO public;

GRANT insert ON informixoltp.system_test_case TO public;

GRANT update ON informixoltp.system_test_case TO public;

GRANT delete ON informixoltp.system_test_case TO public;

GRANT select ON informixoltp.country_affidavit_template_xref TO public;

GRANT insert ON informixoltp.country_affidavit_template_xref TO public;

GRANT delete ON informixoltp.country_affidavit_template_xref TO public;

GRANT update ON informixoltp.country_affidavit_template_xref TO public;





GRANT delete ON informixoltp.assignment_document_template TO public;

GRANT insert ON informixoltp.assignment_document_template TO public;

GRANT update ON informixoltp.assignment_document_template TO public;

GRANT select ON informixoltp.assignment_document_template TO public;

GRANT select ON informixoltp.practice_room_result TO public;

GRANT delete ON informixoltp.practice_room_result TO public;

GRANT update ON informixoltp.practice_room_result TO public;

GRANT insert ON informixoltp.practice_room_result TO public;

GRANT select ON informixoltp.practice_component_state TO public;

GRANT delete ON informixoltp.practice_component_state TO public;

GRANT update ON informixoltp.practice_component_state TO public;

GRANT insert ON informixoltp.practice_component_state TO public;

GRANT insert ON informixoltp.message_status_lu TO public;

GRANT select ON informixoltp.message_status_lu TO public;

GRANT delete ON informixoltp.message_status_lu TO public;



GRANT update ON informixoltp.message_status_lu TO public;

GRANT select ON informixoltp.message TO public;

GRANT update ON informixoltp.message TO public;



GRANT delete ON informixoltp.message TO public;

GRANT insert ON informixoltp.message TO public;

GRANT select ON informixoltp.user_message_status_lu TO public;



GRANT insert ON informixoltp.user_message_status_lu TO public;

GRANT update ON informixoltp.user_message_status_lu TO public;

GRANT delete ON informixoltp.user_message_status_lu TO public;

GRANT delete ON informixoltp.user_message TO public;

GRANT insert ON informixoltp.user_message TO public;

GRANT update ON informixoltp.user_message TO public;

GRANT select ON informixoltp.user_message TO public;



GRANT update ON informixoltp.failure_type_lu TO public;

GRANT insert ON informixoltp.failure_type_lu TO public;

GRANT delete ON informixoltp.failure_type_lu TO public;



GRANT select ON informixoltp.failure_type_lu TO public;



GRANT select ON informixoltp.payment_detail_pablo TO public;

GRANT update ON informixoltp.payment_detail_pablo TO public;

GRANT insert ON informixoltp.payment_detail_pablo TO public;

GRANT delete ON informixoltp.payment_detail_pablo TO public;

GRANT update ON informixoltp.payment_detail_xref_pablo TO public;

GRANT insert ON informixoltp.payment_detail_xref_pablo TO public;



GRANT select ON informixoltp.payment_detail_xref_pablo TO public;

GRANT delete ON informixoltp.payment_detail_xref_pablo TO public;

GRANT delete ON informixoltp.payment_pablo TO public;

GRANT select ON informixoltp.payment_pablo TO public;

GRANT update ON informixoltp.payment_pablo TO public;

GRANT insert ON informixoltp.payment_pablo TO public;



GRANT select ON informixoltp.timers TO public;

GRANT delete ON informixoltp.timers TO public;

GRANT update ON informixoltp.timers TO public;

GRANT insert ON informixoltp.timers TO public;



GRANT insert ON informixoltp.jms_messages TO public;

GRANT select ON informixoltp.jms_messages TO public;



GRANT delete ON informixoltp.jms_messages TO public;

GRANT update ON informixoltp.jms_messages TO public;

GRANT select ON informixoltp.jms_transactions TO public;

GRANT insert ON informixoltp.jms_transactions TO public;

GRANT update ON informixoltp.jms_transactions TO public;

GRANT delete ON informixoltp.jms_transactions TO public;



GRANT update ON informixoltp.jms_users TO public;

GRANT insert ON informixoltp.jms_users TO public;

GRANT delete ON informixoltp.jms_users TO public;

GRANT select ON informixoltp.jms_users TO public;





GRANT insert ON informixoltp.jms_roles TO public;

GRANT select ON informixoltp.jms_roles TO public;

GRANT update ON informixoltp.jms_roles TO public;

GRANT delete ON informixoltp.jms_roles TO public;

GRANT insert ON informixoltp.jms_subscriptions TO public;

GRANT delete ON informixoltp.jms_subscriptions TO public;



GRANT select ON informixoltp.jms_subscriptions TO public;

GRANT update ON informixoltp.jms_subscriptions TO public;

GRANT delete ON informixoltp.payment_detail_pablo_dec TO public;

GRANT select ON informixoltp.payment_detail_pablo_dec TO public;

GRANT update ON informixoltp.payment_detail_pablo_dec TO public;

GRANT insert ON informixoltp.payment_detail_pablo_dec TO public;



GRANT select ON informixoltp.solution_class_file TO public;

GRANT delete ON informixoltp.solution_class_file TO public;

GRANT insert ON informixoltp.solution_class_file TO public;

GRANT update ON informixoltp.solution_class_file TO public;



GRANT update ON informixoltp.survey TO public;

GRANT insert ON informixoltp.survey TO public;

GRANT select ON informixoltp.survey TO public;

GRANT delete ON informixoltp.survey TO public;

GRANT delete ON informixoltp.payment_detail_dr20075 TO public;

GRANT select ON informixoltp.payment_detail_dr20075 TO public;



GRANT update ON informixoltp.payment_detail_dr20075 TO public;

GRANT insert ON informixoltp.payment_detail_dr20075 TO public;

GRANT delete ON informixoltp.payment_pablo_dec TO public;

GRANT insert ON informixoltp.payment_pablo_dec TO public;



GRANT update ON informixoltp.payment_pablo_dec TO public;

GRANT select ON informixoltp.payment_pablo_dec TO public;

GRANT insert ON informixoltp.long_test_queue_status_lu TO public;

GRANT update ON informixoltp.long_test_queue_status_lu TO public;

GRANT select ON informixoltp.long_test_queue_status_lu TO public;

GRANT delete ON informixoltp.long_test_queue_status_lu TO public;



GRANT insert ON informixoltp.intro_event_property_lu TO public;

GRANT select ON informixoltp.intro_event_property_lu TO public;

GRANT update ON informixoltp.intro_event_property_lu TO public;

GRANT delete ON informixoltp.intro_event_property_lu TO public;



GRANT update ON informixoltp.intro_event_config TO public;



GRANT delete ON informixoltp.intro_event_config TO public;

GRANT insert ON informixoltp.intro_event_config TO public;

GRANT select ON informixoltp.intro_event_config TO public;



GRANT select ON informixoltp.intro_event TO public;

GRANT delete ON informixoltp.intro_event TO public;

GRANT insert ON informixoltp.intro_event TO public;

GRANT update ON informixoltp.intro_event TO public;



GRANT delete ON informixoltp.generic_counter TO public;

GRANT select ON informixoltp.generic_counter TO public;

GRANT insert ON informixoltp.generic_counter TO public;

GRANT update ON informixoltp.generic_counter TO public;

GRANT update ON informixoltp.system_test_output TO public;



GRANT delete ON informixoltp.system_test_output TO public;

GRANT insert ON informixoltp.system_test_output TO public;

GRANT select ON informixoltp.system_test_output TO public;

GRANT delete ON informixoltp.payment_detail_xref_pablo_dec TO public;

GRANT update ON informixoltp.payment_detail_xref_pablo_dec TO public;

GRANT select ON informixoltp.payment_detail_xref_pablo_dec TO public;

GRANT insert ON informixoltp.payment_detail_xref_pablo_dec TO public;



GRANT insert ON informixoltp.miketemp TO public;

GRANT delete ON informixoltp.miketemp TO public;

GRANT update ON informixoltp.miketemp TO public;



GRANT select ON informixoltp.miketemp TO public;



GRANT select ON informixoltp.long_component_state TO public;

GRANT update ON informixoltp.long_component_state TO public;

GRANT delete ON informixoltp.long_component_state TO public;

GRANT insert ON informixoltp.long_component_state TO public;

GRANT update ON informixoltp.long_compilation TO public;



GRANT delete ON informixoltp.long_compilation TO public;

GRANT insert ON informixoltp.long_compilation TO public;

GRANT select ON informixoltp.long_compilation TO public;



GRANT update ON informixoltp.long_comp_result TO public;

GRANT insert ON informixoltp.long_comp_result TO public;

GRANT select ON informixoltp.long_comp_result TO public;

GRANT delete ON informixoltp.long_comp_result TO public;

GRANT insert ON informixoltp.long_submission TO public;



GRANT select ON informixoltp.long_submission TO public;

GRANT delete ON informixoltp.long_submission TO public;

GRANT update ON informixoltp.long_submission TO public;

GRANT update ON informixoltp.long_system_test_result TO public;

GRANT select ON informixoltp.long_system_test_result TO public;



GRANT delete ON informixoltp.long_system_test_result TO public;

GRANT insert ON informixoltp.long_system_test_result TO public;



GRANT select ON informixoltp.long_system_test_output TO public;

GRANT insert ON informixoltp.long_system_test_output TO public;

GRANT delete ON informixoltp.long_system_test_output TO public;

GRANT update ON informixoltp.long_system_test_output TO public;

GRANT delete ON informixoltp.long_test_queue TO public;

GRANT insert ON informixoltp.long_test_queue TO public;

GRANT select ON informixoltp.long_test_queue TO public;



GRANT update ON informixoltp.long_test_queue TO public;

GRANT delete ON informixoltp.intro_event_property_type_lu TO public;



GRANT select ON informixoltp.intro_event_property_type_lu TO public;

GRANT update ON informixoltp.intro_event_property_type_lu TO public;

GRANT insert ON informixoltp.intro_event_property_type_lu TO public;

GRANT update ON informixoltp.compilation_class_file TO public;

GRANT delete ON informixoltp.compilation_class_file TO public;

GRANT select ON informixoltp.compilation_class_file TO public;

GRANT insert ON informixoltp.compilation_class_file TO public;

GRANT update ON informixoltp.submission_class_file TO public;

GRANT insert ON informixoltp.submission_class_file TO public;

GRANT delete ON informixoltp.submission_class_file TO public;

GRANT select ON informixoltp.submission_class_file TO public;

GRANT update ON informixoltp.country_region_xref TO public;

GRANT select ON informixoltp.country_region_xref TO public;



GRANT insert ON informixoltp.country_region_xref TO public;

GRANT delete ON informixoltp.country_region_xref TO public;



GRANT select ON informixoltp.payment_detail_xref_dr20075 TO public;

GRANT delete ON informixoltp.payment_detail_xref_dr20075 TO public;

GRANT update ON informixoltp.payment_detail_xref_dr20075 TO public;

GRANT insert ON informixoltp.payment_detail_xref_dr20075 TO public;

GRANT INSERT, DELETE, SELECT, UPDATE ON informixoltp.invoice_type_lu TO public;

GRANT INSERT, DELETE, SELECT, UPDATE ON informixoltp.invoice_record TO public;

GRANT INSERT, DELETE, SELECT, UPDATE ON informixoltp.invoice TO public;
GRANT insert, update, select, delete ON informixoltp.round_event TO public;

GRANT insert, update, select, delete ON informixoltp.user_api_spin TO public;

GRANT insert, update, select, delete ON informixoltp.docusign_envelope TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_PATH_SEQ INCREMENT BY 1 START WITH 30000000;

REVOKE ALL ON informixoltp.SEQUENCE_PATH_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_PATH_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_IMAGE_SEQ INCREMENT BY 1 START WITH 1000000;

REVOKE ALL ON informixoltp.SEQUENCE_IMAGE_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_IMAGE_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_SURVEY_SEQ INCREMENT BY 1 START WITH 1000000;

REVOKE ALL ON informixoltp.SEQUENCE_SURVEY_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_SURVEY_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_ROOM_SEQ INCREMENT BY 1 START WITH 1000000;

REVOKE ALL ON informixoltp.SEQUENCE_ROOM_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_ROOM_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_ROUND_SEQ INCREMENT BY 1 START WITH 1000000;

REVOKE ALL ON informixoltp.SEQUENCE_ROUND_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_ROUND_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_CONTEST_SEQ INCREMENT BY 1 START WITH 1000000;

REVOKE ALL ON informixoltp.SEQUENCE_CONTEST_SEQ FROM PUBLIC;

GRANT select ON informixoltp.SEQUENCE_CONTEST_SEQ TO public;

GRANT insert, update, select, delete ON informixoltp.round_prize TO public;

SET search_path TO tcs_catalog;
CREATE OR REPLACE VIEW informixoltp.active_data_science_challenges (challenge_type, challenge_name, challenge_id, num_submissions,
                                                     num_registrants, registration_start_date, submission_end_date,
                                                     challenge_community, posting_date) as
    -- Data Science projects
SELECT
    pcl.description AS challenge_type
    , pn.value AS challenge_name
    , p.project_id AS challenge_id
    , (SELECT COUNT(*) FROM tcs_catalog.submission s1 INNER JOIN tcs_catalog.upload u1 ON s1.upload_id = u1.upload_id
          WHERE u1.project_id = p.project_id
              AND s1.submission_type_id = 1
              AND s1.submission_status_id <> 5) AS num_submissions
    , (SELECT COUNT(*) FROM tcs_catalog.resource r WHERE r.project_id = p.project_id AND r.resource_role_id = 1) AS num_registrants
    , COALESCE(pp1.actual_start_time, pp1.scheduled_start_time)::TIMESTAMP AS registration_start_date
    , COALESCE(pp2.actual_end_time, pp2.scheduled_end_time)::TIMESTAMP AS submission_end_date
    , 'Develop'::varchar(50) as challenge_community
    , COALESCE(pp1.actual_start_time, pp1.scheduled_start_time)::TIMESTAMP AS posting_date
FROM tcs_catalog.project p
    , tcs_catalog.project_phase pp1 --registration phase
    , tcs_catalog.project_phase pp2 --submission phase
    , tcs_catalog.project_info pn
    , tcs_catalog.project_category_lu pcl
    , tcs_catalog.project_info pi1 -- external id
WHERE p.project_id = pn.project_id
    AND pn.project_info_type_id = 6
    AND pp1.project_id = p.project_id
    AND pp1.phase_type_id = 1  --registration phase
    AND pp2.project_id = p.project_id
    AND pp2.phase_type_id = 2  --submission phase
    AND p.project_category_id = pcl.project_category_id
    AND p.project_status_id = 1
    AND pcl.project_category_id NOT IN (27, 37) --exclude when spec review was a 'contest.' Also exclude MM, which is in there as a 'software' contest.
    AND pp1.phase_status_id IN (2, 3)
    AND pi1.project_info_type_id = 1 -- external reference id
    AND pi1.project_id = p.project_id
    AND EXISTS (SELECT DISTINCT 1 FROM tcs_catalog.comp_technology ct WHERE ct.comp_vers_id = cast(pi1.value as decimal)AND ct.technology_type_id = 27621212)
    -- SRMs
union all
select
    'SRM'::varchar(254) as challenge_type,
    r.short_name::varchar(128) as challenge_name,
    r.round_id as challenge_id,
    (select count(*) from informixoltp.room_result rre where rre.round_id = r.round_id) as num_submissions,
    (select count(*) from informixoltp.round_registration rr where rr.round_id = r.round_id) as num_registrants,
    rs1.start_time::TIMESTAMP as registration_start_date,
    rs2.end_time::TIMESTAMP as submission_end_date,
    'Data'::varchar(50) as challenge_community,
    rs1.start_time::TIMESTAMP as posting_date
from informixoltp.contest c
join informixoltp.round as r on r.contest_id = c.contest_id and r.status='A'
join informixoltp.round_segment rs1 on rs1.round_id = r.round_id and rs1.segment_id = 1
join informixoltp.round_segment rs2 on rs2.round_id = r.round_id and rs2.segment_id = 2
where  r.round_type_id in (1, 2, 10)
  and current_timestamp between rs1.start_time and rs2.end_time
    -- Marathon Matches
union all
select
    'Marathon'::varchar(254) as challenge_type,
    c.name || ' ' || r.name::varchar(128) as challenge_name,
    r.round_id as challenge_id,
    (select count(*) from informixoltp.long_component_state cs, informixoltp.long_submission s where s.example = 0 and s.long_component_state_id = cs.long_component_state_id and cs.round_id = r.round_id) as num_submissions,
    (select count(*) from informixoltp.round_registration rr where rr.round_id = r.round_id) as num_registrants,
    rs1.start_time::TIMESTAMP as registration_start_date,
    rs2.end_time::TIMESTAMP as submission_end_date,
    'Data'::varchar(50) as challenge_community,
    rs1.start_time::TIMESTAMP as posting_date
from informixoltp.contest c
join informixoltp.round as r on r.contest_id = c.contest_id and (r.status='A' or r.status = 'F')
join informixoltp.round_segment rs1 on rs1.round_id = r.round_id and rs1.segment_id = 1 -- registration phase
join informixoltp.round_segment rs2 on rs2.round_id = r.round_id and rs2.segment_id = 2 -- coding phase
where r.round_type_id in (10,13,15,19,22,24,25,27)
  and current_timestamp between rs1.start_time and rs2.end_time;

GRANT select ON informixoltp.active_data_science_challenges TO coder;

CREATE OR REPLACE VIEW informixoltp.upcoming_data_science_challenges (challenge_type, challenge_name, challenge_id, num_submissions,
                                                     num_registrants, registration_start_date, submission_end_date,
                                                     challenge_community, posting_date) as
    -- Data Science projects
SELECT
    pcl.description AS challenge_type
    , pn.value AS challenge_name
    , p.project_id AS challenge_id
    , (SELECT COUNT(*) FROM tcs_catalog.submission s1 INNER JOIN tcs_catalog.upload u1 ON s1.upload_id = u1.upload_id
          WHERE u1.project_id = p.project_id
              AND s1.submission_type_id = 1
              AND s1.submission_status_id <> 5) AS num_submissions
    , (SELECT COUNT(*) FROM tcs_catalog.resource r WHERE r.project_id = p.project_id AND r.resource_role_id = 1) AS num_registrants
    , COALESCE(pp1.actual_start_time, pp1.scheduled_start_time)::TIMESTAMP AS registration_start_date
    , COALESCE(pp2.actual_end_time, pp2.scheduled_end_time)::TIMESTAMP AS submission_end_date
    , 'Develop'::varchar(50) as challenge_community
    , COALESCE(pp1.actual_start_time, pp1.scheduled_start_time)::TIMESTAMP AS posting_date
FROM tcs_catalog.project p
    , tcs_catalog.project_phase pp1 --registration phase
    , tcs_catalog.project_phase pp2 --submission phase
    , tcs_catalog.project_info pn
    , tcs_catalog.project_category_lu pcl
    , tcs_catalog.project_info pi1 -- external id
WHERE p.project_id = pn.project_id
    AND pn.project_info_type_id = 6
    AND pp1.project_id = p.project_id
    AND pp1.phase_type_id = 1  --registration phase
    AND pp2.project_id = p.project_id
    AND pp2.phase_type_id = 2  --submission phase
    AND p.project_category_id = pcl.project_category_id
    AND p.project_status_id in (1,2)
    AND pcl.project_category_id NOT IN (27, 37) --exclude when spec review was a 'contest.' Also exclude MM, which is in there as a 'software' contest.
    AND pp1.phase_status_id = 1
    AND pp1.scheduled_start_time > current_timestamp
    AND pp1.scheduled_start_time < current_timestamp + interval '90' DAY
    AND pi1.project_info_type_id = 1 -- external reference id
    AND pi1.project_id = p.project_id
    AND EXISTS (SELECT DISTINCT 1 FROM tcs_catalog.comp_technology ct WHERE ct.comp_vers_id = cast( pi1.value as decimal) AND ct.technology_type_id = 27621212)
    -- SRMs
union all
select
    'SRM'::varchar(254) as challenge_type,
    r.short_name::varchar(128) as challenge_name,
    r.round_id as challenge_id,
    (select count(*) from informixoltp.room_result rre where rre.round_id = r.round_id) as num_submissions,
    (select count(*) from informixoltp.round_registration rr where rr.round_id = r.round_id) as num_registrants,
    rs1.start_time::TIMESTAMP as registration_start_date,
    rs2.end_time::TIMESTAMP as submission_end_date,
    'Data'::varchar(50) as challenge_community,
    rs1.start_time::TIMESTAMP as posting_date
from informixoltp.contest c
join informixoltp.round as r on r.contest_id = c.contest_id and r.status='F'
join informixoltp.round_segment rs1 on rs1.round_id = r.round_id and rs1.segment_id = 1
join informixoltp.round_segment rs2 on rs2.round_id = r.round_id and rs2.segment_id = 2
where  r.round_type_id in (1, 2, 10)
    -- Marathon Matches
union all
select
    'Marathon'::varchar(254) as challenge_type,
    c.name || ' ' || r.name::varchar(128) as challenge_name,
    r.round_id as challenge_id,
    (select count(*) from informixoltp.long_component_state cs, informixoltp.long_submission s where s.example = 0 and s.long_component_state_id = cs.long_component_state_id and cs.round_id = r.round_id) as num_submissions,
    (select count(*) from informixoltp.round_registration rr where rr.round_id = r.round_id) as num_registrants,
    rs1.start_time::TIMESTAMP as registration_start_date,
    rs2.end_time::TIMESTAMP as submission_end_date,
    'Data'::varchar(50) as challenge_community,
    rs1.start_time::TIMESTAMP as posting_date
from informixoltp.contest c
join informixoltp.round as r on r.contest_id = c.contest_id and r.status='F'
join informixoltp.round_segment rs1 on rs1.round_id = r.round_id and rs1.segment_id = 1 -- registration phase
join informixoltp.round_segment rs2 on rs2.round_id = r.round_id and rs2.segment_id = 2 -- coding phase
where r.round_type_id in (10,13,15,19,22,24,25,27) ;

GRANT select ON informixoltp.upcoming_data_science_challenges TO coder;
