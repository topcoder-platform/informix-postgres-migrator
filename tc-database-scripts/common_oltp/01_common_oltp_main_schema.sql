-- Create database
-- Create schema (database)
CREATE schema IF NOT EXISTS common_oltp authorization postgres;

--Create users/roles
CREATE ROLE coder ;
CREATE ROLE db_sales_im ;
CREATE ROLE veredox ;
CREATE ROLE openaim ;
CREATE ROLE truveo ;
CREATE ROLE cockpit ;
CREATE ROLE winformula ;
CREATE ROLE openxtraz ;

SET search_path TO common_oltp;

-- Grant access
GRANT USAGE ON SCHEMA common_oltp To postgres;
GRANT USAGE ON SCHEMA common_oltp TO coder ;
GRANT USAGE ON SCHEMA common_oltp TO db_sales_im ;
GRANT USAGE ON SCHEMA common_oltp TO veredox ;
GRANT USAGE ON SCHEMA common_oltp TO openaim ;
GRANT USAGE ON SCHEMA common_oltp TO truveo ;
GRANT USAGE ON SCHEMA common_oltp TO cockpit ;
GRANT USAGE ON SCHEMA common_oltp TO winformula ;
GRANT USAGE ON SCHEMA common_oltp TO openxtraz ;

-- User public does not have connect privilege;
CREATE TABLE IF NOT EXISTS common_oltp.security_user (
    login_id DECIMAL(12,0) not null,
    user_id VARCHAR(50) not null,
    password VARCHAR(300) not null,
    create_user_id DECIMAL(12,0)
)
;

REVOKE ALL ON common_oltp.security_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_role_xref (
    user_role_id DECIMAL(12,0) not null,
    login_id DECIMAL(12,0),
    role_id DECIMAL(12,0),
    create_user_id DECIMAL(12,0),
    security_status_id DECIMAL(3,0)
)
;

REVOKE ALL ON common_oltp.user_role_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_group_xref (
    user_group_id DECIMAL(12,0) not null,
    login_id DECIMAL(12,0),
    group_id DECIMAL(12,0),
    create_user_id DECIMAL(12,0),
    security_status_id DECIMAL(3,0),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_group_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.security_groups (
    group_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null,
    challenge_group_ind smallint DEFAULT 0 NOT NULL,
    create_user_id DECIMAL(12,0)
)
;

REVOKE ALL ON common_oltp.security_groups FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.group_role_xref (
    group_role_id DECIMAL(12,0) not null,
    group_id DECIMAL(12,0),
    role_id DECIMAL(12,0),
    create_user_id DECIMAL(12,0),
    security_status_id DECIMAL(3,0)
)
;

REVOKE ALL ON common_oltp.group_role_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.security_roles (
    role_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null,
    create_user_id DECIMAL(12,0)
)
;

REVOKE ALL ON common_oltp.security_roles FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.security_perms (
    role_id DECIMAL(12,0) not null,
    permission VARCHAR(254) not null,
    create_user_id DECIMAL(12,0),
    security_status_id DECIMAL(3,0)
)
;

REVOKE ALL ON common_oltp.security_perms FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.address (
    address_id DECIMAL(10,0),
    address_type_id DECIMAL(5,0),
    address1 VARCHAR(254),
    address2 VARCHAR(254),
    city VARCHAR(64),
    state_code CHAR(2),
    zip VARCHAR(15),
    country_code CHAR(3),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    address3 VARCHAR(254),
    province VARCHAR(64)
)
;

REVOKE ALL ON common_oltp.address FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.address_type_lu (
    address_type_id DECIMAL(5,0),
    address_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.address_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.phone_type_lu (
    phone_type_id DECIMAL(5,0),
    phone_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.phone_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.email (
    user_id DECIMAL(10,0),
    email_id DECIMAL(10,0),
    email_type_id DECIMAL(5,0),
    address VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    primary_ind DECIMAL(1,0),
    status_id DECIMAL(3,0)
)
;

REVOKE ALL ON common_oltp.email FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_address_xref (
    user_id DECIMAL(10,0),
    address_id DECIMAL(10,0)
)
;

REVOKE ALL ON common_oltp.user_address_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.phone (
    user_id DECIMAL(10,0),
    phone_id DECIMAL(10,0),
    phone_type_id DECIMAL(5,0),
    phone_number VARCHAR(64),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    primary_ind DECIMAL(1,0)
)
;

REVOKE ALL ON common_oltp.phone FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_status_lu (
    user_status_id DECIMAL(5,0),
    description VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.user_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.terms_of_use_agreeability_type_lu (
    terms_of_use_agreeability_type_id DECIMAL(5,0) NOT NULL,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(100) NOT NULL
)
;

REVOKE ALL ON common_oltp.terms_of_use_agreeability_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.terms_of_use (
    terms_of_use_id DECIMAL(10,0) NOT NULL,
    terms_text TEXT,
    terms_of_use_type_id DECIMAL(5,0) NOT NULL,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    title VARCHAR(50) NOT NULL,
    url VARCHAR(100),
	terms_of_use_agreeability_type_id DECIMAL(5,0) DEFAULT 3 NOT NULL
)
;

REVOKE ALL ON common_oltp.terms_of_use FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.terms_of_use_type (
    terms_of_use_type_id DECIMAL(5,0) NOT NULL,
    terms_of_use_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.terms_of_use_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_terms_of_use_xref (
    user_id DECIMAL(10,0) NOT NULL,
    terms_of_use_id DECIMAL(10,0) NOT NULL,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_terms_of_use_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_terms_of_use_ban_xref (
    user_id DECIMAL(10,0) NOT NULL,
    terms_of_use_id DECIMAL(10,0) NOT NULL,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_terms_of_use_ban_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.project_role_terms_of_use_xref (
    project_id INT not null,
    resource_role_id INT not null,
    terms_of_use_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    sort_order DECIMAL(1,0) DEFAULT 1 NOT NULL,
    group_ind INT DEFAULT 0 NOT NULL
)
;

REVOKE ALL ON common_oltp.project_role_terms_of_use_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.terms_of_use_dependency (
    dependency_terms_of_use_id DECIMAL(10,0) NOT NULL,
    dependent_terms_of_use_id DECIMAL(10,0) NOT NULL
)
;

REVOKE ALL ON common_oltp.terms_of_use_dependency FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.state (
    state_code VARCHAR(2),
    state_name VARCHAR(35) not null,
    region_code VARCHAR(3),
    modify_date TIMESTAMP default now(),
    demographic_decline DECIMAL(1,0)
)
;

CREATE TABLE IF NOT EXISTS common_oltp.terms_of_use_docusign_template_xref (
    terms_of_use_id DECIMAL(10,0) NOT NULL,
    docusign_template_id VARCHAR(64) NOT NULL
)
;

REVOKE ALL ON common_oltp.state FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.country (
    country_code VARCHAR(3),
    country_name VARCHAR(40) not null,
    modify_date TIMESTAMP default now(),
    participating DECIMAL(1,0),
    default_taxform_id DECIMAL(10,0),
    longitude DECIMAL(10,7),
    latitude DECIMAL(10,7),
	region VARCHAR(64),
	iso_name VARCHAR(128),
	iso_alpha2_code VARCHAR(2),
	iso_alpha3_code VARCHAR(3)
)
;

REVOKE ALL ON common_oltp.country FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.dual (
    value INT
)
;

REVOKE ALL ON common_oltp.dual FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.contact (
    contact_id DECIMAL(10,0) not null,
    company_id DECIMAL(10,0) not null,
    title VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.contact FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.note (
    note_id DECIMAL(10,0) not null,
    text TEXT,
    submitted_by DECIMAL(10,0) not null,
    note_type_id DECIMAL(3,0) not null,
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.note FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_note_xref (
    user_id DECIMAL(10,0) not null,
    note_id DECIMAL(10,0) not null,
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_note_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.note_type_lu (
    note_type_id DECIMAL(3,0) not null,
    note_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.note_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.email_type_lu (
    email_type_id DECIMAL(5,0),
    email_type_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.email_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.key_generation (
    user_def CHAR(18) not null,
    high_value DECIMAL(13) not null
)
;

REVOKE ALL ON common_oltp.key_generation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.company (
    company_id DECIMAL(10,0),
    company_name VARCHAR(100),
    primary_contact_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    timezone_id DECIMAL(5,0) default 143
)
;

REVOKE ALL ON common_oltp.company FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.sequence_object (
    name VARCHAR(25) not null,
    id DECIMAL(3,0),
    current_value DECIMAL(12,0)
)
;

REVOKE ALL ON common_oltp.sequence_object FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.company_datasource_xref (
    datasource_id DECIMAL(10,0) not null,
    company_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.company_datasource_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.datasource_type_lu (
    datasource_type_desc VARCHAR(100) not null,
    datasource_type_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.datasource_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.datasource_lu (
    datasource_id DECIMAL(10,0) not null,
    datasource_name VARCHAR(100) not null,
    datasource_desc VARCHAR(100) not null,
    datasource_type_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.datasource_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.achievement_type_lu (
    achievement_type_id DECIMAL(5,0) not null,
    achievement_type_desc VARCHAR(64) not null
)
;

REVOKE ALL ON common_oltp.achievement_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_achievement (
    user_id DECIMAL(10,0),
    achievement_date DATE not null,
    achievement_type_id DECIMAL(5,0) not null,
    description VARCHAR(255),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_achievement FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.preference_group_lu (
    preference_group_id DECIMAL(5,0) not null,
    preference_group_desc VARCHAR(64) not null,
    sort_order DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.preference_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.preference_lu (
    preference_id DECIMAL(5,0) not null,
    preference_name VARCHAR(64) not null,
    preference_desc VARCHAR(200),
    preference_group_id DECIMAL(5,0) not null,
    preference_type_id DECIMAL(5,0),
    sort_order DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.preference_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_status_type_lu (
    user_status_type_id DECIMAL(3,0),
    description VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.user_status_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_status (
    user_id DECIMAL(10,0),
    user_status_type_id DECIMAL(3,0),
    user_status_id DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.user_status FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.event_lu (
    event_id DECIMAL(3,0),
    event_description VARCHAR(100),
    event_handler VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.event_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_event_status_lu (
    status_id DECIMAL(3,0),
    status_desc VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.user_event_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_event (
    user_event_id SERIAL not null,
    user_id DECIMAL(10,0),
    status_id DECIMAL(3,0),
    event_id DECIMAL(3,0),
    event_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_event FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.email_status_lu (
    status_id DECIMAL(3,0),
    status_desc VARCHAR(100),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.email_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.email_bounce_log (
    log_id SERIAL not null,
    to_address VARCHAR(254),
    from_address VARCHAR(254),
    subject VARCHAR(254),
    bounce_type VARCHAR(50),
    processed_ind DECIMAL(1,0) default 0,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.email_bounce_log FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.bounce_type_lu (
    bounce_type VARCHAR(10),
    bounce_type_desc VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.bounce_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.preference_value (
    preference_value_id DECIMAL(5,0) not null,
    preference_id DECIMAL(5,0) not null,
    value VARCHAR(64),
    "desc" VARCHAR(128),
    sort_order DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.preference_value FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.preference_type_lu (
    preference_type_id DECIMAL(5,0) not null,
    "desc" VARCHAR(128) not null
)
;

REVOKE ALL ON common_oltp.preference_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.db_growth (
    dbase VARCHAR(25),
    table_name VARCHAR(50),
    table_size INT,
    num_extents INT,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.db_growth FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.request (
    user_id DECIMAL(10,0),
    session_id CHAR(50),
    url VARCHAR(254),
    timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.request FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.timezone_lu (
    timezone_id DECIMAL(5,0),
    timezone_desc VARCHAR(100),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.timezone_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.company_terms_of_use_xref (
    company_id DECIMAL(10,0),
    terms_of_use_id DECIMAL(5,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.company_terms_of_use_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.continent (
    continent_id DECIMAL(2,0),
    continent_name VARCHAR(20)
)
;

REVOKE ALL ON common_oltp.continent FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_preference (
    user_id DECIMAL(10,0) not null,
    preference_id DECIMAL(5,0) not null,
    value VARCHAR(254),
    preference_value_id DECIMAL(5,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default NULL
)
;

REVOKE ALL ON common_oltp.user_preference FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.calendar (
    calendar_id DECIMAL(10,0),
    year DECIMAL(4,0),
    month_numeric DECIMAL(2,0),
    month_alpha VARCHAR(10),
    day_of_month DECIMAL(2,0),
    day_of_week DECIMAL(1,0),
    week_day VARCHAR(15),
    year_month VARCHAR(7),
    week_of_year DECIMAL(2,0),
    day_of_year DECIMAL(3,0),
    holiday CHAR(1),
    weekend CHAR(1),
    date DATE,
    week_year DECIMAL(4,0),
    quarter_of_year DECIMAL(1,0)
)
;

REVOKE ALL ON common_oltp.calendar FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.audit_user (
    user_id DECIMAL(10,0),
    column_name VARCHAR(30),
    old_value VARCHAR(254),
    new_value VARCHAR(254),
    timestamp TIMESTAMP default now(),
    reflected_to_ldap boolean default 'f' not null
)
;

REVOKE ALL ON common_oltp.audit_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.security_status_lu (
    security_status_id DECIMAL(3,0),
    status_desc VARCHAR(200)
)
;

REVOKE ALL ON common_oltp.security_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.registration_type_lu (
    registration_type_id DECIMAL(3,0),
    registration_type_name VARCHAR(200),
    registration_type_desc VARCHAR,
    active_ind DECIMAL(1,0) default 1,
    security_group_id DECIMAL(12,0),
    sort DECIMAL(3,0)
)
;

REVOKE ALL ON common_oltp.registration_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.notify_lu (
    notify_id DECIMAL(5,0) not null,
    name VARCHAR(255),
    status VARCHAR(3),
    sort DECIMAL(5,0),
    notify_type_id DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.notify_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_notify_xref (
    user_id DECIMAL(10,0) not null,
    notify_id DECIMAL(5,0) not null
)
;

REVOKE ALL ON common_oltp.user_notify_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.registration_type_notify_xref (
    registration_type_id DECIMAL(3,0) not null,
    notify_id DECIMAL(5,0) not null
)
;

REVOKE ALL ON common_oltp.registration_type_notify_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.demographic_question (
    demographic_question_id DECIMAL(10,0),
    demographic_question_text VARCHAR(255),
    selectable VARCHAR(1),
    demographic_question_desc VARCHAR(255)
)
;

REVOKE ALL ON common_oltp.demographic_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.demographic_answer (
    demographic_answer_id DECIMAL(10,0),
    demographic_question_id DECIMAL(10,0),
    demographic_answer_text VARCHAR(255),
    sort DECIMAL(10,0),
    status VARCHAR(1)
)
;

REVOKE ALL ON common_oltp.demographic_answer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.demographic_response (
    user_id DECIMAL(10,0),
    demographic_answer_id DECIMAL(10,0),
    demographic_response VARCHAR(255),
    demographic_question_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.demographic_response FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.demographic_assignment (
    demographic_question_id DECIMAL(10,0),
    coder_type_id DECIMAL(3,0),
    registration_type_id DECIMAL(3,0),
    sort DECIMAL(10,0),
    status VARCHAR(1),
    is_required DECIMAL(1,0) default 1
)
;

REVOKE ALL ON common_oltp.demographic_assignment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.id_sequences (
    name VARCHAR(254),
    next_block_start DECIMAL(12,0) not null,
    block_size DECIMAL(10,0) not null,
    exhausted DECIMAL(1,0) default 0 not null
)
;

REVOKE ALL ON common_oltp.id_sequences FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.password_recovery (
    password_recovery_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    recovery_address VARCHAR(100),
    expire_date TIMESTAMP not null,
    used_ind DECIMAL(1,0),
    random_key DECIMAL(20,0)
)
;

REVOKE ALL ON common_oltp.password_recovery FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.secret_question (
    user_id DECIMAL(10,0) not null,
    question VARCHAR(254) not null,
    response VARCHAR(254) not null
)
;

REVOKE ALL ON common_oltp.secret_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.event_type_lu (
    event_type_id DECIMAL(3,0),
    event_type_desc VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.event_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.event (
    event_id DECIMAL(10,0),
    event_type_id DECIMAL(3,0),
    event_desc VARCHAR(100),
    start_registration TIMESTAMP,
    end_registration TIMESTAMP,
    terms_of_use_id DECIMAL(10,0),
    survey_id DECIMAL(10,0),
    event_short_desc VARCHAR(100),
    modify_date TIMESTAMP default now(),
    parent_event_id DECIMAL(10,0)
)
;

REVOKE ALL ON common_oltp.event FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.event_registration (
    event_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    eligible_ind DECIMAL(1,0),
    notes VARCHAR(255),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.event_registration FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user (
    user_id DECIMAL(10,0) not null,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    handle VARCHAR(50) not null,
    last_login TIMESTAMP,
    status VARCHAR(3) not null,
    activation_code VARCHAR(32),
    middle_name VARCHAR(64),
    handle_lower VARCHAR(50),
    timezone_id DECIMAL(5,0),
    last_site_hit_date TIMESTAMP,
    name_in_another_language VARCHAR(64),
	password VARCHAR(16),
    open_id VARCHAR(200),
    reg_source VARCHAR(20),
	utm_source VARCHAR(50),
	utm_medium VARCHAR(50),
	utm_campaign VARCHAR(50)
)
;

REVOKE ALL ON common_oltp.user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.registration_type_preference_xref (
    registration_type_id DECIMAL(3,0) not null,
    preference_id DECIMAL(5,0) not null
)
;

REVOKE ALL ON common_oltp.registration_type_preference_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.notify_type_lu (
    notify_type_id DECIMAL(5,0) not null,
    notify_type_desc VARCHAR(64) not null,
    notify_type_sort_order DECIMAL(5,0)
)
;

REVOKE ALL ON common_oltp.notify_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.school_type_lu (
    school_type_id DECIMAL(3,0),
    school_type_desc VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.school_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.school (
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
    viewable DECIMAL(1,0) default 1,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.school FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.school_association_type_lu (
    school_association_type_id DECIMAL(3,0),
    school_association_type_desc VARCHAR(50)
)
;

REVOKE ALL ON common_oltp.school_association_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.user_school (
    user_school_id DECIMAL(10,0) not null,
    user_id DECIMAL(10,0) not null,
    school_id DECIMAL(10,0) not null,
    school_association_type_id DECIMAL(3,0) not null,
    primary_ind boolean not null,
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.user_school FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.professor_status_lu (
    status_id DECIMAL(3,0) not null,
    description VARCHAR(30) not null
)
;

REVOKE ALL ON common_oltp.professor_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.professor (
    user_id DECIMAL(10,0) not null,
    status_id DECIMAL(3,0) not null,
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.professor FROM PUBLIC;


CREATE TABLE IF NOT EXISTS common_oltp.permission_code (
    code VARCHAR(100) not null,
    group_id DECIMAL(12,0) not null,
    next_page VARCHAR(100) not null
)
;

REVOKE ALL ON common_oltp.permission_code FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.user_security_key (
    user_id DECIMAL(10,0) not null,
    security_key VARCHAR(1024) not null,
    security_key_type_id smallint not null
)
;

REVOKE ALL ON common_oltp.user_security_key FROM PUBLIC;

GRANT SELECT ON common_oltp.user_security_key TO coder;

CREATE TABLE IF NOT EXISTS common_oltp.contest_eligibility (
    contest_eligibility_id DECIMAL(10, 0) not null,
    contest_id DECIMAL(10,0) not null,
    is_studio SMALLINT NOT NULL,
    PRIMARY KEY (contest_eligibility_id)
)
;

REVOKE ALL ON common_oltp.contest_eligibility FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.group_contest_eligibility (
    contest_eligibility_id DECIMAL(10, 0) not null,
    group_id DECIMAL(10,0) not null,
    PRIMARY KEY (contest_eligibility_id)
    
)
;

REVOKE ALL ON common_oltp.group_contest_eligibility FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.client_terms_mapping (
    client_terms_mapping_id DECIMAL(10,0) not null,
    client_project_id DECIMAL(10,0) not null,
    terms_of_use_id DECIMAL(10,0) not null,
    resource_role_id DECIMAL(10,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    PRIMARY KEY (client_terms_mapping_id)
)
;

REVOKE ALL ON common_oltp.client_terms_mapping FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_security_group (
  vm_security_group_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_security_group_id)
)
;

REVOKE ALL ON common_oltp.vm_security_group FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_instance_type (
  vm_instance_type_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_instance_type_id)
)
;

REVOKE ALL ON common_oltp.vm_instance_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_availability_zone (
  vm_availability_zone_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_availability_zone_id)
)
;

REVOKE ALL ON common_oltp.vm_availability_zone FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_key_pair (
  vm_key_pair_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_key_pair_id)
)
;

REVOKE ALL ON common_oltp.vm_key_pair FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_image (
  vm_image_id DECIMAL(10,0) NOT NULL  ,
  vm_image_tc_name VARCHAR(50) NOT NULL,
  aws_image_id VARCHAR(50) NOT NULL ,
  vm_security_group_id DECIMAL(10,0)  ,
  vm_instance_type_id DECIMAL(10,0)  ,
  vm_availability_zone_id DECIMAL(10,0)  ,
  vm_key_pair_id DECIMAL(10,0)  ,
  vm_account_id DECIMAL(10,0),
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  vm_provider_id DECIMAL(10,0) not null,
  PRIMARY KEY (vm_image_id)
)
;

REVOKE ALL ON common_oltp.vm_image FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_user_data (
  vm_user_data_id DECIMAL(10,0) NOT NULL  ,
  key VARCHAR(50) NOT NULL ,
  value VARCHAR(200)  ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  encrypted CHAR(1) NOT NULL ,
  PRIMARY KEY (vm_user_data_id)
)
;

REVOKE ALL ON common_oltp.vm_user_data FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_image_user_data (
  vm_image_id DECIMAL(10,0) NOT NULL ,
  vm_user_data_id DECIMAL(10,0) NOT NULL ,
  PRIMARY KEY (vm_image_id, vm_user_data_id)
)
;

REVOKE ALL ON common_oltp.vm_image_user_data FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_account (
  vm_account_id DECIMAL(10,0) NOT NULL  ,
  aws_access_key_id VARCHAR(50) NOT NULL ,
  aws_security_access_key VARCHAR(100) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  account_name VARCHAR(50),
  PRIMARY KEY (vm_account_id)
)
;

REVOKE ALL ON common_oltp.vm_account FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_contest_type (
  vm_contest_type_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_contest_type_id)
)
;

REVOKE ALL ON common_oltp.vm_contest_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_instance (
  vm_instance_id DECIMAL(10,0) NOT NULL ,
  aws_instance_id VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  vm_image_id DECIMAL(10,0) NOT NULL ,
  tc_member_handle VARCHAR(50) NOT NULL ,
  svn_branch VARCHAR(200) NOT NULL ,
  contest_id DECIMAL(10,0) NOT NULL ,
  contest_name VARCHAR(254),
  vm_contest_type_id DECIMAL(10,0) NOT NULL ,
  is_terminated BOOLEAN DEFAULT 'f' NOT NULL,
  public_ip varchar(16),
  vm_usage_id DECIMAL(10,0) NOT NULL,
  vm_creation_time TIMESTAMP NOT NULL,
  vm_account_user_id DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (vm_instance_id)
)
;

REVOKE ALL ON common_oltp.vm_instance FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_instance_audit (
  vm_instance_audit_id DECIMAL(10,0) NOT NULL  ,
  vm_instance_id DECIMAL(10,0) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  action VARCHAR(50) NOT NULL ,
  user_id DECIMAL(10,0),
  PRIMARY KEY (vm_instance_audit_id)
)
;


CREATE TABLE IF NOT EXISTS common_oltp.vm_usage (
  vm_usage_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_usage_id)
)
;

REVOKE ALL ON common_oltp.vm_usage FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.vm_account_user (
  vm_account_user_id DECIMAL(10,0) NOT NULL,
  vm_account_id DECIMAL(10,0) NOT NULL,
  user_id DECIMAL(10,0) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_account_user_id)
)
;


CREATE TABLE IF NOT EXISTS common_oltp.vm_provider(
  vm_provider_id DECIMAL(10,0) NOT NULL  ,
  name VARCHAR(50) NOT NULL ,
  create_date TIMESTAMP NOT NULL ,
  modify_date TIMESTAMP NOT NULL ,
  PRIMARY KEY (vm_provider_id)
)
;


REVOKE ALL ON common_oltp.vm_instance_audit FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.photo_image (
  image_id              SERIAL8,
  file_name             VARCHAR(50) NOT NULL,
  PRIMARY KEY (image_id)
)
;

REVOKE ALL ON common_oltp.photo_image FROM PUBLIC;


CREATE TABLE IF NOT EXISTS common_oltp.member_image (
  member_image_id       SERIAL8,
  member_id             DECIMAL(10,0) NOT NULL,
  image_id              INT8 NOT NULL,
  removed               BOOLEAN NOT NULL,
  created_by            VARCHAR(50) NOT NULL,
  created_date          TIMESTAMP NOT NULL,
  updated_by            VARCHAR(50) NOT NULL,
  updated_date          TIMESTAMP NOT NULL,
  PRIMARY KEY (member_image_id)
)
;

REVOKE ALL ON common_oltp.member_image FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.invalid_handles (
    invalid_handle_id INT NOT NULL,
    invalid_handle VARCHAR(20) NOT NULL
)
;

REVOKE ALL ON common_oltp.invalid_handles FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.page_tracker (
	tracking_id SERIAL not null,
    user_id VARCHAR(50) not null,
	action_id DECIMAL(12,0) not null,
    action_time TIMESTAMP default now() not null,
	next_page_url VARCHAR(250),
	source VARCHAR(250)
)
;

CREATE TABLE IF NOT EXISTS common_oltp.page_tracker_action (
	action_id DECIMAL(12,0) not null,
	action_name VARCHAR(50) not null,
    action_description VARCHAR(250)
)
;

CREATE TABLE IF NOT EXISTS common_oltp.gov_id_document (
    gov_id_document_id SERIAL NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    country_code VARCHAR(3) NOT NULL,
    id_number VARCHAR(64) NOT NULL,
    received_date TIMESTAMP,
    expire_date TIMESTAMP
)
;
REVOKE ALL ON common_oltp.gov_id_document FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.access_token (
  access_token_id DECIMAL(12,0) NOT NULL ,
  token_type VARCHAR(20) NOT NULL ,
  token_key VARCHAR(200) NOT NULL ,
  grant_type VARCHAR(20) NOT NULL ,
  issued_at TIMESTAMP NOT NULL ,
  lifetime DECIMAL(12,0) NOT NULL ,
  client_id VARCHAR(45) NOT NULL ,
  user_login_name VARCHAR(45) NOT NULL
)
;
REVOKE ALL ON common_oltp.access_token FROM PUBLIC;  

CREATE TABLE IF NOT EXISTS common_oltp.authorization_code_grant (
  authorization_code_grant_id DECIMAL(12,0) NOT NULL ,
  redirect_uri VARCHAR(100) NOT NULL ,
  code VARCHAR(100) NOT NULL ,
  issued_at TIMESTAMP NOT NULL ,
  lifetime DECIMAL(12,0) NOT NULL ,
  client_id VARCHAR(45) NOT NULL ,
  user_login_name VARCHAR(45) NOT NULL
)
;
REVOKE ALL ON common_oltp.authorization_code_grant FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.oauth_permission (
  permission_id DECIMAL(12,0) NOT NULL ,
  name VARCHAR(45) NOT NULL ,
  description VARCHAR(200) NOT NULL ,
  "default" CHAR(1) NOT NULL
)
;
REVOKE ALL ON common_oltp.oauth_permission FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.http_verb (
  http_verb_id DECIMAL(12,0) NOT NULL ,
  name VARCHAR(45) NOT NULL 
)
;
REVOKE ALL ON common_oltp.http_verb FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.http_uri (
  http_uri_id DECIMAL(12,0) NOT NULL ,
  path VARCHAR(100) NOT NULL
)
;
REVOKE ALL ON common_oltp.http_uri FROM PUBLIC;
    
CREATE TABLE IF NOT EXISTS common_oltp.oauth_permission_has_http_verb (
  permission_permission_id DECIMAL(12,0) NOT NULL ,
  http_verb_http_verb_id DECIMAL(12,0) NOT NULL 
)
;
REVOKE ALL ON common_oltp.oauth_permission_has_http_verb FROM PUBLIC;


CREATE TABLE IF NOT EXISTS common_oltp.oauth_permission_has_http_uri (
  permission_permission_id DECIMAL(12,0) NOT NULL ,
  http_uri_http_uri_id DECIMAL(12,0) NOT NULL 
)
;
REVOKE ALL ON common_oltp.oauth_permission_has_http_uri FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.access_token_has_permission (
  access_token_access_token_id DECIMAL(12,0) NOT NULL ,
  permission_permission_id DECIMAL(12,0) NOT NULL 
)
;
REVOKE ALL ON common_oltp.access_token_has_permission FROM PUBLIC;


CREATE TABLE IF NOT EXISTS common_oltp.authorization_code_grant_has_permission (
  code_grant_id DECIMAL(12,0) NOT NULL ,
  permission_permission_id DECIMAL(12,0) NOT NULL
)
;
REVOKE ALL ON common_oltp.authorization_code_grant_has_permission FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.password_reset_token (
  user_id INT NOT NULL,
  token VARCHAR(10) NOT NULL,
  expired_at TIMESTAMP NOT NULL,
  email_type_id INT DEFAULT 1 NOT NULL
)
;

REVOKE ALL ON common_oltp.password_reset_token FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.email_request (
  request_id INT NOT NULL,
  user_id DECIMAL(10, 0) NOT NULL,
  email VARCHAR(100) NOT NULL,
  random_key INT  NOT NULL,
  expired_at TIMESTAMP NOT NULL,
  request_type INT NOT NULL
)
;

REVOKE ALL ON common_oltp.email_request FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.corona_event_type (
    corona_event_type_id DECIMAL(3,0),
    corona_event_type_name VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.corona_event_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS common_oltp.corona_event (
  corona_event_id SERIAL not null,
  corona_event_type_id decimal(3, 0) not null,
  user_id decimal(10, 0) not null,
  scanned_ind DECIMAL(1,0) DEFAULT 0 NOT NULL,
  corona_event_timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON common_oltp.corona_event FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.social_login_provider (
  social_login_provider_id decimal(10, 0) not null,
  name VARCHAR(50)
)
;

REVOKE ALL ON common_oltp.social_login_provider FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.user_social_login (
  social_user_id VARCHAR(254),
  user_id decimal(10, 0) not null,
  social_login_provider_id decimal(10, 0) not null,
  social_user_name  VARCHAR(100) not null,
  social_email VARCHAR(100),
  social_email_verified  boolean 
)
;

REVOKE ALL ON common_oltp.user_social_login FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.sso_login_provider (
  sso_login_provider_id DECIMAL(10,0) NOT NULL,
  name VARCHAR(50),
  type VARCHAR(50) NOT NULL,
  identify_email_enabled BOOLEAN NOT NULL,
  identify_handle_enabled BOOLEAN NOT NULL
)
;

REVOKE ALL ON common_oltp.sso_login_provider FROM PUBLIC;

CREATE TABLE IF NOT EXISTS common_oltp.user_sso_login (
  user_id DECIMAL(10,0) NOT NULL,
  sso_user_id VARCHAR(100) NOT NULL,
  sso_user_name VARCHAR(100),
  provider_id DECIMAL(10,0) NOT NULL,
  email VARCHAR(100)
)
;

REVOKE ALL ON common_oltp.user_sso_login FROM PUBLIC;


CREATE SEQUENCE IF NOT EXISTS common_oltp.CONTEST_ELIGIBILITY_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1;

REVOKE ALL ON common_oltp.CONTEST_ELIGIBILITY_SEQ FROM PUBLIC;

CREATE SEQUENCE IF NOT EXISTS seq_access_token;
REVOKE ALL ON common_oltp.seq_access_token FROM PUBLIC;   

CREATE SEQUENCE IF NOT EXISTS seq_authorization_code_grant;
REVOKE ALL ON common_oltp.seq_authorization_code_grant FROM PUBLIC;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_USER_GROUP_SEQ INCREMENT BY 1 START WITH 40000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_EMAIL_SEQ INCREMENT BY 1 START WITH 3000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_USER_SEQ INCREMENT BY 1 START WITH 40000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_COMPONENT_INQUIRY_SEQ INCREMENT BY 1 START WITH 4000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_RESOURCE_ID_SEQ INCREMENT BY 1 START WITH 4000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_UPLOAD_SEQ INCREMENT BY 1 START WITH 4000000;
CREATE SEQUENCE IF NOT EXISTS SEQUENCE_SUBMISSION_SEQ INCREMENT BY 1 START WITH 4000000;
CREATE SEQUENCE IF NOT EXISTS sequence_address_seq INCREMENT BY 1 START WITH 3000000 MINVALUE 3000000;


REVOKE ALL ON common_oltp.SEQUENCE_USER_GROUP_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_EMAIL_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_USER_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_COMPONENT_INQUIRY_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_RESOURCE_ID_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_UPLOAD_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.SEQUENCE_SUBMISSION_SEQ FROM PUBLIC;
REVOKE ALL ON common_oltp.sequence_address_seq FROM PUBLIC;

create view common_oltp.email_user (user_id,first_name,last_name,
       create_date,modify_date,handle,last_login,status,
       activation_code,middle_name,email) as
   select x0.user_id ,x0.first_name ,x0.last_name ,x0.create_date ,
       x0.modify_date ,x0.handle ,x0.last_login ,x0.status ,
       x0.activation_code ,x0.middle_name ,x1.address 
   from common_oltp.user x0 ,common_oltp.email x1 
   where ((((x0.user_id = x1.user_id ) AND (x1.primary_ind = 1. ) ) AND (x1.status_id = 1. ) ) AND (x0.status = 'A' ) ) ;
REVOKE ALL ON common_oltp.email_user FROM PUBLIC;


;

GRANT all ON common_oltp.sequence_object TO coder;

GRANT delete ON common_oltp.user_role_xref TO public;

GRANT select ON common_oltp.user_role_xref TO public;

GRANT insert ON common_oltp.user_role_xref TO public;

GRANT update ON common_oltp.user_role_xref TO public;

GRANT delete ON common_oltp.user_group_xref TO public;

GRANT insert ON common_oltp.user_group_xref TO public;

GRANT select ON common_oltp.user_group_xref TO public;

GRANT update ON common_oltp.user_group_xref TO public;

GRANT update ON common_oltp.security_groups TO public;

GRANT insert ON common_oltp.security_groups TO public;

GRANT select ON common_oltp.security_groups TO public;

GRANT delete ON common_oltp.security_groups TO public;

GRANT select ON common_oltp.group_role_xref TO public;

GRANT delete ON common_oltp.group_role_xref TO public;

GRANT insert ON common_oltp.group_role_xref TO public;

GRANT update ON common_oltp.group_role_xref TO public;

GRANT update ON common_oltp.security_roles TO public;

GRANT delete ON common_oltp.security_roles TO public;

GRANT select ON common_oltp.security_roles TO public;

GRANT insert ON common_oltp.security_roles TO public;

GRANT update ON common_oltp.security_perms TO public;

GRANT insert ON common_oltp.security_perms TO public;

GRANT delete ON common_oltp.security_perms TO public;

GRANT select ON common_oltp.security_perms TO public;

GRANT update ON common_oltp.address TO public;

GRANT delete ON common_oltp.address TO public;

GRANT insert ON common_oltp.address TO public;



GRANT select ON common_oltp.address TO public;

GRANT update ON common_oltp.address_type_lu TO public;

GRANT insert ON common_oltp.address_type_lu TO public;

GRANT delete ON common_oltp.address_type_lu TO public;



GRANT select ON common_oltp.address_type_lu TO public;



GRANT delete ON common_oltp.phone_type_lu TO public;

GRANT select ON common_oltp.phone_type_lu TO public;

GRANT update ON common_oltp.phone_type_lu TO public;

GRANT insert ON common_oltp.phone_type_lu TO public;

GRANT select ON common_oltp.email TO public;

GRANT update ON common_oltp.email TO public;

GRANT insert ON common_oltp.email TO public;

GRANT delete ON common_oltp.email TO public;



GRANT update ON common_oltp.user_address_xref TO public;

GRANT insert ON common_oltp.user_address_xref TO public;



GRANT select ON common_oltp.user_address_xref TO public;

GRANT delete ON common_oltp.user_address_xref TO public;

GRANT select ON common_oltp.phone TO public;

GRANT delete ON common_oltp.phone TO public;

GRANT insert ON common_oltp.phone TO public;

GRANT update ON common_oltp.phone TO public;



GRANT insert ON common_oltp.user_status_lu TO public;

GRANT update ON common_oltp.user_status_lu TO public;

GRANT select ON common_oltp.user_status_lu TO public;

GRANT delete ON common_oltp.user_status_lu TO public;





GRANT delete ON common_oltp.terms_of_use TO public;

GRANT update ON common_oltp.terms_of_use TO public;

GRANT insert ON common_oltp.terms_of_use TO public;

GRANT select ON common_oltp.terms_of_use TO public;

GRANT insert ON common_oltp.terms_of_use_type TO public;

GRANT select ON common_oltp.terms_of_use_type TO public;

GRANT delete ON common_oltp.terms_of_use_type TO public;

GRANT update ON common_oltp.terms_of_use_type TO public;



GRANT delete ON common_oltp.user_terms_of_use_xref TO public;

GRANT insert ON common_oltp.user_terms_of_use_xref TO public;

GRANT select ON common_oltp.user_terms_of_use_xref TO public;

GRANT update ON common_oltp.user_terms_of_use_xref TO public;



GRANT delete ON common_oltp.user_terms_of_use_ban_xref TO public;

GRANT insert ON common_oltp.user_terms_of_use_ban_xref TO public;

GRANT select ON common_oltp.user_terms_of_use_ban_xref TO public;

GRANT update ON common_oltp.user_terms_of_use_ban_xref TO public;



GRANT delete ON common_oltp.project_role_terms_of_use_xref TO public;

GRANT update ON common_oltp.project_role_terms_of_use_xref TO public;

GRANT insert ON common_oltp.project_role_terms_of_use_xref TO public;

GRANT select ON common_oltp.project_role_terms_of_use_xref TO public;





GRANT insert ON common_oltp.state TO public;

GRANT select ON common_oltp.state TO public;

GRANT update ON common_oltp.state TO public;

GRANT delete ON common_oltp.state TO public;



GRANT select ON common_oltp.country TO public;

GRANT update ON common_oltp.country TO public;

GRANT insert ON common_oltp.country TO public;

GRANT delete ON common_oltp.country TO public;

GRANT insert ON common_oltp.dual TO public;

GRANT select ON common_oltp.dual TO public;



GRANT update ON common_oltp.dual TO public;

GRANT delete ON common_oltp.dual TO public;

GRANT delete ON common_oltp.contact TO public;

GRANT select ON common_oltp.contact TO public;



GRANT insert ON common_oltp.contact TO public;

GRANT update ON common_oltp.contact TO public;

GRANT select ON common_oltp.note TO public;

GRANT insert ON common_oltp.note TO public;

GRANT delete ON common_oltp.note TO public;



GRANT update ON common_oltp.note TO public;



GRANT update ON common_oltp.user_note_xref TO public;

GRANT insert ON common_oltp.user_note_xref TO public;

GRANT delete ON common_oltp.user_note_xref TO public;

GRANT select ON common_oltp.user_note_xref TO public;

GRANT delete ON common_oltp.note_type_lu TO public;

GRANT select ON common_oltp.note_type_lu TO public;

GRANT insert ON common_oltp.note_type_lu TO public;



GRANT update ON common_oltp.note_type_lu TO public;

GRANT update ON common_oltp.registration_type_preference_xref TO public;

GRANT insert ON common_oltp.registration_type_preference_xref TO public;

GRANT select ON common_oltp.registration_type_preference_xref TO public;



GRANT delete ON common_oltp.registration_type_preference_xref TO public;

GRANT update ON common_oltp.email_type_lu TO public;

GRANT insert ON common_oltp.email_type_lu TO public;

GRANT select ON common_oltp.email_type_lu TO public;

GRANT delete ON common_oltp.email_type_lu TO public;





GRANT select ON common_oltp.key_generation TO public;

GRANT insert ON common_oltp.key_generation TO public;

GRANT update ON common_oltp.key_generation TO public;

GRANT delete ON common_oltp.key_generation TO public;

GRANT select ON common_oltp.company TO public;

GRANT update ON common_oltp.company TO public;

GRANT insert ON common_oltp.company TO public;

GRANT delete ON common_oltp.company TO public;



GRANT update ON common_oltp.sequence_object TO public;

GRANT delete ON common_oltp.sequence_object TO public;

GRANT insert ON common_oltp.sequence_object TO public;

GRANT select ON common_oltp.sequence_object TO public;

GRANT update ON common_oltp.company_datasource_xref TO public;

GRANT insert ON common_oltp.company_datasource_xref TO public;



GRANT select ON common_oltp.company_datasource_xref TO public;

GRANT delete ON common_oltp.company_datasource_xref TO public;

GRANT delete ON common_oltp.datasource_type_lu TO public;

GRANT update ON common_oltp.datasource_type_lu TO public;

GRANT select ON common_oltp.datasource_type_lu TO public;

GRANT insert ON common_oltp.datasource_type_lu TO public;



GRANT insert ON common_oltp.datasource_lu TO public;

GRANT select ON common_oltp.datasource_lu TO public;

GRANT update ON common_oltp.datasource_lu TO public;

GRANT delete ON common_oltp.datasource_lu TO public;





GRANT delete ON common_oltp.achievement_type_lu TO public;

GRANT insert ON common_oltp.achievement_type_lu TO public;

GRANT select ON common_oltp.achievement_type_lu TO public;

GRANT update ON common_oltp.achievement_type_lu TO public;

GRANT update ON common_oltp.user_achievement TO public;



GRANT insert ON common_oltp.user_achievement TO public;

GRANT select ON common_oltp.user_achievement TO public;

GRANT delete ON common_oltp.user_achievement TO public;

GRANT delete ON common_oltp.preference_group_lu TO public;

GRANT insert ON common_oltp.preference_group_lu TO public;



GRANT select ON common_oltp.preference_group_lu TO public;

GRANT update ON common_oltp.preference_group_lu TO public;

GRANT select ON common_oltp.preference_lu TO public;

GRANT delete ON common_oltp.preference_lu TO public;



GRANT update ON common_oltp.preference_lu TO public;

GRANT insert ON common_oltp.preference_lu TO public;

GRANT delete ON common_oltp.user_status_type_lu TO public;

GRANT insert ON common_oltp.user_status_type_lu TO public;

GRANT select ON common_oltp.user_status_type_lu TO public;



GRANT update ON common_oltp.user_status_type_lu TO public;

GRANT update ON common_oltp.user_status TO public;



GRANT select ON common_oltp.user_status TO public;

GRANT delete ON common_oltp.user_status TO public;

GRANT insert ON common_oltp.user_status TO public;

GRANT insert ON common_oltp.event_lu TO public;

GRANT update ON common_oltp.event_lu TO public;

GRANT delete ON common_oltp.event_lu TO public;



GRANT select ON common_oltp.event_lu TO public;

GRANT delete ON common_oltp.user_event_status_lu TO public;

GRANT insert ON common_oltp.user_event_status_lu TO public;

GRANT select ON common_oltp.user_event_status_lu TO public;

GRANT update ON common_oltp.user_event_status_lu TO public;



GRANT select ON common_oltp.user_event TO public;



GRANT delete ON common_oltp.user_event TO public;

GRANT update ON common_oltp.user_event TO public;

GRANT insert ON common_oltp.user_event TO public;

GRANT delete ON common_oltp.email_status_lu TO public;



GRANT insert ON common_oltp.email_status_lu TO public;

GRANT select ON common_oltp.email_status_lu TO public;

GRANT update ON common_oltp.email_status_lu TO public;

GRANT update ON common_oltp.email_bounce_log TO public;

GRANT select ON common_oltp.email_bounce_log TO public;



GRANT delete ON common_oltp.email_bounce_log TO public;

GRANT insert ON common_oltp.email_bounce_log TO public;

GRANT update ON common_oltp.bounce_type_lu TO public;

GRANT insert ON common_oltp.bounce_type_lu TO public;



GRANT select ON common_oltp.bounce_type_lu TO public;

GRANT delete ON common_oltp.bounce_type_lu TO public;

GRANT select ON common_oltp.preference_value TO public;

GRANT insert ON common_oltp.preference_value TO public;

GRANT update ON common_oltp.preference_value TO public;



GRANT delete ON common_oltp.preference_value TO public;



GRANT delete ON common_oltp.preference_type_lu TO public;

GRANT update ON common_oltp.preference_type_lu TO public;

GRANT insert ON common_oltp.preference_type_lu TO public;

GRANT select ON common_oltp.preference_type_lu TO public;



GRANT insert ON common_oltp.db_growth TO public;

GRANT select ON common_oltp.db_growth TO public;

GRANT delete ON common_oltp.db_growth TO public;

GRANT update ON common_oltp.db_growth TO public;

GRANT insert ON common_oltp.request TO public;

GRANT update ON common_oltp.request TO public;

GRANT delete ON common_oltp.request TO public;

GRANT select ON common_oltp.request TO public;



GRANT select ON common_oltp.timezone_lu TO public;

GRANT insert ON common_oltp.timezone_lu TO public;



GRANT delete ON common_oltp.timezone_lu TO public;

GRANT update ON common_oltp.timezone_lu TO public;



GRANT select ON common_oltp.company_terms_of_use_xref TO public;

GRANT update ON common_oltp.company_terms_of_use_xref TO public;

GRANT insert ON common_oltp.company_terms_of_use_xref TO public;

GRANT delete ON common_oltp.company_terms_of_use_xref TO public;

GRANT update ON common_oltp.continent TO public;

GRANT delete ON common_oltp.continent TO public;



GRANT select ON common_oltp.continent TO public;

GRANT insert ON common_oltp.continent TO public;

GRANT delete ON common_oltp.user_preference TO public;



GRANT select ON common_oltp.user_preference TO public;

GRANT insert ON common_oltp.user_preference TO public;

GRANT update ON common_oltp.user_preference TO public;



GRANT select ON common_oltp.calendar TO public;

GRANT update ON common_oltp.calendar TO public;

GRANT insert ON common_oltp.calendar TO public;

GRANT delete ON common_oltp.calendar TO public;

GRANT insert ON common_oltp.audit_user TO public;



GRANT delete ON common_oltp.audit_user TO public;

GRANT select ON common_oltp.audit_user TO public;

GRANT update ON common_oltp.audit_user TO public;

GRANT delete ON common_oltp.security_status_lu TO public;

GRANT insert ON common_oltp.security_status_lu TO public;



GRANT update ON common_oltp.security_status_lu TO public;

GRANT select ON common_oltp.security_status_lu TO public;

GRANT insert ON common_oltp.registration_type_lu TO public;



GRANT delete ON common_oltp.registration_type_lu TO public;

GRANT update ON common_oltp.registration_type_lu TO public;

GRANT select ON common_oltp.registration_type_lu TO public;



GRANT update ON common_oltp.notify_lu TO public;

GRANT select ON common_oltp.notify_lu TO public;

GRANT delete ON common_oltp.notify_lu TO public;

GRANT insert ON common_oltp.notify_lu TO public;

GRANT insert ON common_oltp.user_notify_xref TO public;

GRANT update ON common_oltp.user_notify_xref TO public;

GRANT select ON common_oltp.user_notify_xref TO public;



GRANT delete ON common_oltp.user_notify_xref TO public;

GRANT delete ON common_oltp.registration_type_notify_xref TO public;

GRANT insert ON common_oltp.registration_type_notify_xref TO public;

GRANT update ON common_oltp.registration_type_notify_xref TO public;

GRANT select ON common_oltp.registration_type_notify_xref TO public;



GRANT update ON common_oltp.demographic_question TO public;

GRANT delete ON common_oltp.demographic_question TO public;



GRANT insert ON common_oltp.demographic_question TO public;

GRANT select ON common_oltp.demographic_question TO public;



GRANT update ON common_oltp.demographic_answer TO public;

GRANT insert ON common_oltp.demographic_answer TO public;

GRANT delete ON common_oltp.demographic_answer TO public;

GRANT select ON common_oltp.demographic_answer TO public;

GRANT select ON common_oltp.demographic_response TO public;

GRANT update ON common_oltp.demographic_response TO public;

GRANT insert ON common_oltp.demographic_response TO public;

GRANT delete ON common_oltp.demographic_response TO public;



GRANT update ON common_oltp.demographic_assignment TO public;

GRANT insert ON common_oltp.demographic_assignment TO public;

GRANT delete ON common_oltp.demographic_assignment TO public;



GRANT select ON common_oltp.demographic_assignment TO public;

GRANT update ON common_oltp.id_sequences TO public;

GRANT select ON common_oltp.id_sequences TO public;



GRANT delete ON common_oltp.id_sequences TO public;

GRANT insert ON common_oltp.id_sequences TO public;

GRANT insert ON common_oltp.password_recovery TO public;

GRANT select ON common_oltp.password_recovery TO public;



GRANT update ON common_oltp.password_recovery TO public;

GRANT delete ON common_oltp.password_recovery TO public;

GRANT insert ON common_oltp.secret_question TO public;

GRANT update ON common_oltp.secret_question TO public;



GRANT select ON common_oltp.secret_question TO public;

GRANT delete ON common_oltp.secret_question TO public;

GRANT insert ON common_oltp.event_type_lu TO public;



GRANT update ON common_oltp.event_type_lu TO public;

GRANT delete ON common_oltp.event_type_lu TO public;

GRANT select ON common_oltp.event_type_lu TO public;

GRANT select ON common_oltp.event TO public;

GRANT insert ON common_oltp.event TO public;



GRANT delete ON common_oltp.event TO public;

GRANT update ON common_oltp.event TO public;

GRANT delete ON common_oltp.event_registration TO public;

GRANT update ON common_oltp.event_registration TO public;

GRANT insert ON common_oltp.event_registration TO public;

GRANT select ON common_oltp.event_registration TO public;





GRANT delete ON common_oltp.user TO public;

GRANT select ON common_oltp.user TO public;

GRANT update ON common_oltp.user TO public;

GRANT insert ON common_oltp.user TO public;

GRANT select ON common_oltp.notify_type_lu TO public;



GRANT delete ON common_oltp.notify_type_lu TO public;

GRANT insert ON common_oltp.notify_type_lu TO public;

GRANT update ON common_oltp.notify_type_lu TO public;

GRANT select ON common_oltp.school_type_lu TO public;

GRANT delete ON common_oltp.school_type_lu TO public;

GRANT update ON common_oltp.school_type_lu TO public;

GRANT insert ON common_oltp.school_type_lu TO public;





GRANT update ON common_oltp.school TO public;

GRANT insert ON common_oltp.school TO public;

GRANT select ON common_oltp.school TO public;

GRANT delete ON common_oltp.school TO public;

GRANT select ON common_oltp.school_association_type_lu TO public;

GRANT delete ON common_oltp.school_association_type_lu TO public;



GRANT insert ON common_oltp.school_association_type_lu TO public;

GRANT update ON common_oltp.school_association_type_lu TO public;

GRANT delete ON common_oltp.user_school TO public;

GRANT update ON common_oltp.user_school TO public;



GRANT insert ON common_oltp.user_school TO public;

GRANT select ON common_oltp.user_school TO public;

GRANT update ON common_oltp.professor_status_lu TO public;

GRANT select ON common_oltp.professor_status_lu TO public;

GRANT delete ON common_oltp.professor_status_lu TO public;



GRANT insert ON common_oltp.professor_status_lu TO public;

GRANT insert ON common_oltp.professor TO public;

GRANT select ON common_oltp.professor TO public;

GRANT update ON common_oltp.professor TO public;

GRANT delete ON common_oltp.professor TO public;



GRANT update ON common_oltp.permission_code TO public;



GRANT delete ON common_oltp.permission_code TO public;

GRANT select ON common_oltp.permission_code TO public;

GRANT insert ON common_oltp.permission_code TO public;

GRANT insert ON common_oltp.user_security_key TO public;

GRANT update ON common_oltp.user_security_key TO public;



GRANT delete ON common_oltp.user_security_key TO public;

GRANT select ON common_oltp.user_security_key TO public;

GRANT insert ON common_oltp.user_security_key TO public;

GRANT select ON common_oltp.email_user TO public;

GRANT select,update,insert,delete ON common_oltp.security_user TO public;

GRANT select,update,insert,delete ON common_oltp.contest_eligibility TO public;

GRANT select,update,insert,delete ON common_oltp.group_contest_eligibility TO public;

GRANT select,update,insert,delete ON common_oltp.client_terms_mapping TO public;



GRANT delete ON common_oltp.vm_instance_type TO public;

GRANT select ON common_oltp.vm_instance_type TO public;

GRANT insert ON common_oltp.vm_instance_type TO public;

GRANT update ON common_oltp.vm_availability_zone TO public;



GRANT delete ON common_oltp.vm_availability_zone TO public;

GRANT select ON common_oltp.vm_availability_zone TO public;

GRANT insert ON common_oltp.vm_availability_zone TO public;

GRANT update ON common_oltp.vm_key_pair TO public;



GRANT delete ON common_oltp.vm_key_pair TO public;

GRANT select ON common_oltp.vm_key_pair TO public;

GRANT insert ON common_oltp.vm_key_pair TO public;

GRANT update ON common_oltp.vm_image TO public;



GRANT delete ON common_oltp.vm_image TO public;

GRANT select ON common_oltp.vm_image TO public;

GRANT insert ON common_oltp.vm_image TO public;

GRANT update ON common_oltp.vm_user_data TO public;



GRANT delete ON common_oltp.vm_user_data TO public;

GRANT select ON common_oltp.vm_user_data TO public;

GRANT insert ON common_oltp.vm_user_data TO public;

GRANT update ON common_oltp.vm_image_user_data TO public;



GRANT delete ON common_oltp.vm_image_user_data TO public;

GRANT select ON common_oltp.vm_image_user_data TO public;

GRANT insert ON common_oltp.vm_image_user_data TO public;

GRANT update ON common_oltp.vm_account TO public;



GRANT delete ON common_oltp.vm_account TO public;

GRANT select ON common_oltp.vm_account TO public;

GRANT insert ON common_oltp.vm_account TO public;

GRANT update ON common_oltp.vm_contest_type TO public;



GRANT delete ON common_oltp.vm_contest_type TO public;

GRANT select ON common_oltp.vm_contest_type TO public;

GRANT insert ON common_oltp.vm_contest_type TO public;

GRANT update ON common_oltp.vm_instance TO public;



GRANT delete ON common_oltp.vm_instance TO public;

GRANT select ON common_oltp.vm_instance TO public;

GRANT insert ON common_oltp.vm_instance TO public;

GRANT update ON common_oltp.vm_instance_audit TO public;



GRANT delete ON common_oltp.vm_instance_audit TO public;

GRANT select ON common_oltp.vm_instance_audit TO public;

GRANT insert ON common_oltp.vm_instance_audit TO public;

GRANT insert, update, delete, select ON common_oltp.member_image TO public;
GRANT insert, update, delete, select ON common_oltp.photo_image TO public;

GRANT select ON common_oltp.CONTEST_ELIGIBILITY_SEQ TO public;

GRANT update, delete, select, insert ON common_oltp.vm_usage TO public;

GRANT update, delete, select, insert ON common_oltp.vm_account_user TO public;

GRANT update, delete, select, insert ON common_oltp.vm_security_group TO public;
	
GRANT insert ON common_oltp.terms_of_use_agreeability_type_lu TO public;

GRANT select ON common_oltp.terms_of_use_agreeability_type_lu TO public;

GRANT delete ON common_oltp.terms_of_use_agreeability_type_lu TO public;

GRANT update ON common_oltp.terms_of_use_agreeability_type_lu TO public;



GRANT insert ON common_oltp.terms_of_use_dependency TO public;

GRANT select ON common_oltp.terms_of_use_dependency TO public;

GRANT delete ON common_oltp.terms_of_use_dependency TO public;

GRANT update ON common_oltp.terms_of_use_dependency TO public;



GRANT delete ON common_oltp.user_preference TO public;



GRANT select ON common_oltp.user_preference TO public;

GRANT insert ON common_oltp.user_preference TO public;

GRANT update ON common_oltp.user_preference TO public;

GRANT delete ON common_oltp.invalid_handles TO public;



GRANT select ON common_oltp.invalid_handles TO public;

GRANT insert ON common_oltp.invalid_handles TO public;

GRANT update ON common_oltp.invalid_handles TO public;

GRANT insert ON common_oltp.corona_event_type TO public;



GRANT update ON common_oltp.corona_event_type TO public;

GRANT delete ON common_oltp.corona_event_type TO public;

GRANT select ON common_oltp.corona_event_type TO public;

GRANT select ON common_oltp.corona_event TO public;

GRANT insert ON common_oltp.corona_event TO public;



GRANT delete ON common_oltp.corona_event TO public;

GRANT update ON common_oltp.corona_event TO public;


GRANT select,update,insert,delete ON common_oltp.page_tracker TO public;

GRANT select,update,insert,delete ON common_oltp.page_tracker_action TO public;
GRANT select,update,insert,delete ON common_oltp.gov_id_document TO public;
GRANT select,update,insert,delete ON common_oltp.access_token TO public;
GRANT select,update,insert,delete ON common_oltp.authorization_code_grant TO public;
GRANT select,update,insert,delete ON common_oltp.oauth_permission TO public;
GRANT select,update,insert,delete ON common_oltp.http_verb TO public;
GRANT select,update,insert,delete ON common_oltp.http_uri TO public;
GRANT select,update,insert,delete ON common_oltp.oauth_permission_has_http_verb TO public;
GRANT select,update,insert,delete ON common_oltp.oauth_permission_has_http_uri TO public;
GRANT select,update,insert,delete ON common_oltp.access_token_has_permission TO public;
GRANT select,update,insert,delete ON common_oltp.authorization_code_grant_has_permission TO public;
GRANT select ON common_oltp.seq_access_token TO public;
GRANT select ON common_oltp.seq_authorization_code_grant TO public;
GRANT select ON common_oltp.SEQUENCE_USER_GROUP_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_EMAIL_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_USER_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_COMPONENT_INQUIRY_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_RESOURCE_ID_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_UPLOAD_SEQ TO public;
GRANT select ON common_oltp.SEQUENCE_SUBMISSION_SEQ TO public;
GRANT select ON common_oltp.sequence_address_seq TO public;
GRANT select,update,insert,delete ON common_oltp.password_reset_token TO public;
GRANT select,update,insert,delete ON common_oltp.email_request TO public;

GRANT select,update,insert,delete ON common_oltp.social_login_provider TO public;
GRANT select,update,insert,delete ON common_oltp.user_social_login TO public;
GRANT select,update,insert,delete ON common_oltp.terms_of_use_docusign_template_xref TO public;

GRANT select,update,insert,delete ON common_oltp.sso_login_provider TO public;
GRANT select,update,insert,delete ON common_oltp.user_sso_login TO public;
