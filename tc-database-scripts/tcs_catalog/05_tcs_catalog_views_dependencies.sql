set search_path to tcs_catalog;

-- Informixoltp synonyms

create or replace view  coder
as select * from informixoltp.coder;

create or replace view  current_school
as select * from informixoltp.current_school;

create or replace view  coder_referral
as select * from informixoltp.coder_referral;

create or replace view  image
as select * from informixoltp.image;

-- JIVE synonyms

create or replace view jivecategory
as select * from jive.jivecategory;

create or replace view jiveforum
as select * from jive.jiveforum;

create or replace view jivemessage
as select * from jive.jivemessage;


-- CORPORATE_OLTP SYNONYMS

create or replace view tc_direct_project
as select * from corporate_oltp.tc_direct_project;

create or replace view permission_type
as select * from corporate_oltp.permission_type;

create or replace view user_permission_grant
as select * from corporate_oltp.user_permission_grant;

create or replace view PERMISSION_SEQ
as select * from corporate_oltp.PERMISSION_SEQ;

create or replace view spec_review_status_type_lu
as select * from corporate_oltp.spec_review_status_type_lu;

create or replace view spec_review_section_type_lu
as select * from corporate_oltp.spec_review_section_type_lu;

create or replace view spec_review_user_role_type_lu
as select * from corporate_oltp.spec_review_user_role_type_lu;

create or replace view spec_review
as select * from corporate_oltp.spec_review;

create or replace view spec_review_reviewer_xref
as select * from corporate_oltp.spec_review_reviewer_xref;

create or replace view spec_section_review
as select * from corporate_oltp.spec_section_review;

create or replace view spec_section_review_comment
as select * from corporate_oltp.spec_section_review_comment;

create or replace view spec_review_comment_view
as select * from corporate_oltp.spec_review_comment_view;

create or replace view SPEC_REVIEW_REVIEWER_SEQ
as select * from corporate_oltp.SPEC_REVIEW_REVIEWER_SEQ;

create or replace view direct_project_type
as select * from corporate_oltp.direct_project_type;

create or replace view direct_project_category
as select * from corporate_oltp.direct_project_category;

create or replace view direct_project_account
as select * from corporate_oltp.direct_project_account;


-- Time_oltp synonyms

create or replace view client
as select * from  time_oltp.client;

create or replace view tt_project
as select * from time_oltp.project;

create or replace view tt_client
as select * from  time_oltp.client;

create or replace view tt_client_project
as select * from  time_oltp.client_project;

create or replace view tt_user_account
as select * from  time_oltp.user_account;

create or replace view tt_project_worker
as select * from  time_oltp.project_worker;

create or replace view tt_project_manager
as select * from  time_oltp.project_manager;
