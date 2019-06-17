SET search_path TO tcs_catalog;

ALTER TABLE tcs_catalog.company_size ADD CONSTRAINT pk_company_size PRIMARY KEY (company_size_id);

CREATE UNIQUE INDEX IF NOT EXISTS comp_ctgy_i1 ON tcs_catalog.comp_categories
    (
    component_id, 
    category_id
    );
ALTER TABLE tcs_catalog.comp_categories CLUSTER ON comp_ctgy_i1;

ALTER TABLE tcs_catalog.comp_categories ADD CONSTRAINT pk_comp_categories PRIMARY KEY (comp_categories_id);

CREATE UNIQUE INDEX IF NOT EXISTS comp_depend_i1 ON tcs_catalog.comp_dependencies
    (
    comp_vers_id, 
    child_comp_vers_id
    );
ALTER TABLE tcs_catalog.comp_dependencies CLUSTER ON comp_depend_i1;

ALTER TABLE tcs_catalog.comp_dependencies ADD CONSTRAINT pk_comp_dependenci PRIMARY KEY (comp_dependency_id);

ALTER TABLE tcs_catalog.comp_documentation ADD CONSTRAINT pk_comp_documentat PRIMARY KEY (document_id);

ALTER TABLE tcs_catalog.comp_download ADD CONSTRAINT pk_comp_download PRIMARY KEY (download_id);

ALTER TABLE tcs_catalog.comp_examples ADD CONSTRAINT pk_comp_examples PRIMARY KEY (example_id);

CREATE UNIQUE INDEX IF NOT EXISTS comp_keywords_i1 ON tcs_catalog.comp_keywords
    (
    component_id, 
    keyword
    );
ALTER TABLE tcs_catalog.comp_keywords CLUSTER ON comp_keywords_i1;

ALTER TABLE tcs_catalog.comp_keywords ADD CONSTRAINT pk_comp_keywords PRIMARY KEY (comp_keywords_id);

ALTER TABLE tcs_catalog.comp_reviews ADD CONSTRAINT pk_comp_reviews PRIMARY KEY (comp_reviews_id);

CREATE UNIQUE INDEX IF NOT EXISTS comp_tech_i1 ON tcs_catalog.comp_technology
    (
    comp_vers_id, 
    technology_type_id
    );
ALTER TABLE tcs_catalog.comp_technology CLUSTER ON comp_tech_i1;

ALTER TABLE tcs_catalog.comp_technology ADD CONSTRAINT pk_comp_technology PRIMARY KEY (comp_tech_id);

ALTER TABLE tcs_catalog.contact_type ADD CONSTRAINT pk_contact_type PRIMARY KEY (contact_type_id);

ALTER TABLE tcs_catalog.country_codes ADD CONSTRAINT pk_country_codes PRIMARY KEY (country_code);

ALTER TABLE tcs_catalog.doc_types ADD CONSTRAINT pk_doc_types PRIMARY KEY (document_type_id);


create  index download_track_i2 on tcs_catalog.download_tracking
    (
    comp_vers_id, 
    login_id
    );
 cluster tcs_catalog.download_tracking USING download_track_i2;    

ALTER TABLE tcs_catalog.download_tracking ADD CONSTRAINT pk_download_tracki PRIMARY KEY (download_track_id);

ALTER TABLE tcs_catalog.key_generation ADD CONSTRAINT pk_key_generation PRIMARY KEY (user_def);

ALTER TABLE tcs_catalog.license_level ADD CONSTRAINT pk_license_level PRIMARY KEY (license_level_id);

ALTER TABLE tcs_catalog.phase ADD CONSTRAINT pk_phase PRIMARY KEY (phase_id);

ALTER TABLE tcs_catalog.price_tiers ADD CONSTRAINT pk_price_tiers PRIMARY KEY (tier_id);

ALTER TABLE tcs_catalog.roles ADD CONSTRAINT pk_roles PRIMARY KEY (role_id);

ALTER TABLE tcs_catalog.status ADD CONSTRAINT pk_status PRIMARY KEY (status_id);

ALTER TABLE tcs_catalog.technology_types ADD CONSTRAINT pk_technology_type PRIMARY KEY (technology_type_id);

ALTER TABLE tcs_catalog.user_contact ADD CONSTRAINT pk_user_contact PRIMARY KEY (user_contact_id);

ALTER TABLE tcs_catalog.user_member ADD CONSTRAINT pk_user_member PRIMARY KEY (user_member_id);

CREATE UNIQUE INDEX IF NOT EXISTS user_techology_i2 ON tcs_catalog.user_technologies
    (
    technology_type_id, 
    login_id
    );
ALTER TABLE tcs_catalog.user_technologies CLUSTER ON user_techology_i2;

ALTER TABLE tcs_catalog.user_technologies ADD CONSTRAINT pk_user_technologi PRIMARY KEY (user_tech_id);

create  index word_search_i2 on tcs_catalog.word_search
    (
    index_word
    );
cluster tcs_catalog.word_search using word_search_i2;   

CREATE unique INDEX IF NOT EXISTS word_search_i3 ON tcs_catalog.word_search
    (
    document_id, 
    index_word
    );

ALTER TABLE tcs_catalog.word_search ADD CONSTRAINT pk_word_search PRIMARY KEY (word_search_id);

CREATE UNIQUE INDEX IF NOT EXISTS word_srch_ctgy_i2 ON tcs_catalog.word_search_ctgy
    (
    category_id, 
    document_id
    );
ALTER TABLE tcs_catalog.word_search_ctgy CLUSTER ON word_srch_ctgy_i2;

CREATE INDEX IF NOT EXISTS word_srch_ctgy_i3 ON tcs_catalog.word_search_ctgy
    (
    document_id
    );

ALTER TABLE tcs_catalog.word_search_ctgy ADD CONSTRAINT pk_word_search_ctg PRIMARY KEY (word_srch_ctgy_id);

ALTER TABLE tcs_catalog.word_search_doc ADD CONSTRAINT pk_word_search_doc PRIMARY KEY (document_id);

ALTER TABLE tcs_catalog.word_search_excl ADD CONSTRAINT pk_word_search_exc PRIMARY KEY (word_srch_exl_id);

ALTER TABLE tcs_catalog.command_group_lu ADD CONSTRAINT command_group_lu_pk PRIMARY KEY (command_group_id);

ALTER TABLE tcs_catalog.command ADD CONSTRAINT command_pk PRIMARY KEY (command_id);

ALTER TABLE tcs_catalog.query ADD CONSTRAINT query_pk PRIMARY KEY (query_id);

CREATE unique INDEX IF NOT EXISTS inputlu_inputcode_idx ON tcs_catalog.input_lu
    (
    input_code
    );

ALTER TABLE tcs_catalog.input_lu ADD CONSTRAINT input_lu_pkey PRIMARY KEY (input_id);

ALTER TABLE tcs_catalog.query_input_xref ADD CONSTRAINT query_input_pk PRIMARY KEY (query_id, input_id);

ALTER TABLE tcs_catalog.command_query_xref ADD CONSTRAINT commandqueryxref_pk PRIMARY KEY (command_id, query_id);

alter table tcs_catalog.tc_user_xref add constraint u144_151 unique 
    (tc_coder_id);

ALTER TABLE tcs_catalog.tc_user_xref ADD CONSTRAINT u144_152 PRIMARY KEY (user_id);

CREATE INDEX IF NOT EXISTS compinquiry_idx1 ON tcs_catalog.component_inquiry
    (
    component_id, 
    phase, 
    version
    );

CREATE INDEX IF NOT EXISTS compinquiry_idx2 ON tcs_catalog.component_inquiry
    (
    user_id
    );

CREATE INDEX IF NOT EXISTS compinquiry_idx3 ON tcs_catalog.component_inquiry
    (
    project_id
    );

CREATE INDEX IF NOT EXISTS compinquiry_idx4 ON tcs_catalog.component_inquiry
    (
    tc_user_id
    );

ALTER TABLE tcs_catalog.component_inquiry ADD CONSTRAINT pk_component_inquiry_id PRIMARY KEY (component_inquiry_id);

CREATE INDEX IF NOT EXISTS compverdates_idx1 ON tcs_catalog.comp_version_dates
    (
    status_id
    );

CREATE INDEX IF NOT EXISTS compverdates_idx2 ON tcs_catalog.comp_version_dates
    (
    comp_vers_id, 
    phase_id
    );

ALTER TABLE tcs_catalog.comp_version_dates ADD CONSTRAINT pk_comp_version_dates_id PRIMARY KEY (comp_version_dates_id);

ALTER TABLE tcs_catalog.comp_level ADD CONSTRAINT pk_comp_level PRIMARY KEY (level_id);

ALTER TABLE tcs_catalog.user_master_tmp ADD CONSTRAINT pk_user_master_tmp PRIMARY KEY (login_id);

ALTER TABLE tcs_catalog.user_master ADD CONSTRAINT pk_user_master PRIMARY KEY (login_id);

ALTER TABLE tcs_catalog.comp_version_dates_history ADD CONSTRAINT pk_comp_version_dates_history_id PRIMARY KEY (comp_version_dates_history_id);

ALTER TABLE tcs_catalog.review_resp ADD CONSTRAINT u159_231 PRIMARY KEY (review_resp_id);

ALTER TABLE tcs_catalog.comp_level_phase ADD CONSTRAINT pk_comp_level_phase PRIMARY KEY (level_id, phase_id);

ALTER TABLE tcs_catalog.user_component_score ADD CONSTRAINT pk_user_comp_score_id PRIMARY KEY (user_component_score_id);

ALTER TABLE tcs_catalog.user_rating ADD CONSTRAINT pk_user_rating PRIMARY KEY (user_id, phase_id);

ALTER TABLE tcs_catalog.rboard_status_lu ADD CONSTRAINT rboard_stat_lu_pk PRIMARY KEY (status_id);

ALTER TABLE tcs_catalog.contest_type_lu ADD CONSTRAINT contest_type_lu_pkey PRIMARY KEY (contest_type_id);

ALTER TABLE tcs_catalog.contest ADD CONSTRAINT contest_pkey PRIMARY KEY (contest_id);

ALTER TABLE tcs_catalog.contest_project_xref ADD CONSTRAINT contest_project_xref_pkey PRIMARY KEY (contest_id, project_id);

ALTER TABLE tcs_catalog.prize_type_lu ADD CONSTRAINT prize_type_lu_pkey PRIMARY KEY (prize_type_id);

ALTER TABLE tcs_catalog.user_contest_prize ADD CONSTRAINT user_contest_prize_pkey PRIMARY KEY (contest_prize_id, user_id);

CREATE INDEX IF NOT EXISTS proj_result_idx1 ON tcs_catalog.project_result
    (
    project_id
    );

ALTER TABLE tcs_catalog.project_result ADD CONSTRAINT project_result_pkey PRIMARY KEY (user_id, project_id);

ALTER TABLE tcs_catalog.user_reliability ADD CONSTRAINT user_reliability_pkey PRIMARY KEY (user_id, phase_id);

CREATE INDEX IF NOT EXISTS royalty_idx1 ON tcs_catalog.royalty
    (
    user_id
    );

ALTER TABLE tcs_catalog.user_event_xref ADD CONSTRAINT usereventxref_pkey PRIMARY KEY (user_id, event_id);

ALTER TABLE tcs_catalog.notification_mail_type_lu ADD CONSTRAINT notificationmailtype_pkey PRIMARY KEY (notification_mail_type_id);

CREATE INDEX IF NOT EXISTS idx_event_on_notification_event ON tcs_catalog.notification_event
    (
    event
    );

ALTER TABLE tcs_catalog.notification_event ADD CONSTRAINT notificationevent_pkey PRIMARY KEY (notification_event_id);

ALTER TABLE tcs_catalog.user_notification_event_xref ADD CONSTRAINT usernotificationeventxref_pkey PRIMARY KEY (notification_event_id, user_id);

ALTER TABLE tcs_catalog.comp_reg_answer ADD CONSTRAINT pk_comp_reg_ans809 PRIMARY KEY (comp_reg_answer_id);

ALTER TABLE tcs_catalog.question_style ADD CONSTRAINT question_style_pkey PRIMARY KEY (question_style_id);

ALTER TABLE tcs_catalog.comp_reg_question ADD CONSTRAINT pk_comp_reg_que516 PRIMARY KEY (comp_reg_question_id);

ALTER TABLE tcs_catalog.project_wager ADD CONSTRAINT project_wager_pkey PRIMARY KEY (user_id, project_id);

ALTER TABLE tcs_catalog.catalog ADD CONSTRAINT catalog_pk PRIMARY KEY (catalog_id);

ALTER TABLE tcs_catalog.rboard_user ADD CONSTRAINT rboard_user_pk PRIMARY KEY (user_id, project_type_id, catalog_id);

ALTER TABLE tcs_catalog.category_catalog ADD CONSTRAINT catalog_category_xref_pk PRIMARY KEY (category_id);

ALTER TABLE tcs_catalog.specification_type ADD CONSTRAINT pk_specification_type PRIMARY KEY (specification_type_id);

ALTER TABLE tcs_catalog.specification ADD CONSTRAINT pk_specification PRIMARY KEY (specification_id);

ALTER TABLE tcs_catalog.project_type_lu ADD CONSTRAINT pk_project_type_lu PRIMARY KEY (project_type_id);

ALTER TABLE tcs_catalog.project_catalog_lu ADD CONSTRAINT pk_project_catalog_lu PRIMARY KEY (project_catalog_id);

ALTER TABLE tcs_catalog.project_category_lu ADD CONSTRAINT pk_project_category_lu PRIMARY KEY (project_category_id);

ALTER TABLE tcs_catalog.scorecard_type_lu ADD CONSTRAINT pk_scorecard_type_lu PRIMARY KEY (scorecard_type_id);

ALTER TABLE tcs_catalog.scorecard_status_lu ADD CONSTRAINT pk_scorecard_status_lu PRIMARY KEY (scorecard_status_id);

ALTER TABLE tcs_catalog.scorecard ADD CONSTRAINT pk_scorecard PRIMARY KEY (scorecard_id);

ALTER TABLE tcs_catalog.scorecard_group ADD CONSTRAINT pk_scorecard_group PRIMARY KEY (scorecard_group_id);

ALTER TABLE tcs_catalog.scorecard_question_type_lu ADD CONSTRAINT pk_scorecard_question_type_lu PRIMARY KEY (scorecard_question_type_id);

ALTER TABLE tcs_catalog.scorecard_question ADD CONSTRAINT pk_scorecard_question PRIMARY KEY (scorecard_question_id);

ALTER TABLE tcs_catalog.project_status_lu ADD CONSTRAINT pk_project_status_lu PRIMARY KEY (project_status_id);

ALTER TABLE tcs_catalog.project ADD CONSTRAINT pk_project PRIMARY KEY (project_id);

ALTER TABLE tcs_catalog.project_info_type_lu ADD CONSTRAINT pk_project_info_type_lu PRIMARY KEY (project_info_type_id);

ALTER TABLE tcs_catalog.phase_status_lu ADD CONSTRAINT pk_phase_status_lu PRIMARY KEY (phase_status_id);

ALTER TABLE tcs_catalog.phase_type_lu ADD CONSTRAINT pk_phase_type_lu PRIMARY KEY (phase_type_id);

ALTER TABLE tcs_catalog.project_phase ADD CONSTRAINT pk_project_phase PRIMARY KEY (project_phase_id);

ALTER TABLE tcs_catalog.phase_dependency ADD CONSTRAINT pk_phase_dependency PRIMARY KEY (dependency_phase_id, dependent_phase_id);

ALTER TABLE tcs_catalog.phase_criteria_type_lu ADD CONSTRAINT pk_phase_criteria_type_lu PRIMARY KEY (phase_criteria_type_id);

ALTER TABLE tcs_catalog.phase_criteria ADD CONSTRAINT pk_phase_criteria PRIMARY KEY (project_phase_id, phase_criteria_type_id);

ALTER TABLE tcs_catalog.resource_role_lu ADD CONSTRAINT pk_resource_role_lu PRIMARY KEY (resource_role_id);

ALTER TABLE tcs_catalog.resource ADD CONSTRAINT pk_resource PRIMARY KEY (resource_id);

create  index resource_resourcerule_idx on tcs_catalog.resource
    (
    resource_role_id
    );
cluster tcs_catalog.resource using  resource_resourcerule_idx;  
    
ALTER TABLE tcs_catalog.resource_info_type_lu ADD CONSTRAINT pk_resource_info_type_lu PRIMARY KEY (resource_info_type_id);

ALTER TABLE tcs_catalog.upload_type_lu ADD CONSTRAINT pk_upload_type_lu PRIMARY KEY (upload_type_id);

ALTER TABLE tcs_catalog.upload_status_lu ADD CONSTRAINT pk_upload_status_lu PRIMARY KEY (upload_status_id);

ALTER TABLE tcs_catalog.upload ADD CONSTRAINT pk_upload PRIMARY KEY (upload_id);

ALTER TABLE tcs_catalog.submission_status_lu ADD CONSTRAINT pk_submission_status_lu PRIMARY KEY (submission_status_id);
    
ALTER TABLE tcs_catalog.submission_type_lu ADD CONSTRAINT pk_submission_type_lu PRIMARY KEY (submission_type_id);

ALTER TABLE tcs_catalog.submission ADD CONSTRAINT pk_submission PRIMARY KEY (submission_id);

ALTER TABLE tcs_catalog.resource_submission ADD CONSTRAINT pk_resource_submission PRIMARY KEY (resource_id, submission_id);

ALTER TABLE tcs_catalog.comment_type_lu ADD CONSTRAINT pk_comment_type_lu PRIMARY KEY (comment_type_id);

ALTER TABLE tcs_catalog.review ADD CONSTRAINT pk_review PRIMARY KEY (review_id);

ALTER TABLE tcs_catalog.review_item ADD CONSTRAINT pk_review_item PRIMARY KEY (review_item_id);

ALTER TABLE tcs_catalog.review_comment ADD CONSTRAINT pk_review_comment PRIMARY KEY (review_comment_id);

ALTER TABLE tcs_catalog.review_item_comment ADD CONSTRAINT pk_review_item_comment PRIMARY KEY (review_item_comment_id);

ALTER TABLE tcs_catalog.deliverable_lu ADD CONSTRAINT pk_deliverable_lu PRIMARY KEY (deliverable_id);

ALTER TABLE tcs_catalog.project_audit ADD CONSTRAINT pk_project_audit PRIMARY KEY (project_audit_id);

ALTER TABLE tcs_catalog.notification_type_lu ADD CONSTRAINT pk_notification_type_lu PRIMARY KEY (notification_type_id);

ALTER TABLE tcs_catalog.notification ADD CONSTRAINT pk_notification PRIMARY KEY (project_id, external_ref_id, notification_type_id);

ALTER TABLE tcs_catalog.screening_status_lu ADD CONSTRAINT pk_screening_status_lu PRIMARY KEY (screening_status_id);

ALTER TABLE tcs_catalog.screening_task ADD CONSTRAINT pk_screening_task PRIMARY KEY (screening_task_id);

ALTER TABLE tcs_catalog.response_severity_lu ADD CONSTRAINT pk_response_severity_lu PRIMARY KEY (response_severity_id);

ALTER TABLE tcs_catalog.screening_response_lu ADD CONSTRAINT pk_screening_response_lu PRIMARY KEY (screening_response_id);

ALTER TABLE tcs_catalog.screening_result ADD CONSTRAINT pk_screening_result PRIMARY KEY (screening_result_id);

ALTER TABLE tcs_catalog.default_scorecard ADD CONSTRAINT pk_default_scorecard PRIMARY KEY (project_category_id, scorecard_type_id);

ALTER TABLE tcs_catalog.user_role ADD CONSTRAINT pk_user_role PRIMARY KEY (user_role_id);

CREATE INDEX IF NOT EXISTS resource_info_val_idx ON tcs_catalog.resource_info
    (
    value
    );

ALTER TABLE tcs_catalog.resource_info ADD CONSTRAINT pk_resource_info PRIMARY KEY (resource_id, resource_info_type_id);

CREATE INDEX IF NOT EXISTS project_info_val_idx ON tcs_catalog.project_info
    (
    value
    );

ALTER TABLE tcs_catalog.project_info ADD CONSTRAINT pk_project_info PRIMARY KEY (project_id, project_info_type_id);

CREATE UNIQUE INDEX IF NOT EXISTS comp_versions_i2 ON tcs_catalog.comp_versions
    (
    component_id, 
    version
    );
ALTER TABLE tcs_catalog.comp_versions CLUSTER ON comp_versions_i2;

ALTER TABLE tcs_catalog.comp_versions ADD CONSTRAINT pk_comp_versions PRIMARY KEY (comp_vers_id);

ALTER TABLE tcs_catalog.comp_jive_category_xref ADD CONSTRAINT pk_comp_jive_xr643 PRIMARY KEY (jive_category_id, comp_vers_id);

ALTER TABLE tcs_catalog.contest_prize ADD CONSTRAINT contest_prize_pkey PRIMARY KEY (contest_prize_id);

ALTER TABLE tcs_catalog.season ADD CONSTRAINT season_id_pk PRIMARY KEY (season_id);

ALTER TABLE tcs_catalog.stage ADD CONSTRAINT stage_id_pk PRIMARY KEY (stage_id);

ALTER TABLE tcs_catalog.contest_stage_xref ADD CONSTRAINT contest_stage_xref_pk PRIMARY KEY (contest_id, stage_id);

ALTER TABLE tcs_catalog.contest_season_xref ADD CONSTRAINT contest_season_xref_pk PRIMARY KEY (contest_id, season_id);

ALTER TABLE tcs_catalog.contest_result_calculator_lu ADD CONSTRAINT contest_result_calculator_lu_pk PRIMARY KEY (contest_result_calculator_id);

ALTER TABLE tcs_catalog.scorecard_section ADD CONSTRAINT pk_scorecard_section PRIMARY KEY (scorecard_section_id);

ALTER TABLE tcs_catalog.member_ban ADD CONSTRAINT pk_member_ban_ban_id PRIMARY KEY (ban_id);

ALTER TABLE tcs_catalog.message ADD CONSTRAINT pk_message_message_id PRIMARY KEY (message_id);

ALTER TABLE tcs_catalog.message_to_handle ADD CONSTRAINT pk_message_to_handle PRIMARY KEY (message_id, to_handle);

ALTER TABLE tcs_catalog.status_assignment ADD CONSTRAINT pk_status_assignment_status_assignment_id PRIMARY KEY (status_assignment_id);

ALTER TABLE tcs_catalog.offer ADD CONSTRAINT pk_offer_offer_id PRIMARY KEY (offer_id);

ALTER TABLE tcs_catalog.team_header ADD CONSTRAINT pk_team_header_team_id PRIMARY KEY (team_id);

ALTER TABLE tcs_catalog.team_properties ADD CONSTRAINT pk_team_properties PRIMARY KEY (team_id, key);

ALTER TABLE tcs_catalog.team_position ADD CONSTRAINT pk_team_position PRIMARY KEY (position_id);

ALTER TABLE tcs_catalog.team_position_properties ADD CONSTRAINT pk_team_position_properties PRIMARY KEY (position_id, key);

ALTER TABLE tcs_catalog.team_manager_audit ADD CONSTRAINT pk_team_manager_audit PRIMARY KEY (team_manager_audit_id);

ALTER TABLE tcs_catalog.team_manager_audit_details ADD CONSTRAINT pk_team_manager_audit_details PRIMARY KEY (team_manager_audit_id, name);

ALTER TABLE tcs_catalog.team_manager_audit_custom_details ADD CONSTRAINT pk_team_manager_audit_custom_details PRIMARY KEY (team_manager_audit_id, name);

ALTER TABLE tcs_catalog.facade_audit ADD CONSTRAINT pk_facade_audit PRIMARY KEY (create_date, create_user);

CREATE INDEX IF NOT EXISTS comp_catalog_root_cat_id_idx ON tcs_catalog.comp_catalog
    (
    root_category_id
    );

ALTER TABLE tcs_catalog.comp_catalog ADD CONSTRAINT pk_comp_catalog PRIMARY KEY (component_id);

ALTER TABLE tcs_catalog.framework ADD CONSTRAINT pk_framework1 PRIMARY KEY (framework_id);

ALTER TABLE tcs_catalog.widget ADD CONSTRAINT pk_widget1 PRIMARY KEY (widget_id);

ALTER TABLE tcs_catalog.widget_version ADD CONSTRAINT pk_widgetversio310 PRIMARY KEY (widget_version_id);

alter table tcs_catalog.widget_version add constraint u376_1513 unique 
    (widget_id, version_major, version_minor, version_increment, version_build) ;

ALTER TABLE tcs_catalog.dr_points ADD CONSTRAINT pk_dr_points PRIMARY KEY (dr_points_id);

ALTER TABLE tcs_catalog.dr_points_operation_lu ADD CONSTRAINT pk_dr_points_operation_lu PRIMARY KEY (dr_points_operation_id);

ALTER TABLE tcs_catalog.dr_points_reference_type_lu ADD CONSTRAINT pk_dr_points_reference_type_lu PRIMARY KEY (dr_points_reference_type_id);

ALTER TABLE tcs_catalog.dr_points_type_lu ADD CONSTRAINT pk_dr_points_type_lu PRIMARY KEY (dr_points_type_id);

ALTER TABLE tcs_catalog.dr_points_status_lu ADD CONSTRAINT pk_dr_points_status_lu PRIMARY KEY (dr_points_status_id);

ALTER TABLE tcs_catalog.points_calculator_lu ADD CONSTRAINT pk_points_calculator_lu PRIMARY KEY (points_calculator_id);

ALTER TABLE tcs_catalog.track ADD CONSTRAINT pk_track PRIMARY KEY (track_id);

ALTER TABLE tcs_catalog.track_contest ADD CONSTRAINT pk_track_contest PRIMARY KEY (track_contest_id);

ALTER TABLE tcs_catalog.track_contest_result_calculator_lu ADD CONSTRAINT pk_track_contest_result_calculator_lu PRIMARY KEY (track_contest_result_calculator_id);

ALTER TABLE tcs_catalog.track_contest_type_lu ADD CONSTRAINT pk_track_contest_type_lu PRIMARY KEY (track_contest_type_id);

ALTER TABLE tcs_catalog.track_project_category_xref ADD CONSTRAINT pk_track_project_category_xref PRIMARY KEY (track_id, project_category_id);

ALTER TABLE tcs_catalog.track_type_lu ADD CONSTRAINT pk_track_type_lu PRIMARY KEY (track_type_id);

ALTER TABLE tcs_catalog.track_status_lu ADD CONSTRAINT pk_track_status_lu PRIMARY KEY (track_status_id);

ALTER TABLE tcs_catalog.categories ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);

ALTER TABLE tcs_catalog.comp_client ADD CONSTRAINT comp_client_pk PRIMARY KEY (component_id, client_id);

ALTER TABLE tcs_catalog.comp_user ADD CONSTRAINT comp_user_pk PRIMARY KEY (component_id, user_id);

ALTER TABLE tcs_catalog.third_party_library ADD CONSTRAINT third_party_library_pk PRIMARY KEY (third_party_library_id);

ALTER TABLE tcs_catalog.client_billing_config_type_lu ADD CONSTRAINT pk_client_billing_config_type_lu PRIMARY KEY (client_billing_config_type_id ) ; 
 
ALTER TABLE tcs_catalog.client_billing_config ADD CONSTRAINT pk_client_billing_config PRIMARY KEY (client_billing_id, client_billing_config_type_id) ; 


ALTER TABLE tcs_catalog.copilot_profile ADD CONSTRAINT pk_copilot_profile PRIMARY KEY (copilot_profile_id);

ALTER TABLE tcs_catalog.copilot_profile_status ADD CONSTRAINT pk_copilot_profile_status PRIMARY KEY (copilot_profile_status_id);
  
ALTER TABLE tcs_catalog.copilot_profile_info ADD CONSTRAINT pk_copilot_profile_info PRIMARY KEY (copilot_profile_info_id);
  
ALTER TABLE tcs_catalog.copilot_profile_info_type ADD CONSTRAINT pk_copilot_profile_info_type PRIMARY KEY (copilot_profile_info_type_id);

ALTER TABLE tcs_catalog.late_deliverable_type_lu ADD CONSTRAINT pk_late_deliverable_type_lu PRIMARY KEY (late_deliverable_type_id);

ALTER TABLE tcs_catalog.late_deliverable ADD CONSTRAINT pk_late_deliverable PRIMARY KEY (late_deliverable_id);

ALTER TABLE tcs_catalog.review_feedback ADD CONSTRAINT pk_review_feedback PRIMARY KEY (review_feedback_id);

ALTER TABLE tcs_catalog.review_feedback_detail ADD CONSTRAINT pk_review_feedback_detail PRIMARY KEY (review_feedback_id, reviewer_user_id);

ALTER TABLE tcs_catalog.project_reliability ADD CONSTRAINT pk_project_reliability PRIMARY KEY (project_id, user_id);
    
ALTER TABLE tcs_catalog.file_type_lu ADD CONSTRAINT pk_file_type_lu PRIMARY KEY (file_type_id);

ALTER TABLE tcs_catalog.prize ADD CONSTRAINT pk_prize PRIMARY KEY (prize_id);

ALTER TABLE tcs_catalog.project_studio_specification ADD CONSTRAINT pk_project_studio_spec PRIMARY KEY (project_studio_spec_id);

ALTER TABLE tcs_catalog.project_mm_specification ADD CONSTRAINT pk_project_mm_spec PRIMARY KEY (project_mm_spec_id);
    
ALTER TABLE tcs_catalog.project_file_type_xref ADD CONSTRAINT pk_project_file_type_xref PRIMARY KEY (project_id, file_type_id);

ALTER TABLE tcs_catalog.mime_type_lu ADD CONSTRAINT pk_mime_type_lu PRIMARY KEY (mime_type_id);    


ALTER TABLE tcs_catalog.project_copilot_type_lu ADD CONSTRAINT project_copilot_type_lu_pk PRIMARY KEY (project_copilot_type_id);

ALTER TABLE tcs_catalog.project_copilot_type ADD CONSTRAINT project_copilot_type_pk PRIMARY KEY (project_id, project_copilot_type_id);

ALTER TABLE tcs_catalog.copilot_contest_extra_info_type ADD CONSTRAINT pk_copilot_contest_extra_info_type PRIMARY KEY (copilot_contest_extra_info_type_id);

ALTER TABLE tcs_catalog.copilot_contest_extra_info ADD CONSTRAINT pk_copilot_contest_extra_info PRIMARY KEY (copilot_posting_contest_id, copilot_contest_extra_info_type_id);
	  
ALTER TABLE tcs_catalog.project_milestone ADD CONSTRAINT project_milestone_pk PRIMARY KEY (project_milestone_id);

ALTER TABLE tcs_catalog.project_milestone_owner ADD CONSTRAINT project_milestone_owner_pk PRIMARY KEY (project_milestone_owner_id);

ALTER TABLE tcs_catalog.comp_milestone_feedback ADD CONSTRAINT pk_comp_milestone_feedback_id PRIMARY KEY (comp_milestone_feedback_id);
      
ALTER TABLE tcs_catalog.customer_group
	ADD CONSTRAINT pk_security_group PRIMARY KEY (group_id);

ALTER TABLE tcs_catalog.group_associated_billing_accounts
	ADD CONSTRAINT pk_group_associated_billing_accounts PRIMARY KEY(group_id, billing_account_id);


ALTER TABLE tcs_catalog.group_associated_direct_projects
	ADD CONSTRAINT pk_group_associated_direct_projects PRIMARY KEY(group_direct_project_id);

ALTER TABLE tcs_catalog.customer_administrator
	ADD CONSTRAINT pk_customer_administrator PRIMARY KEY(customer_administrator_id);

ALTER TABLE tcs_catalog.group_member ADD CONSTRAINT pk_group_member PRIMARY KEY(group_member_id);

ALTER TABLE tcs_catalog.group_invitation ADD CONSTRAINT pk_group_invitation PRIMARY KEY(group_invitation_id);

ALTER TABLE tcs_catalog.group_audit_record ADD CONSTRAINT pk_group_audit_record PRIMARY KEY(id);


ALTER TABLE tcs_catalog.review_auction_category_lu ADD CONSTRAINT review_auction_category_lu_pk PRIMARY KEY (review_auction_category_id);

ALTER TABLE tcs_catalog.review_auction_type_lu ADD CONSTRAINT review_auction_type_lu_pk PRIMARY KEY (review_auction_type_id);

ALTER TABLE tcs_catalog.review_application_role_lu ADD CONSTRAINT review_application_role_lu_pk PRIMARY KEY (review_application_role_id);

ALTER TABLE tcs_catalog.review_application_role_resource_role_xref ADD CONSTRAINT review_application_role_resource_role_xref_pk PRIMARY KEY (review_application_role_id, resource_role_id);

ALTER TABLE tcs_catalog.review_application_status_lu ADD CONSTRAINT review_application_status_lu_pk PRIMARY KEY (review_application_status_id);

ALTER TABLE tcs_catalog.review_auction ADD CONSTRAINT review_auction_pk PRIMARY KEY (review_auction_id);

ALTER TABLE tcs_catalog.review_application ADD CONSTRAINT review_application_pk PRIMARY KEY (review_application_id);      

ALTER TABLE tcs_catalog.project_payment_type_lu ADD CONSTRAINT project_payment_type_lu_pk PRIMARY KEY (project_payment_type_id);

ALTER TABLE tcs_catalog.project_payment ADD CONSTRAINT project_payment_pk PRIMARY KEY (project_payment_id);

ALTER TABLE tcs_catalog.project_payment_adjustment ADD CONSTRAINT project_payment_adjustment_pk PRIMARY KEY (project_id, resource_role_id);

ALTER TABLE tcs_catalog.default_project_payment ADD CONSTRAINT default_project_payment_pk PRIMARY KEY (project_category_id, resource_role_id);

ALTER TABLE tcs_catalog.reviewer_rating ADD CONSTRAINT reviewer_rating_pk PRIMARY KEY (project_id, user_id);

ALTER TABLE tcs_catalog.collaborating_members ADD CONSTRAINT pk_collaborating_members PRIMARY KEY (collaborating_group_id, user_id);
	
ALTER TABLE direct_project_task_list ADD CONSTRAINT pk_direct_project_task_list PRIMARY KEY (direct_project_task_list_id);
	
	
	

ALTER TABLE direct_project_task_list_permitted_user ADD CONSTRAINT pk_direct_project_task_list_permitted_user PRIMARY KEY (direct_project_task_list_id, user_id);

	

ALTER TABLE direct_project_task_status ADD CONSTRAINT pk_direct_project_task_status_id PRIMARY KEY (direct_project_task_status_id);



ALTER TABLE direct_project_task_priority ADD CONSTRAINT pk_direct_project_task_priority PRIMARY KEY (direct_project_task_priority_id);


ALTER TABLE direct_project_task ADD CONSTRAINT pk_direct_project_task PRIMARY KEY (direct_project_task_id);

ALTER TABLE direct_project_task_attachment ADD CONSTRAINT pk_direct_project_task_attachment PRIMARY KEY (direct_project_task_attachment_id);

ALTER TABLE direct_project_task_contest_xref ADD CONSTRAINT pk_direct_project_task_contest_xref PRIMARY KEY (direct_project_task_id, project_id);



ALTER TABLE direct_project_task_assignee ADD CONSTRAINT pk_direct_project_task_assignee PRIMARY KEY (direct_project_task_id, user_id);




ALTER TABLE direct_project_task_milestone_xref ADD CONSTRAINT pk_direct_project_task_milestone_xref PRIMARY KEY (direct_project_task_id, project_milestone_id);




ALTER TABLE direct_project_task_list_contest_xref ADD CONSTRAINT pk_direct_project_task_list_contest_xref PRIMARY KEY (direct_project_task_list_id, project_id);


ALTER TABLE direct_project_task_list_milestone_xref ADD CONSTRAINT pk_direct_project_task_list_milestone_xref PRIMARY KEY (direct_project_task_list_id, project_milestone_id);

ALTER TABLE tcs_catalog.contest_milestone_xref ADD CONSTRAINT pk_contest_milestone_xref PRIMARY KEY (contest_id, project_milestone_id);
	
ALTER TABLE tcs_catalog.project_sub_category_lu ADD CONSTRAINT project_sub_category_pk PRIMARY KEY (project_sub_category_id);

ALTER TABLE tcs_catalog.platform_lu ADD CONSTRAINT platform_lu_pk PRIMARY KEY (platform_id);

ALTER TABLE tcs_catalog.user_recent_item_type ADD CONSTRAINT user_recent_item_type_pk PRIMARY KEY (recent_item_type_id);

ALTER TABLE tcs_catalog.user_recent_item ADD CONSTRAINT user_recent_item_pk PRIMARY KEY (user_recent_item_id);

ALTER TABLE tcs_catalog.user_recent_item
   ADD CONSTRAINT u_user_recent_item UNIQUE (user_id, item_id, recent_item_type_id);
   
ALTER TABLE tcs_catalog.project_platform_lu ADD CONSTRAINT pk_project_platform_lu PRIMARY KEY (project_platform_id);

ALTER TABLE tcs_catalog.project_platform ADD CONSTRAINT pk_project_platform PRIMARY KEY (project_id, project_platform_id);


ALTER TABLE tcs_catalog.comp_categories  ADD CONSTRAINT fk_comp_ctgy1 FOREIGN KEY (category_id) references tcs_catalog.categories (category_id);

ALTER TABLE tcs_catalog.comp_categories  ADD CONSTRAINT fk_comp_ctgy2 FOREIGN KEY (component_id) references tcs_catalog.comp_catalog (component_id);

ALTER TABLE tcs_catalog.comp_dependencies  ADD CONSTRAINT fk_comp_depend1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_dependencies  ADD CONSTRAINT fk_comp_depend2 FOREIGN KEY (child_comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_documentation  ADD CONSTRAINT fk_comp_doc1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_documentation  ADD CONSTRAINT fk_comp_doc_ref2 FOREIGN KEY (document_type_id) references tcs_catalog.doc_types (document_type_id);

ALTER TABLE tcs_catalog.comp_download  ADD CONSTRAINT comp_download_fk1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_examples  ADD CONSTRAINT fk_comp_example FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_keywords  ADD CONSTRAINT fk_comp_keyword FOREIGN KEY (component_id) references tcs_catalog.comp_catalog (component_id);

ALTER TABLE tcs_catalog.comp_reviews  ADD CONSTRAINT fk_com_review1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_technology  ADD CONSTRAINT fk_comp_tech1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.comp_technology  ADD CONSTRAINT fk_comp_tech2 FOREIGN KEY (technology_type_id) references tcs_catalog.technology_types (technology_type_id);

ALTER TABLE tcs_catalog.contact_type  ADD CONSTRAINT fk_contact_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.doc_types  ADD CONSTRAINT fk_doc_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.download_tracking  ADD CONSTRAINT download_track_fk1 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.download_tracking  ADD CONSTRAINT download_track_fk3 FOREIGN KEY (license_level_id) references tcs_catalog.license_level (license_level_id);

ALTER TABLE tcs_catalog.download_tracking  ADD CONSTRAINT download_track_fk4 FOREIGN KEY (download_id) references tcs_catalog.comp_download (download_id);

ALTER TABLE tcs_catalog.license_level  ADD CONSTRAINT license_level_fk1 FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.roles  ADD CONSTRAINT fk_role_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.technology_types  ADD CONSTRAINT fk_tech_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.user_contact  ADD CONSTRAINT fk_user_cont_info2 FOREIGN KEY (contact_type_id) references tcs_catalog.contact_type (contact_type_id);

ALTER TABLE tcs_catalog.user_technologies  ADD CONSTRAINT fk_user_tech1 FOREIGN KEY (technology_type_id) references tcs_catalog.technology_types (technology_type_id);

ALTER TABLE tcs_catalog.command  ADD CONSTRAINT command_command_group_fk FOREIGN KEY (command_group_id) references tcs_catalog.command_group_lu (command_group_id);

ALTER TABLE tcs_catalog.contest  ADD CONSTRAINT contest_contest_result_calculator_id_fk FOREIGN KEY (contest_result_calculator_id) references tcs_catalog.contest_result_calculator_lu (contest_result_calculator_id);

ALTER TABLE tcs_catalog.contest  ADD CONSTRAINT contest_contesttypelu_fk FOREIGN KEY (contest_type_id) references tcs_catalog.contest_type_lu (contest_type_id);

ALTER TABLE tcs_catalog.contest_project_xref  ADD CONSTRAINT contestprojectxref_contest_fk FOREIGN KEY (contest_id) references tcs_catalog.contest (contest_id);

ALTER TABLE tcs_catalog.user_reliability  ADD CONSTRAINT userreliability_phase_fk FOREIGN KEY (phase_id) references tcs_catalog.phase (phase_id);

ALTER TABLE tcs_catalog.notification_event  ADD CONSTRAINT notificationevent_notificationmailtype_fk FOREIGN KEY (notification_mail_type_id) references tcs_catalog.notification_mail_type_lu (notification_mail_type_id);

ALTER TABLE tcs_catalog.user_notification_event_xref  ADD CONSTRAINT usernotificationevent_notificationevent_fk FOREIGN KEY (notification_event_id) references tcs_catalog.notification_event (notification_event_id);

ALTER TABLE tcs_catalog.comp_reg_answer  ADD CONSTRAINT compreganswer_compregquestion_fk FOREIGN KEY (comp_reg_question_id) references tcs_catalog.comp_reg_question (comp_reg_question_id);

ALTER TABLE tcs_catalog.question_style  ADD CONSTRAINT questionstyle_status_fk FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.comp_reg_question  ADD CONSTRAINT compregquestion_questionstyle_fk FOREIGN KEY (question_style_id) references tcs_catalog.question_style (question_style_id);

ALTER TABLE tcs_catalog.rboard_user  ADD CONSTRAINT rboard_user_status_fk FOREIGN KEY (status_id) references tcs_catalog.rboard_status_lu (status_id);

ALTER TABLE tcs_catalog.rboard_user  ADD CONSTRAINT rboard_user_catalog_fk FOREIGN KEY (catalog_id) references tcs_catalog.catalog (catalog_id);

ALTER TABLE tcs_catalog.category_catalog  ADD CONSTRAINT category_catalog_catalog_fk FOREIGN KEY (catalog_id) references tcs_catalog.catalog (catalog_id);

ALTER TABLE tcs_catalog.category_catalog  ADD CONSTRAINT category_catalog_category_fk FOREIGN KEY (category_id) references tcs_catalog.categories (category_id);

ALTER TABLE tcs_catalog.specification  ADD CONSTRAINT fk_specification_type FOREIGN KEY (specification_type_id) references tcs_catalog.specification_type (specification_type_id);

ALTER TABLE tcs_catalog.command_execution  ADD CONSTRAINT commandexecution_command_fk FOREIGN KEY (command_id) references tcs_catalog.command (command_id);

ALTER TABLE tcs_catalog.project_category_lu  ADD CONSTRAINT fk_projectcategorylu_projecttypelu_projecttypeid FOREIGN KEY (project_type_id) references tcs_catalog.project_type_lu (project_type_id);

ALTER TABLE tcs_catalog.scorecard  ADD CONSTRAINT fk_scorecard_scorecardtypelu_scorecardtypeid FOREIGN KEY (scorecard_type_id) references tcs_catalog.scorecard_type_lu (scorecard_type_id);

ALTER TABLE tcs_catalog.scorecard  ADD CONSTRAINT fk_scorecard_projectcategorylu_projectcategoryid FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);

ALTER TABLE tcs_catalog.scorecard  ADD CONSTRAINT fk_scorecard_scorecardstatuslu_scorecardstatusid FOREIGN KEY (scorecard_status_id) references tcs_catalog.scorecard_status_lu (scorecard_status_id);

ALTER TABLE tcs_catalog.scorecard_group  ADD CONSTRAINT fk_scorecardgroup_scorecard_scorecardid FOREIGN KEY (scorecard_id) references tcs_catalog.scorecard (scorecard_id);

ALTER TABLE tcs_catalog.scorecard_question  ADD CONSTRAINT fk_scorecardquestion_scorecardsection_scorecardsectionid FOREIGN KEY (scorecard_section_id) references tcs_catalog.scorecard_section (scorecard_section_id);

ALTER TABLE tcs_catalog.scorecard_question  ADD CONSTRAINT fk_scorecardquestion_scorecardquestiontypelu_scorecardquestiontypeid FOREIGN KEY (scorecard_question_type_id) references tcs_catalog.scorecard_question_type_lu (scorecard_question_type_id);

ALTER TABLE tcs_catalog.project  ADD CONSTRAINT fk_project_projectcategorylu_projectcategoryid FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);

ALTER TABLE tcs_catalog.project  ADD CONSTRAINT fk_project_projectstatuslu_projectstatusid FOREIGN KEY (project_status_id) references tcs_catalog.project_status_lu (project_status_id);

ALTER TABLE tcs_catalog.project_phase  ADD CONSTRAINT fk_projectphase_phasetypelu_phasetypeid FOREIGN KEY (phase_type_id) references tcs_catalog.phase_type_lu (phase_type_id);

ALTER TABLE tcs_catalog.project_phase  ADD CONSTRAINT fk_projectphase_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_phase  ADD CONSTRAINT fk_projectphase_phasestatuslu_phasestatusid FOREIGN KEY (phase_status_id) references tcs_catalog.phase_status_lu (phase_status_id);

ALTER TABLE tcs_catalog.phase_dependency  ADD CONSTRAINT fk_phasedependency_projectphase_dependencyphaseid FOREIGN KEY (dependency_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.phase_dependency  ADD CONSTRAINT fk_phasedependency_projectphase_dependentphaseid FOREIGN KEY (dependent_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.phase_criteria  ADD CONSTRAINT fk_phasecriteria_projectphase_projectphaseid FOREIGN KEY (project_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.phase_criteria  ADD CONSTRAINT fk_phasecriteria_phasecriteriatypelu_phasecriteriatypeid FOREIGN KEY (phase_criteria_type_id) references tcs_catalog.phase_criteria_type_lu (phase_criteria_type_id);

ALTER TABLE tcs_catalog.resource_role_lu  ADD CONSTRAINT fk_resourcerolelu_phasetypelu_phasetypeid FOREIGN KEY (phase_type_id) references tcs_catalog.phase_type_lu (phase_type_id);

ALTER TABLE tcs_catalog.resource  ADD CONSTRAINT fk_resource_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.resource  ADD CONSTRAINT fk_resource_resourcerolelu_resourceroleid FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.resource  ADD CONSTRAINT fk_resource_projectphase_projectphaseid FOREIGN KEY (project_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.review_resp  ADD CONSTRAINT fk_reviewresp_resourcerolelu_resourceroleid FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.upload  ADD CONSTRAINT fk_upload_uploadtypelu_uploadtypeid FOREIGN KEY (upload_type_id) references tcs_catalog.upload_type_lu (upload_type_id);

ALTER TABLE tcs_catalog.upload  ADD CONSTRAINT fk_upload_uploadstatuslu_uploadstatusid FOREIGN KEY (upload_status_id) references tcs_catalog.upload_status_lu (upload_status_id);

ALTER TABLE tcs_catalog.upload  ADD CONSTRAINT fk_upload_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.upload  ADD CONSTRAINT fk_upload_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.upload  ADD CONSTRAINT fk_upload_projectphase_projectphaseid FOREIGN KEY (project_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.submission  ADD CONSTRAINT fk_submission_submissionstatuslu_submissionstatusid FOREIGN KEY (submission_status_id) references tcs_catalog.submission_status_lu (submission_status_id);

ALTER TABLE tcs_catalog.submission  ADD CONSTRAINT fk_submission_submissiontypelu_submissiontypeid FOREIGN KEY (submission_type_id) references tcs_catalog.submission_type_lu (submission_type_id);

ALTER TABLE tcs_catalog.submission  ADD CONSTRAINT fk_submission_upload_uploadid FOREIGN KEY (upload_id) references tcs_catalog.upload (upload_id);

ALTER TABLE tcs_catalog.resource_submission  ADD CONSTRAINT fk_resourcesubmission_submission_submissionid FOREIGN KEY (submission_id) references tcs_catalog.submission (submission_id);

ALTER TABLE tcs_catalog.resource_submission  ADD CONSTRAINT fk_resourcesubmission_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.review  ADD CONSTRAINT fk_review_scorecard_scorecardid FOREIGN KEY (scorecard_id) references tcs_catalog.scorecard (scorecard_id);

ALTER TABLE tcs_catalog.review  ADD CONSTRAINT fk_review_submission_submissionid FOREIGN KEY (submission_id) references tcs_catalog.submission (submission_id);

ALTER TABLE tcs_catalog.review  ADD CONSTRAINT fk_review_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.review  ADD CONSTRAINT fk_review_projectphase_projectphaseid FOREIGN KEY (project_phase_id) references tcs_catalog.project_phase (project_phase_id);

ALTER TABLE tcs_catalog.review_item  ADD CONSTRAINT fk_reviewitem_review_reviewid FOREIGN KEY (review_id) references tcs_catalog.review (review_id);

ALTER TABLE tcs_catalog.review_item  ADD CONSTRAINT fk_reviewitem_scorecardquestion_scorecardquestionid FOREIGN KEY (scorecard_question_id) references tcs_catalog.scorecard_question (scorecard_question_id);

ALTER TABLE tcs_catalog.review_item  ADD CONSTRAINT fk_reviewitem_upload_uploadid FOREIGN KEY (upload_id) references tcs_catalog.upload (upload_id);

ALTER TABLE tcs_catalog.review_comment  ADD CONSTRAINT fk_reviewcomment_review_reviewid FOREIGN KEY (review_id) references tcs_catalog.review (review_id);

ALTER TABLE tcs_catalog.review_comment  ADD CONSTRAINT fk_reviewcomment_commenttypelu_commenttypeid FOREIGN KEY (comment_type_id) references tcs_catalog.comment_type_lu (comment_type_id);

ALTER TABLE tcs_catalog.review_comment  ADD CONSTRAINT fk_reviewcomment_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.review_item_comment  ADD CONSTRAINT fk_reviewitemcomment_reviewitem_reviewitemid FOREIGN KEY (review_item_id) references tcs_catalog.review_item (review_item_id);

ALTER TABLE tcs_catalog.review_item_comment  ADD CONSTRAINT fk_reviewitemcomment_commenttypelu_commenttypeid FOREIGN KEY (comment_type_id) references tcs_catalog.comment_type_lu (comment_type_id);

ALTER TABLE tcs_catalog.review_item_comment  ADD CONSTRAINT fk_reviewitemcomment_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.deliverable_lu  ADD CONSTRAINT fk_deliverablelu_phasetypelu_phasetypeid FOREIGN KEY (phase_type_id) references tcs_catalog.phase_type_lu (phase_type_id);

ALTER TABLE tcs_catalog.deliverable_lu  ADD CONSTRAINT fk_deliverablelu_resourcerolelu_resourceroleid FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.deliverable_lu  ADD CONSTRAINT fk_deliverablelu_submissiontypelu_submissiontypeid FOREIGN KEY (submission_type_id) references tcs_catalog.submission_type_lu (submission_type_id);

ALTER TABLE tcs_catalog.project_audit  ADD CONSTRAINT fk_projectaudit_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.notification  ADD CONSTRAINT fk_notification_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.notification  ADD CONSTRAINT fk_notification_notificationtypelu_notificationtypeid FOREIGN KEY (notification_type_id) references tcs_catalog.notification_type_lu (notification_type_id);

ALTER TABLE tcs_catalog.screening_task  ADD CONSTRAINT fk_screeningtask_upload_uploadid FOREIGN KEY (upload_id) references tcs_catalog.upload (upload_id);

ALTER TABLE tcs_catalog.screening_task  ADD CONSTRAINT fk_screeningtask_screeningstatuslu_screeningstatusid FOREIGN KEY (screening_status_id) references tcs_catalog.screening_status_lu (screening_status_id);

ALTER TABLE tcs_catalog.screening_response_lu  ADD CONSTRAINT fk_screeningresponselu_responseseveritylu_responseseverityid FOREIGN KEY (response_severity_id) references tcs_catalog.response_severity_lu (response_severity_id);

ALTER TABLE tcs_catalog.screening_result  ADD CONSTRAINT fk_screeningresult_screeningtask_screeningtaskid FOREIGN KEY (screening_task_id) references tcs_catalog.screening_task (screening_task_id);

ALTER TABLE tcs_catalog.screening_result  ADD CONSTRAINT fk_screeningresult_screeingresponselu_screeningresponseid FOREIGN KEY (screening_response_id) references tcs_catalog.screening_response_lu (screening_response_id);

ALTER TABLE tcs_catalog.default_scorecard  ADD CONSTRAINT fk_defaultscorecard_projectcategorylu_projectcategoryid FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);

ALTER TABLE tcs_catalog.default_scorecard  ADD CONSTRAINT fk_defaultscorecard_scorecardtypelu_scorecardtypeid FOREIGN KEY (scorecard_type_id) references tcs_catalog.scorecard_type_lu (scorecard_type_id);

ALTER TABLE tcs_catalog.default_scorecard  ADD CONSTRAINT fk_defaultscorecard_scorecard_scorecardid FOREIGN KEY (scorecard_id) references tcs_catalog.scorecard (scorecard_id);

ALTER TABLE tcs_catalog.user_role  ADD CONSTRAINT fk_user_role2 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.user_role  ADD CONSTRAINT fk_user_role3 FOREIGN KEY (role_id) references tcs_catalog.roles (role_id);

ALTER TABLE tcs_catalog.resource_info  ADD CONSTRAINT fk_resourceinfo_resourceinfotypelu_resourceinfotypeid FOREIGN KEY (resource_info_type_id) references tcs_catalog.resource_info_type_lu (resource_info_type_id);

ALTER TABLE tcs_catalog.resource_info  ADD CONSTRAINT fk_resourceinfo_resource_resourceid FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.project_info  ADD CONSTRAINT fk_projectinfo_projectinfotypelu_projectinfotypeid FOREIGN KEY (project_info_type_id) references tcs_catalog.project_info_type_lu (project_info_type_id);

ALTER TABLE tcs_catalog.project_info  ADD CONSTRAINT fk_projectinfo_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.comp_versions  ADD CONSTRAINT fk_comp_versions FOREIGN KEY (component_id) references tcs_catalog.comp_catalog (component_id);

ALTER TABLE tcs_catalog.comp_versions  ADD CONSTRAINT fk_comp_phase FOREIGN KEY (phase_id) references tcs_catalog.phase (phase_id);

ALTER TABLE tcs_catalog.comp_jive_category_xref  ADD CONSTRAINT fk_comp_jive_ca109 FOREIGN KEY (comp_vers_id) references tcs_catalog.comp_versions (comp_vers_id);

ALTER TABLE tcs_catalog.season  ADD CONSTRAINT next_rookie_season_id_fk FOREIGN KEY (next_rookie_season_id) references tcs_catalog.season (season_id);

ALTER TABLE tcs_catalog.stage  ADD CONSTRAINT stage_season_id_fk FOREIGN KEY (season_id) references tcs_catalog.season (season_id);

ALTER TABLE tcs_catalog.contest_stage_xref  ADD CONSTRAINT contest_stage_stage_id_fk FOREIGN KEY (stage_id) references tcs_catalog.stage (stage_id);

ALTER TABLE tcs_catalog.contest_stage_xref  ADD CONSTRAINT contest_stage_contest_id_fk FOREIGN KEY (contest_id) references tcs_catalog.contest (contest_id);

ALTER TABLE tcs_catalog.contest_season_xref  ADD CONSTRAINT contest_season_season_id_fk FOREIGN KEY (season_id) references tcs_catalog.season (season_id);

ALTER TABLE tcs_catalog.contest_season_xref  ADD CONSTRAINT contest_season_contest_id_fk FOREIGN KEY (contest_id) references tcs_catalog.contest (contest_id);

ALTER TABLE tcs_catalog.scorecard_section  ADD CONSTRAINT fk_scorecardsection_scorecardgroup_scorecardgroupid FOREIGN KEY (scorecard_group_id) references tcs_catalog.scorecard_group (scorecard_group_id);

ALTER TABLE tcs_catalog.message_to_handle  ADD CONSTRAINT fk_message_to_handle_message_id FOREIGN KEY (message_id) references tcs_catalog.message (message_id);

ALTER TABLE tcs_catalog.offer  ADD CONSTRAINT fk_offer_team_status_assignment_id FOREIGN KEY (current_status_assignment_id) references tcs_catalog.status_assignment (status_assignment_id);

ALTER TABLE tcs_catalog.team_header  ADD CONSTRAINT fk_team_header_project_id FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.team_header  ADD CONSTRAINT fk_team_header_captain_resource_id FOREIGN KEY (captain_resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.team_properties  ADD CONSTRAINT fk_team_properties_team_id FOREIGN KEY (team_id) references tcs_catalog.team_header (team_id);

ALTER TABLE tcs_catalog.team_position  ADD CONSTRAINT fk_team_position_team_id FOREIGN KEY (team_id) references tcs_catalog.team_header (team_id);

ALTER TABLE tcs_catalog.team_position  ADD CONSTRAINT fk_team_position_resource_id FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.team_position_properties  ADD CONSTRAINT fk_team_position_properties_team_position_id FOREIGN KEY (position_id) references tcs_catalog.team_position (position_id);

ALTER TABLE tcs_catalog.team_manager_audit_details  ADD CONSTRAINT fk_team_manager_audit_details_team_manager_audit_id FOREIGN KEY (team_manager_audit_id) references tcs_catalog.team_manager_audit (team_manager_audit_id);

ALTER TABLE tcs_catalog.team_manager_audit_custom_details  ADD CONSTRAINT fk_team_manager_audit_custom_details_team_manager_audit_id FOREIGN KEY (team_manager_audit_id) references tcs_catalog.team_manager_audit (team_manager_audit_id);

ALTER TABLE tcs_catalog.comp_catalog  ADD CONSTRAINT fk_comp_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.widget  ADD CONSTRAINT fk_widget_framework FOREIGN KEY (framework_id) references tcs_catalog.framework (framework_id);

ALTER TABLE tcs_catalog.widget_version  ADD CONSTRAINT fk_widgetversion_widget FOREIGN KEY (widget_id) references tcs_catalog.widget (widget_id);

ALTER TABLE tcs_catalog.dr_points  ADD CONSTRAINT dr_points_fkindex1 FOREIGN KEY (track_id) references tcs_catalog.track (track_id);

ALTER TABLE tcs_catalog.dr_points  ADD CONSTRAINT dr_points_fkindex2 FOREIGN KEY (dr_points_type_id) references tcs_catalog.dr_points_type_lu (dr_points_type_id);

ALTER TABLE tcs_catalog.dr_points  ADD CONSTRAINT dr_points_fkindex3 FOREIGN KEY (dr_points_operation_id) references tcs_catalog.dr_points_operation_lu (dr_points_operation_id);

ALTER TABLE tcs_catalog.dr_points  ADD CONSTRAINT dr_points_fkindex4 FOREIGN KEY (dr_points_reference_type_id) references tcs_catalog.dr_points_reference_type_lu (dr_points_reference_type_id);

ALTER TABLE tcs_catalog.dr_points  ADD CONSTRAINT dr_points_fkindex5 FOREIGN KEY (dr_points_status_id) references tcs_catalog.dr_points_status_lu (dr_points_status_id);

ALTER TABLE tcs_catalog.track  ADD CONSTRAINT track_fkindex1 FOREIGN KEY (points_calculator_id) references tcs_catalog.points_calculator_lu (points_calculator_id);

ALTER TABLE tcs_catalog.track  ADD CONSTRAINT track_fkindex2 FOREIGN KEY (track_type_id) references tcs_catalog.track_type_lu (track_type_id);

ALTER TABLE tcs_catalog.track  ADD CONSTRAINT track_fkindex3 FOREIGN KEY (track_status_id) references tcs_catalog.track_status_lu (track_status_id);

ALTER TABLE tcs_catalog.track_contest  ADD CONSTRAINT track_contest_fkindex1 FOREIGN KEY (track_id) references tcs_catalog.track (track_id);

ALTER TABLE tcs_catalog.track_contest  ADD CONSTRAINT track_contest_fkindex2 FOREIGN KEY (track_contest_type_id) references tcs_catalog.track_contest_type_lu (track_contest_type_id);

ALTER TABLE tcs_catalog.track_contest  ADD CONSTRAINT track_contest_fkindex3 FOREIGN KEY (track_contest_result_calculator_id) references tcs_catalog.track_contest_result_calculator_lu (track_contest_result_calculator_id);

ALTER TABLE tcs_catalog.track_project_category_xref  ADD CONSTRAINT track_project_category_xref_fkindex1 FOREIGN KEY (track_id) references tcs_catalog.track (track_id);

ALTER TABLE tcs_catalog.track_project_category_xref  ADD CONSTRAINT track_project_category_xref_fkindex2 FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);

ALTER TABLE tcs_catalog.categories  ADD CONSTRAINT fk_ctgy_status FOREIGN KEY (status_id) references tcs_catalog.status (status_id);

ALTER TABLE tcs_catalog.link_type_lu ADD CONSTRAINT pk_link_type_lu PRIMARY KEY (link_type_id);

ALTER TABLE tcs_catalog.linked_project_xref ADD CONSTRAINT pk_linked_project_xref PRIMARY KEY (source_project_id, dest_project_id);
 
ALTER TABLE tcs_catalog.linked_project_xref  ADD CONSTRAINT fk_linked_project_xref_project_projectid FOREIGN KEY (source_project_id) references tcs_catalog.project (project_id);
 
ALTER TABLE tcs_catalog.linked_project_xref  ADD CONSTRAINT fk_linked_project_xref_project_lu_destprojectid FOREIGN KEY (dest_project_id) references tcs_catalog.project (project_id);
 
ALTER TABLE tcs_catalog.linked_project_xref  ADD CONSTRAINT fk_linked_project_xref_link_type_lu_linktypeid FOREIGN KEY (link_type_id) references tcs_catalog.link_type_lu (link_type_id);

 ALTER TABLE tcs_catalog.project_spec ADD CONSTRAINT pk_project_sepc PRIMARY KEY (project_spec_id);
 
ALTER TABLE tcs_catalog.project_spec  ADD CONSTRAINT fk_project_spec_project FOREIGN KEY (project_id) references tcs_catalog.project (project_id);


ALTER TABLE tcs_catalog.sale_status_lu
        ADD CONSTRAINT SALE_STATUS_LU_PK PRIMARY KEY (sale_status_id);

ALTER TABLE tcs_catalog.sale_type_lu
        ADD CONSTRAINT SALE_TYPE_LU_PK PRIMARY KEY (sale_type_id);

ALTER TABLE tcs_catalog.contest_sale
        ADD CONSTRAINT CONTEST_SALE_PK PRIMARY KEY (contest_sale_id);



ALTER TABLE tcs_catalog.audit_action_type_lu ADD CONSTRAINT audit_action_type_lu_pkey PRIMARY KEY (audit_action_type_id);

ALTER TABLE tcs_catalog.project_user_audit ADD CONSTRAINT project_user_audit_pkey PRIMARY KEY (project_user_audit_id);

ALTER TABLE tcs_catalog.project_user_audit  ADD CONSTRAINT project_user_audit_audit_action_type_lu_fk FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu (audit_action_type_id);

ALTER TABLE tcs_catalog.project_user_audit  ADD CONSTRAINT project_user_audit_project_fk FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_user_audit  ADD CONSTRAINT project_user_audit_resource_role_lu_fk FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.project_info_audit  ADD CONSTRAINT project_info_audit_audit_action_type_lu_fk FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu (audit_action_type_id);

ALTER TABLE tcs_catalog.project_info_audit  ADD CONSTRAINT project_info_audit_project_fk FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_info_audit  ADD CONSTRAINT project_info_audit_project_info_type_lu_fk FOREIGN KEY (project_info_type_id) references tcs_catalog.project_info_type_lu (project_info_type_id);

ALTER TABLE tcs_catalog.project_phase_audit  ADD CONSTRAINT project_phase_audit_audit_action_type_lu_fk FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu (audit_action_type_id);

ALTER TABLE tcs_catalog.project_phase_audit  ADD CONSTRAINT project_phase_audit_project_phase_fk FOREIGN KEY (project_phase_id) references tcs_catalog.project_phase (project_phase_id);


ALTER TABLE tcs_catalog.software_competition_pipeline_info  ADD CONSTRAINT pipeline_component_fk FOREIGN KEY (component_id) references tcs_catalog.comp_catalog (component_id);

ALTER TABLE tcs_catalog.software_competition_pipeline_info  ADD CONSTRAINT pipeline_project_fk FOREIGN KEY (competition_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.software_competition_change_history  ADD CONSTRAINT pipeline_history_pipeline_fk FOREIGN KEY (software_competition_pipeline_info_id) references tcs_catalog.software_competition_pipeline_info  (id);


ALTER TABLE tcs_catalog.client_billing_config  ADD CONSTRAINT fk_client_billing_type_lu FOREIGN KEY (client_billing_config_type_id ) references tcs_catalog.client_billing_config_type_lu (client_billing_config_type_id); 


ALTER TABLE tcs_catalog.copilot_profile  ADD CONSTRAINT fk_copilotProfile_copilotProfileStatus_copilotProfileStatusId FOREIGN KEY (copilot_profile_status_id) references tcs_catalog.copilot_profile_status (copilot_profile_status_id);

/*ALTER TABLE tcs_catalog.copilot_profile  ADD CONSTRAINT fk_copilotProfile_userId FOREIGN KEY (user_id) references tcs_catalog.user (user_id);*/

ALTER TABLE tcs_catalog.copilot_profile_info  ADD CONSTRAINT fk_copilotProfileInfo_copilotProfileInfoType_copilotProfileInfoTypeId FOREIGN KEY (copilot_profile_info_type_id) references tcs_catalog.copilot_profile_info_type (copilot_profile_info_type_id);

ALTER TABLE tcs_catalog.copilot_profile_info  ADD CONSTRAINT fk_copilotProfileInfo_copilotProfile_copilotProfileId FOREIGN KEY (copilot_profile_id) references tcs_catalog.copilot_profile (copilot_profile_id);

ALTER TABLE tcs_catalog.contest_sale
        ADD CONSTRAINT  CONTEST_SALE_SALE_STATUS_FK FOREIGN KEY(sale_status_id)
        REFERENCES tcs_catalog.sale_status_lu(sale_status_id);

ALTER TABLE tcs_catalog.contest_sale
        ADD CONSTRAINT CONTEST_SALE_PROJECT_FK FOREIGN KEY(contest_id)
        REFERENCES tcs_catalog.project(project_id) ;

ALTER TABLE tcs_catalog.contest_sale
        ADD CONSTRAINT CONTEST_SALE_SALE_TYPE_FK FOREIGN KEY(sale_type_id)
        REFERENCES tcs_catalog.sale_type_lu(sale_type_id)  ;
            
ALTER TABLE tcs_catalog.late_deliverable  ADD CONSTRAINT fk_latedeliverable_latedeliverabletypelu_latedeliverabletypeid FOREIGN KEY (late_deliverable_type_id) references tcs_catalog.late_deliverable_type_lu (late_deliverable_type_id);

alter table tcs_catalog.late_deliverable add constraint fk_latedeliverable_projectphase_projectphaseid foreign key
    (project_phase_id)
    references tcs_catalog.project_phase
    (project_phase_id) on delete cascade;
 
alter table tcs_catalog.late_deliverable add constraint fk_latedeliverable_resource_resource_id foreign key
    (resource_id)
    references tcs_catalog.resource
    (resource_id) on delete cascade;
 
ALTER TABLE tcs_catalog.late_deliverable  ADD CONSTRAINT fk_latedeliverable_deliverablelu_deliverableid FOREIGN KEY (deliverable_id) references tcs_catalog.deliverable_lu (deliverable_id);

ALTER TABLE tcs_catalog.review_feedback  ADD CONSTRAINT fk_reviewfeedback_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.review_feedback_audit  ADD CONSTRAINT fk_reviewfeedbackaudit_reviewfeedback_reviewfeedbackid FOREIGN KEY (review_feedback_id) references tcs_catalog.review_feedback (review_feedback_id);

ALTER TABLE tcs_catalog.review_feedback_audit  ADD CONSTRAINT fk_reviewfeedbackaudit_auditactiontypelu_auditactiontypeid FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu (audit_action_type_id);

ALTER TABLE tcs_catalog.review_feedback_detail  ADD CONSTRAINT fk_reviewfeedbackdetail_reviewfeedback_reviewfeedbackid FOREIGN KEY (review_feedback_id) references tcs_catalog.review_feedback (review_feedback_id);

ALTER TABLE tcs_catalog.review_feedback_detail_audit  ADD CONSTRAINT fk_reviewfeedbackdetailaudit_reviewfeedback_reviewfeedbackid FOREIGN KEY (review_feedback_id) references tcs_catalog.review_feedback (review_feedback_id);

ALTER TABLE tcs_catalog.review_feedback_detail_audit  ADD CONSTRAINT fk_reviewfeedbackdetailaudit_auditactiontypelu_auditactiontypeid FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu (audit_action_type_id);

ALTER TABLE tcs_catalog.project_reliability  ADD CONSTRAINT fk_projectreliability_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE copilot_project ADD CONSTRAINT fk_copilot_project_copilot_project_status
    FOREIGN KEY (copilot_project_status_id )
    REFERENCES copilot_project_status(copilot_project_status_id ) ON DELETE CASCADE ;

ALTER TABLE copilot_project ADD CONSTRAINT fk_copilot_project_copilot_profile 
    FOREIGN KEY (copilot_profile_id )
    REFERENCES copilot_profile(copilot_profile_id ) ON DELETE CASCADE ;

ALTER TABLE copilot_project ADD CONSTRAINT fk_copilot_project_copilot_type 
    FOREIGN KEY (copilot_type_id )
    REFERENCES copilot_type(copilot_type_id ) ON DELETE CASCADE ;

ALTER TABLE copilot_project_info ADD CONSTRAINT fk_copilot_project_info_copilot_project
    FOREIGN KEY (copilot_project_id )
    REFERENCES copilot_project(copilot_project_id ) ON DELETE CASCADE ;

ALTER TABLE copilot_project_info ADD CONSTRAINT fk_copilot_project_info_copilot_project_info_type
    FOREIGN KEY (copilot_project_info_type_id )
    REFERENCES copilot_project_info_type(copilot_project_info_type_id ) ON DELETE CASCADE ;

ALTER TABLE tcs_catalog.comp_milestone_feedback  ADD CONSTRAINT fk_comp_milestone_feedback_project_project_id FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

create index IF NOT EXISTS project_idx_dpi 
on tcs_catalog.project
(
tc_direct_project_id
);

    
ALTER TABLE tcs_catalog.prize  ADD CONSTRAINT prize_file_type_fk FOREIGN KEY (prize_type_id) references tcs_catalog.prize_type_lu  (prize_type_id);

ALTER TABLE tcs_catalog.prize  ADD CONSTRAINT prize_project_fk FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project  ADD CONSTRAINT project_project_studio_spec_fk FOREIGN KEY (project_studio_spec_id) references tcs_catalog.project_studio_specification  (project_studio_spec_id);

ALTER TABLE tcs_catalog.project  ADD CONSTRAINT project_project_mm_spec_fk FOREIGN KEY (project_mm_spec_id) references tcs_catalog.project_mm_specification  (project_mm_spec_id);
    
ALTER TABLE tcs_catalog.project_file_type_xref  ADD CONSTRAINT project_project_file_type_xref_fk FOREIGN KEY (project_id) references tcs_catalog.project  (project_id);

ALTER TABLE tcs_catalog.project_file_type_xref  ADD CONSTRAINT file_type_project_file_type_xref_fk FOREIGN KEY (file_type_id) references tcs_catalog.file_type_lu  (file_type_id);

ALTER TABLE tcs_catalog.submission  ADD CONSTRAINT prize_submission_fk FOREIGN KEY (prize_id) references tcs_catalog.prize  (prize_id);

ALTER TABLE tcs_catalog.mime_type_lu  ADD CONSTRAINT mime_type_file_type_fk FOREIGN KEY (file_type_id) references tcs_catalog.file_type_lu  (file_type_id);

alter table tcs_catalog.submission_image add constraint submission_submission_image_fk foreign key 
    (submission_id) 
    references tcs_catalog.submission 
    (submission_id) on delete cascade;

ALTER TABLE tcs_catalog.submission_declaration ADD CONSTRAINT submission_declaration_pk PRIMARY KEY (submission_declaration_id);

ALTER TABLE tcs_catalog.external_content_type ADD CONSTRAINT external_content_type_pk PRIMARY KEY (external_content_type_id);

ALTER TABLE tcs_catalog.submission_external_content ADD CONSTRAINT submission_external_content_pk PRIMARY KEY (external_content_id);

ALTER TABLE tcs_catalog.external_content_property ADD CONSTRAINT external_content_property_pk PRIMARY KEY (external_content_property_id);

ALTER TABLE tcs_catalog.submission_declaration  ADD CONSTRAINT submission_declaration_to_submission_fk FOREIGN KEY (submission_id) references tcs_catalog.submission (submission_id);

ALTER TABLE tcs_catalog.submission_external_content  ADD CONSTRAINT submission_external_content_to_submission_declaration_fk FOREIGN KEY (submission_declaration_id) references tcs_catalog.submission_declaration (submission_declaration_id);

ALTER TABLE tcs_catalog.external_content_property  ADD CONSTRAINT external_content_property_to_submission_external_content_fk FOREIGN KEY (external_content_id) references tcs_catalog.submission_external_content (external_content_id);

ALTER TABLE tcs_catalog.project_copilot_type  ADD CONSTRAINT fk_project_copilot_type_pj FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_copilot_type  ADD CONSTRAINT fk_project_copilot_type_tp FOREIGN KEY (project_copilot_type_id) references tcs_catalog.project_copilot_type_lu (project_copilot_type_id);

ALTER TABLE tcs_catalog.copilot_contest_extra_info  ADD CONSTRAINT fk_copilot_contest_extra_info_pj FOREIGN KEY (copilot_posting_contest_id) references tcs_catalog.project (project_id);
ALTER TABLE tcs_catalog.copilot_contest_extra_info  ADD CONSTRAINT fk_copilot_contest_extra_info_tp FOREIGN KEY (copilot_contest_extra_info_type_id) references tcs_catalog.copilot_contest_extra_info_type (copilot_contest_extra_info_type_id);
  
ALTER TABLE direct_project_metadata  ADD CONSTRAINT fk_project_metadata_project_metadata_type FOREIGN KEY (project_metadata_key_id) references tcs_catalog.direct_project_metadata_key  (project_metadata_key_id);

ALTER TABLE direct_project_metadata_audit  ADD CONSTRAINT fk_project_metadata_audit_audit_action_type_lu1 FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu  (audit_action_type_id);

ALTER TABLE direct_project_metadata_key_audit  ADD CONSTRAINT fk_project_metadata_key_audit_audit_action_type_lu1 FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu  (audit_action_type_id);

ALTER TABLE direct_project_metadata_predefined_value  ADD CONSTRAINT fk_project_metadata_type_value_project_metadata_type1 FOREIGN KEY (project_metadata_key_id) references tcs_catalog.direct_project_metadata_key  (project_metadata_key_id);

ALTER TABLE direct_project_metadata_predefined_value_audit  ADD CONSTRAINT fk_project_metadata_predefined_value_audit_audit_action_type_1 FOREIGN KEY (audit_action_type_id) references tcs_catalog.audit_action_type_lu  (audit_action_type_id);


ALTER TABLE tcs_catalog.project_category_lu  ADD CONSTRAINT fk_projectcategorylu_projectcataloglu_projectcatalogid FOREIGN KEY (project_catalog_id) references tcs_catalog.project_catalog_lu (project_catalog_id);



ALTER TABLE tcs_catalog.project_milestone_owner  ADD CONSTRAINT fk_project_milestone_owner_project_milestone FOREIGN KEY (project_milestone_id) references tcs_catalog.project_milestone (project_milestone_id);

CREATE INDEX IF NOT EXISTS direct_project_metadata_val_idx ON tcs_catalog.direct_project_metadata
    (
    metadata_value
    );


ALTER TABLE tcs_catalog.group_associated_billing_accounts ADD CONSTRAINT fk_group_associated_billing_accounts_group FOREIGN KEY (group_id) references tcs_catalog.customer_group (group_id);


ALTER TABLE tcs_catalog.group_invitation  ADD CONSTRAINT fk_group_invitation_group_member FOREIGN KEY (group_member_id) references tcs_catalog.group_member (group_member_id);
	
ALTER TABLE tcs_catalog.review_auction_type_lu  ADD CONSTRAINT reviewauctiontypelu_reviewauctioncategorylu_fk FOREIGN KEY (review_auction_category_id) references tcs_catalog.review_auction_category_lu (review_auction_category_id);

ALTER TABLE tcs_catalog.review_application_role_lu  ADD CONSTRAINT reviewapplicationrolelu_reviewauctiontypelu_fk FOREIGN KEY (review_auction_type_id) references tcs_catalog.review_auction_type_lu (review_auction_type_id);

ALTER TABLE tcs_catalog.review_application_role_resource_role_xref  ADD CONSTRAINT reviewapplicationroleresourcerolexref_reviewapplicationrolelu_fk FOREIGN KEY (review_application_role_id) references tcs_catalog.review_application_role_lu (review_application_role_id);

ALTER TABLE tcs_catalog.review_application_role_resource_role_xref  ADD CONSTRAINT reviewapplicationroleresourcerolexref_resourcerolelu_fk FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.review_auction  ADD CONSTRAINT reviewauction_reviewauctiontypelu_fk FOREIGN KEY (review_auction_type_id) references tcs_catalog.review_auction_type_lu (review_auction_type_id);

ALTER TABLE tcs_catalog.review_auction  ADD CONSTRAINT reviewauction_project_fk FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

alter table tcs_catalog.review_application add constraint reviewapplication_reviewauction_fk foreign key 
    (review_auction_id)
    references tcs_catalog.review_auction
    (review_auction_id) on delete cascade;

ALTER TABLE tcs_catalog.review_application  ADD CONSTRAINT reviewapplication_reviewapplicationrolelu_fk FOREIGN KEY (review_application_role_id) references tcs_catalog.review_application_role_lu (review_application_role_id);

ALTER TABLE tcs_catalog.review_application  ADD CONSTRAINT reviewapplication_reviewapplicationstatuslu_fk FOREIGN KEY (review_application_status_id) references tcs_catalog.review_application_status_lu (review_application_status_id);
	
ALTER TABLE tcs_catalog.project_payment  ADD CONSTRAINT projectpayment_projectpaymenttypelu_fk FOREIGN KEY (project_payment_type_id) references tcs_catalog.project_payment_type_lu (project_payment_type_id);

ALTER TABLE tcs_catalog.project_payment  ADD CONSTRAINT projectpayment_resource_fk FOREIGN KEY (resource_id) references tcs_catalog.resource (resource_id);

ALTER TABLE tcs_catalog.project_payment  ADD CONSTRAINT projectpayment_submission_fk FOREIGN KEY (submission_id) references tcs_catalog.submission (submission_id);

ALTER TABLE tcs_catalog.project_payment_adjustment  ADD CONSTRAINT projectpaymentadjustment_project_fk FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_payment_adjustment  ADD CONSTRAINT projectpaymentadjustment_resourcerolelu_fk FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.default_project_payment  ADD CONSTRAINT defaultprojectpayment_projectcategorylu_fk FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);

ALTER TABLE tcs_catalog.default_project_payment  ADD CONSTRAINT defaultprojectpayment_resourcerolelu_fk FOREIGN KEY (resource_role_id) references tcs_catalog.resource_role_lu (resource_role_id);

ALTER TABLE tcs_catalog.reviewer_rating  ADD CONSTRAINT fk_reviewerrating_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

alter table tcs_catalog.asset_version add constraint version_asset_id_ref foreign key 
    (asset_id)
    references tcs_catalog.asset (id )
    ON DELETE CASCADE;
    
ALTER TABLE tcs_catalog.asset  ADD CONSTRAINT asset_current_version_id_ref FOREIGN KEY (current_version_id) references tcs_catalog.asset_version  (id );

alter table tcs_catalog.asset_category_mapping add constraint mapping_asset_id_ref foreign key 
    (asset_id)
    references tcs_catalog.asset (id )
    ON DELETE CASCADE;
    
alter table tcs_catalog.asset_category_mapping add constraint mapping_category_id_ref foreign key 
    (category_id)
    references tcs_catalog.asset_category (id )
    ON DELETE CASCADE;
    

CREATE INDEX IF NOT EXISTS group_archived_idx ON tcs_catalog.customer_group
    (
    archived
    );
	
CREATE INDEX IF NOT EXISTS group_member_permission_idx ON tcs_catalog.group_member
    (
    specific_permission
    );

CREATE INDEX IF NOT EXISTS group_member_active_idx ON tcs_catalog.group_member
    (
    active
    );

ALTER TABLE direct_project_task_list_permitted_user  ADD CONSTRAINT fk_task_list_permitted_user_to_task_list FOREIGN KEY (direct_project_task_list_id) references tcs_catalog.direct_project_task_list (direct_project_task_list_id);

ALTER TABLE direct_project_task  ADD CONSTRAINT fk_task_to_task_list FOREIGN KEY (direct_project_task_list_id) references tcs_catalog.direct_project_task_list (direct_project_task_list_id);

ALTER TABLE direct_project_task  ADD CONSTRAINT fk_task_to_task_status FOREIGN KEY (status) references tcs_catalog.direct_project_task_status (direct_project_task_status_id);

ALTER TABLE direct_project_task  ADD CONSTRAINT fk_task_to_task_priority FOREIGN KEY (priority) references tcs_catalog.direct_project_task_priority (direct_project_task_priority_id);

ALTER TABLE direct_project_task_attachment  ADD CONSTRAINT fk_task_attachment_to_task FOREIGN KEY (direct_project_task_id) references tcs_catalog.direct_project_task (direct_project_task_id);

ALTER TABLE direct_project_task_contest_xref  ADD CONSTRAINT fk_task_contest_xref_to_task FOREIGN KEY (direct_project_task_id) references tcs_catalog.direct_project_task (direct_project_task_id);


ALTER TABLE direct_project_task_assignee  ADD CONSTRAINT fk_task_assignee_to_task FOREIGN KEY (direct_project_task_id) references tcs_catalog.direct_project_task (direct_project_task_id);

ALTER TABLE direct_project_task_milestone_xref  ADD CONSTRAINT fk_task_milestone_xref_to_task FOREIGN KEY (direct_project_task_id) references tcs_catalog.direct_project_task (direct_project_task_id);

ALTER TABLE direct_project_task_milestone_xref  ADD CONSTRAINT fk_task_milestone_xref_to_project FOREIGN KEY (project_milestone_id) references tcs_catalog.project_milestone (project_milestone_id);


ALTER TABLE direct_project_task_list_contest_xref  ADD CONSTRAINT fk_task_list_context_xref_to_task_list FOREIGN KEY (direct_project_task_list_id) references tcs_catalog.direct_project_task_list (direct_project_task_list_id);

ALTER TABLE direct_project_task_list_milestone_xref  ADD CONSTRAINT fk_task_list_milestone_xref_to_project FOREIGN KEY (project_milestone_id) references tcs_catalog.project_milestone (project_milestone_id);

ALTER TABLE direct_project_task_list_milestone_xref  ADD CONSTRAINT fk_task_list_milestone_xref_to_task_list FOREIGN KEY (direct_project_task_list_id) references tcs_catalog.direct_project_task_list (direct_project_task_list_id);

ALTER TABLE tcs_catalog.contest_milestone_xref  ADD CONSTRAINT fk_contestmilestonexref_project_contestid FOREIGN KEY (contest_id) references tcs_catalog.project (project_id);
    
ALTER TABLE tcs_catalog.contest_milestone_xref  ADD CONSTRAINT fk_contestmilestonexref_projectmilestone_projectmilestoneid FOREIGN KEY (project_milestone_id) references tcs_catalog.project_milestone (project_milestone_id);

ALTER TABLE tcs_catalog.project_sub_category_lu  ADD CONSTRAINT project_sub_category_fk FOREIGN KEY (project_category_id) references tcs_catalog.project_category_lu (project_category_id);    

ALTER TABLE tcs_catalog.project  ADD CONSTRAINT project_project_sub_category_fk FOREIGN KEY (project_sub_category_id) references tcs_catalog.project_sub_category_lu  (project_sub_category_id);    

ALTER TABLE tcs_catalog.user_recent_item  ADD CONSTRAINT user_recent_item_user_recent_item_type_fk FOREIGN KEY (recent_item_type_id) references tcs_catalog.user_recent_item_type (recent_item_type_id);
	
ALTER TABLE tcs_catalog.project_platform  ADD CONSTRAINT fk_projectplatform_project_projectid FOREIGN KEY (project_id) references tcs_catalog.project (project_id);

ALTER TABLE tcs_catalog.project_platform  ADD CONSTRAINT fk_projectplatform_projectplatformlu_projectplatformid FOREIGN KEY (project_platform_id) references tcs_catalog.project_platform_lu (project_platform_id);

CREATE INDEX IF NOT EXISTS resource_user_id_idx ON tcs_catalog.resource
	(
	user_id
	);


CREATE INDEX IF NOT EXISTS bac_id_ix ON tcs_catalog.group_associated_billing_accounts 
    (
        billing_account_id
    );

CREATE INDEX IF NOT EXISTS group_associated_direct_projects_i1 ON tcs_catalog.group_associated_direct_projects
    (
        group_id
    );

CREATE INDEX IF NOT EXISTS group_associated_direct_projects_i2 ON tcs_catalog.group_associated_direct_projects
    (
        tc_direct_project_id
    );

CREATE INDEX IF NOT EXISTS customer_group_i1 ON tcs_catalog.customer_group
    (
        auto_grant
    );

CREATE INDEX IF NOT EXISTS customer_group_i2 ON tcs_catalog.customer_group
    (
        client_id
    );

CREATE INDEX IF NOT EXISTS group_member_i1 ON tcs_catalog.group_member
    (
        group_id
    );

CREATE INDEX IF NOT EXISTS group_member_i2 ON tcs_catalog.group_member
    (
        user_id
    );

CREATE INDEX IF NOT EXISTS project_idx_cu ON tcs_catalog.project
    (
        create_user
    );
