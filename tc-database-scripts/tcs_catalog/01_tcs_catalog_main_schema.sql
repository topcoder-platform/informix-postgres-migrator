-- Create database
SET search_path TO tcs_catalog;
-- Grant access
GRANT USAGE ON SCHEMA tcs_catalog TO coder ;
GRANT USAGE ON SCHEMA tcs_catalog TO readonly ;
GRANT USAGE ON SCHEMA tcs_catalog TO veredox ;
GRANT USAGE ON SCHEMA tcs_catalog TO openaim ;
GRANT USAGE ON SCHEMA tcs_catalog TO truveo ;
GRANT USAGE ON SCHEMA tcs_catalog TO winformula ;
GRANT USAGE ON SCHEMA tcs_catalog TO openxtraz ;

-- User public does not have connect privilege;
CREATE TABLE IF NOT EXISTS tcs_catalog.company_size (
    company_size_id DECIMAL(12,0) not null,
    description VARCHAR(25) not null
)
;

REVOKE ALL ON tcs_catalog.company_size FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_categories (
    comp_categories_id DECIMAL(12,0) not null,
    component_id DECIMAL(12,0),
    category_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.comp_categories FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_dependencies (
    comp_dependency_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    child_comp_vers_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.comp_dependencies FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_documentation (
    document_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    document_type_id DECIMAL(12,0),
    document_name VARCHAR(254) not null,
    url VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.comp_documentation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_download (
    download_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    url VARCHAR(254) not null,
    description VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.comp_download FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_examples (
    example_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    url VARCHAR(254) not null,
    description VARCHAR
)
;

REVOKE ALL ON tcs_catalog.comp_examples FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_keywords (
    comp_keywords_id DECIMAL(12,0) not null,
    component_id DECIMAL(12,0),
    keyword VARCHAR(50) not null
)
;

REVOKE ALL ON tcs_catalog.comp_keywords FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_reviews (
    comp_reviews_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    login_id DECIMAL(12,0),
    review_time TIMESTAMP not null,
    rating DECIMAL(5) not null,
    comments VARCHAR not null
)
;

REVOKE ALL ON tcs_catalog.comp_reviews FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_technology (
    comp_tech_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    technology_type_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.comp_technology FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contact_type (
    contact_type_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.contact_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.country_codes (
    country_code DECIMAL(12,0) not null,
    description VARCHAR(100) not null
)
;

REVOKE ALL ON tcs_catalog.country_codes FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.doc_types (
    document_type_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.doc_types FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.download_tracking (
    download_track_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    login_id DECIMAL(12,0),
    license_level_id DECIMAL(12,0),
    download_id DECIMAL(12,0),
    unit_cost DECIMAL(12,0) not null,
    price DECIMAL(10,2) not null,
    create_time TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.download_tracking FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.key_generation (
    user_def CHAR(18) not null,
    high_value DECIMAL(13) not null
)
;

REVOKE ALL ON tcs_catalog.key_generation FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.license_level (
    license_level_id DECIMAL(12,0) not null,
    price_multiplier DECIMAL(10,3) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.license_level FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase (
    phase_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.phase FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.price_tiers (
    tier_id DECIMAL(12,0) not null,
    discount_percent DECIMAL(5,2) not null
)
;

REVOKE ALL ON tcs_catalog.price_tiers FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.roles (
    role_id DECIMAL(12,0) not null,
    role_name VARCHAR(100) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.roles FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.status (
    status_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.status FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.technology_types (
    technology_type_id DECIMAL(12,0) not null,
    technology_name VARCHAR(100) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.technology_types FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_contact (
    user_contact_id DECIMAL(12,0) not null,
    contact_type_id DECIMAL(12,0),
    login_id DECIMAL(12,0),
    contact_info VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.user_contact FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_member (
    user_member_id DECIMAL(12,0) not null,
    login_id DECIMAL(12,0),
    tc_rating DECIMAL(5) not null,
    tcs_rating DECIMAL(5) not null
)
;

REVOKE ALL ON tcs_catalog.user_member FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_technologies (
    user_tech_id DECIMAL(12,0) not null,
    technology_type_id DECIMAL(12,0),
    login_id DECIMAL(12,0),
    rating DECIMAL(5) not null,
    months DECIMAL(5) not null
)
;

REVOKE ALL ON tcs_catalog.user_technologies FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.word_search (
    word_search_id DECIMAL(12,0) not null,
    document_id DECIMAL(12,0) not null,
    index_word CHAR(100) not null,
    nbr_occurrences DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.word_search FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.word_search_ctgy (
    word_srch_ctgy_id DECIMAL(12,0) not null,
    category_id CHAR(50) not null,
    document_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.word_search_ctgy FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.word_search_doc (
    document_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.word_search_doc FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.word_search_excl (
    word_srch_exl_id DECIMAL(12,0) not null,
    exclude_word VARCHAR(100) not null
)
;

REVOKE ALL ON tcs_catalog.word_search_excl FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name VARCHAR(100)
)
;

REVOKE ALL ON tcs_catalog.command_group_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.command (
    command_id DECIMAL(10,0),
    command_desc VARCHAR(100),
    command_group_id DECIMAL(5,0)
)
;

REVOKE ALL ON tcs_catalog.command FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.query (
    query_id DECIMAL(10,0),
    text TEXT,
    name VARCHAR(100),
    ranking INT,
    column_index INT
)
;

REVOKE ALL ON tcs_catalog.query FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.input_lu (
    input_id DECIMAL(10,0),
    input_code VARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc VARCHAR(100)
)
;

REVOKE ALL ON tcs_catalog.input_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.query_input_xref (
    query_id DECIMAL(10,0),
    optional CHAR(1),
    default_value VARCHAR(100),
    input_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
;

REVOKE ALL ON tcs_catalog.query_input_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
)
;

REVOKE ALL ON tcs_catalog.command_query_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.tc_user_xref (
    user_id DECIMAL(12,0),
    tc_coder_id DECIMAL(10)
)
;

REVOKE ALL ON tcs_catalog.tc_user_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.component_inquiry (
    component_inquiry_id DECIMAL(12,0) not null,
    component_id DECIMAL(12,0),
    user_id DECIMAL(12,0) not null,
    comment VARCHAR(254),
    agreed_to_terms DECIMAL(1) not null,
    rating DECIMAL(5) not null,
    phase DECIMAL(12,0),
    tc_user_id DECIMAL(12,0),
    version DECIMAL(12,0),
    create_time TIMESTAMP default now() not null,
    project_id DECIMAL(10,0)
)
;

REVOKE ALL ON tcs_catalog.component_inquiry FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_version_dates (
    comp_version_dates_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0) not null,
    phase_id DECIMAL(12,0) not null,
    posting_date DATE not null,
    initial_submission_date DATE not null,
    winner_announced_date DATE not null,
    final_submission_date DATE not null,
    estimated_dev_date DATE,
    price DECIMAL(10,2),
    total_submissions DECIMAL(12,0) default 0 not null,
    status_id DECIMAL(12,0) default 301 not null,
    create_time TIMESTAMP default now() not null,
    level_id DECIMAL(12,0),
    screening_complete_date DATE,
    review_complete_date DATE,
    aggregation_complete_date DATE,
    phase_complete_date DATE,
    production_date DATE,
    aggregation_complete_date_comment VARCHAR(254),
    phase_complete_date_comment VARCHAR(254),
    review_complete_date_comment VARCHAR(254),
    winner_announced_date_comment VARCHAR(254),
    initial_submission_date_comment VARCHAR(254),
    screening_complete_date_comment VARCHAR(254),
    final_submission_date_comment VARCHAR(254),
    production_date_comment VARCHAR(254),
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.comp_version_dates FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_level (
    level_id DECIMAL(12,0) not null,
    description VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.comp_level FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_master_tmp (
    login_id DECIMAL(12,0) not null,
    last_login_time TIMESTAMP not null,
    num_logins DECIMAL(7) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.user_master_tmp FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_master (
    login_id DECIMAL(12,0) not null,
    last_login_time TIMESTAMP not null,
    num_logins DECIMAL(7) not null,
    status_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.user_master FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_version_dates_history (
    comp_version_dates_history_id DECIMAL(12,0),
    comp_vers_id DECIMAL(12,0),
    phase_id DECIMAL(12,0),
    posting_date DATE,
    initial_submission_date DATE,
    winner_announced_date DATE,
    final_submission_date DATE,
    estimated_dev_date DATE,
    price DECIMAL(10,2),
    total_submissions DECIMAL(12,0) default 0,
    status_id DECIMAL(12,0),
    create_time TIMESTAMP default now(),
    level_id DECIMAL(12,0),
    screening_complete_date DATE,
    review_complete_date DATE,
    aggregation_complete_date DATE,
    phase_complete_date DATE,
    production_date DATE,
    aggregation_complete_date_comment VARCHAR(254),
    phase_complete_date_comment VARCHAR(254),
    review_complete_date_comment VARCHAR(254),
    winner_announced_date_comment VARCHAR(254),
    initial_submission_date_comment VARCHAR(254),
    screening_complete_date_comment VARCHAR(254),
    final_submission_date_comment VARCHAR(254),
    production_date_comment VARCHAR(254)
)
;

REVOKE ALL ON tcs_catalog.comp_version_dates_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.review_resp (
    review_resp_id DECIMAL(12,0) not null,
    review_resp_name VARCHAR(254) not null,
    phase_id DECIMAL(5,0),
    resource_role_id INT not null
)
;

REVOKE ALL ON tcs_catalog.review_resp FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.sample_inquiry (
    sample_inquiry_id DECIMAL(16) not null,
    first_name VARCHAR(250) not null,
    last_name VARCHAR(250) not null,
    email_address VARCHAR(250) not null,
    catalog VARCHAR(40) not null,
    contact_me DECIMAL(1) not null,
    country_id DECIMAL(16) not null,
    create_date_time TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.sample_inquiry FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_level_phase (
    level_id DECIMAL(12,0) not null,
    phase_id DECIMAL(12,0) not null,
    price_increase DECIMAL(18,2)
)
;

REVOKE ALL ON tcs_catalog.comp_level_phase FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_component_score (
    user_component_score_id DECIMAL(10) not null,
    user_id DECIMAL(10) not null,
    level_id DECIMAL(4) not null,
    comp_vers_id DECIMAL(10) not null,
    phase_id DECIMAL(3) not null,
    score DECIMAL(5,2) not null,
    money DECIMAL(10,2) default 0 not null,
    processed DECIMAL(16) default 0 not null,
    rating DECIMAL(6),
    place DECIMAL(4),
    multiplier DECIMAL(3,0),
    submission_date DATE,
    mod_date_time TIMESTAMP default now() not null,
    create_date_time TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.user_component_score FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_rating (
    user_id DECIMAL(10) not null,
    rating DECIMAL(10) default 0 not null,
    phase_id DECIMAL(3) not null,
    vol DECIMAL(10) default 0 not null,
    rating_no_vol DECIMAL(10) default 0 not null,
    num_ratings DECIMAL(5) default 0 not null,
    mod_date_time TIMESTAMP default now() not null,
    create_date_time TIMESTAMP default now() not null,
    last_rated_project_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.user_rating FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.tcs_ratings_history (
    score DECIMAL(5,2) not null,
    vol DECIMAL(10,0) not null,
    rating DECIMAL(10,0) not null,
    timestamp TIMESTAMP not null,
    level_id DECIMAL(3,0) not null,
    phase_id DECIMAL(3,0) not null
)
;

REVOKE ALL ON tcs_catalog.tcs_ratings_history FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.rboard_status_lu (
    status_id DECIMAL(3,0) not null,
    status_desc VARCHAR(64)
)
;

REVOKE ALL ON tcs_catalog.rboard_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_type_lu (
    contest_type_id DECIMAL(5,0),
    contest_type_desc VARCHAR(64)
)
;

REVOKE ALL ON tcs_catalog.contest_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest (
    contest_id DECIMAL(10,0),
    contest_name VARCHAR(128),
    phase_id DECIMAL(5,0),
    contest_type_id DECIMAL(5,0),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    event_id DECIMAL(10,0),
    modify_date TIMESTAMP default now() not null,
    contest_result_calculator_id INT,
    project_category_id INT
)
;

REVOKE ALL ON tcs_catalog.contest FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_project_xref (
    contest_id DECIMAL(10,0),
    project_id DECIMAL(10,0),
    create_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.contest_project_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.prize_type_lu (
    prize_type_id DECIMAL(5,0),
    prize_type_desc VARCHAR(64)
)
;

REVOKE ALL ON tcs_catalog.prize_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_contest_prize (
    contest_prize_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    payment DECIMAL(10,2)
)
;

REVOKE ALL ON tcs_catalog.user_contest_prize FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_result (
    user_id DECIMAL(10,0),
    project_id DECIMAL(10,0),
    old_rating DECIMAL(5,0),
    new_rating DECIMAL(5,0),
    raw_score DECIMAL(5,2),
    final_score DECIMAL(5,2),
    payment DECIMAL(10,2),
    placed DECIMAL(6,0),
    rating_ind DECIMAL(1,0),
    valid_submission_ind DECIMAL(1,0),
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now(),
    passed_review_ind DECIMAL(1,0),
    point_adjustment FLOAT,
    rating_order INT
)
;

REVOKE ALL ON tcs_catalog.project_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_reliability (
    user_id DECIMAL(10,0),
    rating DECIMAL(5,4),
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now(),
    phase_id DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.user_reliability FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.royalty (
    user_id DECIMAL(10,0),
    amount DECIMAL(7,2),
    description VARCHAR(254),
    royalty_date DATE,
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.royalty FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_event_xref (
    user_id DECIMAL(10,0) not null,
    event_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.user_event_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.notification_mail_type_lu (
    notification_mail_type_id DECIMAL(3,0),
    mail_template VARCHAR(254) not null,
    subject VARCHAR(254) not null,
    "from" VARCHAR(254) not null
)
;

REVOKE ALL ON tcs_catalog.notification_mail_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.notification_event (
    notification_event_id DECIMAL(5,0),
    event VARCHAR(254) not null,
    notification_mail_type_id DECIMAL(3,0) not null,
    description VARCHAR(254)
)
;

REVOKE ALL ON tcs_catalog.notification_event FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_notification_event_xref (
    notification_event_id DECIMAL(5,0) not null,
    user_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON tcs_catalog.user_notification_event_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dual (
    value INT
)
;

REVOKE ALL ON tcs_catalog.dual FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_reg_answer (
    comp_reg_answer_id DECIMAL(10,0),
    comp_reg_question_id DECIMAL(10,0) not null,
    answer_text VARCHAR(250) not null,
    sort_order DECIMAL(3,0),
    is_active DECIMAL(1,0) default 1
)
;

REVOKE ALL ON tcs_catalog.comp_reg_answer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_reg_response (
    comp_reg_question_id DECIMAL(10,0) not null,
    comp_reg_answer_id DECIMAL(10,0),
    response_text TEXT,
    user_id DECIMAL(10,0),
    project_id DECIMAL(10,0) not null,
    create_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.comp_reg_response FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.question_style (
    question_style_id DECIMAL(3,0),
    question_style_desc VARCHAR(25) not null,
    status_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.question_style FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.gp_user_reliability (
    user_id DECIMAL(10,0),
    rating DECIMAL(5,4),
    modify_date TIMESTAMP default now(),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.gp_user_reliability FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_reg_question (
    comp_reg_question_id DECIMAL(10,0),
    question_text VARCHAR not null,
    question_style_id DECIMAL(3,0) not null,
    is_active DECIMAL(1,0) default 1,
    is_required DECIMAL(1,0) default 1
)
;

REVOKE ALL ON tcs_catalog.comp_reg_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_wager (
    user_id DECIMAL(10,0),
    project_id DECIMAL(10,0),
    wager_amount DECIMAL(5,0),
    create_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.project_wager FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.catalog (
    catalog_id DECIMAL(12,0) not null,
    catalog_name VARCHAR(100) not null
)
;

REVOKE ALL ON tcs_catalog.catalog FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.rboard_user (
    user_id DECIMAL(10,0) not null,
    project_type_id DECIMAL(12,0) not null,
    catalog_id DECIMAL(12,0) not null,
    status_id DECIMAL(3,0) not null,
    immune_ind DECIMAL(1,0) not null
)
;

REVOKE ALL ON tcs_catalog.rboard_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.category_catalog (
    catalog_id DECIMAL(12,0) not null,
    category_id DECIMAL(12,0) not null
)
;

REVOKE ALL ON tcs_catalog.category_catalog FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.specification_type (
    specification_type_id DECIMAL(5,0) not null,
    specification_type_desc VARCHAR(50) not null
)
;

REVOKE ALL ON tcs_catalog.specification_type FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.specification (
    specification_id DECIMAL(12,0) not null,
    specification_uploader_id DECIMAL(12,0) not null,
    specification_type_id DECIMAL(5,0) not null,
    passed_auto_screening DECIMAL(1,0),
    specification_url VARCHAR(255) not null,
    specification_remote_filename VARCHAR(50) not null,
    specification_upload_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.specification FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.command_execution (
    command_id DECIMAL(10,0),
    timestamp TIMESTAMP default now(),
    execution_time INT,
    inputs VARCHAR(2000)
)
;

REVOKE ALL ON tcs_catalog.command_execution FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_type_lu (
    project_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    is_generic boolean default 'f'not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.project_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_catalog_lu (
    project_catalog_id INT not null,
    name VARCHAR(64),
    description VARCHAR(254),
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    display boolean,
    display_order INT,
    "version" DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.project_catalog_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_category_lu (
    project_category_id INT not null,
    project_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    display boolean,
    display_order INT,
    project_catalog_id INT,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.project_category_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_type_lu (
    scorecard_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_status_lu (
    scorecard_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard (
    scorecard_id INT not null,
    scorecard_status_id INT not null,
    scorecard_type_id INT not null,
    project_category_id INT not null,
    name VARCHAR(64) not null,
    version VARCHAR(16) not null,
    min_score FLOAT not null,
    max_score FLOAT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version_number DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_group (
    scorecard_group_id INT not null,
    scorecard_id INT not null,
    name VARCHAR(64) not null,
    weight FLOAT not null,
    sort DECIMAL(3,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_group FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_question_type_lu (
    scorecard_question_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_question_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_question (
    scorecard_question_id INT not null,
    scorecard_question_type_id INT not null,
    scorecard_section_id INT not null,
    description VARCHAR(4096) not null,
    guideline VARCHAR(4096),
    weight FLOAT not null,
    sort DECIMAL(3,0) not null,
    upload_document DECIMAL(1,0) not null,
    upload_document_required DECIMAL(1,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_question FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_status_lu (
    project_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project (
    project_id INT not null,
    project_status_id INT not null,
    project_category_id INT not null,
    project_studio_spec_id INTEGER,   
    project_mm_spec_id INTEGER, 
    project_sub_category_id INTEGER,     
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    tc_direct_project_id INT
)
;
REVOKE ALL ON tcs_catalog.project FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_info_type_lu (
    project_info_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(25) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_info_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase_status_lu (
    phase_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.phase_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase_type_lu (
    phase_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.phase_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_phase (
    project_phase_id INT not null,
    project_id INT not null,
    phase_type_id INT not null,
    phase_status_id INT not null,
    fixed_start_time TIMESTAMP,
    scheduled_start_time TIMESTAMP not null,
    scheduled_end_time TIMESTAMP not null,
    actual_start_time TIMESTAMP,
    actual_end_time TIMESTAMP,
    duration DECIMAL(16,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_phase FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase_dependency (
    dependency_phase_id INT not null,
    dependent_phase_id INT not null,
    dependency_start DECIMAL(1,0) not null,
    dependent_start DECIMAL(1,0) not null,
    lag_time DECIMAL(16,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.phase_dependency FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase_criteria_type_lu (
    phase_criteria_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.phase_criteria_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.phase_criteria (
    project_phase_id INT not null,
    phase_criteria_type_id INT not null,
    parameter VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.phase_criteria FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.resource_role_lu (
    resource_role_id INT not null,
    phase_type_id INT,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.resource_role_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.resource (
    resource_id INT not null,
    resource_role_id INT not null,
    project_id INT,
    project_phase_id INT,
    user_id DECIMAL(10,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.resource FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.resource_info_type_lu (
    resource_info_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.resource_info_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.upload_type_lu (
    upload_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.upload_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.upload_status_lu (
    upload_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.upload_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.upload (
    upload_id INT not null,
    project_id INT not null,
    project_phase_id INT,
    resource_id INT not null,
    upload_type_id INT not null,
    upload_status_id INT not null,
    parameter VARCHAR(254) not null,
    upload_desc VARCHAR(254),
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.upload FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.submission_status_lu (
    submission_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.submission_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.submission_type_lu (
    submission_type_id            INTEGER                         not null,
    name                          VARCHAR(64)                     not null,
    description                   VARCHAR(254)                    not null,
    create_user                   VARCHAR(64)                     not null,
    create_date                   TIMESTAMP       not null,
    modify_user                   VARCHAR(64)                     not null,
    modify_date                   TIMESTAMP       not null
)
;

REVOKE ALL ON tcs_catalog.submission_type_lu FROM PUBLIC ;
CREATE TABLE IF NOT EXISTS tcs_catalog.submission (
    submission_id INT not null,
    upload_id INT not null,
    submission_status_id INT not null,
    screening_score DECIMAL(10,5),
    initial_score DECIMAL(10,5),
    final_score DECIMAL(10,5),
    placement DECIMAL(3,0),
    submission_type_id INTEGER NOT NULL,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    user_rank DECIMAL(5,0),
    mark_for_purchase BOOLEAN,
    prize_id INTEGER,
    file_size DECIMAL(18,0),
    view_count DECIMAL(10,0),
    system_file_name varchar(254),
    thurgood_job_id VARCHAR(100)
)
;

REVOKE ALL ON tcs_catalog.submission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.resource_submission (
    resource_id INT not null,
    submission_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.resource_submission FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comment_type_lu (
    comment_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.comment_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.review (
    review_id INT not null,
    resource_id INT not null,
    submission_id INT,
    project_phase_id INT not null,
    scorecard_id INT not null,
    committed DECIMAL(1,0) not null,
    score FLOAT,
    initial_score DECIMAL(5,2),
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.review FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.review_item (
    review_item_id INT not null,
    review_id INT not null,
    scorecard_question_id INT not null,
    upload_id INT,
    answer VARCHAR(254) not null,
    sort DECIMAL(3,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.review_item FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.review_comment (
    review_comment_id INT not null,
    resource_id INT not null,
    review_id INT not null,
    comment_type_id INT not null,
    content VARCHAR(4096) not null,
    extra_info VARCHAR(254),
    sort DECIMAL(3,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.review_comment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.review_item_comment (
    review_item_comment_id INT not null,
    resource_id INT not null,
    review_item_id INT not null,
    comment_type_id INT not null,
    content VARCHAR(4096) not null,
    extra_info VARCHAR(254),
    sort DECIMAL(3,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.review_item_comment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.deliverable_lu (
    deliverable_id INT not null,
    phase_type_id INT not null,
    resource_role_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(64) not null,
    required DECIMAL(1,0) not null,
    submission_type_id INTEGER,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.deliverable_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_audit (
    project_audit_id INT not null,
    project_id INT not null,
    update_reason VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.notification_type_lu (
    notification_type_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.notification_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.notification (
    project_id INT not null,
    external_ref_id INT not null,
    notification_type_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.notification FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.screening_status_lu (
    screening_status_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.screening_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.screening_task (
    screening_task_id INT not null,
    upload_id INT not null,
    screening_status_id INT not null,
    screener_id INT,
    start_timestamp TIMESTAMP,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.screening_task FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.response_severity_lu (
    response_severity_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.response_severity_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.screening_response_lu (
    screening_response_id INT not null,
    response_severity_id INT not null,
    response_code VARCHAR(16) not null,
    response_text VARCHAR(254) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.screening_response_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.screening_result (
    screening_result_id INT not null,
    screening_task_id INT not null,
    screening_response_id INT not null,
    dynamic_response_text VARCHAR(4096) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.screening_result FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.default_scorecard (
    project_category_id INT not null,
    scorecard_type_id INT not null,
    scorecard_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.default_scorecard FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_role (
    user_role_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    role_id DECIMAL(12,0),
    login_id DECIMAL(12,0),
    description VARCHAR(254)
)
;

REVOKE ALL ON tcs_catalog.user_role FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.resource_info (
    resource_id INT not null,
    resource_info_type_id INT not null,
    value VARCHAR(255) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.resource_info FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_info (
    project_id INT not null,
    project_info_type_id INT not null,
    value VARCHAR(255) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_info FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_profile (
    copilot_profile_id DECIMAL(10,0) NOT NULL,
    user_id DECIMAL(10, 0) NOT NULL,
    copilot_profile_status_id DECIMAL(10,0) NOT NULL,
    suspension_count INT NOT NULL,
    reliability DECIMAL(5,2) NOT NULL,
    activation_date TIMESTAMP,
    show_copilot_earnings BOOLEAN,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP  NOT NULL,
    update_user VARCHAR(64) NOT NULL,
    update_date TIMESTAMP  NOT NULL,
    is_software_copilot BOOLEAN DEFAULT 'f',
    is_studio_copilot BOOLEAN DEFAULT 'f'
)
;

REVOKE ALL ON tcs_catalog.copilot_profile FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_profile_status (
    copilot_profile_status_id DECIMAL(10,0) NOT NULL,
    name VARCHAR(40) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP  NOT NULL,
    update_user VARCHAR(64) NOT NULL,
    update_date TIMESTAMP  NOT NULL
)
;

REVOKE ALL ON tcs_catalog.copilot_profile_status FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_profile_info (
    copilot_profile_info_id DECIMAL(10,0) NOT NULL,
    copilot_profile_info_type_id DECIMAL(10,0) NOT NULL,
    copilot_profile_id DECIMAL(10,0) NOT NULL,
    value VARCHAR(100) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP  NOT NULL,
    update_user VARCHAR(64) NOT NULL,
    update_date TIMESTAMP  NOT NULL
)
;

REVOKE ALL ON tcs_catalog.copilot_profile_info FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_profile_info_type (
    copilot_profile_info_type_id DECIMAL(10,0) NOT NULL,
    name VARCHAR(20) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP  NOT NULL,
    update_user VARCHAR(64) NOT NULL,
    update_date TIMESTAMP  NOT NULL
)
;

REVOKE ALL ON tcs_catalog.copilot_profile_info_type FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.gp_user_contest_prize (
    contest_prize_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    payment DECIMAL(10,2)
)
;

REVOKE ALL ON tcs_catalog.gp_user_contest_prize FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_rating_audit (
    user_id DECIMAL(10,0),
    phase_id DECIMAL(3,0),
    column_name VARCHAR(30),
    old_value VARCHAR(254),
    new_value VARCHAR(254),
    timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.user_rating_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_reliability_audit (
    user_id DECIMAL(10,0),
    phase_id DECIMAL(3,0),
    column_name VARCHAR(30),
    old_value VARCHAR(254),
    new_value VARCHAR(254),
    timestamp TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.user_reliability_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_versions (
    comp_vers_id DECIMAL(12,0) not null,
    component_id DECIMAL(12,0),
    version DECIMAL(12,0) not null,
    version_text CHAR(20) not null,
    create_time TIMESTAMP  default now(),
    phase_id DECIMAL(12,0) not null,
    phase_time TIMESTAMP not null,
    price DECIMAL(10,2) not null,
    comments VARCHAR,
    modify_date TIMESTAMP default now() not null,
    suspended_ind DECIMAL(1,0) default 0
)
;

REVOKE ALL ON tcs_catalog.comp_versions FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_jive_category_xref (
    comp_vers_id DECIMAL(12,0) not null,
    jive_category_id INT not null
)
;

REVOKE ALL ON tcs_catalog.comp_jive_category_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_forum_xref_bak (
    comp_forum_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0),
    forum_id DECIMAL(12,0),
    forum_type DECIMAL(5) not null,
    jive_category_id DECIMAL(15,0)
)
;

REVOKE ALL ON tcs_catalog.comp_forum_xref_bak FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_prize (
    contest_prize_id DECIMAL(10,0),
    contest_id DECIMAL(10,0),
    prize_type_id DECIMAL(5,0),
    place DECIMAL(2,0),
    prize_amount DECIMAL(10,2),
    prize_desc VARCHAR(100),
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.contest_prize FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.season (
    season_id DECIMAL(6,0),
    name NVARCHAR(254),
    rookie_competition_ind DECIMAL(1,0),
    next_rookie_season_id DECIMAL(6,0),
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.season FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.stage (
    stage_id DECIMAL(6,0),
    season_id DECIMAL(6,0) not null,
    name NVARCHAR(254) not null,
    start_date TIMESTAMP not null,
    end_date TIMESTAMP not null,
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.stage FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_stage_xref (
    contest_id DECIMAL(10,0),
    stage_id DECIMAL(6,0),
    top_trip_winners DECIMAL(3,0),
    top_performers_factor DECIMAL(4,2)
)
;

REVOKE ALL ON tcs_catalog.contest_stage_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_season_xref (
    contest_id DECIMAL(10,0),
    season_id DECIMAL(6,0)
)
;

REVOKE ALL ON tcs_catalog.contest_season_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_result_calculator_lu (
    contest_result_calculator_id INT,
    class_name VARCHAR(100) not null
)
;

REVOKE ALL ON tcs_catalog.contest_result_calculator_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.scorecard_section (
    scorecard_section_id INT not null,
    scorecard_group_id INT not null,
    name VARCHAR(1024) not null,
    weight FLOAT not null,
    sort DECIMAL(3,0) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null,
    version DECIMAL(12,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.scorecard_section FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.member_ban (
    ban_id INT not null,
    user_id INT not null,
    timestamp TIMESTAMP not null,
    expiration TIMESTAMP not null,
    removed boolean not null
)
;

REVOKE ALL ON tcs_catalog.member_ban FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.message (
    message_id INT not null,
    from_handle VARCHAR(50) not null,
    project_id INT not null,
    project_name VARCHAR(50) not null,
    timestamp TIMESTAMP not null,
    subject VARCHAR(250),
    message VARCHAR(4096) not null
)
;

REVOKE ALL ON tcs_catalog.message FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.message_to_handle (
    message_id INT not null,
    to_handle VARCHAR(50) not null
)
;

REVOKE ALL ON tcs_catalog.message_to_handle FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.status_assignment (
    status_assignment_id INT not null,
    offer_id INT not null,
    status_id SMALLINT not null,
    timestamp TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.status_assignment FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.offer (
    offer_id INT not null,
    from_user_id INT not null,
    to_user_id INT not null,
    position_id INT not null,
    payment SMALLINT not null,
    message VARCHAR(4096),
    current_status_assignment_id INT not null,
    rejection_cause VARCHAR(4096)
)
;

REVOKE ALL ON tcs_catalog.offer FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_header (
    team_id INT not null,
    name VARCHAR(32) not null,
    description VARCHAR(255) not null,
    finalized boolean not null,
    project_id INT not null,
    captain_resource_id INT not null,
    captain_payment SMALLINT not null
)
;

REVOKE ALL ON tcs_catalog.team_header FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_properties (
    team_id INT not null,
    key VARCHAR(255) not null,
    value TEXT
)
;

REVOKE ALL ON tcs_catalog.team_properties FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_position (
    position_id INT not null,
    team_id INT not null,
    name VARCHAR(32) not null,
    description VARCHAR(255) not null,
    published boolean not null,
    resource_id INT,
    payment SMALLINT not null
)
;

REVOKE ALL ON tcs_catalog.team_position FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_position_properties (
    position_id INT not null,
    key VARCHAR(255) not null,
    value TEXT
)
;

REVOKE ALL ON tcs_catalog.team_position_properties FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_manager_audit (
    team_manager_audit_id INT not null,
    user_id INT not null,
    entity_id INT not null,
    entity_type VARCHAR(15) not null,
    date TIMESTAMP not null,
    active boolean not null
)
;

REVOKE ALL ON tcs_catalog.team_manager_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_manager_audit_details (
    team_manager_audit_id INT not null,
    name VARCHAR(31) not null,
    old_value VARCHAR(255),
    new_value VARCHAR(255)
)
;

REVOKE ALL ON tcs_catalog.team_manager_audit_details FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.team_manager_audit_custom_details (
    team_manager_audit_id INT not null,
    name VARCHAR(255) not null,
    old_value TEXT,
    new_value TEXT
)
;

REVOKE ALL ON tcs_catalog.team_manager_audit_custom_details FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.facade_audit (
    create_date TIMESTAMP default now() not null,
    create_user VARCHAR(64) not null,
    session_key INT not null,
    message VARCHAR(255)
)
;

REVOKE ALL ON tcs_catalog.facade_audit FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_catalog (
    component_id DECIMAL(12,0) not null,
    current_version DECIMAL(12,0) not null,
    short_desc VARCHAR,
    component_name VARCHAR(254) not null,
    description VARCHAR(10000),
    function_desc VARCHAR,
    create_time TIMESTAMP  default now(),
    status_id DECIMAL(12,0) not null,
    root_category_id DECIMAL(12,0),
    modify_date TIMESTAMP default now() not null,
    public_ind DECIMAL(1,0) default 0 not null
)
;

REVOKE ALL ON tcs_catalog.comp_catalog FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_pablo (
    project_id INT not null,
    project_status_id INT not null,
    project_category_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_pablo FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.framework (
    framework_id INT,
    name VARCHAR(100),
    description VARCHAR
)
;

REVOKE ALL ON tcs_catalog.framework FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.widget (
    widget_id INT,
    framework_id INT,
    name VARCHAR(100),
    description VARCHAR
)
;

REVOKE ALL ON tcs_catalog.widget FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.widget_version (
    widget_version_id INT,
    version_major INT not null,
    version_minor INT not null,
    version_increment INT not null,
    version_build INT not null,
    widget_id INT not null,
    notes VARCHAR,
    version_date TIMESTAMP default now(),
    download_url VARCHAR(300),
    deprecate_date TIMESTAMP default now(),
    current_version boolean,
    minimum_version boolean
)
;

REVOKE ALL ON tcs_catalog.widget_version FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.project_info_before_moving_price (
    project_id INT not null,
    project_info_type_id INT not null,
    value VARCHAR(255) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.project_info_before_moving_price FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_version_dates_before_moving_price (
    comp_version_dates_id DECIMAL(12,0) not null,
    comp_vers_id DECIMAL(12,0) not null,
    phase_id DECIMAL(12,0) not null,
    posting_date DATE not null,
    initial_submission_date DATE not null,
    winner_announced_date DATE not null,
    final_submission_date DATE not null,
    estimated_dev_date DATE,
    price DECIMAL(10,2) not null,
    total_submissions DECIMAL(12,0) default 0 not null,
    status_id DECIMAL(12,0) default 301 not null,
    create_time TIMESTAMP default now() not null,
    level_id DECIMAL(12,0),
    screening_complete_date DATE,
    review_complete_date DATE,
    aggregation_complete_date DATE,
    phase_complete_date DATE,
    production_date DATE,
    aggregation_complete_date_comment VARCHAR(254),
    phase_complete_date_comment VARCHAR(254),
    review_complete_date_comment VARCHAR(254),
    winner_announced_date_comment VARCHAR(254),
    initial_submission_date_comment VARCHAR(254),
    screening_complete_date_comment VARCHAR(254),
    final_submission_date_comment VARCHAR(254),
    production_date_comment VARCHAR(254),
    modify_date TIMESTAMP default now() not null
)
;

REVOKE ALL ON tcs_catalog.comp_version_dates_before_moving_price FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dr_points (
    dr_points_id DECIMAL(10,0) not null,
    track_id DECIMAL(10,0) not null,
    dr_points_reference_type_id INT not null,
    dr_points_operation_id INT not null,
    dr_points_type_id INT not null,
    dr_points_status_id INT not null,
    dr_points_desc VARCHAR(100) not null,
    user_id DECIMAL(10,0) not null,
    amount DECIMAL(10,2) not null,
    application_date TIMESTAMP not null,
    award_date TIMESTAMP not null,
    reference_id DECIMAL(10,0),
    is_potential boolean default 'f',
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.dr_points FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dr_points_operation_lu (
    dr_points_operation_id INT not null,
    dr_points_operation_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.dr_points_operation_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dr_points_reference_type_lu (
    dr_points_reference_type_id INT not null,
    dr_points_reference_type_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.dr_points_reference_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dr_points_type_lu (
    dr_points_type_id INT not null,
    dr_points_type_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.dr_points_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.dr_points_status_lu (
    dr_points_status_id INT not null,
    dr_points_status_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.dr_points_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.points_calculator_lu (
    points_calculator_id INT not null,
    class_name VARCHAR(100) not null,
    points_calculator_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.points_calculator_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track (
    track_id DECIMAL(10,0) not null,
    points_calculator_id INT not null,
    track_type_id INT not null,
    track_status_id INT not null,
    track_desc VARCHAR(50) not null,
    track_start_date TIMESTAMP not null,
    track_end_date TIMESTAMP not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_contest (
    track_contest_id DECIMAL(10,0) not null,
    track_contest_result_calculator_id INT not null,
    track_contest_type_id INT not null,
    track_id DECIMAL(10,0) not null,
    track_contest_desc VARCHAR(128) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track_contest FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_contest_result_calculator_lu (
    track_contest_result_calculator_id INT not null,
    class_name VARCHAR(100) not null,
    track_contest_result_calculator_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track_contest_result_calculator_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_contest_type_lu (
    track_contest_type_id INT not null,
    track_contest_type_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track_contest_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_project_category_xref (
    track_id DECIMAL(10,0) not null,
    project_category_id INT not null
)
;

REVOKE ALL ON tcs_catalog.track_project_category_xref FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_type_lu (
    track_type_id INT not null,
    track_type_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track_type_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.track_status_lu (
    track_status_id INT not null,
    track_status_desc VARCHAR(50) not null,
    create_date TIMESTAMP default now(),
    modify_date TIMESTAMP default now()
)
;

REVOKE ALL ON tcs_catalog.track_status_lu FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.categories (
    category_id DECIMAL(12,0) not null,
    parent_category_id DECIMAL(12,0),
    category_name VARCHAR(100) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(12,0) not null,
    viewable DECIMAL(1,0) default 1,
    is_custom boolean default 'f'
)
;

REVOKE ALL ON tcs_catalog.categories FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_client (
    component_id DECIMAL(12,0) not null,
    client_id INT not null
)
;

REVOKE ALL ON tcs_catalog.comp_client FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_user (
    component_id DECIMAL(12,0) not null,
    user_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON tcs_catalog.comp_user FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.user_client (
    user_id DECIMAL(10,0) not null,
    client_id DECIMAL(10,0) not null,
    admin_ind DECIMAL(12,0)
)
;

REVOKE ALL ON tcs_catalog.user_client FROM PUBLIC;
CREATE TABLE IF NOT EXISTS tcs_catalog.comp_link (
    comp_link_id INT,
    comp_vers_id VARCHAR(255),
    link VARCHAR(255)
)
;

REVOKE ALL ON tcs_catalog.comp_link FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.link_type_lu (
    link_type_id INT not null,
    link_type_name VARCHAR(64) not null,
    allow_overlap DECIMAL(1) 
)
;
 
REVOKE ALL ON tcs_catalog.link_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.linked_project_xref (
    source_project_id INT,
    dest_project_id INT,
    link_type_id INT
)
;
 
REVOKE ALL ON tcs_catalog.linked_project_xref FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.third_party_library(

third_party_library_id DECIMAL(10,0) not null,
name varchar(50),
version varchar(50),
description varchar(100),
url varchar(50),
license varchar(50),
usage_comments varchar(150),
path varchar(200),
alias varchar(50),
notes varchar(150),
category varchar(50)
)
;

 
REVOKE ALL ON tcs_catalog.third_party_library FROM PUBLIC;

create OR REPLACE view tcs_catalog.v_latest_version (version,component_name,
       component_id,comp_vers_id,phase_id) as
   select max(x0.version ) ,x1.component_name ,x1.component_id ,
       x0.comp_vers_id ,x0.phase_id 
   from tcs_catalog.comp_versions x0 ,tcs_catalog.comp_catalog x1 
   where (((x0.phase_id IN (112. ,113. )) AND (x1.component_id = x0.component_id ) ) AND (x1.status_id = 102. ) ) group by x1.component_name ,
       x1.component_id ,x0.comp_vers_id ,x0.phase_id ;
REVOKE ALL ON tcs_catalog.v_latest_version FROM PUBLIC;

create OR REPLACE view tcs_catalog.user_customer (user_customer_id,login_id,
       first_name,last_name,company,address,city,postal_code,
       country_code,telephone_country,telephone_area,telephone_nbr,
       use_components,use_consultants,receive_tcsnews,receive_newshtml,
       company_size_id,tier_id,activation_code,email_address) as
   select x0.user_id ,x0.user_id ,x0.first_name ,x0.last_name ,
       x6.company_name ,((x1.address1 || ' ' ) || x1.address2 ) ,
       x1.city ,x1.zip ,x1.country_code ,'' ,'' ,x4.phone_number ,
       0 ,0 ,0 ,0 ,1 ,0 ,x0.activation_code ,x3.address 
   from common_oltp.user x0 ,common_oltp.address x1 ,common_oltp.user_address_xref x2 ,common_oltp.email x3 ,outer(common_oltp.phone x4 ,common_oltp.contact x5 ,common_oltp.company x6 ) 
   where ((((((((x0.user_id = x2.user_id ) AND (x1.address_id = x2.address_id ) ) AND (x3.primary_ind = 1. ) ) AND (x3.user_id = x0.user_id ) ) AND (x4.user_id = x0.user_id ) ) AND (x4.primary_ind = 1. ) ) AND (x5.contact_id = x0.user_id ) ) AND (x5.company_id = x6.company_id ) ) ;
REVOKE ALL ON tcs_catalog.user_customer FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_spec (
   project_spec_id INTEGER NOT NULL,
   project_id INTEGER NOT NULL,
   version INTEGER NOT NULL,
   detailed_requirements VARCHAR (20000),
   detailed_requirements_text TEXT,
   submission_deliverables VARCHAR (4000),
   submission_deliverables_text TEXT,
   environment_setup_instruction VARCHAR,
   final_submission_guidelines  VARCHAR,
   final_submission_guidelines_text TEXT,
   private_description VARCHAR (4096),
   private_description_text TEXT,
   create_user VARCHAR(64),
   create_date TIMESTAMP,
   modify_user VARCHAR(64),
   modify_date TIMESTAMP 
)
;

REVOKE ALL ON tcs_catalog.project_spec FROM PUBLIC;

-- SIZE = 5 ROWS
CREATE TABLE IF NOT EXISTS tcs_catalog.sale_status_lu (
    sale_status_id INTEGER NOT NULL,
    sale_status_desc VARCHAR(100) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.sale_status_lu FROM PUBLIC;

-- SIZE = 5 ROWS
CREATE TABLE IF NOT EXISTS tcs_catalog.sale_type_lu (
    sale_type_id INTEGER NOT NULL,
    sale_type_name VARCHAR(100) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.sale_type_lu FROM PUBLIC;

-- SIZE = 4000 ROWS PER YEAR IN THE FIRST YEAR
CREATE TABLE IF NOT EXISTS tcs_catalog.contest_sale (
    contest_sale_id INTEGER not null,
    contest_id INTEGER not null,
    sale_status_id INTEGER not null,
    price DECIMAL(10,2) not null,
    paypal_order_id VARCHAR(128),
    create_date TIMESTAMP default now() not null,
    sale_reference_id VARCHAR(128),
    sale_type_id INTEGER
)
;

REVOKE ALL ON tcs_catalog.contest_sale FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.software_competition_pipeline_info (
    id DECIMAL(10,0) not null,
    competition_id INT,
    review_payment DECIMAL(7,3),
    specification_review_payment DECIMAL(7,3),
    contest_fee DECIMAL(7,3),
    client_name VARCHAR(45),
    confidence DECIMAL(10,0),
    client_approval SMALLINT,
    pricing_approval SMALLINT,
    has_wiki_specification SMALLINT,
    passed_spec_review SMALLINT,
    has_dependent_competitions SMALLINT,
    was_reposted SMALLINT,
    notes VARCHAR(150),
    component_id DECIMAL(12,0),
    PRIMARY KEY (id)
   
) 
;

REVOKE ALL ON tcs_catalog.software_competition_pipeline_info FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.software_competition_change_history (
    id DECIMAL(10,0) not null,
    manager VARCHAR(45),
    client VARCHAR(45),
    type VARCHAR(45),
    new_data VARCHAR(45),
    old_data VARCHAR(45),
    initial_data VARCHAR(45),
    change_time TIMESTAMP default now(),
    change_type VARCHAR(45),
    software_competition_pipeline_info_id DECIMAL(10,0),
    PRIMARY KEY (id)
) 
;

REVOKE ALL ON tcs_catalog.software_competition_change_history FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.audit_action_type_lu (
    audit_action_type_id INT not null,
    name VARCHAR(50) not null,
    description VARCHAR(50) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP default now() not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP default now() not null
) 
;
REVOKE ALL ON tcs_catalog.audit_action_type_lu FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_user_audit  (
    project_user_audit_id DECIMAL(12,0) not null,
    project_id INT not null,
    resource_user_id DECIMAL(12,0) not null,
    resource_role_id INT not null,
    audit_action_type_id INT not null,
    action_date TIMESTAMP not null,
    action_user_id DECIMAL(12,0) not null
) 
;
REVOKE ALL ON tcs_catalog.project_user_audit FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_info_audit (
    project_id int not null,
    project_info_type_id int not null,
    value varchar(255),
    audit_action_type_id int not null,
    action_date TIMESTAMP not null,
    action_user_id decimal(12,0) not null
) 
;
REVOKE ALL ON tcs_catalog.project_info_audit FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_phase_audit (
    project_phase_id int not null,
    scheduled_start_time TIMESTAMP,
    scheduled_end_time TIMESTAMP,
    audit_action_type_id int not null,
    action_date TIMESTAMP not null,
    action_user_id decimal(12,0) not null
) 
;
REVOKE ALL ON tcs_catalog.project_phase_audit FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.client_billing_config (
 
            client_billing_id DECIMAL(10,0) not null, 
            client_billing_config_type_id INT not null, 
            value VARCHAR(255) not null, 
    create_user VARCHAR(64) not null, 
    create_date TIMESTAMP not null, 
    modify_user VARCHAR(64) not null, 
    modify_date TIMESTAMP not null 
) 
;
REVOKE ALL ON tcs_catalog.client_billing_config FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.client_billing_config_type_lu ( 
            client_billing_config_type_id INT not null, 
    name VARCHAR(64) not null, 
    description VARCHAR(25) not null, 
    create_user VARCHAR(64) not null, 
    create_date TIMESTAMP not null, 
    modify_user VARCHAR(64) not null, 
    modify_date TIMESTAMP not null 
)
;
REVOKE ALL ON tcs_catalog.client_billing_config_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.late_deliverable_type_lu (
    late_deliverable_type_id INT NOT NULL,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(254) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.late_deliverable_type_lu FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.late_deliverable (
    late_deliverable_id serial NOT NULL,
    late_deliverable_type_id INTEGER NOT NULL,
    project_phase_id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    deliverable_id INTEGER NOT NULL,
    deadline TIMESTAMP,
    compensated_deadline TIMESTAMP,
    create_date TIMESTAMP NOT NULL,
    forgive_ind DECIMAL(1,0) NOT NULL,
    last_notified TIMESTAMP,
    delay DECIMAL(16,0),
    explanation VARCHAR(4096),
    explanation_date TIMESTAMP,
    response VARCHAR(4096),
    response_user VARCHAR(64),
    response_date TIMESTAMP
)
;
REVOKE ALL ON tcs_catalog.late_deliverable FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_feedback (
    review_feedback_id serial NOT NULL,
    project_id INT NOT NULL,
    comment VARCHAR(4096),
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    modify_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP NOT NULL
)
;
REVOKE ALL ON tcs_catalog.review_feedback FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_feedback_audit (
    review_feedback_id INT NOT NULL,
    project_id INT NOT NULL,
    comment VARCHAR(4096),
    audit_action_type_id INT NOT NULL,
    action_user VARCHAR(64) NOT NULL,
    action_date TIMESTAMP NOT NULL
)
;
REVOKE ALL ON tcs_catalog.review_feedback_audit FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_feedback_detail (
    review_feedback_id INT NOT NULL,
    reviewer_user_id DECIMAL(10,0) NOT NULL,
    score INTEGER NOT NULL,
    feedback_text VARCHAR(4096) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.review_feedback_detail FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_feedback_detail_audit (
    review_feedback_id INT NOT NULL,
    reviewer_user_id DECIMAL(10,0) NOT NULL,
    score INTEGER,
    feedback_text VARCHAR(4096),
    audit_action_type_id INT NOT NULL,
    action_user VARCHAR(64) NOT NULL,
    action_date TIMESTAMP NOT NULL
)
;
REVOKE ALL ON tcs_catalog.review_feedback_detail_audit FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_reliability (
    project_id INT NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    resolution_date TIMESTAMP NOT NULL,
    reliability_before_resolution DECIMAL(5,4),
    reliability_after_resolution DECIMAL(5,4) NOT NULL,
    reliability_on_registration DECIMAL(5,4),
    reliable_ind DECIMAL(1,0) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.project_reliability FROM PUBLIC ;

CREATE TABLE IF NOT EXISTS copilot_project_status (
  copilot_project_status_id DECIMAL(10,0) NOT NULL,
  name VARCHAR(10) NOT NULL,
  create_user VARCHAR(64) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  modify_user VARCHAR(64) NOT NULL,
  modify_date TIMESTAMP NOT NULL,
  PRIMARY KEY (copilot_project_status_id)
)
;
REVOKE ALL ON tcs_catalog.copilot_project_status FROM PUBLIC;


CREATE TABLE IF NOT EXISTS copilot_type (
  copilot_type_id DECIMAL(10, 0) NOT NULL,
  name VARCHAR(20) NOT NULL,
  create_user VARCHAR(64) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  modify_user VARCHAR(64) NOT NULL,
  modify_date VARCHAR(64) NOT NULL,
  PRIMARY KEY (copilot_type_id)
)
;
REVOKE ALL ON tcs_catalog.copilot_type FROM PUBLIC;


CREATE TABLE IF NOT EXISTS copilot_project (
  copilot_project_id DECIMAL(10,0) NOT NULL,
  copilot_profile_id DECIMAL(10,0) NOT NULL,
  name VARCHAR(255),
  tc_direct_project_id DECIMAL(10,0) NOT NULL,
  copilot_type_id DECIMAL(10,0) NOT NULL,
  copilot_project_status_id DECIMAL(10,0) NOT NULL,
  customer_feedback VARCHAR(4096),
  customer_rating DECIMAL(2,1),
  pm_feedback VARCHAR(4096),
  pm_rating DECIMAL(2,1),
  private_project CHAR(1) NOT NULL,
  completion_date TIMESTAMP,
  create_user VARCHAR(64) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  modify_user VARCHAR(64) NOT NULL,
  modify_date TIMESTAMP NOT NULL,
  PRIMARY KEY (copilot_project_id)
)
;
REVOKE ALL ON tcs_catalog.copilot_project FROM PUBLIC;


CREATE TABLE IF NOT EXISTS copilot_project_info_type (
  copilot_project_info_type_id DECIMAL(10,0) NOT NULL,
  name VARCHAR(20) NOT NULL,
  create_user VARCHAR(64) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  modify_user VARCHAR(64) NOT NULL,
  modify_date TIMESTAMP NOT NULL,
  PRIMARY KEY (copilot_project_info_type_id)
)
;
REVOKE ALL ON tcs_catalog.copilot_project_info_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS copilot_project_info (
  copilot_project_info_id DECIMAL(10,0) NOT NULL,
  copilot_project_id DECIMAL(10,0) NOT NULL,
  copilot_project_info_type_id DECIMAL(10,0) NOT NULL,
  value VARCHAR(800) NOT NULL,
  create_user VARCHAR(64) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  modify_user VARCHAR(64) NOT NULL,
  modify_date TIMESTAMP NOT NULL,
  PRIMARY KEY (copilot_project_info_id)
)
;
REVOKE ALL ON tcs_catalog.copilot_project_info FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.file_type_lu (
  file_type_id INTEGER not null,
  description VARCHAR(254) not null,
  sort INTEGER not null,
  image_file BOOLEAN not null,
  extension  VARCHAR(20) not null,
  bundled_file BOOLEAN not null,
  create_user VARCHAR(64) not null,
  create_date TIMESTAMP not null,
  modify_user VARCHAR(64)  not null,
  modify_date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.file_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.prize (
  prize_id INTEGER not null,
  project_id INT not null,
  place INTEGER not null,
  prize_amount FLOAT not null,
  prize_type_id DECIMAL(5,0) not null,
  number_of_submissions INTEGER not null,
  create_user VARCHAR(64) not null,
  create_date TIMESTAMP not null,
  modify_user VARCHAR(64) not null,
  modify_date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.prize FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_studio_specification (
  project_studio_spec_id INTEGER not null,
  goals VARCHAR (2000),
  target_audience VARCHAR (500),
  branding_guidelines VARCHAR (500),
  disliked_design_websites VARCHAR (500),
  other_instructions VARCHAR (2000),
  winning_criteria VARCHAR (2000),
  submitters_locked_between_rounds BOOLEAN,
  round_one_introduction VARCHAR (2000),
  round_two_introduction VARCHAR (2000),
  colors VARCHAR (500),
  fonts VARCHAR (500),
  layout_and_size VARCHAR (500),
  contest_introduction VARCHAR (2000),
  contest_description VARCHAR (10000),
  contest_description_text TEXT,
  content_requirements VARCHAR (2000),
  general_feedback VARCHAR(2000),
  create_user VARCHAR(64) not null,
  create_date TIMESTAMP not null,
  modify_user VARCHAR(64) not null,
  modify_date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.project_studio_specification FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_mm_specification (
  project_mm_spec_id INTEGER not null,
  match_details    text,
  match_rules      text,
  problem_id       INTEGER,
  create_user      VARCHAR(64) not null,
  create_date      TIMESTAMP not null,
  modify_user      VARCHAR(64) not null,
  modify_date      TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.project_mm_specification FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_file_type_xref (
  project_id INTEGER not null,
  file_type_id INTEGER not null
)
;
REVOKE ALL ON tcs_catalog.project_file_type_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.default_terms (
    project_category_id INT not null,
    resource_role_id INT not null,
    terms_of_use_id DECIMAL(10,0) not null,
    cca BOOLEAN
)
;
REVOKE ALL ON tcs_catalog.default_terms FROM PUBLIC; 

CREATE TABLE IF NOT EXISTS tcs_catalog.mime_type_lu (
  mime_type_id DECIMAL(12,0) not null,
  file_type_id INTEGER not null,
  mime_type_desc VARCHAR(100) not null
)    
;
REVOKE ALL ON tcs_catalog.mime_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.submission_image (
  submission_id INTEGER not null,
  image_id DECIMAL(10,0) not null,
  sort_order INTEGER not null,
  modify_date TIMESTAMP DEFAULT now(),
  create_date TIMESTAMP DEFAULT now()
)  
;
REVOKE ALL ON tcs_catalog.submission_image FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.submission_declaration (
    submission_declaration_id DECIMAL(10,0) NOT NULL,
    submission_id INTEGER NOT NULL,
    comment text NOT NULL,
    has_external_content CHAR(1)
) 
;
REVOKE ALL ON tcs_catalog.submission_declaration FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.external_content_type (
    external_content_type_id DECIMAL(10, 0) NOT NULL,
    name VARCHAR(50) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.external_content_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.submission_external_content (
    external_content_id DECIMAL(10, 0) NOT NULL,
    external_content_type_id DECIMAL(10, 0) NOT NULL,
    display_position INTEGER NOT NULL,
    submission_declaration_id DECIMAL(10, 0) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.submission_external_content FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.external_content_property (
    external_content_property_id DECIMAL(10, 0) NOT NULL,
    external_content_id DECIMAL(10, 0) NOT NULL,
    name VARCHAR(50) NOT NULL,
    value VARCHAR(100) NOT NULL
)
;
REVOKE ALL ON tcs_catalog.external_content_property FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_download_audit (
    upload_id INT not null,
    user_id DECIMAL(10,0),
    ip_address VARCHAR(20) not null,
    successful boolean not null,
    date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.project_download_audit FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_copilot_type_lu
  (
    project_copilot_type_id INT not null,
    name VARCHAR(64) not null,
    project_copilot_type_desc VARCHAR(64) not null
  )
;
REVOKE ALL ON tcs_catalog.project_copilot_type_lu FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.project_copilot_type
  (
    project_id INT not null,
    project_copilot_type_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
  )
;
REVOKE ALL ON tcs_catalog.project_copilot_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_contest_extra_info_type
  (
    copilot_contest_extra_info_type_id INT not null,
    name VARCHAR(64) not null,
    copilot_contest_extra_info_type_desc VARCHAR(64) not null
  )
;
REVOKE ALL ON tcs_catalog.copilot_contest_extra_info_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.copilot_contest_extra_info
  (
    copilot_posting_contest_id INT not null,
    copilot_contest_extra_info_type_id INT not null,
    value VARCHAR(255) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
  )
;
REVOKE ALL ON tcs_catalog.copilot_contest_extra_info FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata (
    project_metadata_id SERIAL NOT NULL,
    tc_direct_project_id DECIMAL(10,0) NOT NULL,
    project_metadata_key_id INTEGER NOT NULL,
    metadata_value VARCHAR(350) NOT NULL,
    constraint pk_direct_project_metadata PRIMARY KEY (project_metadata_id) )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata_audit (
    project_metadata_audit_id DECIMAL(10,0) NOT NULL,
    project_metadata_id DECIMAL(10,0) NOT NULL,
    tc_direct_project_id DECIMAL(10,0) NOT NULL,
    project_metadata_key_id DECIMAL(10,0) NOT NULL,
    metadata_value VARCHAR(500) NOT NULL,
    audit_action_type_id INTEGER NOT NULL,
    action_date TIMESTAMP NOT NULL,
    action_user_id DECIMAL(10,0) NOT NULL )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata_audit FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata_key (
    project_metadata_key_id SERIAL NOT NULL, name VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    grouping CHAR(1),
    client_id DECIMAL(10,0),
    single CHAR(1) NOT NULL,
    constraint pk_direct_project_metadata_key PRIMARY KEY (project_metadata_key_id) )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata_key FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata_key_audit (
    project_metadata_key_audit_id DECIMAL(10,0) NOT NULL,
    project_metadata_key_id DECIMAL(10,0) NOT NULL,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(255),
    grouping CHAR(1),
    client_id DECIMAL(10,0),
    audit_action_type_id INTEGER NOT NULL,
    action_date TIMESTAMP NOT NULL,
    action_user_id DECIMAL(12,0) NOT NULL,
    single CHAR(1) NOT NULL )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata_key_audit FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata_predefined_value (
    project_metadata_predefined_value_id SERIAL NOT NULL,
    project_metadata_key_id INTEGER NOT NULL,
    predefined_metadata_value VARCHAR(500) NOT NULL,
    position INTEGER NOT NULL,
    list_order INTEGER NOT NULL ,
    constraint pk_direct_project_metadata_predefined_value PRIMARY KEY (project_metadata_predefined_value_id) )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata_predefined_value FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_metadata_predefined_value_audit (
    project_metadata_predefined_value_audit_id DECIMAL(10,0) NOT NULL,
    project_metadata_predefined_value_id DECIMAL(10,0) NOT NULL,
    project_metadata_key_id DECIMAL(10,0) NOT NULL,
    predefined_metadata_value VARCHAR(500) NOT NULL,
    position INTEGER NOT NULL,
    audit_action_type_id INTEGER NOT NULL,
    action_date TIMESTAMP NOT NULL,
    action_user_id DECIMAL(12,0) NOT NULL )
;
REVOKE ALL ON tcs_catalog.direct_project_metadata_predefined_value_audit FROM PUBLIC;

CREATE TABLE IF NOT EXISTS project_milestone (
    project_milestone_id Serial not null,
    name VARCHAR(80) not null,
    description VARCHAR(250) not null,
    due_date TIMESTAMP not null,                   
    send_notifications boolean not null,
    completed boolean not null,
    project_id INT not null,
	completion_date TIMESTAMP
)
;

REVOKE ALL ON tcs_catalog.project_milestone FROM PUBLIC;

CREATE TABLE IF NOT EXISTS project_milestone_owner (
    project_milestone_owner_id Serial NOT NULL,
    user_id INT NOT NULL,
    user_handle VARCHAR(45) NOT NULL,
    project_milestone_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.project_milestone_owner FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.comp_milestone_feedback (
	comp_milestone_feedback_id serial not null,
	project_id int not null UNIQUE,

	feedback VARCHAR(4096)
)
;

REVOKE ALL ON tcs_catalog.comp_milestone_feedback FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.customer_group (
	group_id INT NOT NULL,
	name VARCHAR(45) NOT NULL,
	default_permission VARCHAR(20) NOT NULL,
	client_id INT NOT NULL,
	archived SMALLINT NOT NULL,
	archived_on TIMESTAMP,
	effective_group_id INT,
	auto_grant SMALLINT DEFAULT 0
) 
;

REVOKE ALL ON tcs_catalog.customer_group FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.group_associated_billing_accounts(
	group_id INT NOT NULL,
	billing_account_id INT NOT NULL)
;

REVOKE ALL ON tcs_catalog.group_associated_billing_accounts FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.group_associated_direct_projects(
    group_direct_project_id INT NOT NULL,
	group_id INT NOT NULL,
	tc_direct_project_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.group_associated_direct_projects FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.customer_administrator(
	customer_administrator_id INT NOT NULL,
	user_id INT NOT NULL,
	client_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.customer_administrator FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.group_member(
	group_member_id INT NOT NULL,
	user_id INT NOT NULL,
	group_id INT NOT NULL,
	use_group_default SMALLINT NOT NULL,
	specific_permission VARCHAR(20),
	active SMALLINT NOT NULL,
	activated_on TIMESTAMP,
	unassigned_on TIMESTAMP
)
;

REVOKE ALL ON tcs_catalog.group_member FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.group_invitation(
	group_invitation_id INT NOT NULL,
	group_member_id INT NOT NULL,
	status VARCHAR(20) NOT NULL,
	sent_on TIMESTAMP NOT NULL,
    reject_reason nchar(500),
	accepted_or_rejected_on TIMESTAMP,
	approval_processed_on TIMESTAMP
)
;

REVOKE ALL ON tcs_catalog.group_invitation FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.group_audit_record(
	id INT NOT NULL,
	user_handle VARCHAR(45) NOT NULL,
	ip_address VARCHAR(45) NOT NULL,
	previous_data_value NCHAR(500) NOT NULL,
	new_data_value NCHAR(500) NOT NULL,
	create_date TIMESTAMP NOT NULL
)
;

REVOKE ALL ON tcs_catalog.group_audit_record FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_auction_category_lu (
    review_auction_category_id serial NOT NULL,
    name VARCHAR(64) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_auction_category_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_auction_type_lu (
    review_auction_type_id serial NOT NULL,
    name VARCHAR(64) NOT NULL,
    review_auction_category_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_auction_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_application_role_lu (
    review_application_role_id serial NOT NULL,
    name VARCHAR(64) NOT NULL,
    review_auction_type_id INT NOT NULL,
    positions INT NOT NULL,
    order_index INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_application_role_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_application_role_resource_role_xref (
    review_application_role_id INT NOT NULL,
    resource_role_id INT NOT NULL,
    unique_role BOOLEAN NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_application_role_resource_role_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_application_status_lu (
    review_application_status_id serial NOT NULL,
    name VARCHAR(64) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_application_status_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_auction (
    review_auction_id serial NOT NULL,
    project_id INT NOT NULL,
    review_auction_type_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_auction FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.review_application (
    review_application_id serial NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    review_auction_id INT NOT NULL,
    review_application_role_id INT NOT NULL,
    review_application_status_id INT NOT NULL,
    create_date TIMESTAMP NOT NULL,
    modify_date TIMESTAMP NOT NULL
)
;

REVOKE ALL ON tcs_catalog.review_application FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_payment_type_lu (
    project_payment_type_id serial NOT NULL,
    name VARCHAR(64) NOT NULL,
    mergeable boolean NOT NULL,
    pacts_payment_type_id DECIMAL(3,0) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.project_payment_type_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_payment (
    project_payment_id serial NOT NULL,
    project_payment_type_id INT NOT NULL,
    resource_id INT NOT NULL,
    submission_id INT,
    amount DECIMAL(12,2) NOT NULL,
    pacts_payment_id DECIMAL(10,0),
    create_user VARCHAR(64) NOT NULL, 
    create_date TIMESTAMP NOT NULL,
    modify_user VARCHAR(64) NOT NULL, 
    modify_date TIMESTAMP NOT NULL
)
;

REVOKE ALL ON tcs_catalog.project_payment FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_payment_adjustment (
    project_id INT NOT NULL,
    resource_role_id INT NOT NULL,
    fixed_amount DECIMAL(12,2),
    multiplier FLOAT
)
;

REVOKE ALL ON tcs_catalog.project_payment_adjustment FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.default_project_payment (
    project_category_id INT NOT NULL,
    resource_role_id INT NOT NULL,
    fixed_amount DECIMAL(12,2) NOT NULL,
    base_coefficient FLOAT NOT NULL,
    incremental_coefficient FLOAT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.default_project_payment FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.reviewer_rating (
    project_id INT NOT NULL,
    user_id DECIMAL(10,0) NOT NULL,
    review_date TIMESTAMP NOT NULL,
    rating FLOAT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.reviewer_rating FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.collaborating_members (
    collaborating_group_id INT NOT NULL,
    user_id DECIMAL(10,0) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.collaborating_members FROM PUBLIC ;


CREATE TABLE IF NOT EXISTS tcs_catalog.file_type_icon (
  id SERIAL8 NOT NULL,
  file_type VARCHAR(50) NOT NULL ,
  file_type_category VARCHAR(50) NOT NULL ,
  icon_path VARCHAR(200) NOT NULL ,
  PRIMARY KEY (id) )
;

REVOKE ALL ON tcs_catalog.file_type_icon FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.asset_category (
  id SERIAL8 NOT NULL,
  name VARCHAR(50) NOT NULL ,
  container_type VARCHAR(50) NOT NULL ,
  container_id INT8 NOT NULL ,
  PRIMARY KEY (id) )
;

REVOKE ALL ON tcs_catalog.asset_category FROM PUBLIC;



CREATE TABLE IF NOT EXISTS tcs_catalog.asset (
  id SERIAL8 NOT NULL,
  name VARCHAR(100) NOT NULL ,
  current_version_id INT8 ,
  container_type VARCHAR(50) NOT NULL ,
  container_id INT8 NOT NULL ,
  public CHAR(1) NOT NULL ,
  PRIMARY KEY (id))
;

REVOKE ALL ON tcs_catalog.asset FROM PUBLIC;


CREATE TABLE IF NOT EXISTS tcs_catalog.asset_version (
  id SERIAL8 NOT NULL,
  version VARCHAR(50) NOT NULL ,
  file_name VARCHAR(100) NOT NULL ,
  file_type VARCHAR(100) NOT NULL ,
  file_size_bytes INT8 NOT NULL ,
  uploader_id INT8 NOT NULL ,
  upload_time TIMESTAMP NOT NULL ,
  description VARCHAR(1000) ,
  asset_id INT8 NOT NULL ,
  preview_image_path VARCHAR(200) ,
  file_path VARCHAR(200) NOT NULL ,
  PRIMARY KEY (id))
;

REVOKE ALL ON tcs_catalog.asset_version FROM PUBLIC;
  
CREATE TABLE IF NOT EXISTS tcs_catalog.asset_category_mapping (
  asset_id INT8 NOT NULL,
  category_id INT8 NOT NULL ,
  PRIMARY KEY (asset_id, category_id))
;

REVOKE ALL ON tcs_catalog.asset_category_mapping FROM PUBLIC;
  
CREATE TABLE IF NOT EXISTS tcs_catalog.asset_permission (
  id SERIAL8 NOT NULL,
  asset_id INT8 NOT NULL ,
  user_id INT8 NOT NULL ,
  PRIMARY KEY (id))
;

REVOKE ALL ON tcs_catalog.asset_permission FROM PUBLIC;
	
CREATE TABLE IF NOT EXISTS tcs_catalog.asset_audit_record (
  id SERIAL8 NOT NULL,
  timestamp TIMESTAMP NOT NULL ,
  user_id INT8 NOT NULL ,
  action VARCHAR(200) NOT NULL ,
  entity_type VARCHAR(200) NOT NULL ,
  entity_id INT8 NOT NULL ,
  old_value VARCHAR(4000) ,
  new_value VARCHAR(4000) ,
  PRIMARY KEY (id) )
;

REVOKE ALL ON tcs_catalog.asset_audit_record FROM PUBLIC;


CREATE TABLE IF NOT EXISTS direct_project_task_list (
    direct_project_task_list_id Serial NOT NULL,
    project_id INT NOT NULL,
    name VARCHAR(80) NOT NULL,
    notes VARCHAR(250),
    create_date TIMESTAMP NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP,
    modify_user VARCHAR(64),
    is_active CHAR DEFAULT 'Y' NOT NULL,
    is_default CHAR DEFAULT 'N' NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_list FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_status (
    direct_project_task_status_id int NOT NULL,
    name VARCHAR(64) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_status FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_list_permitted_user (
    direct_project_task_list_id INT NOT NULL,
    user_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_list_permitted_user FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_priority (
    direct_project_task_priority_id int NOT NULL,
    name VARCHAR(64) NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_priority FROM PUBLIC;


CREATE TABLE IF NOT EXISTS direct_project_task (
    direct_project_task_id Serial NOT NULL,
    direct_project_task_list_id INT NOT NULL,
    name VARCHAR(80) NOT NULL,
    notes VARCHAR(250),
    create_date TIMESTAMP NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP,
    modify_user VARCHAR(64),
    start_date TIMESTAMP,
    due_date TIMESTAMP,
    status INT NOT NULL,
    priority INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task FROM PUBLIC;

	
CREATE TABLE IF NOT EXISTS direct_project_task_attachment (
    direct_project_task_attachment_id Serial NOT NULL,
    direct_project_task_id INT NOT NULL,
    file_name VARCHAR(64) NOT NULL,
    mime_type VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP,
    modify_user VARCHAR(64)
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_attachment FROM PUBLIC;


CREATE TABLE IF NOT EXISTS direct_project_task_list_milestone_xref (
    direct_project_task_list_id INT NOT NULL,
    project_milestone_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_list_milestone_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_contest_xref (
    direct_project_task_id INT NOT NULL,
    project_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_contest_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_assignee (
    direct_project_task_id INT NOT NULL,
    user_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_assignee FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_milestone_xref (
    direct_project_task_id INT NOT NULL,
    project_milestone_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_milestone_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS direct_project_task_list_contest_xref (
    direct_project_task_list_id INT NOT NULL,
    project_id INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.direct_project_task_list_contest_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.contest_milestone_xref (
    contest_id INT NOT NULL,
    project_milestone_id INT NOT NULL,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.contest_milestone_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_sub_category_lu (
  project_sub_category_id INT NOT NULL ,
  name VARCHAR(45) ,
  description VARCHAR(45) ,
  project_category_id INT
)
;
  
REVOKE ALL ON tcs_catalog.project_sub_category_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.platform_lu (
    platform_id DECIMAL(10,0) not null,
    name VARCHAR(100) not null,
    description VARCHAR(254) not null,
    status_id DECIMAL(10,0) not null
)
;

REVOKE ALL ON tcs_catalog.platform_lu FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.user_recent_item_type (
  recent_item_type_id INT NOT NULL,
  item_type_name VARCHAR(64) NOT NULL,
  max_records_number INT NOT NULL
)
;

REVOKE ALL ON tcs_catalog.user_recent_item_type FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.user_recent_item (
  user_recent_item_id INT NOT NULL,
  user_id INT NOT NULL,
  item_id INT NOT NULL,
  recent_item_type_id INT NOT NULL,
  access_time TIMESTAMP not null
)
;

REVOKE ALL ON tcs_catalog.user_recent_item FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_platform (
    project_id INT not null,
    project_platform_id INT not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.project_platform FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_platform_lu (
    project_platform_id INT not null,
    name VARCHAR(255) not null,
    create_user VARCHAR(64) not null,
    create_date TIMESTAMP not null,
    modify_user VARCHAR(64) not null,
    modify_date TIMESTAMP not null
)
;
REVOKE ALL ON tcs_catalog.project_platform_lu FROM PUBLIC;

SET search_path TO tcs_catalog;
CREATE TABLE IF NOT EXISTS tcs_catalog.client_group_xref (
    client_id INT NOT NULL,
    group_id INT NOT NULL
)
;
REVOKE ALL ON tcs_catalog.client_group_xref FROM PUBLIC;

CREATE TABLE IF NOT EXISTS tcs_catalog.project_event_log (
    project_event_log_id bigserial,
    project_id INT,
    operation VARCHAR(10) not null,
    date TIMESTAMP default now() not null,
    source VARCHAR(64) not null,
    source_id INT not null
)
;
REVOKE ALL ON tcs_catalog.project_event_log FROM PUBLIC;


;

;

;


GRANT select ON tcs_catalog.user_customer TO coder;

GRANT insert ON tcs_catalog.comp_client TO public;

GRANT update ON tcs_catalog.comp_client TO public;

GRANT delete ON tcs_catalog.comp_client TO public;



GRANT select ON tcs_catalog.comp_client TO public;

GRANT update ON tcs_catalog.company_size TO public;

GRANT select ON tcs_catalog.company_size TO public;

GRANT insert ON tcs_catalog.company_size TO public;



GRANT delete ON tcs_catalog.company_size TO public;



GRANT select ON tcs_catalog.comp_categories TO public;

GRANT update ON tcs_catalog.comp_categories TO public;

GRANT delete ON tcs_catalog.comp_categories TO public;

GRANT insert ON tcs_catalog.comp_categories TO public;

GRANT insert ON tcs_catalog.comp_dependencies TO public;



GRANT delete ON tcs_catalog.comp_dependencies TO public;

GRANT update ON tcs_catalog.comp_dependencies TO public;

GRANT select ON tcs_catalog.comp_dependencies TO public;

GRANT update ON tcs_catalog.comp_documentation TO public;



GRANT insert ON tcs_catalog.comp_documentation TO public;

GRANT delete ON tcs_catalog.comp_documentation TO public;

GRANT select ON tcs_catalog.comp_documentation TO public;



GRANT update ON tcs_catalog.comp_download TO public;

GRANT select ON tcs_catalog.comp_download TO public;

GRANT delete ON tcs_catalog.comp_download TO public;

GRANT insert ON tcs_catalog.comp_download TO public;

GRANT update ON tcs_catalog.comp_examples TO public;



GRANT insert ON tcs_catalog.comp_examples TO public;

GRANT delete ON tcs_catalog.comp_examples TO public;

GRANT select ON tcs_catalog.comp_examples TO public;

GRANT select ON tcs_catalog.scorecard_section TO public;

GRANT insert ON tcs_catalog.scorecard_section TO public;

GRANT update ON tcs_catalog.scorecard_section TO public;

GRANT delete ON tcs_catalog.scorecard_section TO public;

GRANT insert ON tcs_catalog.comp_keywords TO public;



GRANT delete ON tcs_catalog.comp_keywords TO public;

GRANT select ON tcs_catalog.comp_keywords TO public;

GRANT update ON tcs_catalog.comp_keywords TO public;

GRANT insert ON tcs_catalog.comp_reviews TO public;

GRANT select ON tcs_catalog.comp_reviews TO public;

GRANT update ON tcs_catalog.comp_reviews TO public;

GRANT delete ON tcs_catalog.comp_reviews TO public;



GRANT insert ON tcs_catalog.comp_technology TO public;

GRANT select ON tcs_catalog.comp_technology TO public;

GRANT update ON tcs_catalog.comp_technology TO public;

GRANT delete ON tcs_catalog.comp_technology TO public;





GRANT update ON tcs_catalog.contact_type TO public;

GRANT select ON tcs_catalog.contact_type TO public;

GRANT insert ON tcs_catalog.contact_type TO public;

GRANT delete ON tcs_catalog.contact_type TO public;



GRANT update ON tcs_catalog.country_codes TO public;

GRANT select ON tcs_catalog.country_codes TO public;

GRANT insert ON tcs_catalog.country_codes TO public;

GRANT delete ON tcs_catalog.country_codes TO public;

GRANT delete ON tcs_catalog.contest_prize TO public;

GRANT insert ON tcs_catalog.contest_prize TO public;

GRANT select ON tcs_catalog.contest_prize TO public;

GRANT update ON tcs_catalog.contest_prize TO public;



GRANT select ON tcs_catalog.doc_types TO public;

GRANT update ON tcs_catalog.doc_types TO public;

GRANT insert ON tcs_catalog.doc_types TO public;



GRANT delete ON tcs_catalog.doc_types TO public;



GRANT select ON tcs_catalog.download_tracking TO public;

GRANT insert ON tcs_catalog.download_tracking TO public;

GRANT delete ON tcs_catalog.download_tracking TO public;

GRANT update ON tcs_catalog.download_tracking TO public;

GRANT select,update,delete,insert ON tcs_catalog.submission_type_lu TO public;

GRANT insert ON tcs_catalog.season TO public;



GRANT delete ON tcs_catalog.season TO public;

GRANT update ON tcs_catalog.season TO public;

GRANT select ON tcs_catalog.season TO public;

GRANT select ON tcs_catalog.stage TO public;

GRANT update ON tcs_catalog.stage TO public;

GRANT insert ON tcs_catalog.stage TO public;



GRANT delete ON tcs_catalog.stage TO public;



GRANT insert ON tcs_catalog.contest_stage_xref TO public;

GRANT delete ON tcs_catalog.contest_stage_xref TO public;

GRANT select ON tcs_catalog.contest_stage_xref TO public;

GRANT update ON tcs_catalog.contest_stage_xref TO public;



GRANT insert ON tcs_catalog.contest_season_xref TO public;

GRANT select ON tcs_catalog.contest_season_xref TO public;

GRANT update ON tcs_catalog.contest_season_xref TO public;

GRANT delete ON tcs_catalog.contest_season_xref TO public;

GRANT update ON tcs_catalog.contest_result_calculator_lu TO public;



GRANT select ON tcs_catalog.contest_result_calculator_lu TO public;

GRANT insert ON tcs_catalog.contest_result_calculator_lu TO public;

GRANT delete ON tcs_catalog.contest_result_calculator_lu TO public;

GRANT insert ON tcs_catalog.member_ban TO public;

GRANT delete ON tcs_catalog.member_ban TO public;

GRANT select ON tcs_catalog.member_ban TO public;

GRANT update ON tcs_catalog.member_ban TO public;





GRANT delete ON tcs_catalog.key_generation TO public;

GRANT select ON tcs_catalog.key_generation TO public;

GRANT insert ON tcs_catalog.key_generation TO public;

GRANT update ON tcs_catalog.key_generation TO public;



GRANT update ON tcs_catalog.license_level TO public;

GRANT select ON tcs_catalog.license_level TO public;

GRANT insert ON tcs_catalog.license_level TO public;

GRANT delete ON tcs_catalog.license_level TO public;

GRANT insert ON tcs_catalog.phase TO public;

GRANT delete ON tcs_catalog.phase TO public;

GRANT select ON tcs_catalog.phase TO public;



GRANT update ON tcs_catalog.phase TO public;

GRANT insert ON tcs_catalog.price_tiers TO public;

GRANT update ON tcs_catalog.price_tiers TO public;



GRANT select ON tcs_catalog.price_tiers TO public;

GRANT delete ON tcs_catalog.price_tiers TO public;

GRANT select ON tcs_catalog.roles TO public;

GRANT delete ON tcs_catalog.roles TO public;

GRANT insert ON tcs_catalog.roles TO public;

GRANT update ON tcs_catalog.roles TO public;





GRANT select ON tcs_catalog.status TO public;

GRANT insert ON tcs_catalog.status TO public;

GRANT update ON tcs_catalog.status TO public;

GRANT delete ON tcs_catalog.status TO public;

GRANT delete ON tcs_catalog.technology_types TO public;

GRANT select ON tcs_catalog.technology_types TO public;

GRANT insert ON tcs_catalog.technology_types TO public;

GRANT update ON tcs_catalog.technology_types TO public;



GRANT update ON tcs_catalog.user_contact TO public;



GRANT delete ON tcs_catalog.user_contact TO public;

GRANT insert ON tcs_catalog.user_contact TO public;

GRANT select ON tcs_catalog.user_contact TO public;

GRANT insert ON tcs_catalog.user_member TO public;

GRANT select ON tcs_catalog.user_member TO public;

GRANT delete ON tcs_catalog.user_member TO public;



GRANT update ON tcs_catalog.user_member TO public;

GRANT update ON tcs_catalog.project_type_lu TO public;

GRANT delete ON tcs_catalog.project_type_lu TO public;

GRANT select ON tcs_catalog.project_type_lu TO public;

GRANT insert ON tcs_catalog.project_type_lu TO public;

GRANT update ON tcs_catalog.user_technologies TO public;

GRANT delete ON tcs_catalog.user_technologies TO public;

GRANT insert ON tcs_catalog.user_technologies TO public;

GRANT select ON tcs_catalog.user_technologies TO public;



GRANT delete ON tcs_catalog.word_search TO public;

GRANT select ON tcs_catalog.word_search TO public;

GRANT update ON tcs_catalog.word_search TO public;

GRANT insert ON tcs_catalog.word_search TO public;





GRANT update ON tcs_catalog.word_search_ctgy TO public;

GRANT insert ON tcs_catalog.word_search_ctgy TO public;

GRANT select ON tcs_catalog.word_search_ctgy TO public;

GRANT delete ON tcs_catalog.word_search_ctgy TO public;

GRANT delete ON tcs_catalog.word_search_doc TO public;

GRANT insert ON tcs_catalog.word_search_doc TO public;

GRANT select ON tcs_catalog.word_search_doc TO public;

GRANT update ON tcs_catalog.word_search_doc TO public;





GRANT insert ON tcs_catalog.word_search_excl TO public;

GRANT update ON tcs_catalog.word_search_excl TO public;

GRANT select ON tcs_catalog.word_search_excl TO public;

GRANT delete ON tcs_catalog.word_search_excl TO public;

GRANT update ON tcs_catalog.command_group_lu TO public;

GRANT select ON tcs_catalog.command_group_lu TO public;

GRANT insert ON tcs_catalog.command_group_lu TO public;



GRANT delete ON tcs_catalog.command_group_lu TO public;



GRANT update ON tcs_catalog.command TO public;

GRANT delete ON tcs_catalog.command TO public;

GRANT insert ON tcs_catalog.command TO public;

GRANT select ON tcs_catalog.command TO public;

GRANT delete ON tcs_catalog.query TO public;

GRANT select ON tcs_catalog.query TO public;



GRANT insert ON tcs_catalog.query TO public;

GRANT update ON tcs_catalog.query TO public;

GRANT select ON tcs_catalog.input_lu TO public;



GRANT delete ON tcs_catalog.input_lu TO public;

GRANT insert ON tcs_catalog.input_lu TO public;

GRANT update ON tcs_catalog.input_lu TO public;

GRANT select ON tcs_catalog.query_input_xref TO public;



GRANT update ON tcs_catalog.query_input_xref TO public;

GRANT insert ON tcs_catalog.query_input_xref TO public;

GRANT delete ON tcs_catalog.query_input_xref TO public;

GRANT delete ON tcs_catalog.command_query_xref TO public;

GRANT select ON tcs_catalog.command_query_xref TO public;



GRANT update ON tcs_catalog.command_query_xref TO public;

GRANT insert ON tcs_catalog.command_query_xref TO public;

GRANT select ON tcs_catalog.message TO public;

GRANT update ON tcs_catalog.message TO public;



GRANT delete ON tcs_catalog.message TO public;

GRANT insert ON tcs_catalog.message TO public;

GRANT select ON tcs_catalog.tc_user_xref TO public;

GRANT delete ON tcs_catalog.tc_user_xref TO public;



GRANT insert ON tcs_catalog.tc_user_xref TO public;

GRANT update ON tcs_catalog.tc_user_xref TO public;

GRANT delete ON tcs_catalog.message_to_handle TO public;

GRANT select ON tcs_catalog.message_to_handle TO public;



GRANT insert ON tcs_catalog.message_to_handle TO public;

GRANT update ON tcs_catalog.message_to_handle TO public;

GRANT select ON tcs_catalog.component_inquiry TO public;

GRANT update ON tcs_catalog.component_inquiry TO public;



GRANT delete ON tcs_catalog.component_inquiry TO public;

GRANT insert ON tcs_catalog.component_inquiry TO public;



GRANT update ON tcs_catalog.comp_version_dates TO public;

GRANT select ON tcs_catalog.comp_version_dates TO public;

GRANT insert ON tcs_catalog.comp_version_dates TO public;

GRANT delete ON tcs_catalog.comp_version_dates TO public;

GRANT insert ON tcs_catalog.comp_level TO public;

GRANT update ON tcs_catalog.comp_level TO public;

GRANT delete ON tcs_catalog.comp_level TO public;



GRANT select ON tcs_catalog.comp_level TO public;

GRANT delete ON tcs_catalog.user_master_tmp TO public;



GRANT select ON tcs_catalog.user_master_tmp TO public;

GRANT update ON tcs_catalog.user_master_tmp TO public;

GRANT insert ON tcs_catalog.user_master_tmp TO public;

GRANT insert ON tcs_catalog.user_master TO public;

GRANT update ON tcs_catalog.user_master TO public;

GRANT delete ON tcs_catalog.user_master TO public;



GRANT select ON tcs_catalog.user_master TO public;

GRANT delete ON tcs_catalog.comp_version_dates_history TO public;

GRANT select ON tcs_catalog.comp_version_dates_history TO public;

GRANT insert ON tcs_catalog.comp_version_dates_history TO public;

GRANT update ON tcs_catalog.comp_version_dates_history TO public;



GRANT insert ON tcs_catalog.project_category_lu TO public;

GRANT select ON tcs_catalog.project_category_lu TO public;

GRANT update ON tcs_catalog.project_category_lu TO public;

GRANT delete ON tcs_catalog.project_category_lu TO public;

GRANT update ON tcs_catalog.scorecard_type_lu TO public;

GRANT delete ON tcs_catalog.scorecard_type_lu TO public;

GRANT select ON tcs_catalog.scorecard_type_lu TO public;

GRANT insert ON tcs_catalog.scorecard_type_lu TO public;

GRANT update ON tcs_catalog.scorecard_status_lu TO public;

GRANT delete ON tcs_catalog.scorecard_status_lu TO public;

GRANT select ON tcs_catalog.scorecard_status_lu TO public;

GRANT insert ON tcs_catalog.scorecard_status_lu TO public;

GRANT insert ON tcs_catalog.scorecard TO public;

GRANT select ON tcs_catalog.scorecard TO public;

GRANT delete ON tcs_catalog.scorecard TO public;

GRANT update ON tcs_catalog.scorecard TO public;

GRANT select ON tcs_catalog.scorecard_group TO public;

GRANT insert ON tcs_catalog.scorecard_group TO public;

GRANT delete ON tcs_catalog.scorecard_group TO public;

GRANT update ON tcs_catalog.scorecard_group TO public;

GRANT insert ON tcs_catalog.status_assignment TO public;



GRANT select ON tcs_catalog.status_assignment TO public;

GRANT update ON tcs_catalog.status_assignment TO public;

GRANT delete ON tcs_catalog.status_assignment TO public;

GRANT update ON tcs_catalog.scorecard_question_type_lu TO public;

GRANT delete ON tcs_catalog.scorecard_question_type_lu TO public;

GRANT select ON tcs_catalog.scorecard_question_type_lu TO public;

GRANT insert ON tcs_catalog.scorecard_question_type_lu TO public;

GRANT update ON tcs_catalog.review_resp TO public;



GRANT insert ON tcs_catalog.review_resp TO public;

GRANT select ON tcs_catalog.review_resp TO public;

GRANT delete ON tcs_catalog.review_resp TO public;

GRANT update ON tcs_catalog.scorecard_question TO public;

GRANT insert ON tcs_catalog.scorecard_question TO public;

GRANT select ON tcs_catalog.scorecard_question TO public;

GRANT delete ON tcs_catalog.scorecard_question TO public;

GRANT select ON tcs_catalog.project_status_lu TO public;

GRANT update ON tcs_catalog.project_status_lu TO public;

GRANT insert ON tcs_catalog.project_status_lu TO public;

GRANT delete ON tcs_catalog.project_status_lu TO public;

GRANT insert ON tcs_catalog.project TO public;

GRANT update ON tcs_catalog.project TO public;

GRANT delete ON tcs_catalog.project TO public;

GRANT select ON tcs_catalog.project TO public;

GRANT insert ON tcs_catalog.project_info_type_lu TO public;

GRANT update ON tcs_catalog.project_info_type_lu TO public;

GRANT delete ON tcs_catalog.project_info_type_lu TO public;

GRANT select ON tcs_catalog.project_info_type_lu TO public;

GRANT insert ON tcs_catalog.comp_catalog TO public;

GRANT delete ON tcs_catalog.comp_catalog TO public;



GRANT select ON tcs_catalog.comp_catalog TO public;

GRANT update ON tcs_catalog.comp_catalog TO public;

GRANT select ON tcs_catalog.phase_status_lu TO public;

GRANT delete ON tcs_catalog.phase_status_lu TO public;

GRANT update ON tcs_catalog.phase_status_lu TO public;

GRANT insert ON tcs_catalog.phase_status_lu TO public;

GRANT select ON tcs_catalog.phase_type_lu TO public;

GRANT insert ON tcs_catalog.phase_type_lu TO public;

GRANT update ON tcs_catalog.phase_type_lu TO public;

GRANT delete ON tcs_catalog.phase_type_lu TO public;

GRANT update ON tcs_catalog.project_phase TO public;

GRANT delete ON tcs_catalog.project_phase TO public;

GRANT select ON tcs_catalog.project_phase TO public;

GRANT insert ON tcs_catalog.project_phase TO public;

GRANT update ON tcs_catalog.phase_dependency TO public;

GRANT select ON tcs_catalog.phase_dependency TO public;

GRANT delete ON tcs_catalog.phase_dependency TO public;

GRANT insert ON tcs_catalog.phase_dependency TO public;

GRANT update ON tcs_catalog.phase_criteria_type_lu TO public;

GRANT delete ON tcs_catalog.phase_criteria_type_lu TO public;

GRANT insert ON tcs_catalog.phase_criteria_type_lu TO public;

GRANT select ON tcs_catalog.phase_criteria_type_lu TO public;

GRANT select ON tcs_catalog.phase_criteria TO public;

GRANT insert ON tcs_catalog.phase_criteria TO public;

GRANT update ON tcs_catalog.phase_criteria TO public;

GRANT delete ON tcs_catalog.phase_criteria TO public;

GRANT select ON tcs_catalog.resource_role_lu TO public;

GRANT delete ON tcs_catalog.resource_role_lu TO public;

GRANT insert ON tcs_catalog.resource_role_lu TO public;

GRANT update ON tcs_catalog.resource_role_lu TO public;

GRANT update ON tcs_catalog.resource TO public;

GRANT select ON tcs_catalog.resource TO public;

GRANT insert ON tcs_catalog.resource TO public;

GRANT delete ON tcs_catalog.resource TO public;

GRANT insert ON tcs_catalog.resource_info_type_lu TO public;

GRANT select ON tcs_catalog.resource_info_type_lu TO public;

GRANT update ON tcs_catalog.resource_info_type_lu TO public;

GRANT delete ON tcs_catalog.resource_info_type_lu TO public;

GRANT insert ON tcs_catalog.project_info TO public;

GRANT update ON tcs_catalog.project_info TO public;

GRANT select ON tcs_catalog.project_info TO public;

GRANT delete ON tcs_catalog.project_info TO public;

GRANT delete ON tcs_catalog.upload_type_lu TO public;

GRANT select ON tcs_catalog.upload_type_lu TO public;

GRANT insert ON tcs_catalog.upload_type_lu TO public;

GRANT update ON tcs_catalog.upload_type_lu TO public;

GRANT update ON tcs_catalog.upload_status_lu TO public;

GRANT insert ON tcs_catalog.upload_status_lu TO public;

GRANT select ON tcs_catalog.upload_status_lu TO public;

GRANT delete ON tcs_catalog.upload_status_lu TO public;

GRANT update ON tcs_catalog.upload TO public;

GRANT insert ON tcs_catalog.upload TO public;

GRANT delete ON tcs_catalog.upload TO public;

GRANT select ON tcs_catalog.upload TO public;

GRANT select ON tcs_catalog.sample_inquiry TO public;

GRANT update ON tcs_catalog.sample_inquiry TO public;

GRANT delete ON tcs_catalog.sample_inquiry TO public;

GRANT insert ON tcs_catalog.sample_inquiry TO public;



GRANT update ON tcs_catalog.comp_level_phase TO public;

GRANT select ON tcs_catalog.comp_level_phase TO public;



GRANT delete ON tcs_catalog.comp_level_phase TO public;

GRANT insert ON tcs_catalog.comp_level_phase TO public;

GRANT insert ON tcs_catalog.user_component_score TO public;

GRANT delete ON tcs_catalog.user_component_score TO public;

GRANT select ON tcs_catalog.user_component_score TO public;

GRANT update ON tcs_catalog.user_component_score TO public;



GRANT delete ON tcs_catalog.user_rating TO public;

GRANT update ON tcs_catalog.user_rating TO public;

GRANT select ON tcs_catalog.user_rating TO public;

GRANT insert ON tcs_catalog.user_rating TO public;



GRANT delete ON tcs_catalog.tcs_ratings_history TO public;

GRANT insert ON tcs_catalog.tcs_ratings_history TO public;



GRANT update ON tcs_catalog.tcs_ratings_history TO public;

GRANT select ON tcs_catalog.tcs_ratings_history TO public;

GRANT select ON tcs_catalog.rboard_status_lu TO public;

GRANT insert ON tcs_catalog.rboard_status_lu TO public;

GRANT delete ON tcs_catalog.rboard_status_lu TO public;

GRANT update ON tcs_catalog.rboard_status_lu TO public;



GRANT select ON tcs_catalog.submission_status_lu TO public;

GRANT delete ON tcs_catalog.submission_status_lu TO public;

GRANT update ON tcs_catalog.submission_status_lu TO public;

GRANT insert ON tcs_catalog.submission_status_lu TO public;

GRANT update ON tcs_catalog.submission TO public;

GRANT insert ON tcs_catalog.submission TO public;

GRANT delete ON tcs_catalog.submission TO public;

GRANT select ON tcs_catalog.submission TO public;

GRANT delete ON tcs_catalog.resource_submission TO public;

GRANT update ON tcs_catalog.resource_submission TO public;

GRANT insert ON tcs_catalog.resource_submission TO public;

GRANT select ON tcs_catalog.resource_submission TO public;

GRANT update ON tcs_catalog.comment_type_lu TO public;

GRANT select ON tcs_catalog.comment_type_lu TO public;

GRANT insert ON tcs_catalog.comment_type_lu TO public;

GRANT delete ON tcs_catalog.comment_type_lu TO public;

GRANT select ON tcs_catalog.review TO public;

GRANT update ON tcs_catalog.review TO public;

GRANT delete ON tcs_catalog.review TO public;

GRANT insert ON tcs_catalog.review TO public;

GRANT select ON tcs_catalog.review_item TO public;

GRANT update ON tcs_catalog.review_item TO public;

GRANT insert ON tcs_catalog.review_item TO public;

GRANT delete ON tcs_catalog.review_item TO public;

GRANT delete ON tcs_catalog.review_comment TO public;

GRANT select ON tcs_catalog.review_comment TO public;

GRANT insert ON tcs_catalog.review_comment TO public;

GRANT update ON tcs_catalog.review_comment TO public;



GRANT insert ON tcs_catalog.contest_type_lu TO public;

GRANT delete ON tcs_catalog.contest_type_lu TO public;

GRANT update ON tcs_catalog.contest_type_lu TO public;

GRANT select ON tcs_catalog.contest_type_lu TO public;



GRANT update ON tcs_catalog.contest TO public;

GRANT select ON tcs_catalog.contest TO public;

GRANT delete ON tcs_catalog.contest TO public;

GRANT insert ON tcs_catalog.contest TO public;

GRANT insert ON tcs_catalog.contest_project_xref TO public;

GRANT update ON tcs_catalog.contest_project_xref TO public;

GRANT select ON tcs_catalog.contest_project_xref TO public;



GRANT delete ON tcs_catalog.contest_project_xref TO public;

GRANT insert ON tcs_catalog.prize_type_lu TO public;

GRANT delete ON tcs_catalog.prize_type_lu TO public;

GRANT update ON tcs_catalog.prize_type_lu TO public;



GRANT select ON tcs_catalog.prize_type_lu TO public;

GRANT insert ON tcs_catalog.offer TO public;



GRANT update ON tcs_catalog.offer TO public;

GRANT select ON tcs_catalog.offer TO public;

GRANT delete ON tcs_catalog.offer TO public;



GRANT update ON tcs_catalog.user_contest_prize TO public;

GRANT delete ON tcs_catalog.user_contest_prize TO public;

GRANT insert ON tcs_catalog.user_contest_prize TO public;

GRANT select ON tcs_catalog.user_contest_prize TO public;

GRANT delete ON tcs_catalog.project_result TO public;

GRANT select ON tcs_catalog.project_result TO public;

GRANT insert ON tcs_catalog.project_result TO public;



GRANT update ON tcs_catalog.project_result TO public;

GRANT insert ON tcs_catalog.user_reliability TO public;

GRANT update ON tcs_catalog.user_reliability TO public;

GRANT select ON tcs_catalog.user_reliability TO public;



GRANT delete ON tcs_catalog.user_reliability TO public;

GRANT update ON tcs_catalog.royalty TO public;

GRANT insert ON tcs_catalog.royalty TO public;



GRANT delete ON tcs_catalog.royalty TO public;

GRANT select ON tcs_catalog.royalty TO public;

GRANT select ON tcs_catalog.project_pablo TO public;

GRANT delete ON tcs_catalog.project_pablo TO public;

GRANT update ON tcs_catalog.project_pablo TO public;



GRANT insert ON tcs_catalog.project_pablo TO public;

GRANT select ON tcs_catalog.user_event_xref TO public;



GRANT insert ON tcs_catalog.user_event_xref TO public;

GRANT update ON tcs_catalog.user_event_xref TO public;

GRANT delete ON tcs_catalog.user_event_xref TO public;

GRANT insert ON tcs_catalog.review_item_comment TO public;

GRANT update ON tcs_catalog.review_item_comment TO public;

GRANT delete ON tcs_catalog.review_item_comment TO public;

GRANT select ON tcs_catalog.review_item_comment TO public;

GRANT update ON tcs_catalog.deliverable_lu TO public;

GRANT insert ON tcs_catalog.deliverable_lu TO public;

GRANT delete ON tcs_catalog.deliverable_lu TO public;

GRANT select ON tcs_catalog.deliverable_lu TO public;

GRANT update ON tcs_catalog.notification_mail_type_lu TO public;

GRANT insert ON tcs_catalog.notification_mail_type_lu TO public;



GRANT delete ON tcs_catalog.notification_mail_type_lu TO public;

GRANT select ON tcs_catalog.notification_mail_type_lu TO public;

GRANT select ON tcs_catalog.notification_event TO public;

GRANT delete ON tcs_catalog.notification_event TO public;

GRANT update ON tcs_catalog.notification_event TO public;

GRANT insert ON tcs_catalog.notification_event TO public;



GRANT delete ON tcs_catalog.user_notification_event_xref TO public;

GRANT update ON tcs_catalog.user_notification_event_xref TO public;

GRANT insert ON tcs_catalog.user_notification_event_xref TO public;

GRANT select ON tcs_catalog.user_notification_event_xref TO public;





GRANT delete ON tcs_catalog.dual TO public;

GRANT insert ON tcs_catalog.dual TO public;

GRANT select ON tcs_catalog.dual TO public;

GRANT update ON tcs_catalog.dual TO public;

GRANT insert ON tcs_catalog.framework TO public;

GRANT update ON tcs_catalog.framework TO public;

GRANT delete ON tcs_catalog.framework TO public;



GRANT select ON tcs_catalog.framework TO public;

GRANT delete ON tcs_catalog.project_audit TO public;

GRANT insert ON tcs_catalog.project_audit TO public;

GRANT update ON tcs_catalog.project_audit TO public;

GRANT select ON tcs_catalog.project_audit TO public;

GRANT insert ON tcs_catalog.notification_type_lu TO public;

GRANT update ON tcs_catalog.notification_type_lu TO public;

GRANT delete ON tcs_catalog.notification_type_lu TO public;

GRANT select ON tcs_catalog.notification_type_lu TO public;

GRANT insert ON tcs_catalog.notification TO public;

GRANT delete ON tcs_catalog.notification TO public;

GRANT update ON tcs_catalog.notification TO public;

GRANT select ON tcs_catalog.notification TO public;

GRANT select ON tcs_catalog.screening_status_lu TO public;

GRANT insert ON tcs_catalog.screening_status_lu TO public;

GRANT update ON tcs_catalog.screening_status_lu TO public;

GRANT delete ON tcs_catalog.screening_status_lu TO public;



GRANT insert ON tcs_catalog.comp_reg_answer TO public;

GRANT update ON tcs_catalog.comp_reg_answer TO public;

GRANT select ON tcs_catalog.comp_reg_answer TO public;

GRANT delete ON tcs_catalog.comp_reg_answer TO public;

GRANT insert ON tcs_catalog.comp_reg_response TO public;

GRANT select ON tcs_catalog.comp_reg_response TO public;

GRANT delete ON tcs_catalog.comp_reg_response TO public;

GRANT update ON tcs_catalog.comp_reg_response TO public;



GRANT select ON tcs_catalog.question_style TO public;

GRANT update ON tcs_catalog.question_style TO public;



GRANT delete ON tcs_catalog.question_style TO public;

GRANT insert ON tcs_catalog.question_style TO public;

GRANT select ON tcs_catalog.gp_user_reliability TO public;



GRANT delete ON tcs_catalog.gp_user_reliability TO public;

GRANT update ON tcs_catalog.gp_user_reliability TO public;

GRANT insert ON tcs_catalog.gp_user_reliability TO public;

GRANT update ON tcs_catalog.comp_versions TO public;

GRANT insert ON tcs_catalog.comp_versions TO public;

GRANT select ON tcs_catalog.comp_versions TO public;

GRANT delete ON tcs_catalog.comp_versions TO public;



GRANT select ON tcs_catalog.widget TO public;

GRANT insert ON tcs_catalog.widget TO public;



GRANT delete ON tcs_catalog.widget TO public;

GRANT update ON tcs_catalog.widget TO public;

GRANT select ON tcs_catalog.screening_task TO public;

GRANT insert ON tcs_catalog.screening_task TO public;

GRANT update ON tcs_catalog.screening_task TO public;

GRANT delete ON tcs_catalog.screening_task TO public;

GRANT insert ON tcs_catalog.comp_reg_question TO public;

GRANT select ON tcs_catalog.comp_reg_question TO public;



GRANT update ON tcs_catalog.comp_reg_question TO public;

GRANT delete ON tcs_catalog.comp_reg_question TO public;



GRANT insert ON tcs_catalog.project_wager TO public;

GRANT select ON tcs_catalog.project_wager TO public;

GRANT update ON tcs_catalog.project_wager TO public;

GRANT delete ON tcs_catalog.project_wager TO public;

GRANT update ON tcs_catalog.widget_version TO public;

GRANT select ON tcs_catalog.widget_version TO public;



GRANT delete ON tcs_catalog.widget_version TO public;

GRANT insert ON tcs_catalog.widget_version TO public;

GRANT insert ON tcs_catalog.catalog TO public;

GRANT select ON tcs_catalog.catalog TO public;

GRANT delete ON tcs_catalog.catalog TO public;



GRANT update ON tcs_catalog.catalog TO public;

GRANT select ON tcs_catalog.rboard_user TO public;

GRANT delete ON tcs_catalog.rboard_user TO public;

GRANT insert ON tcs_catalog.rboard_user TO public;



GRANT update ON tcs_catalog.rboard_user TO public;

GRANT update ON tcs_catalog.category_catalog TO public;



GRANT insert ON tcs_catalog.category_catalog TO public;

GRANT select ON tcs_catalog.category_catalog TO public;

GRANT delete ON tcs_catalog.category_catalog TO public;

GRANT insert ON tcs_catalog.project_info_before_moving_price TO public;

GRANT delete ON tcs_catalog.project_info_before_moving_price TO public;

GRANT select ON tcs_catalog.project_info_before_moving_price TO public;

GRANT update ON tcs_catalog.project_info_before_moving_price TO public;





GRANT update ON tcs_catalog.comp_version_dates_before_moving_price TO public;

GRANT select ON tcs_catalog.comp_version_dates_before_moving_price TO public;

GRANT delete ON tcs_catalog.comp_version_dates_before_moving_price TO public;

GRANT insert ON tcs_catalog.comp_version_dates_before_moving_price TO public;

GRANT insert ON tcs_catalog.dr_points TO public;

GRANT delete ON tcs_catalog.dr_points TO public;

GRANT update ON tcs_catalog.dr_points TO public;



GRANT select ON tcs_catalog.dr_points TO public;

GRANT select ON tcs_catalog.specification_type TO public;

GRANT delete ON tcs_catalog.specification_type TO public;



GRANT insert ON tcs_catalog.specification_type TO public;

GRANT update ON tcs_catalog.specification_type TO public;

GRANT delete ON tcs_catalog.specification TO public;



GRANT select ON tcs_catalog.specification TO public;

GRANT update ON tcs_catalog.specification TO public;

GRANT insert ON tcs_catalog.specification TO public;

GRANT select ON tcs_catalog.response_severity_lu TO public;

GRANT update ON tcs_catalog.response_severity_lu TO public;

GRANT insert ON tcs_catalog.response_severity_lu TO public;

GRANT delete ON tcs_catalog.response_severity_lu TO public;

GRANT select ON tcs_catalog.gp_user_contest_prize TO public;

GRANT update ON tcs_catalog.gp_user_contest_prize TO public;

GRANT delete ON tcs_catalog.gp_user_contest_prize TO public;



GRANT insert ON tcs_catalog.gp_user_contest_prize TO public;

GRANT delete ON tcs_catalog.user_rating_audit TO public;

GRANT update ON tcs_catalog.user_rating_audit TO public;

GRANT select ON tcs_catalog.user_rating_audit TO public;



GRANT insert ON tcs_catalog.user_rating_audit TO public;

GRANT update ON tcs_catalog.command_execution TO public;



GRANT delete ON tcs_catalog.command_execution TO public;

GRANT insert ON tcs_catalog.command_execution TO public;

GRANT select ON tcs_catalog.command_execution TO public;



GRANT select ON tcs_catalog.user_reliability_audit TO public;

GRANT update ON tcs_catalog.user_reliability_audit TO public;

GRANT delete ON tcs_catalog.user_reliability_audit TO public;

GRANT insert ON tcs_catalog.user_reliability_audit TO public;

GRANT select ON tcs_catalog.dr_points_operation_lu TO public;

GRANT update ON tcs_catalog.dr_points_operation_lu TO public;

GRANT delete ON tcs_catalog.dr_points_operation_lu TO public;



GRANT insert ON tcs_catalog.dr_points_operation_lu TO public;

GRANT update ON tcs_catalog.dr_points_reference_type_lu TO public;

GRANT insert ON tcs_catalog.dr_points_reference_type_lu TO public;

GRANT delete ON tcs_catalog.dr_points_reference_type_lu TO public;

GRANT select ON tcs_catalog.dr_points_reference_type_lu TO public;



GRANT select ON tcs_catalog.screening_response_lu TO public;

GRANT insert ON tcs_catalog.screening_response_lu TO public;

GRANT update ON tcs_catalog.screening_response_lu TO public;

GRANT delete ON tcs_catalog.screening_response_lu TO public;

GRANT select ON tcs_catalog.screening_result TO public;

GRANT insert ON tcs_catalog.screening_result TO public;

GRANT delete ON tcs_catalog.screening_result TO public;

GRANT update ON tcs_catalog.screening_result TO public;

GRANT delete ON tcs_catalog.default_scorecard TO public;

GRANT select ON tcs_catalog.default_scorecard TO public;

GRANT insert ON tcs_catalog.default_scorecard TO public;

GRANT update ON tcs_catalog.default_scorecard TO public;

GRANT insert ON tcs_catalog.user_role TO public;



GRANT delete ON tcs_catalog.user_role TO public;

GRANT select ON tcs_catalog.user_role TO public;

GRANT update ON tcs_catalog.user_role TO public;

GRANT insert ON tcs_catalog.dr_points_type_lu TO public;

GRANT delete ON tcs_catalog.dr_points_type_lu TO public;

GRANT update ON tcs_catalog.dr_points_type_lu TO public;

GRANT select ON tcs_catalog.dr_points_type_lu TO public;



GRANT insert ON tcs_catalog.comp_jive_category_xref TO public;

GRANT select ON tcs_catalog.comp_jive_category_xref TO public;



GRANT delete ON tcs_catalog.comp_jive_category_xref TO public;

GRANT update ON tcs_catalog.comp_jive_category_xref TO public;

GRANT delete ON tcs_catalog.comp_forum_xref_bak TO public;

GRANT insert ON tcs_catalog.comp_forum_xref_bak TO public;

GRANT update ON tcs_catalog.comp_forum_xref_bak TO public;



GRANT select ON tcs_catalog.comp_forum_xref_bak TO public;

GRANT select ON tcs_catalog.dr_points_status_lu TO public;

GRANT insert ON tcs_catalog.dr_points_status_lu TO public;

GRANT delete ON tcs_catalog.dr_points_status_lu TO public;

GRANT update ON tcs_catalog.dr_points_status_lu TO public;



GRANT delete ON tcs_catalog.resource_info TO public;

GRANT select ON tcs_catalog.resource_info TO public;

GRANT update ON tcs_catalog.resource_info TO public;

GRANT insert ON tcs_catalog.resource_info TO public;

GRANT update ON tcs_catalog.team_header TO public;

GRANT delete ON tcs_catalog.team_header TO public;

GRANT insert ON tcs_catalog.team_header TO public;



GRANT select ON tcs_catalog.team_header TO public;



GRANT select ON tcs_catalog.team_properties TO public;

GRANT delete ON tcs_catalog.team_properties TO public;

GRANT insert ON tcs_catalog.team_properties TO public;

GRANT update ON tcs_catalog.team_properties TO public;

GRANT update ON tcs_catalog.team_position TO public;

GRANT delete ON tcs_catalog.team_position TO public;



GRANT select ON tcs_catalog.team_position TO public;

GRANT insert ON tcs_catalog.team_position TO public;

GRANT insert ON tcs_catalog.team_position_properties TO public;

GRANT update ON tcs_catalog.team_position_properties TO public;



GRANT select ON tcs_catalog.team_position_properties TO public;

GRANT delete ON tcs_catalog.team_position_properties TO public;

GRANT update ON tcs_catalog.team_manager_audit TO public;

GRANT select ON tcs_catalog.team_manager_audit TO public;



GRANT delete ON tcs_catalog.team_manager_audit TO public;

GRANT insert ON tcs_catalog.team_manager_audit TO public;

GRANT delete ON tcs_catalog.team_manager_audit_details TO public;



GRANT insert ON tcs_catalog.team_manager_audit_details TO public;

GRANT select ON tcs_catalog.team_manager_audit_details TO public;

GRANT update ON tcs_catalog.team_manager_audit_details TO public;

GRANT select ON tcs_catalog.team_manager_audit_custom_details TO public;



GRANT update ON tcs_catalog.team_manager_audit_custom_details TO public;

GRANT insert ON tcs_catalog.team_manager_audit_custom_details TO public;

GRANT delete ON tcs_catalog.team_manager_audit_custom_details TO public;

GRANT insert ON tcs_catalog.facade_audit TO public;

GRANT update ON tcs_catalog.facade_audit TO public;



GRANT delete ON tcs_catalog.facade_audit TO public;

GRANT select ON tcs_catalog.facade_audit TO public;



GRANT update ON tcs_catalog.track_contest_result_calculator_lu TO public;

GRANT select ON tcs_catalog.track_contest_result_calculator_lu TO public;

GRANT insert ON tcs_catalog.track_contest_result_calculator_lu TO public;

GRANT delete ON tcs_catalog.track_contest_result_calculator_lu TO public;

GRANT delete ON tcs_catalog.track_contest_type_lu TO public;



GRANT select ON tcs_catalog.track_contest_type_lu TO public;

GRANT insert ON tcs_catalog.track_contest_type_lu TO public;

GRANT update ON tcs_catalog.track_contest_type_lu TO public;

GRANT insert ON tcs_catalog.track_project_category_xref TO public;

GRANT delete ON tcs_catalog.track_project_category_xref TO public;

GRANT update ON tcs_catalog.track_project_category_xref TO public;

GRANT select ON tcs_catalog.track_project_category_xref TO public;



GRANT delete ON tcs_catalog.track_type_lu TO public;

GRANT insert ON tcs_catalog.track_type_lu TO public;

GRANT select ON tcs_catalog.track_type_lu TO public;



GRANT update ON tcs_catalog.track_type_lu TO public;



GRANT delete ON tcs_catalog.track_status_lu TO public;

GRANT select ON tcs_catalog.track_status_lu TO public;

GRANT insert ON tcs_catalog.track_status_lu TO public;

GRANT update ON tcs_catalog.track_status_lu TO public;

GRANT insert ON tcs_catalog.categories TO public;

GRANT delete ON tcs_catalog.categories TO public;

GRANT update ON tcs_catalog.categories TO public;

GRANT select ON tcs_catalog.categories TO public;



GRANT insert ON tcs_catalog.comp_user TO public;



GRANT select ON tcs_catalog.comp_user TO public;

GRANT delete ON tcs_catalog.comp_user TO public;

GRANT update ON tcs_catalog.comp_user TO public;

GRANT delete ON tcs_catalog.user_client TO public;

GRANT select ON tcs_catalog.user_client TO public;

GRANT update ON tcs_catalog.user_client TO public;



GRANT insert ON tcs_catalog.user_client TO public;

GRANT delete ON tcs_catalog.comp_link TO public;

GRANT select ON tcs_catalog.comp_link TO public;

GRANT update ON tcs_catalog.comp_link TO public;

GRANT insert ON tcs_catalog.comp_link TO public;



GRANT select ON tcs_catalog.points_calculator_lu TO public;

GRANT insert ON tcs_catalog.points_calculator_lu TO public;

GRANT update ON tcs_catalog.points_calculator_lu TO public;



GRANT delete ON tcs_catalog.points_calculator_lu TO public;

GRANT insert ON tcs_catalog.track TO public;

GRANT delete ON tcs_catalog.track TO public;

GRANT update ON tcs_catalog.track TO public;



GRANT select ON tcs_catalog.track TO public;

GRANT delete ON tcs_catalog.track_contest TO public;



GRANT select ON tcs_catalog.track_contest TO public;

GRANT update ON tcs_catalog.track_contest TO public;

GRANT insert ON tcs_catalog.track_contest TO public;

GRANT select ON tcs_catalog.v_latest_version TO public;

GRANT select ON tcs_catalog.link_type_lu TO public;

GRANT insert ON tcs_catalog.link_type_lu TO public;

GRANT update ON tcs_catalog.link_type_lu TO public;

GRANT delete ON tcs_catalog.link_type_lu TO public;

GRANT select ON tcs_catalog.linked_project_xref TO public;

GRANT insert ON tcs_catalog.linked_project_xref TO public;

GRANT update ON tcs_catalog.linked_project_xref TO public;

GRANT delete ON tcs_catalog.linked_project_xref TO public;

GRANT select ON tcs_catalog.project_spec TO public;

GRANT insert ON tcs_catalog.project_spec TO public;

GRANT update ON tcs_catalog.project_spec TO public;

GRANT delete ON tcs_catalog.project_spec TO public;


GRANT select ON tcs_catalog.sale_status_lu TO public;

GRANT insert ON tcs_catalog.sale_status_lu TO public;

GRANT update ON tcs_catalog.sale_status_lu TO public;

GRANT delete ON tcs_catalog.sale_status_lu TO public;


GRANT select ON tcs_catalog.sale_type_lu TO public;

GRANT insert ON tcs_catalog.sale_type_lu TO public;

GRANT update ON tcs_catalog.sale_type_lu TO public;

GRANT delete ON tcs_catalog.sale_type_lu TO public;


GRANT select ON tcs_catalog.contest_sale TO public;

GRANT insert ON tcs_catalog.contest_sale TO public;

GRANT update ON tcs_catalog.contest_sale TO public;

GRANT delete ON tcs_catalog.contest_sale TO public;

grant select,insert,update,delete on tcs_catalog.software_competition_pipeline_info  to public  ;
grant select,insert,update,delete on tcs_catalog.software_competition_change_history  to public  ;

GRANT select ON tcs_catalog.audit_action_type_lu TO public;
GRANT update ON tcs_catalog.audit_action_type_lu TO public;
GRANT insert ON tcs_catalog.audit_action_type_lu TO public;
GRANT delete ON tcs_catalog.audit_action_type_lu TO public;
    
GRANT select ON tcs_catalog.project_user_audit TO public;
GRANT update ON tcs_catalog.project_user_audit TO public;
GRANT insert ON tcs_catalog.project_user_audit TO public;
GRANT delete ON tcs_catalog.project_user_audit TO public;
    
GRANT select ON tcs_catalog.project_info_audit TO public;
GRANT update ON tcs_catalog.project_info_audit TO public;
GRANT insert ON tcs_catalog.project_info_audit TO public;
GRANT delete ON tcs_catalog.project_info_audit TO public;

GRANT select ON tcs_catalog.project_phase_audit TO public;
GRANT update ON tcs_catalog.project_phase_audit TO public;
GRANT insert ON tcs_catalog.project_phase_audit TO public;
GRANT delete ON tcs_catalog.project_phase_audit TO public;

GRANT select ON tcs_catalog.third_party_library TO public;
GRANT update ON tcs_catalog.third_party_library TO public;
GRANT insert ON tcs_catalog.third_party_library TO public;
GRANT delete ON tcs_catalog.third_party_library TO public;

GRANT update ON tcs_catalog.copilot_profile TO public;
GRANT delete ON tcs_catalog.copilot_profile TO public;
GRANT select ON tcs_catalog.copilot_profile TO public;
GRANT insert ON tcs_catalog.copilot_profile TO public;

GRANT update ON tcs_catalog.copilot_profile_status TO public;
GRANT delete ON tcs_catalog.copilot_profile_status TO public;
GRANT select ON tcs_catalog.copilot_profile_status TO public;
GRANT insert ON tcs_catalog.copilot_profile_status TO public;

GRANT update ON tcs_catalog.copilot_profile_info TO public;
GRANT delete ON tcs_catalog.copilot_profile_info TO public;
GRANT select ON tcs_catalog.copilot_profile_info TO public;
GRANT insert ON tcs_catalog.copilot_profile_info TO public;

GRANT update ON tcs_catalog.copilot_profile_info_type TO public;
GRANT delete ON tcs_catalog.copilot_profile_info_type TO public;
GRANT select ON tcs_catalog.copilot_profile_info_type TO public;
GRANT insert ON tcs_catalog.copilot_profile_info_type TO public;


CREATE SEQUENCE IF NOT EXISTS tcs_catalog.PROJECT_USER_AUDIT_SEQ;
REVOKE ALL ON tcs_catalog.PROJECT_USER_AUDIT_SEQ FROM PUBLIC;
GRANT select ON tcs_catalog.PROJECT_USER_AUDIT_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS tcs_catalog.user_recent_item_sequence;
REVOKE ALL ON tcs_catalog.user_recent_item_sequence FROM PUBLIC;
GRANT select ON tcs_catalog.user_recent_item_sequence TO public;

CREATE SEQUENCE IF NOT EXISTS SEQUENCE_REVIEW_APPLICATION_SEQ INCREMENT BY 1 START WITH 3000000;
REVOKE ALL ON tcs_catalog.SEQUENCE_REVIEW_APPLICATION_SEQ FROM PUBLIC;
GRANT select ON tcs_catalog.SEQUENCE_REVIEW_APPLICATION_SEQ TO public;

CREATE SEQUENCE IF NOT EXISTS tcs_catalog.copilot_project_sequence INCREMENT BY 1 START WITH 1 MINVALUE 1;
alter sequence tcs_catalog.copilot_project_sequence restart with 5000;
REVOKE ALL ON tcs_catalog.copilot_project_sequence FROM PUBLIC;
GRANT select ON tcs_catalog.copilot_project_sequence TO public;



GRANT select,insert,update,delete ON tcs_catalog.client_billing_config TO public;
GRANT select,insert,update,delete ON tcs_catalog.client_billing_config_type_lu TO public;
GRANT select,insert,update,delete ON tcs_catalog.late_deliverable_type_lu TO public;
GRANT select,insert,update,delete ON tcs_catalog.late_deliverable TO public;
GRANT select,insert,update,delete ON tcs_catalog.review_feedback TO public;
GRANT select,insert,update,delete ON tcs_catalog.review_feedback_audit TO public;
GRANT select,insert,update,delete ON tcs_catalog.review_feedback_detail TO public;
GRANT select,insert,update,delete ON tcs_catalog.review_feedback_detail_audit TO public;
GRANT select,insert,update,delete ON tcs_catalog.project_reliability TO public;

GRANT select,insert,update,delete ON tcs_catalog.copilot_project_status TO public;
GRANT select,insert,update,delete ON tcs_catalog.copilot_type TO public;
GRANT select,insert,update,delete ON tcs_catalog.copilot_project TO public;
GRANT select,insert,update,delete ON tcs_catalog.copilot_project_info_type TO public;
GRANT select,insert,update,delete ON tcs_catalog.copilot_project_info TO public;

GRANT select,insert,update,delete ON tcs_catalog.file_type_lu TO public;
GRANT select,insert,update,delete ON tcs_catalog.prize TO public;
GRANT select,insert,update,delete ON tcs_catalog.project_studio_specification TO public;
GRANT select,insert,update,delete ON tcs_catalog.project_mm_specification TO public;
GRANT select,insert,update,delete ON tcs_catalog.project_file_type_xref TO public;
GRANT select,insert,update,delete ON tcs_catalog.default_terms TO public;
GRANT select,insert,update,delete ON tcs_catalog.mime_type_lu TO public;
GRANT select,insert,update,delete ON tcs_catalog.submission_image TO public;

GRANT select,insert,update,delete ON tcs_catalog.submission_declaration TO public;
GRANT select,insert,update,delete ON tcs_catalog.submission_external_content TO public;
GRANT select,insert,update,delete ON tcs_catalog.external_content_type TO public;
GRANT select,insert,update,delete ON tcs_catalog.external_content_property TO public;
GRANT select,insert,update,delete ON tcs_catalog.project_download_audit TO public;



GRANT update ON tcs_catalog.project_copilot_type_lu TO public;
GRANT insert ON tcs_catalog.project_copilot_type_lu TO public;
GRANT select ON tcs_catalog.project_copilot_type_lu TO public;
GRANT delete ON tcs_catalog.project_copilot_type_lu TO public;


GRANT update ON tcs_catalog.project_copilot_type TO public;
GRANT insert ON tcs_catalog.project_copilot_type TO public;
GRANT select ON tcs_catalog.project_copilot_type TO public;
GRANT delete ON tcs_catalog.project_copilot_type TO public;


GRANT update ON tcs_catalog.copilot_contest_extra_info_type TO public;
GRANT insert ON tcs_catalog.copilot_contest_extra_info_type TO public;
GRANT select ON tcs_catalog.copilot_contest_extra_info_type TO public;
GRANT delete ON tcs_catalog.copilot_contest_extra_info_type TO public;


GRANT update ON tcs_catalog.copilot_contest_extra_info TO public;
GRANT insert ON tcs_catalog.copilot_contest_extra_info TO public;
GRANT select ON tcs_catalog.copilot_contest_extra_info TO public;
GRANT delete ON tcs_catalog.copilot_contest_extra_info TO public;


GRANT update ON tcs_catalog.direct_project_metadata TO public;
GRANT insert ON tcs_catalog.direct_project_metadata TO public;
GRANT select ON tcs_catalog.direct_project_metadata TO public;
GRANT delete ON tcs_catalog.direct_project_metadata TO public;


GRANT update ON tcs_catalog.direct_project_metadata_audit TO public;
GRANT insert ON tcs_catalog.direct_project_metadata_audit TO public;
GRANT select ON tcs_catalog.direct_project_metadata_audit TO public;
GRANT delete ON tcs_catalog.direct_project_metadata_audit TO public;


GRANT update ON tcs_catalog.direct_project_metadata_key TO public;
GRANT insert ON tcs_catalog.direct_project_metadata_key TO public;
GRANT select ON tcs_catalog.direct_project_metadata_key TO public;
GRANT delete ON tcs_catalog.direct_project_metadata_key TO public;


GRANT update ON tcs_catalog.direct_project_metadata_key_audit TO public;
GRANT insert ON tcs_catalog.direct_project_metadata_key_audit TO public;
GRANT select ON tcs_catalog.direct_project_metadata_key_audit TO public;
GRANT delete ON tcs_catalog.direct_project_metadata_key_audit TO public;


GRANT update ON tcs_catalog.direct_project_metadata_predefined_value TO public;
GRANT insert ON tcs_catalog.direct_project_metadata_predefined_value TO public;
GRANT select ON tcs_catalog.direct_project_metadata_predefined_value TO public;
GRANT delete ON tcs_catalog.direct_project_metadata_predefined_value TO public;


GRANT update ON tcs_catalog.direct_project_metadata_predefined_value_audit TO public;
GRANT insert ON tcs_catalog.direct_project_metadata_predefined_value_audit TO public;
GRANT select ON tcs_catalog.direct_project_metadata_predefined_value_audit TO public;
GRANT delete ON tcs_catalog.direct_project_metadata_predefined_value_audit TO public;



GRANT select,insert,update,delete ON tcs_catalog.project_milestone TO public;

GRANT select,insert,update,delete ON tcs_catalog.project_milestone_owner TO public;

GRANT select,insert,update,delete ON tcs_catalog.comp_milestone_feedback TO public;



GRANT insert ON tcs_catalog.customer_group TO public;

GRANT select ON tcs_catalog.customer_group TO public;

GRANT update ON tcs_catalog.customer_group TO public;



GRANT delete ON tcs_catalog.customer_group TO public;

GRANT insert ON tcs_catalog.group_associated_billing_accounts TO public;

GRANT select ON tcs_catalog.group_associated_billing_accounts TO public;

GRANT update ON tcs_catalog.group_associated_billing_accounts TO public;



GRANT delete ON tcs_catalog.group_associated_billing_accounts TO public;

GRANT insert ON tcs_catalog.group_associated_direct_projects TO public;

GRANT select ON tcs_catalog.group_associated_direct_projects TO public;

GRANT update ON tcs_catalog.group_associated_direct_projects TO public;



GRANT delete ON tcs_catalog.group_associated_direct_projects TO public;

GRANT insert ON tcs_catalog.customer_administrator TO public;

GRANT select ON tcs_catalog.customer_administrator TO public;

GRANT update ON tcs_catalog.customer_administrator TO public;



GRANT delete ON tcs_catalog.customer_administrator TO public;


GRANT insert ON tcs_catalog.group_member TO public;

GRANT select ON tcs_catalog.group_member TO public;

GRANT update ON tcs_catalog.group_member TO public;



GRANT delete ON tcs_catalog.group_member TO public;

GRANT insert ON tcs_catalog.group_invitation TO public;

GRANT select ON tcs_catalog.group_invitation TO public;

GRANT update ON tcs_catalog.group_invitation TO public;



GRANT delete ON tcs_catalog.group_invitation TO public;

GRANT insert ON tcs_catalog.group_audit_record TO public;

GRANT select ON tcs_catalog.group_audit_record TO public;

GRANT update ON tcs_catalog.group_audit_record TO public;



GRANT delete ON tcs_catalog.group_audit_record TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_auction_category_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_auction_type_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_application_role_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_application_role_resource_role_xref TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_application_status_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_auction TO public;

GRANT select,insert,update,delete ON tcs_catalog.review_application TO public;

GRANT select,insert,update,delete ON tcs_catalog.project_payment_type_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.project_payment TO public;

GRANT select,insert,update,delete ON tcs_catalog.project_payment_adjustment TO public;

GRANT select,insert,update,delete ON tcs_catalog.default_project_payment TO public;

GRANT select,insert,update,delete ON tcs_catalog.reviewer_rating TO public;

GRANT select,insert,update,delete ON tcs_catalog.collaborating_members TO public;


GRANT select,insert,update,delete ON tcs_catalog.file_type_icon TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset_category TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset_version TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset_category_mapping TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset_permission TO public;
GRANT select,insert,update,delete ON tcs_catalog.asset_audit_record TO public;

GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_list TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_status TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_list_permitted_user TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_priority TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_attachment TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_list_milestone_xref TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_contest_xref TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_assignee TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_milestone_xref TO public;
GRANT select,insert,update,delete ON tcs_catalog.direct_project_task_list_contest_xref TO public;

GRANT select,insert,update,delete ON tcs_catalog.contest_milestone_xref TO public;

GRANT select,insert,update,delete ON tcs_catalog.project_sub_category_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.platform_lu TO public;

GRANT select,insert,update,delete ON tcs_catalog.user_recent_item_type TO public;
GRANT select,insert,update,delete ON tcs_catalog.user_recent_item TO public;

GRANT select,insert,update,delete ON tcs_catalog.client_group_xref TO public;

GRANT insert ON tcs_catalog.project_platform TO public;
GRANT update ON tcs_catalog.project_platform TO public;
GRANT delete ON tcs_catalog.project_platform TO public;
GRANT select ON tcs_catalog.project_platform TO public;
GRANT insert ON tcs_catalog.project_platform_lu TO public;
GRANT update ON tcs_catalog.project_platform_lu TO public;
GRANT delete ON tcs_catalog.project_platform_lu TO public;
GRANT select ON tcs_catalog.project_platform_lu TO public;

CREATE INDEX IF NOT EXISTS project_platform_name_idx ON tcs_catalog.project_platform_lu
    (
    name
    );

CREATE TABLE IF NOT EXISTS tcs_catalog.submission_push_status (
    push_id SERIAL NOT NULL,
    tc_direct_project_id DECIMAL(10,0),
    user_id DECIMAL(12,0),
    value VARCHAR(64) NOT NULL,
    create_user VARCHAR(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    modify_user VARCHAR(64) NOT NULL,
    modify_date TIMESTAMP NOT NULL
)
;

REVOKE ALL ON tcs_catalog.submission_push_status FROM PUBLIC;

GRANT SELECT,INSERT,UPDATE,DELETE ON tcs_catalog.submission_push_status TO PUBLIC;

