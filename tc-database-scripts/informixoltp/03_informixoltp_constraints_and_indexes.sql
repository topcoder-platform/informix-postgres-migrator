SET search_path TO informixoltp;

ALTER TABLE informixoltp.access ADD CONSTRAINT access_pkey PRIMARY KEY (access_id);

ALTER TABLE informixoltp.education ADD CONSTRAINT education_pkey PRIMARY KEY (education_id);

ALTER TABLE informixoltp.coder_skill ADD CONSTRAINT coder_skill_pkey PRIMARY KEY (coder_id, skill_id);

ALTER TABLE informixoltp.connection_lock ADD CONSTRAINT connection_lock_pkey PRIMARY KEY (round_id, room_id);

ALTER TABLE informixoltp.contact_us ADD CONSTRAINT contact_us_pkey PRIMARY KEY (contact_us_id);

ALTER TABLE informixoltp.contact_us_subject ADD CONSTRAINT contact_us_subject_pkey PRIMARY KEY (contact_us_subject_id);

ALTER TABLE informixoltp.data_type ADD CONSTRAINT data_type_pk PRIMARY KEY (data_type_id);

ALTER TABLE informixoltp.degree ADD CONSTRAINT degree_pkey PRIMARY KEY (degree_id);

ALTER TABLE informixoltp.difficulty ADD CONSTRAINT difficulty_pkey PRIMARY KEY (difficulty_id);

ALTER TABLE informixoltp.group ADD CONSTRAINT group_pkey PRIMARY KEY (group_id);

ALTER TABLE informixoltp.group_user ADD CONSTRAINT group_user_pkey PRIMARY KEY (group_id, user_id);

ALTER TABLE informixoltp.permission ADD CONSTRAINT permission_pkey PRIMARY KEY (secure_object_id, sector_id, access_id);

ALTER TABLE informixoltp.question_type ADD CONSTRAINT question_type_pkey PRIMARY KEY (question_type_id);

CREATE INDEX IF NOT EXISTS room_indx1 ON informixoltp.room
    (
    round_id, 
    room_id
    );

ALTER TABLE informixoltp.room ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);

ALTER TABLE informixoltp.round_component ADD CONSTRAINT round_problem_pk PRIMARY KEY (component_id, round_id, division_id);

ALTER TABLE informixoltp.segment_type ADD CONSTRAINT segment_type_pk PRIMARY KEY (segment_type_id);

ALTER TABLE informixoltp.round_segment ADD CONSTRAINT round_segment_pkey PRIMARY KEY (round_id, segment_id);

ALTER TABLE informixoltp.sector ADD CONSTRAINT sector_pkey PRIMARY KEY (sector_id);

ALTER TABLE informixoltp.secure_object ADD CONSTRAINT secure_object_pkey PRIMARY KEY (secure_object_id);

ALTER TABLE informixoltp.skill_type ADD CONSTRAINT skill_type_pkey PRIMARY KEY (skill_type_id);

ALTER TABLE informixoltp.language ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);

ALTER TABLE informixoltp.user_type ADD CONSTRAINT user_type_pkey PRIMARY KEY (user_type_id);

ALTER TABLE informixoltp.news ADD CONSTRAINT news_pkey PRIMARY KEY (news_id);

CREATE INDEX IF NOT EXISTS auditcoder_coderid_indx ON informixoltp.audit_coder
    (
    user_id
    );

ALTER TABLE informixoltp.dispute ADD CONSTRAINT dispute_pkey PRIMARY KEY (dispute_id, inquiry_id, corporate_id);

ALTER TABLE informixoltp.corporate ADD CONSTRAINT corporate_pkey PRIMARY KEY (corporate_id);

ALTER TABLE informixoltp.ad ADD CONSTRAINT ad_pkey PRIMARY KEY (ad_id);

ALTER TABLE informixoltp.inquiry ADD CONSTRAINT inquiry_pkey PRIMARY KEY (inquiry_id, corporate_id);

ALTER TABLE informixoltp.watch ADD CONSTRAINT watch_pkey PRIMARY KEY (corporate_id, coder_id);

ALTER TABLE informixoltp.subscription_region ADD CONSTRAINT subscription_region_pkey PRIMARY KEY (subscription_id, region_code);

ALTER TABLE informixoltp.subscription ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscription_id);

ALTER TABLE informixoltp.region_state ADD CONSTRAINT region_state_pkey PRIMARY KEY (region_code, state_code, user_type_id);

ALTER TABLE informixoltp.contest ADD CONSTRAINT contest_pkey PRIMARY KEY (contest_id);

ALTER TABLE informixoltp.coder ADD CONSTRAINT coder_pkey PRIMARY KEY (coder_id);

CREATE INDEX IF NOT EXISTS jiveword_idx1 ON informixoltp.jiveword
    (
    word
    );

ALTER TABLE informixoltp.jiveword ADD CONSTRAINT jiveword_pkey PRIMARY KEY (wordid);

CREATE INDEX IF NOT EXISTS useruseridx ON informixoltp.jiveuserperm
    (
    userid
    );

ALTER TABLE informixoltp.jiveuserperm ADD CONSTRAINT jiveuserperm_pkey PRIMARY KEY (forumid, userid, permission);

CREATE INDEX IF NOT EXISTS jivethread_forumid_idx ON informixoltp.jivethread
    (
    forumid
    );

ALTER TABLE informixoltp.jivethread ADD CONSTRAINT jivethread_pkey PRIMARY KEY (threadid);

CREATE INDEX IF NOT EXISTS wordcountidx ON informixoltp.jivemessageword
    (
    wordcount
    );

CREATE INDEX IF NOT EXISTS wordforumididx ON informixoltp.jivemessageword
    (
    forumid
    );

CREATE INDEX IF NOT EXISTS wordwordidx ON informixoltp.jivemessageword
    (
    wordid
    );

ALTER TABLE informixoltp.jivemessageword ADD CONSTRAINT jivemessageword_pkey PRIMARY KEY (messageid, wordid);

CREATE INDEX IF NOT EXISTS childidx ON informixoltp.jivemessagetree
    (
    childid
    );

ALTER TABLE informixoltp.jivemessagetree ADD CONSTRAINT jivemessagetree_pkey PRIMARY KEY (parentid, childid);

ALTER TABLE informixoltp.jivemessageprop ADD CONSTRAINT jivemessageprop_pkey PRIMARY KEY (messageid, name);

CREATE INDEX IF NOT EXISTS jivemessage_modifieddate_idx ON informixoltp.jivemessage
    (
    modifieddate
    );

CREATE INDEX IF NOT EXISTS jivemessage_threadid_idx ON informixoltp.jivemessage
    (
    threadid
    );

ALTER TABLE informixoltp.jivemessage ADD CONSTRAINT jivemessage_pkey PRIMARY KEY (messageid);

CREATE INDEX IF NOT EXISTS filterindexidx ON informixoltp.jivefilter
    (
    filterindex
    );

ALTER TABLE informixoltp.jivefilter ADD CONSTRAINT jivefilter_pkey PRIMARY KEY (forumid, filterindex);

CREATE INDEX IF NOT EXISTS msg_x ON informixoltp.jmsmessage
    (
    messageid
    );

CREATE INDEX IF NOT EXISTS msgq_x ON informixoltp.jmsmessagequeue
    (
    messageid
    );

ALTER TABLE informixoltp.referral ADD CONSTRAINT referral_pkey PRIMARY KEY (referral_id);

ALTER TABLE informixoltp.editor ADD CONSTRAINT editor_pkey PRIMARY KEY (editor_id);

ALTER TABLE informixoltp.pay_period ADD CONSTRAINT pay_period_pkey PRIMARY KEY (pay_period_id);

ALTER TABLE informixoltp.title ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);

ALTER TABLE informixoltp.press_release ADD CONSTRAINT press_release_pkey PRIMARY KEY (press_release_id);

ALTER TABLE informixoltp.division ADD CONSTRAINT division_pkey PRIMARY KEY (division_id);

CREATE INDEX IF NOT EXISTS server_connection_idx ON informixoltp.server_connection
    (
    coder_id
    );

ALTER TABLE informixoltp.server_connection ADD CONSTRAINT server_connection_pkey PRIMARY KEY (server_id, connection_id);

ALTER TABLE informixoltp.sector_file ADD CONSTRAINT sector_file_pkey PRIMARY KEY (sector_id);

ALTER TABLE informixoltp.segment ADD CONSTRAINT segment_pkey PRIMARY KEY (segment_id);

ALTER TABLE informixoltp.corporate_contact_us ADD CONSTRAINT corporate_contact_us_pkey PRIMARY KEY (corporate_contact_us_id);

ALTER TABLE informixoltp.system_test_result ADD CONSTRAINT system_test_result_pkey PRIMARY KEY (round_id, coder_id, component_id, test_case_id);

ALTER TABLE informixoltp.coder_type ADD CONSTRAINT coder_type_pkey PRIMARY KEY (coder_type_id);

CREATE INDEX IF NOT EXISTS coder_referral_idx1 ON informixoltp.coder_referral
    (
    referral_id, 
    reference_id
    );

ALTER TABLE informixoltp.coder_referral ADD CONSTRAINT coder_referral_pkey PRIMARY KEY (coder_id, referral_id);

ALTER TABLE informixoltp.problem_status_lu ADD CONSTRAINT problem_status_pkey PRIMARY KEY (problem_status_id);

ALTER TABLE informixoltp.correspondence ADD CONSTRAINT conrrespondence_pkey PRIMARY KEY (correspondence_id);

ALTER TABLE informixoltp.correspondence_status ADD CONSTRAINT correspondencestatus_pkey PRIMARY KEY (correspondence_status_id);

CREATE INDEX IF NOT EXISTS comp_user_xref_user_idx ON informixoltp.component_user_xref
    (
    user_id
    );

ALTER TABLE informixoltp.component_user_xref ADD CONSTRAINT problem_user_pkey PRIMARY KEY (component_id, user_id, user_type_id);

ALTER TABLE informixoltp.solution ADD CONSTRAINT solution_pkey PRIMARY KEY (solution_id);

CREATE INDEX IF NOT EXISTS problem_state_indx ON informixoltp.component_state
    (
    round_id, 
    coder_id, 
    component_id
    );

ALTER TABLE informixoltp.component_state ADD CONSTRAINT problemstate_pkey PRIMARY KEY (component_state_id);

ALTER TABLE informixoltp.problem_solution ADD CONSTRAINT problem_solution_pkey PRIMARY KEY (problem_id, solution_id);

ALTER TABLE informixoltp.development_application_status ADD CONSTRAINT dev_app_status_pkey PRIMARY KEY (dev_app_status_id);

ALTER TABLE informixoltp.development_application ADD CONSTRAINT dev_app_pkey PRIMARY KEY (dev_app_id);

ALTER TABLE informixoltp.challenge ADD CONSTRAINT challenge_pkey PRIMARY KEY (round_id, challenger_id, defendant_id, component_id, challenge_id);

ALTER TABLE informixoltp.invite_list ADD CONSTRAINT invite_list_pkey PRIMARY KEY (round_id, coder_id);

ALTER TABLE informixoltp.current_school ADD CONSTRAINT pk_current_scho777 PRIMARY KEY (coder_id);

ALTER TABLE informixoltp.sub_template ADD CONSTRAINT sub_template_pkey PRIMARY KEY (template_id, sub_template_id);

CREATE INDEX IF NOT EXISTS student_rep_idx1 ON informixoltp.student_rep
    (
    coder_id
    );

CREATE INDEX IF NOT EXISTS student_rep_idx2 ON informixoltp.student_rep
    (
    school_id
    );

ALTER TABLE informixoltp.room_type ADD CONSTRAINT room_type_pkey PRIMARY KEY (room_type_id);

ALTER TABLE informixoltp.round_registration ADD CONSTRAINT round_registration_pkey PRIMARY KEY (round_id, coder_id);

ALTER TABLE informixoltp.question_style ADD CONSTRAINT question_style_pkey PRIMARY KEY (question_style_id);

ALTER TABLE informixoltp.answer ADD CONSTRAINT answer_pk PRIMARY KEY (answer_id);

ALTER TABLE informixoltp.survey_question ADD CONSTRAINT survey_question_pk PRIMARY KEY (survey_id, question_id);

ALTER TABLE informixoltp.round_question ADD CONSTRAINT u198_150 PRIMARY KEY (round_id, question_id);

CREATE INDEX IF NOT EXISTS corr_read_xref_user_id ON informixoltp.correspondence_read_xref
    (
    user_id
    );

ALTER TABLE informixoltp.correspondence_read_xref ADD CONSTRAINT conrrespondence_read_xref_pkey PRIMARY KEY (correspondence_id, user_id);

ALTER TABLE informixoltp.problem_user_request ADD CONSTRAINT problem_user_request_pkey PRIMARY KEY (request_id);

ALTER TABLE informixoltp.contract_type_lu ADD CONSTRAINT contract_type_pkey PRIMARY KEY (contract_type_id);

ALTER TABLE informixoltp.image_type_lu ADD CONSTRAINT image_type_lu_pk PRIMARY KEY (image_type_id);

ALTER TABLE informixoltp.image ADD CONSTRAINT image_pk PRIMARY KEY (image_id);

ALTER TABLE informixoltp.coder_image_xref ADD CONSTRAINT coder_image_xref_pk PRIMARY KEY (coder_id, image_id);

ALTER TABLE informixoltp.jiveforum ADD CONSTRAINT jiveforum_pkey PRIMARY KEY (forumid);

ALTER TABLE informixoltp.login ADD CONSTRAINT login_pk PRIMARY KEY (login_id);

ALTER TABLE informixoltp.project ADD CONSTRAINT pk_project PRIMARY KEY (project_id);

ALTER TABLE informixoltp.project_issue ADD CONSTRAINT project_issue_pk PRIMARY KEY (project_issue_id);

ALTER TABLE informixoltp.project_task ADD CONSTRAINT project_task_pk PRIMARY KEY (project_task_id);

ALTER TABLE informixoltp.project_user ADD CONSTRAINT project_user_pk PRIMARY KEY (project_user_id);

ALTER TABLE informixoltp.project_user_task ADD CONSTRAINT project_user_task_pk PRIMARY KEY (project_user_task_id);

ALTER TABLE informixoltp.project_user_update ADD CONSTRAINT project_user_update_pk PRIMARY KEY (project_user_update_id);

ALTER TABLE informixoltp.status_type_lu ADD CONSTRAINT status_type_pk PRIMARY KEY (status_type_id);

ALTER TABLE informixoltp.request_type_lu ADD CONSTRAINT request_type_lu_pk PRIMARY KEY (request_type_id);

ALTER TABLE informixoltp.path ADD CONSTRAINT path_pk PRIMARY KEY (path_id);

ALTER TABLE informixoltp.round_type_lu ADD CONSTRAINT round_type_lu_pk PRIMARY KEY (round_type_id);

CREATE unique INDEX IF NOT EXISTS web_content_indx1 ON informixoltp.web_content
    (
    content_name
    );

ALTER TABLE informixoltp.web_content ADD CONSTRAINT web_content_pk PRIMARY KEY (content_id);

ALTER TABLE informixoltp.web_file ADD CONSTRAINT web_file_pkey PRIMARY KEY (file_id);

ALTER TABLE informixoltp.staging_problem ADD CONSTRAINT staging_problem_pkey PRIMARY KEY (problem_id);

CREATE INDEX IF NOT EXISTS request_indx1 ON informixoltp.request
    (
    connection_id, 
    server_id, 
    round_id, 
    room_id, 
    request_type_id
    );

ALTER TABLE informixoltp.request ADD CONSTRAINT request_pk PRIMARY KEY (request_id);

ALTER TABLE informixoltp.staging_rating ADD CONSTRAINT staging_rating_pkey PRIMARY KEY (coder_id, backup_id);

ALTER TABLE informixoltp.staging_room ADD CONSTRAINT staging_room_pkey PRIMARY KEY (room_id);

ALTER TABLE informixoltp.staging_round_problem ADD CONSTRAINT staging_round_problem_pk PRIMARY KEY (problem_id, round_id, division_id);

ALTER TABLE informixoltp.staging_round_segment ADD CONSTRAINT staging_round_segment_pkey PRIMARY KEY (round_id, segment_id);

ALTER TABLE informixoltp.staging_contest ADD CONSTRAINT staging_contest_pkey PRIMARY KEY (contest_id);

ALTER TABLE informixoltp.staging_challenge ADD CONSTRAINT staging_challenge_pkey PRIMARY KEY (round_id, challenger_id, defendant_id, problem_id, challenge_id, backup_id);

ALTER TABLE informixoltp.staging_round_registration ADD CONSTRAINT staging_round_registration_pkey PRIMARY KEY (round_id, coder_id);

ALTER TABLE informixoltp.staging_survey ADD CONSTRAINT staging_survey_pkey PRIMARY KEY (survey_id);

ALTER TABLE informixoltp.staging_question ADD CONSTRAINT staging_question_pk PRIMARY KEY (question_id);

ALTER TABLE informixoltp.staging_answer ADD CONSTRAINT staging_answer_pk PRIMARY KEY (answer_id);

ALTER TABLE informixoltp.staging_response ADD CONSTRAINT staging_response_pk PRIMARY KEY (question_id, answer_id, user_id);

ALTER TABLE informixoltp.staging_survey_question ADD CONSTRAINT staging_survey_question_pk PRIMARY KEY (survey_id, question_id);

ALTER TABLE informixoltp.staging_round_question ADD CONSTRAINT u235_238 PRIMARY KEY (round_id, question_id);

ALTER TABLE informixoltp.staging_round ADD CONSTRAINT stagin_round PRIMARY KEY (round_id);

ALTER TABLE informixoltp.staging_room_result ADD CONSTRAINT staging_room_result_pkey PRIMARY KEY (round_id, room_id, coder_id, backup_id);

ALTER TABLE informixoltp.affidavit_type_lu ADD CONSTRAINT affidavit_type_lu_pk PRIMARY KEY (affidavit_type_id);

ALTER TABLE informixoltp.contract_payment_xref ADD CONSTRAINT contract_payment_xref_pk PRIMARY KEY (contract_id, payment_id);

ALTER TABLE informixoltp.user_tax_form_xref ADD CONSTRAINT user_tax_form_xref_pk PRIMARY KEY (tax_form_id, user_id);

ALTER TABLE informixoltp.payment_note_xref ADD CONSTRAINT payment_note_xref_pk PRIMARY KEY (note_id, payment_id);

ALTER TABLE informixoltp.affidavit_note_xref ADD CONSTRAINT affidavit_note_xref_pk PRIMARY KEY (note_id, affidavit_id);

ALTER TABLE informixoltp.contract_note_xref ADD CONSTRAINT contract_note_xref_pk PRIMARY KEY (contract_id, note_id);

ALTER TABLE informixoltp.payment_detail ADD CONSTRAINT payment_detail_pk PRIMARY KEY (payment_detail_id);

ALTER TABLE informixoltp.payment ADD CONSTRAINT payment_pk PRIMARY KEY (payment_id);

ALTER TABLE informixoltp.payment_address ADD CONSTRAINT payment_address_pk PRIMARY KEY (payment_address_id);

ALTER TABLE informixoltp.payment_detail_xref ADD CONSTRAINT payment_detail_xref_pk PRIMARY KEY (payment_id, payment_detail_id);

ALTER TABLE informixoltp.payment_release ADD CONSTRAINT payment_release_pk PRIMARY KEY (payment_release_id);

ALTER TABLE informixoltp.payment_release_xref ADD CONSTRAINT payment_release_xref_pk PRIMARY KEY (payment_release_id, payment_id);

ALTER TABLE informixoltp.modification_rationale_lu ADD CONSTRAINT modification_rationale_lu_pk PRIMARY KEY (modification_rationale_id);

ALTER TABLE informixoltp.affidavit ADD CONSTRAINT affidavit_pk PRIMARY KEY (affidavit_id);

ALTER TABLE informixoltp.user_tax_form_note_xref ADD CONSTRAINT u251_267 PRIMARY KEY (user_id, tax_form_id, note_id);

ALTER TABLE informixoltp.tax_form ADD CONSTRAINT tax_form_pk PRIMARY KEY (tax_form_id);

ALTER TABLE informixoltp.contract ADD CONSTRAINT contract_pk PRIMARY KEY (contract_id);

ALTER TABLE informixoltp.affidavit_template ADD CONSTRAINT affidavit_template_pk PRIMARY KEY (affidavit_template_id);

ALTER TABLE informixoltp.query ADD CONSTRAINT query_pk PRIMARY KEY (query_id);

ALTER TABLE informixoltp.command ADD CONSTRAINT command_pk PRIMARY KEY (command_id);

ALTER TABLE informixoltp.command_query_xref ADD CONSTRAINT commandqueryxref_pk PRIMARY KEY (command_id, query_id);

ALTER TABLE informixoltp.query_input_xref ADD CONSTRAINT query_input_pk PRIMARY KEY (query_id, input_id);

CREATE unique INDEX IF NOT EXISTS inputlu_inputcode_idx ON informixoltp.input_lu
    (
    input_code
    );

ALTER TABLE informixoltp.input_lu ADD CONSTRAINT input_lu_pkey PRIMARY KEY (input_id);

ALTER TABLE informixoltp.sched_job_type_lu ADD CONSTRAINT sched_job_type_lu_pk PRIMARY KEY (sched_job_type_id);

ALTER TABLE informixoltp.sched_job_status_lu ADD CONSTRAINT sched_job_status_lu_pk PRIMARY KEY (sched_job_status_id);

ALTER TABLE informixoltp.sched_job_detail_status_lu ADD CONSTRAINT sched_job_detail_status_lu_pk PRIMARY KEY (sched_job_detail_status_id);

ALTER TABLE informixoltp.sched_job ADD CONSTRAINT sched_job_pk PRIMARY KEY (sched_job_id);

ALTER TABLE informixoltp.email_job_group_lu ADD CONSTRAINT email_job_group_lu_pk PRIMARY KEY (email_job_group_id);

ALTER TABLE informixoltp.email_template_group_lu ADD CONSTRAINT email_template_group_lu_pk PRIMARY KEY (email_template_group_id);

ALTER TABLE informixoltp.email_template ADD CONSTRAINT email_template_pk PRIMARY KEY (email_template_id);

ALTER TABLE informixoltp.email_list_group_lu ADD CONSTRAINT email_list_group_lu_pk PRIMARY KEY (email_list_group_id);

ALTER TABLE informixoltp.email_list ADD CONSTRAINT email_list_pk PRIMARY KEY (email_list_id);

ALTER TABLE informixoltp.email_list_detail ADD CONSTRAINT email_list_detail_pk PRIMARY KEY (email_list_detail_id);

ALTER TABLE informixoltp.sched_email_job ADD CONSTRAINT sched_email_job_pk PRIMARY KEY (sched_email_job_id);

ALTER TABLE informixoltp.command_param ADD CONSTRAINT command_param_pk PRIMARY KEY (command_param_id);

ALTER TABLE informixoltp.command_group_lu ADD CONSTRAINT command_group_lu_pk PRIMARY KEY (command_group_id);

ALTER TABLE informixoltp.user_status_lu ADD CONSTRAINT user_status_pk PRIMARY KEY (user_status_id);

ALTER TABLE informixoltp.status_lu ADD CONSTRAINT statuslu_pkey PRIMARY KEY (status_id);

ALTER TABLE informixoltp.broadcast_type_lu ADD CONSTRAINT broadcasttypelu_pk PRIMARY KEY (broadcast_type_id);

ALTER TABLE informixoltp.broadcast ADD CONSTRAINT broadcast_pk PRIMARY KEY (broadcast_id);

ALTER TABLE informixoltp.round_payment ADD CONSTRAINT round_payment_pk PRIMARY KEY (round_payment_id);

ALTER TABLE informixoltp.sched_control ADD CONSTRAINT sched_control_pk PRIMARY KEY (sched_job_id);

ALTER TABLE informixoltp.job_type_lu ADD CONSTRAINT job_type_lu_pkey PRIMARY KEY (job_type_id);

ALTER TABLE informixoltp.job ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);

ALTER TABLE informixoltp.hit_type_lu ADD CONSTRAINT hit_type_lu_pkey PRIMARY KEY (hit_type_id);

ALTER TABLE informixoltp.job_hit ADD CONSTRAINT job_hit_pkey PRIMARY KEY (job_id, user_id, hit_type_id);

ALTER TABLE informixoltp.monitor_function_type_lu ADD CONSTRAINT monitory_function_type_lu_pk PRIMARY KEY (monitor_function_type_id);

ALTER TABLE informixoltp.monitor_function ADD CONSTRAINT monitor_function_pk PRIMARY KEY (monitor_function_id);

ALTER TABLE informixoltp.company_user_xref ADD CONSTRAINT company_user_xref_pkey PRIMARY KEY (company_id, company_user_code);

ALTER TABLE informixoltp.company_image_xref ADD CONSTRAINT company_image_xref_pk PRIMARY KEY (company_id, image_id);

ALTER TABLE informixoltp.coder_confirmation ADD CONSTRAINT coder_confirmation_pkey PRIMARY KEY (coder_id, contest_id);

ALTER TABLE informixoltp.component_type_lu ADD CONSTRAINT conmponent_type_lu_pk PRIMARY KEY (component_type_id);

ALTER TABLE informixoltp.problem_type_lu ADD CONSTRAINT problem_type_lu_pk PRIMARY KEY (problem_type_id);

ALTER TABLE informixoltp.parameter ADD CONSTRAINT parameter_pk PRIMARY KEY (parameter_id);

ALTER TABLE informixoltp.component_solution_xref ADD CONSTRAINT component_solution_xref_pk PRIMARY KEY (component_id, solution_id);

ALTER TABLE informixoltp.component_status_lu ADD CONSTRAINT component_status_lu_pkey PRIMARY KEY (component_status_id);

ALTER TABLE informixoltp.data_type_mapping ADD CONSTRAINT data_type_mapping_pk PRIMARY KEY (language_id, data_type_id);

ALTER TABLE informixoltp.web_service ADD CONSTRAINT web_service_pkey PRIMARY KEY (web_service_id);

ALTER TABLE informixoltp.web_service_file_type ADD CONSTRAINT webservicefiletype_pk PRIMARY KEY (web_service_file_type_id);

ALTER TABLE informixoltp.web_service_source_file ADD CONSTRAINT webservicesourcefile_pk PRIMARY KEY (web_service_source_file_id);

ALTER TABLE informixoltp.web_service_compilation ADD CONSTRAINT webservicecompilation_pk PRIMARY KEY (web_service_source_file_id, sort_order);

ALTER TABLE informixoltp.component_web_service_xref ADD CONSTRAINT component_web_service_xref_pk PRIMARY KEY (component_id, web_service_id);

ALTER TABLE informixoltp.problem_payment ADD CONSTRAINT problem_payment_pkey PRIMARY KEY (coder_id, problem_id);

CREATE INDEX IF NOT EXISTS component_idx1 ON informixoltp.component
    (
    problem_id
    );

ALTER TABLE informixoltp.component ADD CONSTRAINT component_pk PRIMARY KEY (component_id);

ALTER TABLE informixoltp.file_type_lu ADD CONSTRAINT file_type_lu_pk PRIMARY KEY (file_type_id);

ALTER TABLE informixoltp.resume ADD CONSTRAINT resume_pk PRIMARY KEY (resume_id);

ALTER TABLE informixoltp.campaign ADD CONSTRAINT campaign_pkey PRIMARY KEY (campaign_id);

ALTER TABLE informixoltp.activity ADD CONSTRAINT activity_pk PRIMARY KEY (activity_id);

ALTER TABLE informixoltp.campaign_activity_xref ADD CONSTRAINT campaign_activity_xref_pk PRIMARY KEY (campaign_id, activity_id);

ALTER TABLE informixoltp.campaign_job_xref ADD CONSTRAINT campaign_job_xref_pk PRIMARY KEY (campaign_id, job_id);

ALTER TABLE informixoltp.problem ADD CONSTRAINT problem_pkey PRIMARY KEY (problem_id);

CREATE INDEX IF NOT EXISTS sched_job_detail_idx1 ON informixoltp.sched_job_detail
    (
    sched_job_id, 
    sched_job_detail_id
    );

ALTER TABLE informixoltp.sched_job_detail ADD CONSTRAINT sched_job_detail_pk PRIMARY KEY (sched_job_detail_id);

ALTER TABLE informixoltp.round_image_xref ADD CONSTRAINT round_image_xref_pk PRIMARY KEY (round_id, image_id);

alter table informixoltp.wl_team add constraint u324_543 unique(team_name);

ALTER TABLE informixoltp.wl_team ADD CONSTRAINT u324_542 PRIMARY KEY (team_id);

ALTER TABLE informixoltp.team_type_lu ADD CONSTRAINT u316_374 PRIMARY KEY (team_type_id);

ALTER TABLE informixoltp.team_coder_component_xref ADD CONSTRAINT u318_378 PRIMARY KEY (team_id, coder_id, component_id, round_id);

alter table informixoltp.team_coder_xref add constraint u319_383 unique(coder_id);

ALTER TABLE informixoltp.team_coder_xref ADD CONSTRAINT u319_384 PRIMARY KEY (team_id, coder_id);

ALTER TABLE informixoltp.problem_web_service_xref ADD CONSTRAINT u320_387 PRIMARY KEY (problem_id, web_service_id);

ALTER TABLE informixoltp.web_service_java_doc ADD CONSTRAINT u321_390 PRIMARY KEY (web_service_java_doc_id);

ALTER TABLE informixoltp.compilation ADD CONSTRAINT compilation_pkey PRIMARY KEY (component_state_id);

ALTER TABLE informixoltp.submission ADD CONSTRAINT submission_pk PRIMARY KEY (component_state_id, submission_number);

ALTER TABLE informixoltp.donation_type_lu ADD CONSTRAINT donationtype_pk PRIMARY KEY (donation_type_id);

ALTER TABLE informixoltp.question ADD CONSTRAINT question_pk PRIMARY KEY (question_id);

ALTER TABLE informixoltp.problem_rating_question ADD CONSTRAINT problem_rating_question_pkey PRIMARY KEY (question_id);

ALTER TABLE informixoltp.problem_rating ADD CONSTRAINT problem_rating_pkey PRIMARY KEY (problem_id, question_id, coder_id);

ALTER TABLE informixoltp.question_image_xref ADD CONSTRAINT question_image_xref_pk PRIMARY KEY (question_id, image_id);

ALTER TABLE informixoltp.staging_component_state ADD CONSTRAINT componentstate_pkey PRIMARY KEY (component_state_id, backup_id);

ALTER TABLE informixoltp.backup ADD CONSTRAINT u339_406 PRIMARY KEY (backup_id);

ALTER TABLE informixoltp.component_category_lu ADD CONSTRAINT conmponent_category_lu_pk PRIMARY KEY (component_category_id);

ALTER TABLE informixoltp.component_category_xref ADD CONSTRAINT conmponent_category_xref_pk PRIMARY KEY (component_id, component_category_id);

ALTER TABLE informixoltp.campaign_round_xref ADD CONSTRAINT campaign_round_pk PRIMARY KEY (campaign_id, round_id);

ALTER TABLE informixoltp.campaign_type_lu ADD CONSTRAINT campaign_type_lu_pk PRIMARY KEY (campaign_type_id);

ALTER TABLE informixoltp.skill ADD CONSTRAINT skill_pkey PRIMARY KEY (skill_id);

ALTER TABLE informixoltp.coder_skill_type_note_xref ADD CONSTRAINT coderstilltypenote_pk PRIMARY KEY (coder_id, skill_type_id, note_id);

ALTER TABLE informixoltp.staging_submission ADD CONSTRAINT staging_submission_pk PRIMARY KEY (component_state_id, submission_number, backup_id);

ALTER TABLE informixoltp.staging_compilation ADD CONSTRAINT staging_compilation_pkey PRIMARY KEY (component_state_id, backup_id);

ALTER TABLE informixoltp.staging_system_test_result ADD CONSTRAINT staging_system_test_result_pkey PRIMARY KEY (round_id, coder_id, problem_id, test_case_id, backup_id);

ALTER TABLE informixoltp.staging_system_test_case ADD CONSTRAINT staging_systemtestcase_pk PRIMARY KEY (test_case_id);

CREATE INDEX IF NOT EXISTS system_test_component_ix ON informixoltp.system_test_case
    (
    component_id, 
    example_flag, 
    system_flag
    );

ALTER TABLE informixoltp.system_test_case ADD CONSTRAINT systemtestcase_pk PRIMARY KEY (test_case_id);

ALTER TABLE informixoltp.country_affidavit_template_xref ADD CONSTRAINT countryaffidavittemplatexref_pk PRIMARY KEY (country_code, affidavit_template_id);

ALTER TABLE informixoltp.message_status_lu ADD CONSTRAINT message_status_lu_pkey PRIMARY KEY (message_status_id);

ALTER TABLE informixoltp.message ADD CONSTRAINT message_pkey PRIMARY KEY (message_id);

ALTER TABLE informixoltp.user_message_status_lu ADD CONSTRAINT user_message_status_lu_pkey PRIMARY KEY (user_message_status_id);

ALTER TABLE informixoltp.user_message ADD CONSTRAINT user_message_pkey PRIMARY KEY (user_id, message_id, status_id);

ALTER TABLE informixoltp.failure_type_lu ADD CONSTRAINT failure_type_lu_pkey PRIMARY KEY (failure_type_id);

CREATE INDEX IF NOT EXISTS jms_messages_destination ON informixoltp.jms_messages
    (
    destination
    );

CREATE INDEX IF NOT EXISTS jms_messages_txop_txid ON informixoltp.jms_messages
    (
    txop, 
    txid
    );

ALTER TABLE informixoltp.jms_messages ADD CONSTRAINT jmsmessage_pk PRIMARY KEY (messageid, destination);

ALTER TABLE informixoltp.jms_transactions ADD CONSTRAINT jmstransactions_pk PRIMARY KEY (txid);

ALTER TABLE informixoltp.jms_users ADD CONSTRAINT jmsusers_pk PRIMARY KEY (userid);

ALTER TABLE informixoltp.jms_roles ADD CONSTRAINT jmsroles_pk PRIMARY KEY (userid, roleid);

ALTER TABLE informixoltp.jms_subscriptions ADD CONSTRAINT jmssubscriptions_pk PRIMARY KEY (clientid, subname);

ALTER TABLE informixoltp.solution_class_file ADD CONSTRAINT solutionclassfile_pkey PRIMARY KEY (solution_id, sort_order);

ALTER TABLE informixoltp.survey ADD CONSTRAINT survey_pkey PRIMARY KEY (survey_id);

ALTER TABLE informixoltp.long_test_queue_status_lu ADD CONSTRAINT longtestqueuestatuslu_pkey PRIMARY KEY (status_id);

ALTER TABLE informixoltp.intro_event_property_lu ADD CONSTRAINT collegetourpropertylu_pk PRIMARY KEY (property_id);

ALTER TABLE informixoltp.intro_event ADD CONSTRAINT collegetourevent_pk PRIMARY KEY (event_id);

ALTER TABLE informixoltp.system_test_output ADD CONSTRAINT system_test_output_pkey PRIMARY KEY (round_id, coder_id, component_id, test_case_id);

CREATE INDEX IF NOT EXISTS long_component_state_indx ON informixoltp.long_component_state
    (
    round_id, 
    coder_id, 
    component_id
    );

ALTER TABLE informixoltp.long_component_state ADD CONSTRAINT longcomponentstate_pkey PRIMARY KEY (long_component_state_id);

ALTER TABLE informixoltp.long_compilation ADD CONSTRAINT longcompilation_pkey PRIMARY KEY (long_component_state_id);

CREATE INDEX IF NOT EXISTS longcompresult_coderid_indx ON informixoltp.long_comp_result
    (
    coder_id
    );

ALTER TABLE informixoltp.long_comp_result ADD CONSTRAINT longcompresult_pkey PRIMARY KEY (round_id, coder_id);

ALTER TABLE informixoltp.long_submission ADD CONSTRAINT longsubmission_pk PRIMARY KEY (long_component_state_id, submission_number, example);

ALTER TABLE informixoltp.long_system_test_result ADD CONSTRAINT longsystemtestresult_pk PRIMARY KEY (round_id, coder_id, component_id, test_case_id, submission_number, example);

ALTER TABLE informixoltp.long_system_test_output ADD CONSTRAINT long_system_test_output_pkey PRIMARY KEY (round_id, coder_id, component_id, test_case_id, submission_number, example);

CREATE INDEX IF NOT EXISTS ltq_create_date_idx ON informixoltp.long_test_queue
    (
    create_date
    );

ALTER TABLE informixoltp.long_test_queue ADD CONSTRAINT longtestqueue_pkey PRIMARY KEY (long_component_state_id, test_case_id);

ALTER TABLE informixoltp.compilation_class_file ADD CONSTRAINT compilationclassfile_pkey PRIMARY KEY (component_state_id, sort_order);

ALTER TABLE informixoltp.submission_class_file ADD CONSTRAINT submissionclassfile_pk PRIMARY KEY (component_state_id, submission_number, sort_order);

CREATE INDEX IF NOT EXISTS arch_sch_det_idx1 ON informixoltp.archive_sched_job_detail
    (
    sched_job_id
    );

ALTER TABLE informixoltp.long_submission_class_file ADD CONSTRAINT longsubmissionclassfile_pk PRIMARY KEY (long_component_state_id, submission_number, example, sort_order);

ALTER TABLE informixoltp.ltg_type_lu ADD CONSTRAINT ltg_type_lu_pk PRIMARY KEY (type_id);

ALTER TABLE informixoltp.ltg_status_lu ADD CONSTRAINT ltg_status_lu_pk PRIMARY KEY (status_id);

ALTER TABLE informixoltp.long_test_group ADD CONSTRAINT long_test_group_pk PRIMARY KEY (ltg_id);

ALTER TABLE informixoltp.ltc_status_lu ADD CONSTRAINT ltc_status_lu_pk PRIMARY KEY (status_id);

ALTER TABLE informixoltp.long_test_case ADD CONSTRAINT long_test_case_pk PRIMARY KEY (ltc_id);

ALTER TABLE informixoltp.long_test_result ADD CONSTRAINT long_test_result_pk PRIMARY KEY (ltc_id);

ALTER TABLE informixoltp.long_test_queue_mpsqas ADD CONSTRAINT long_test_queue_mpsqas_pk PRIMARY KEY (ltc_id);

ALTER TABLE informixoltp.mpsqas_user_ltg_xref ADD CONSTRAINT mpsqas_user_ltg_pk PRIMARY KEY (user_id, ltg_id);

ALTER TABLE informixoltp.algo_rating_type_lu ADD CONSTRAINT algo_rating_type_lu_pk PRIMARY KEY (algo_rating_type_id);

ALTER TABLE informixoltp.algo_rating ADD CONSTRAINT algo_rating_pkey PRIMARY KEY (coder_id, algo_rating_type_id);

ALTER TABLE informixoltp.season ADD CONSTRAINT season_pkey PRIMARY KEY (season_id);

ALTER TABLE informixoltp.season_type_lu ADD CONSTRAINT season_type_lu_pkey PRIMARY KEY (season_type_id);

ALTER TABLE informixoltp.season_algo_rating ADD CONSTRAINT season_algo_rating_pkey PRIMARY KEY (coder_id, season_id);

ALTER TABLE informixoltp.region_type_lu ADD CONSTRAINT regiontypelu_pkey PRIMARY KEY (region_type_id);

ALTER TABLE informixoltp.region ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);

ALTER TABLE informixoltp.practice_group ADD CONSTRAINT practice_group_pkey PRIMARY KEY (group_id);

ALTER TABLE informixoltp.payment_method_lu ADD CONSTRAINT pk_payment_meth48 PRIMARY KEY (payment_method_id);

ALTER TABLE informixoltp.team ADD CONSTRAINT u463_376 PRIMARY KEY (team_id);

ALTER TABLE informixoltp.member_contact_black_list ADD CONSTRAINT member_contact_black_list_pk PRIMARY KEY (user_id, blocked_user_id);

ALTER TABLE informixoltp.member_contact_message ADD CONSTRAINT member_contact_message_pk PRIMARY KEY (member_contact_message_id);

ALTER TABLE informixoltp.staging_algo_rating ADD CONSTRAINT staging_algo_rating_pkey PRIMARY KEY (coder_id, algo_rating_type_id, backup_id);

ALTER TABLE informixoltp.round ADD CONSTRAINT u478_496 PRIMARY KEY (round_id);

ALTER TABLE informixoltp.payment_reference_lu ADD CONSTRAINT payment_reference_lu_pk PRIMARY KEY (payment_reference_id);

ALTER TABLE informixoltp.long_test_score_id ADD CONSTRAINT long_test_score_id_pk PRIMARY KEY (round_id);

ALTER TABLE informixoltp.mike_school ADD CONSTRAINT mike_school_pkey PRIMARY KEY (school_id);

ALTER TABLE informixoltp.response ADD CONSTRAINT response_pk PRIMARY KEY (response_id);

ALTER TABLE informixoltp.visa_letter_event ADD CONSTRAINT visa_letter_event_id_pkey PRIMARY KEY (visa_letter_event_id);

ALTER TABLE informixoltp.visa_letter_request ADD CONSTRAINT visa_letter_request_pkey PRIMARY KEY (visa_letter_request_id);

ALTER TABLE informixoltp.assignment_document_type_lu ADD CONSTRAINT assignment_document_type_pkey PRIMARY KEY (assignment_document_type_id);

ALTER TABLE informixoltp.assignment_document_status_lu ADD CONSTRAINT assignment_document_status_pkey PRIMARY KEY (assignment_document_status_id);

ALTER TABLE informixoltp.assignment_document ADD CONSTRAINT assignment_document_pk PRIMARY KEY (assignment_document_id);

ALTER TABLE informixoltp.assignment_document_template ADD CONSTRAINT assignment_document_template_pkey PRIMARY KEY (assignment_document_template_id);

ALTER TABLE informixoltp.intro_event_property_type_lu ADD CONSTRAINT _property_type_lu_pk PRIMARY KEY (property_type_id);

CREATE INDEX IF NOT EXISTS conn_hist_idx1 ON informixoltp.connection_history
    (
    connection_id, 
    server_id
    );

CREATE INDEX IF NOT EXISTS conn_hist_idx2 ON informixoltp.connection_history
    (
    coder_id
    );

ALTER TABLE informixoltp.payment_status_lu ADD CONSTRAINT payment_status_lu_pk PRIMARY KEY (payment_status_id);

ALTER TABLE informixoltp.payment_status_reason_lu ADD CONSTRAINT payment_status_reason_lu_pk PRIMARY KEY (payment_status_reason_id);

ALTER TABLE informixoltp.payment_detail_status_reason_xref ADD CONSTRAINT payment_detail_status_reason_xref_pk PRIMARY KEY (payment_detail_id, payment_status_reason_id);

ALTER TABLE informixoltp.round_language ADD CONSTRAINT round_language_pk PRIMARY KEY (round_id, language_id);

ALTER TABLE informixoltp.generic_counter_client ADD CONSTRAINT generic_counter_client_pk PRIMARY KEY (client_id);

alter table informixoltp.generic_counter_client add constraint generic_counter_client_uk unique (name);

ALTER TABLE informixoltp.generic_counter ADD CONSTRAINT generic_counter_pk PRIMARY KEY (client_id, counter_id);

ALTER TABLE informixoltp.payment_detail_pablo ADD CONSTRAINT payment_detail_pk_temp PRIMARY KEY (payment_detail_id);

ALTER TABLE informixoltp.timers ADD CONSTRAINT timers_pk PRIMARY KEY (timerid, targetid);

CREATE INDEX IF NOT EXISTS room_result_round_coder_ix ON informixoltp.room_result
    (
    round_id, 
    coder_id
    );

ALTER TABLE informixoltp.room_result ADD CONSTRAINT room_result_pkey PRIMARY KEY (round_id, room_id, coder_id);

ALTER TABLE informixoltp.classroom_status_lu ADD CONSTRAINT pk_classroomstatus PRIMARY KEY (status_id);

ALTER TABLE informixoltp.classroom ADD CONSTRAINT pk_classroom PRIMARY KEY (classroom_id);

ALTER TABLE informixoltp.student_classroom_status_lu ADD CONSTRAINT pk_studentclassroomstatus PRIMARY KEY (status_id);

ALTER TABLE informixoltp.student_classroom_xref ADD CONSTRAINT pk_studentclassroom PRIMARY KEY (classroom_id, student_id);

ALTER TABLE informixoltp.student_professor_xref ADD CONSTRAINT pk_studentprofessor PRIMARY KEY (professor_id, student_id);

ALTER TABLE informixoltp.round_property_type_lu ADD CONSTRAINT pk_roundpropertylu PRIMARY KEY (round_property_type_id);

ALTER TABLE informixoltp.round_property ADD CONSTRAINT pk_roundproperty PRIMARY KEY (round_id, round_property_type_id);

ALTER TABLE informixoltp.college_problem_set ADD CONSTRAINT pk_collegeproblemset PRIMARY KEY (problem_set_id);

ALTER TABLE informixoltp.problem_set_component_xref ADD CONSTRAINT pk_collegeproblemsetcomponent PRIMARY KEY (problem_set_id, component_id);

ALTER TABLE informixoltp.invoice_type_lu ADD CONSTRAINT   pk_invoice_type_lu PRIMARY KEY(invoice_type_id);
      
ALTER TABLE informixoltp.invoice_record ADD CONSTRAINT pk_invoice_record PRIMARY KEY(invoice_record_id);

ALTER TABLE informixoltp.invoice ADD CONSTRAINT   pk_invoice PRIMARY KEY(invoice_id);

ALTER TABLE informixoltp.invoice_record  ADD CONSTRAINT fk_invoicerecord_invoice FOREIGN KEY (invoice_id) references informixoltp.invoice (invoice_id);

CREATE INDEX IF NOT EXISTS mike_temp1_idx ON informixoltp.mike_temp1
    (
    user_id
    );

CREATE INDEX IF NOT EXISTS art_idx1 ON informixoltp.algo_rating_tgh
    (
    coder_id, 
    algo_rating_type_id
    );

CREATE INDEX IF NOT EXISTS temp_algo_rating_index ON informixoltp.algo_rating_tgh_hourly
    (
    coder_id, 
    algo_rating_type_id
    );

ALTER TABLE informixoltp.payment_type_lu ADD CONSTRAINT payment_type_lu_pk PRIMARY KEY (payment_type_id);

ALTER TABLE informixoltp.long_system_test_data ADD CONSTRAINT long_system_test_data_pk PRIMARY KEY (round_id, component_id, coder_id, example, submission_number, test_case_id);

ALTER TABLE informixoltp.round_prize ADD CONSTRAINT round_prize_pk PRIMARY KEY (round_id, place);
	
ALTER TABLE informixoltp.education  ADD CONSTRAINT education_degree_fk FOREIGN KEY (degree_id) references informixoltp.degree (degree_id);

ALTER TABLE informixoltp.education  ADD CONSTRAINT education_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.coder_skill  ADD CONSTRAINT coderskill_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.coder_skill  ADD CONSTRAINT coder_skill_fk FOREIGN KEY (skill_id) references informixoltp.skill (skill_id);

ALTER TABLE informixoltp.contact_us  ADD CONSTRAINT contactus_contactussubject_fk FOREIGN KEY (contact_us_subject_id) references informixoltp.contact_us_subject (contact_us_subject_id);

ALTER TABLE informixoltp.group  ADD CONSTRAINT group_secureobject_fk FOREIGN KEY (group_id) references informixoltp.secure_object (secure_object_id);

ALTER TABLE informixoltp.group_user  ADD CONSTRAINT group_user_group_fk FOREIGN KEY (group_id) references informixoltp.group (group_id);

ALTER TABLE informixoltp.permission  ADD CONSTRAINT permission_access_fk FOREIGN KEY (access_id) references informixoltp.access (access_id);

ALTER TABLE informixoltp.permission  ADD CONSTRAINT permission_secotrs_fk FOREIGN KEY (sector_id) references informixoltp.sector (sector_id);

ALTER TABLE informixoltp.permission  ADD CONSTRAINT permission_secure_object_fk FOREIGN KEY (secure_object_id) references informixoltp.secure_object (secure_object_id);

ALTER TABLE informixoltp.question_type  ADD CONSTRAINT questiontype_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.room  ADD CONSTRAINT room_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.room  ADD CONSTRAINT room_roomtype_fk FOREIGN KEY (room_type_id) references informixoltp.room_type (room_type_id);

ALTER TABLE informixoltp.room  ADD CONSTRAINT room_division_fk FOREIGN KEY (division_id) references informixoltp.division (division_id);

ALTER TABLE informixoltp.round_component  ADD CONSTRAINT roundproblem_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_component  ADD CONSTRAINT roundproblem_division_fk FOREIGN KEY (division_id) references informixoltp.division (division_id);

ALTER TABLE informixoltp.round_component  ADD CONSTRAINT roundproblem_difficulty_fk FOREIGN KEY (difficulty_id) references informixoltp.difficulty (difficulty_id);

ALTER TABLE informixoltp.round_component  ADD CONSTRAINT roundcomponent_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.round_segment  ADD CONSTRAINT roundsegment_segment_fk FOREIGN KEY (segment_id) references informixoltp.segment (segment_id);

ALTER TABLE informixoltp.round_segment  ADD CONSTRAINT roundsegments_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.dispute  ADD CONSTRAINT dispute_inquiry_fk FOREIGN KEY (inquiry_id, corporate_id) references informixoltp.inquiry (inquiry_id, corporate_id);

ALTER TABLE informixoltp.dispute  ADD CONSTRAINT dispute_corporate_fk FOREIGN KEY (corporate_id) references informixoltp.corporate (corporate_id);

ALTER TABLE informixoltp.inquiry  ADD CONSTRAINT inquiry_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.watch  ADD CONSTRAINT coderwatch_coderid_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.watch  ADD CONSTRAINT coderwatch_corporate_fk FOREIGN KEY (corporate_id) references informixoltp.corporate (corporate_id);

ALTER TABLE informixoltp.subscription_region  ADD CONSTRAINT subscriptionregion_subscription_fk FOREIGN KEY (subscription_id) references informixoltp.subscription (subscription_id);

ALTER TABLE informixoltp.subscription  ADD CONSTRAINT subscripton_corporate_fk FOREIGN KEY (corporate_id) references informixoltp.corporate (corporate_id);

ALTER TABLE informixoltp.contest  ADD CONSTRAINT contest_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.contest  ADD CONSTRAINT contest_season_id_fkey FOREIGN KEY (season_id) references informixoltp.season (season_id);

ALTER TABLE informixoltp.coder  ADD CONSTRAINT coder_codertype_fk FOREIGN KEY (coder_type_id) references informixoltp.coder_type (coder_type_id);

ALTER TABLE informixoltp.sector_file  ADD CONSTRAINT sector_file_sector_fk FOREIGN KEY (sector_id) references informixoltp.sector (sector_id);

ALTER TABLE informixoltp.sector_agreement  ADD CONSTRAINT sector_agreement_sector_fk FOREIGN KEY (sector_id) references informixoltp.sector (sector_id);

ALTER TABLE informixoltp.experience  ADD CONSTRAINT experience_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.experience  ADD CONSTRAINT coderexperience_title_fk FOREIGN KEY (title_id) references informixoltp.title (title_id);

ALTER TABLE informixoltp.system_test_result  ADD CONSTRAINT systemtestresult_systemtestcase_fk FOREIGN KEY (test_case_id) references informixoltp.system_test_case (test_case_id);

ALTER TABLE informixoltp.system_test_result  ADD CONSTRAINT systemtestcases_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.system_test_result  ADD CONSTRAINT system_testcases_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.system_test_result  ADD CONSTRAINT systemtestresult_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.system_test_result  ADD CONSTRAINT systemtestresult_failuretype_fkey FOREIGN KEY (failure_type_id) references informixoltp.failure_type_lu (failure_type_id);

ALTER TABLE informixoltp.coder_referral  ADD CONSTRAINT coder_referral_referral_fk FOREIGN KEY (referral_id) references informixoltp.referral (referral_id);

ALTER TABLE informixoltp.coder_referral  ADD CONSTRAINT coder_referral_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.problem_statement_history  ADD CONSTRAINT prblmstmthistory_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.correspondence  ADD CONSTRAINT correspondence_coder_fk FOREIGN KEY (from_coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.correspondence  ADD CONSTRAINT correspondence_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.correspondence  ADD CONSTRAINT correspondence_group_fk FOREIGN KEY (group_id) references informixoltp.group (group_id);

ALTER TABLE informixoltp.correspondence  ADD CONSTRAINT correspondence_correspondence_fk FOREIGN KEY (reply_id) references informixoltp.correspondence (correspondence_id);

ALTER TABLE informixoltp.correspondence  ADD CONSTRAINT correspondence_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.mpsqas_chat_history  ADD CONSTRAINT mpsqaschathistory_problem_d FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.mpsqas_chat_history  ADD CONSTRAINT mpsqaschathistory_coder_d FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.component_user_xref  ADD CONSTRAINT componentuserxref_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.solution  ADD CONSTRAINT solution_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.solution  ADD CONSTRAINT solution_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.component_state  ADD CONSTRAINT problemstate_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.component_state  ADD CONSTRAINT problemstate_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.component_state  ADD CONSTRAINT problemstate_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.component_state  ADD CONSTRAINT componentstate_componentstatuslu_fk FOREIGN KEY (status_id) references informixoltp.component_status_lu (component_status_id);

ALTER TABLE informixoltp.component_state  ADD CONSTRAINT componentstate_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.problem_solution  ADD CONSTRAINT problemsolution_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.problem_solution  ADD CONSTRAINT problemsoltuion_solution_fk FOREIGN KEY (solution_id) references informixoltp.solution (solution_id);

ALTER TABLE informixoltp.development_application  ADD CONSTRAINT devapp_usertype_fk FOREIGN KEY (user_type_id) references informixoltp.user_type (user_type_id);

ALTER TABLE informixoltp.development_application  ADD CONSTRAINT devapp_devappstatus_fk FOREIGN KEY (dev_app_status_id) references informixoltp.development_application_status (dev_app_status_id);

ALTER TABLE informixoltp.challenge  ADD CONSTRAINT challenge_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.challenge  ADD CONSTRAINT challenge_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.challenge  ADD CONSTRAINT challenge_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.challenge  ADD CONSTRAINT challenge_chgr_coder_fk FOREIGN KEY (challenger_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.challenge  ADD CONSTRAINT challenge_def_coder_fk FOREIGN KEY (defendant_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.invite_list  ADD CONSTRAINT invitelist_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.invite_list  ADD CONSTRAINT invitelist_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.invite_list  ADD CONSTRAINT invitelist_contest_fk FOREIGN KEY (contest_id) references informixoltp.contest (contest_id);

ALTER TABLE informixoltp.round_registration  ADD CONSTRAINT roundregistration_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_registration  ADD CONSTRAINT roundregistration_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.question_style  ADD CONSTRAINT questionstyle_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.answer  ADD CONSTRAINT answer_question_fk FOREIGN KEY (question_id) references informixoltp.question (question_id);

ALTER TABLE informixoltp.survey_question  ADD CONSTRAINT surveyquestion_survey_fk FOREIGN KEY (survey_id) references informixoltp.survey (survey_id);

ALTER TABLE informixoltp.survey_question  ADD CONSTRAINT surveyquestion_question_fk FOREIGN KEY (question_id) references informixoltp.question (question_id);

ALTER TABLE informixoltp.round_question  ADD CONSTRAINT roundquestion_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_question  ADD CONSTRAINT roundquestion_question_fk FOREIGN KEY (question_id) references informixoltp.question (question_id);

ALTER TABLE informixoltp.correspondence_read_xref  ADD CONSTRAINT correspondencereadxref_correspondence_fk FOREIGN KEY (correspondence_id) references informixoltp.correspondence (correspondence_id);

ALTER TABLE informixoltp.problem_user_request  ADD CONSTRAINT problemuserrequest_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.image  ADD CONSTRAINT image_imagetypelu_fk FOREIGN KEY (image_type_id) references informixoltp.image_type_lu (image_type_id);

ALTER TABLE informixoltp.image  ADD CONSTRAINT image_path_fk FOREIGN KEY (path_id) references informixoltp.path (path_id);

ALTER TABLE informixoltp.coder_image_xref  ADD CONSTRAINT coderimagexref_image_fk FOREIGN KEY (image_id) references informixoltp.image (image_id);

ALTER TABLE informixoltp.coder_image_xref  ADD CONSTRAINT coderimagexref_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.round_type_lu  ADD CONSTRAINT round_type_lu_algo_rating_type_fk FOREIGN KEY (algo_rating_type_id) references informixoltp.algo_rating_type_lu (algo_rating_type_id);

ALTER TABLE informixoltp.request  ADD CONSTRAINT request_requesttypelu_fk FOREIGN KEY (request_type_id) references informixoltp.request_type_lu (request_type_id);

ALTER TABLE informixoltp.request  ADD CONSTRAINT request_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.request  ADD CONSTRAINT request_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.request  ADD CONSTRAINT request_room_fk FOREIGN KEY (room_id) references informixoltp.room (room_id);

ALTER TABLE informixoltp.staging_rating  ADD CONSTRAINT stagingrating_backup_id_fk FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.staging_challenge  ADD CONSTRAINT stagingchallenge_backup_id_fk FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.staging_room_result  ADD CONSTRAINT stagingroomresult_backup_id_fk FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.contract_payment_xref  ADD CONSTRAINT r_53 FOREIGN KEY (contract_id) references informixoltp.contract (contract_id);

ALTER TABLE informixoltp.user_tax_form_xref  ADD CONSTRAINT usertaxformxref_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.user_tax_form_xref  ADD CONSTRAINT usertaxform_taxform_fk FOREIGN KEY (tax_form_id) references informixoltp.tax_form (tax_form_id);

ALTER TABLE informixoltp.payment_note_xref  ADD CONSTRAINT paymentnotexref_payment_id FOREIGN KEY (payment_id) references informixoltp.payment (payment_id);

ALTER TABLE informixoltp.affidavit_note_xref  ADD CONSTRAINT affidavitnotexref_affidavite_fk FOREIGN KEY (affidavit_id) references informixoltp.affidavit (affidavit_id);

ALTER TABLE informixoltp.contract_note_xref  ADD CONSTRAINT contractnotexref_contract_fk FOREIGN KEY (contract_id) references informixoltp.contract (contract_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT paymentdetail_paymentstatuslu_fk FOREIGN KEY (payment_status_id) references informixoltp.payment_status_lu (payment_status_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT paymentdetail_paymentaddress_fk FOREIGN KEY (payment_address_id) references informixoltp.payment_address (payment_address_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT paymentdetail_modificationrationale_fk FOREIGN KEY (modification_rationale_id) references informixoltp.modification_rationale_lu (modification_rationale_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT fk_payment_deta490 FOREIGN KEY (payment_method_id) references informixoltp.payment_method_lu (payment_method_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT fk_payment_deta149 FOREIGN KEY (payment_type_id) references informixoltp.payment_type_lu (payment_type_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT paymentdetail_algorithm_round_id_fk FOREIGN KEY (algorithm_round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.payment_detail  ADD CONSTRAINT paymentdetail_algorithm_problem_id_fk FOREIGN KEY (algorithm_problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.payment  ADD CONSTRAINT payment_paymentdetail_fk FOREIGN KEY (most_recent_detail_id) references informixoltp.payment_detail (payment_detail_id);

ALTER TABLE informixoltp.payment  ADD CONSTRAINT payment_payment_fk FOREIGN KEY (referral_payment_id) references informixoltp.payment (payment_id);

ALTER TABLE informixoltp.payment_detail_xref  ADD CONSTRAINT paymentdetailxref_payment_fk FOREIGN KEY (payment_id) references informixoltp.payment (payment_id);

ALTER TABLE informixoltp.payment_detail_xref  ADD CONSTRAINT paymentdetailxref_paymentdetail_fk FOREIGN KEY (payment_detail_id) references informixoltp.payment_detail (payment_detail_id);

ALTER TABLE informixoltp.payment_release  ADD CONSTRAINT paymentrelease_paymentmethodlu_fk FOREIGN KEY (payment_method_id) references informixoltp.payment_method_lu (payment_method_id);

ALTER TABLE informixoltp.payment_release_xref  ADD CONSTRAINT paymentreleasexref_paymentrelease_fk FOREIGN KEY (payment_release_id) references informixoltp.payment_release (payment_release_id);

ALTER TABLE informixoltp.payment_release_xref  ADD CONSTRAINT paymentreleasexref_payment_fk FOREIGN KEY (payment_id) references informixoltp.payment (payment_id);

ALTER TABLE informixoltp.user_payment_method  ADD CONSTRAINT userpaymentmethod_paymentmethodlu_fk FOREIGN KEY (payment_method_id) references informixoltp.payment_method_lu (payment_method_id);

ALTER TABLE informixoltp.affidavit  ADD CONSTRAINT affidavit_affidavittypelu_fk FOREIGN KEY (affidavit_type_id) references informixoltp.affidavit_type_lu (affidavit_type_id);

ALTER TABLE informixoltp.affidavit  ADD CONSTRAINT affidavit_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.user_tax_form_note_xref  ADD CONSTRAINT usertaxformnotexref_taxform_fk FOREIGN KEY (tax_form_id) references informixoltp.tax_form (tax_form_id);

ALTER TABLE informixoltp.tax_form  ADD CONSTRAINT taxform_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.contract  ADD CONSTRAINT contract_contracttyeplu_fk FOREIGN KEY (contract_type_id) references informixoltp.contract_type_lu (contract_type_id);

ALTER TABLE informixoltp.contract  ADD CONSTRAINT contract_status_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.affidavit_template  ADD CONSTRAINT affidavittemplate_affidavittypelu_fk FOREIGN KEY (affidavit_type_id) references informixoltp.affidavit_type_lu (affidavit_type_id);

ALTER TABLE informixoltp.command  ADD CONSTRAINT command_command_group_fk FOREIGN KEY (command_group_id) references informixoltp.command_group_lu (command_group_id);

ALTER TABLE informixoltp.sched_job  ADD CONSTRAINT sched_job_sched_job_type_lu_fk FOREIGN KEY (sched_job_type_id) references informixoltp.sched_job_type_lu (sched_job_type_id);

ALTER TABLE informixoltp.sched_job  ADD CONSTRAINT sched_job_sched_job_status_lu_fk FOREIGN KEY (sched_job_status_id) references informixoltp.sched_job_status_lu (sched_job_status_id);

ALTER TABLE informixoltp.sched_job  ADD CONSTRAINT sched_job_email_job_group_lu_fk FOREIGN KEY (email_job_group_id) references informixoltp.email_job_group_lu  (email_job_group_id);

ALTER TABLE informixoltp.email_template  ADD CONSTRAINT email_template_email_template_group_lu_fk FOREIGN KEY (email_template_group_id) references informixoltp.email_template_group_lu (email_template_group_id);

ALTER TABLE informixoltp.email_list  ADD CONSTRAINT email_list_detail_email_list_group_lu_fk FOREIGN KEY (email_list_group_id) references informixoltp.email_list_group_lu (email_list_group_id);

ALTER TABLE informixoltp.email_list_detail  ADD CONSTRAINT email_list_detail_email_list_fk FOREIGN KEY (email_list_id) references informixoltp.email_list (email_list_id);

ALTER TABLE informixoltp.sched_email_job  ADD CONSTRAINT sched_email_job_sched_job_fk FOREIGN KEY (sched_email_job_id) references informixoltp.sched_job (sched_job_id);

ALTER TABLE informixoltp.sched_email_job  ADD CONSTRAINT sched_email_job_email_template_fk FOREIGN KEY (email_template_id) references informixoltp.email_template (email_template_id);

ALTER TABLE informixoltp.sched_email_job  ADD CONSTRAINT sched_email_job_command_fk FOREIGN KEY (command_id) references informixoltp.command (command_id);

ALTER TABLE informixoltp.sched_email_job  ADD CONSTRAINT sched_email_job_email_list_fk FOREIGN KEY (email_list_id) references informixoltp.email_list (email_list_id);

ALTER TABLE informixoltp.command_param  ADD CONSTRAINT command_param_sched_email_job_fk FOREIGN KEY (sched_email_job_id) references informixoltp.sched_email_job (sched_email_job_id);

ALTER TABLE informixoltp.broadcast  ADD CONSTRAINT broadcast_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.broadcast  ADD CONSTRAINT broadcast_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.broadcast  ADD CONSTRAINT broadcast_broadcasttypelu_fk FOREIGN KEY (broadcast_type_id) references informixoltp.broadcast_type_lu (broadcast_type_id);

ALTER TABLE informixoltp.broadcast  ADD CONSTRAINT broadcast_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.round_payment  ADD CONSTRAINT roundpayment_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_payment  ADD CONSTRAINT roundpayment_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.round_payment  ADD CONSTRAINT roundpayment_paymenttypelu_fk FOREIGN KEY (payment_type_id) references informixoltp.payment_type_lu (payment_type_id);

ALTER TABLE informixoltp.job_hit  ADD CONSTRAINT jobhit_hittypelu_fk FOREIGN KEY (hit_type_id) references informixoltp.hit_type_lu (hit_type_id);

ALTER TABLE informixoltp.job_hit  ADD CONSTRAINT jobhit_job_fk FOREIGN KEY (job_id) references informixoltp.job (job_id);

ALTER TABLE informixoltp.monitor_function  ADD CONSTRAINT monitorfunction_monitorfunctiontypelu_fk FOREIGN KEY (monitor_function_type_id) references informixoltp.monitor_function_type_lu (monitor_function_type_id);

ALTER TABLE informixoltp.monitor_user_round_xref  ADD CONSTRAINT monitoruserroundxref_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.group_monitor_function_xref  ADD CONSTRAINT groupmonitorfunctionsxref_group_fk FOREIGN KEY (group_id) references informixoltp.group (group_id);

ALTER TABLE informixoltp.group_monitor_function_xref  ADD CONSTRAINT groupmonitorfunctionxref_monitorfunction_fk FOREIGN KEY (monitor_function_id) references informixoltp.monitor_function (monitor_function_id);

ALTER TABLE informixoltp.company_image_xref  ADD CONSTRAINT companyimagexref_image_fk FOREIGN KEY (image_id) references informixoltp.image (image_id);

ALTER TABLE informixoltp.parameter  ADD CONSTRAINT parameter_datatype_fk FOREIGN KEY (data_type_id) references informixoltp.data_type (data_type_id);

ALTER TABLE informixoltp.component_solution_xref  ADD CONSTRAINT componentsolution_solution_fk FOREIGN KEY (solution_id) references informixoltp.solution (solution_id);

ALTER TABLE informixoltp.data_type_mapping  ADD CONSTRAINT datatypemapping_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.data_type_mapping  ADD CONSTRAINT datatypemapping_datatype_fk FOREIGN KEY (data_type_id) references informixoltp.data_type (data_type_id);

ALTER TABLE informixoltp.web_service_source_file  ADD CONSTRAINT webservicesourcefile_webservice_fk FOREIGN KEY (web_service_id) references informixoltp.web_service (web_service_id);

ALTER TABLE informixoltp.web_service_source_file  ADD CONSTRAINT webservicesourcefile_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.web_service_source_file  ADD CONSTRAINT webservicesourcefile_webservicefiletype_fk FOREIGN KEY (web_service_file_type_id) references informixoltp.web_service_file_type (web_service_file_type_id);

ALTER TABLE informixoltp.web_service_compilation  ADD CONSTRAINT webservicecompilation_webservicesourcefile_fk FOREIGN KEY (web_service_source_file_id) references informixoltp.web_service_source_file (web_service_source_file_id);

ALTER TABLE informixoltp.web_service_compilation  ADD CONSTRAINT webservicecompilation_webservicefiletype_fk FOREIGN KEY (web_service_file_type_id) references informixoltp.web_service_file_type (web_service_file_type_id);

ALTER TABLE informixoltp.component_web_service_xref  ADD CONSTRAINT componentwebservice_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.problem_payment  ADD CONSTRAINT problempayment_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.problem_payment  ADD CONSTRAINT problempayment_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.component  ADD CONSTRAINT component_componenttypelu_fk FOREIGN KEY (component_type_id) references informixoltp.component_type_lu (component_type_id);

ALTER TABLE informixoltp.resume  ADD CONSTRAINT resume_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.resume  ADD CONSTRAINT resume_filetypelu_fk FOREIGN KEY (file_type_id) references informixoltp.file_type_lu (file_type_id);

ALTER TABLE informixoltp.campaign  ADD CONSTRAINT campaign_campaigntypelu_fk FOREIGN KEY (campaign_type_id) references informixoltp.campaign_type_lu (campaign_type_id);

ALTER TABLE informixoltp.campaign_activity_xref  ADD CONSTRAINT campaignactivityxref_activity_fk FOREIGN KEY (activity_id) references informixoltp.activity (activity_id);

ALTER TABLE informixoltp.campaign_activity_xref  ADD CONSTRAINT campaignactivityxref_campaign_fk FOREIGN KEY (campaign_id) references informixoltp.campaign (campaign_id);

ALTER TABLE informixoltp.campaign_job_xref  ADD CONSTRAINT campaignjobxref_campaign_fk FOREIGN KEY (campaign_id) references informixoltp.campaign (campaign_id);

ALTER TABLE informixoltp.campaign_job_xref  ADD CONSTRAINT campaignjobxref_job_fk FOREIGN KEY (job_id) references informixoltp.job (job_id);

ALTER TABLE informixoltp.problem  ADD CONSTRAINT problems_prblmstatus_fk FOREIGN KEY (status_id) references informixoltp.problem_status_lu (problem_status_id);

ALTER TABLE informixoltp.problem  ADD CONSTRAINT problem_problemtypelu_fk FOREIGN KEY (problem_type_id) references informixoltp.problem_type_lu (problem_type_id);

ALTER TABLE informixoltp.sched_job_detail  ADD CONSTRAINT sched_job_detail_sched_job_fk FOREIGN KEY (sched_job_id) references informixoltp.sched_job (sched_job_id);

ALTER TABLE informixoltp.sched_job_detail  ADD CONSTRAINT sched_job_detail_sched_job_detail_status_lu_fk FOREIGN KEY (sched_job_detail_status_id) references informixoltp.sched_job_detail_status_lu (sched_job_detail_status_id);

ALTER TABLE informixoltp.round_image_xref  ADD CONSTRAINT roundimagexref_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_image_xref  ADD CONSTRAINT roundimagexref_image_fk FOREIGN KEY (image_id) references informixoltp.image (image_id);

ALTER TABLE informixoltp.team_coder_component_xref  ADD CONSTRAINT team_teamid_fk FOREIGN KEY (team_id) references informixoltp.team (team_id);

ALTER TABLE informixoltp.team_coder_component_xref  ADD CONSTRAINT coder_coderid_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.team_coder_component_xref  ADD CONSTRAINT component_componentid_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.team_coder_component_xref  ADD CONSTRAINT round_roundid_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.team_coder_xref  ADD CONSTRAINT team_teamid_2_fk FOREIGN KEY (team_id) references informixoltp.team (team_id);

ALTER TABLE informixoltp.team_coder_xref  ADD CONSTRAINT coder_coderid_2_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.problem_web_service_xref  ADD CONSTRAINT problem_problemid_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.problem_web_service_xref  ADD CONSTRAINT webservice_webserviceid_fk FOREIGN KEY (web_service_id) references informixoltp.web_service (web_service_id);

ALTER TABLE informixoltp.web_service_java_doc  ADD CONSTRAINT webservice_webserviceid_2_fk FOREIGN KEY (web_service_id) references informixoltp.web_service (web_service_id);

ALTER TABLE informixoltp.compilation  ADD CONSTRAINT compilation_problemstate_fk FOREIGN KEY (component_state_id) references informixoltp.component_state (component_state_id);

ALTER TABLE informixoltp.submission  ADD CONSTRAINT submission_problemstate_fk FOREIGN KEY (component_state_id) references informixoltp.component_state (component_state_id);

ALTER TABLE informixoltp.charity_donation  ADD CONSTRAINT charitydonation_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.charity_donation  ADD CONSTRAINT charitydonation_donationtype_fk FOREIGN KEY (donation_type_id) references informixoltp.donation_type_lu (donation_type_id);

ALTER TABLE informixoltp.question  ADD CONSTRAINT question_questiontype_fk FOREIGN KEY (question_type_id) references informixoltp.question_type (question_type_id);

ALTER TABLE informixoltp.question  ADD CONSTRAINT question_questionstyle_fk FOREIGN KEY (question_style_id) references informixoltp.question_style (question_style_id);

ALTER TABLE informixoltp.question  ADD CONSTRAINT question_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.problem_rating  ADD CONSTRAINT problem_rating_question_fk FOREIGN KEY (question_id) references informixoltp.problem_rating_question (question_id);

ALTER TABLE informixoltp.problem_rating  ADD CONSTRAINT problem_rating_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.problem_rating  ADD CONSTRAINT problem_rating_problem_fk FOREIGN KEY (problem_id) references informixoltp.problem (problem_id);

ALTER TABLE informixoltp.question_image_xref  ADD CONSTRAINT questionimagexref_image_fk FOREIGN KEY (image_id) references informixoltp.image (image_id);

ALTER TABLE informixoltp.question_image_xref  ADD CONSTRAINT questionimagexref_question_fk FOREIGN KEY (question_id) references informixoltp.question (question_id);

ALTER TABLE informixoltp.staging_component_state  ADD CONSTRAINT stagingcomponentstate_backup_id_fk FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.backup  ADD CONSTRAINT r339_743 FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.backup_tables  ADD CONSTRAINT r340_744 FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.component_category_xref  ADD CONSTRAINT comp_cat_xref_comp_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.component_category_xref  ADD CONSTRAINT comp_cat_xref_cat_fk FOREIGN KEY (component_category_id) references informixoltp.component_category_lu (component_category_id);

ALTER TABLE informixoltp.campaign_round_xref  ADD CONSTRAINT campaign_round_xref_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.campaign_round_xref  ADD CONSTRAINT campaign_round_xref_campaign_fk FOREIGN KEY (campaign_id) references informixoltp.campaign (campaign_id);

ALTER TABLE informixoltp.skill  ADD CONSTRAINT skill_skilltype_fk FOREIGN KEY (skill_type_id) references informixoltp.skill_type (skill_type_id);

ALTER TABLE informixoltp.coder_skill_type_note_xref  ADD CONSTRAINT coderskilltypenote_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.coder_skill_type_note_xref  ADD CONSTRAINT coderskilltypenote_skilltype_fk FOREIGN KEY (skill_type_id) references informixoltp.skill_type (skill_type_id);

ALTER TABLE informixoltp.system_test_case  ADD CONSTRAINT system_test_case_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.country_affidavit_template_xref  ADD CONSTRAINT countryaffidavittemplatexref_affidavittemplate_fk FOREIGN KEY (affidavit_template_id) references informixoltp.affidavit_template (affidavit_template_id);

ALTER TABLE informixoltp.message  ADD CONSTRAINT message_messagestatuslu_pk FOREIGN KEY (status_id) references informixoltp.message_status_lu (message_status_id);

ALTER TABLE informixoltp.user_message  ADD CONSTRAINT usermessage_message_fkey FOREIGN KEY (message_id) references informixoltp.message (message_id);

ALTER TABLE informixoltp.user_message  ADD CONSTRAINT usermessage_usermessagestatuslu_pk FOREIGN KEY (status_id) references informixoltp.user_message_status_lu (user_message_status_id);

ALTER TABLE informixoltp.solution_class_file  ADD CONSTRAINT solutionclassfile_solution_fk FOREIGN KEY (solution_id) references informixoltp.solution (solution_id);

ALTER TABLE informixoltp.survey  ADD CONSTRAINT survey_statuslu_fk FOREIGN KEY (status_id) references informixoltp.status_lu (status_id);

ALTER TABLE informixoltp.intro_event_property_lu  ADD CONSTRAINT intro_event_property_fk FOREIGN KEY (property_type_id) references informixoltp.intro_event_property_type_lu (property_type_id);

ALTER TABLE informixoltp.intro_event_config  ADD CONSTRAINT collegetourconfg_collegetourevent_fk FOREIGN KEY (event_id) references informixoltp.intro_event (event_id);

ALTER TABLE informixoltp.intro_event_config  ADD CONSTRAINT collegetourconfg_collegetourproperty_fk FOREIGN KEY (property_id) references informixoltp.intro_event_property_lu (property_id);

ALTER TABLE informixoltp.intro_event  ADD CONSTRAINT collegetourevent_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.intro_event  ADD CONSTRAINT collegetourevent_image_fk FOREIGN KEY (image_id) references informixoltp.image (image_id);

ALTER TABLE informixoltp.intro_event  ADD CONSTRAINT intro_event_command_id_fk FOREIGN KEY (eligibility_command_id) references informixoltp.command (command_id);

ALTER TABLE informixoltp.intro_event  ADD CONSTRAINT collegetourevent_compround_fk FOREIGN KEY (competition_round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.system_test_output  ADD CONSTRAINT systemtestoutput_systemtestresult_fkey FOREIGN KEY (round_id, coder_id, component_id, test_case_id) references informixoltp.system_test_result (round_id, coder_id, component_id, test_case_id);

ALTER TABLE informixoltp.long_component_state  ADD CONSTRAINT longcomponentstate_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.long_component_state  ADD CONSTRAINT longcomponentstate_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.long_component_state  ADD CONSTRAINT longcomponentstate_componentstatuslu_fk FOREIGN KEY (status_id) references informixoltp.component_status_lu (component_status_id);

ALTER TABLE informixoltp.long_component_state  ADD CONSTRAINT longcomponentstate_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.long_compilation  ADD CONSTRAINT longcompilation_longcomponentstate_fk FOREIGN KEY (long_component_state_id) references informixoltp.long_component_state (long_component_state_id);

ALTER TABLE informixoltp.long_comp_result  ADD CONSTRAINT longcompresult_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.long_comp_result  ADD CONSTRAINT longcompresult_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.long_submission  ADD CONSTRAINT longsubmission_problemstate_fk FOREIGN KEY (long_component_state_id) references informixoltp.long_component_state (long_component_state_id);

ALTER TABLE informixoltp.long_system_test_result  ADD CONSTRAINT longsystemtestresult_systemtestcase_fk FOREIGN KEY (test_case_id) references informixoltp.system_test_case (test_case_id);

ALTER TABLE informixoltp.long_system_test_result  ADD CONSTRAINT longsystemtestresult_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.long_system_test_result  ADD CONSTRAINT longsystemtestresult_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.long_system_test_result  ADD CONSTRAINT longsystemtestresult_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.long_test_queue  ADD CONSTRAINT longtestqueue_longcomponentstate_fk FOREIGN KEY (long_component_state_id) references informixoltp.long_component_state (long_component_state_id);

ALTER TABLE informixoltp.long_test_queue  ADD CONSTRAINT longtestqueue_systemtestcase_fk FOREIGN KEY (test_case_id) references informixoltp.system_test_case (test_case_id);

ALTER TABLE informixoltp.long_test_queue  ADD CONSTRAINT longtestqueue_longtestqueuestatuslu_fk FOREIGN KEY (status_id) references informixoltp.long_test_queue_status_lu (status_id);

ALTER TABLE informixoltp.compilation_class_file  ADD CONSTRAINT compilationclassfile_component_state_fk FOREIGN KEY (component_state_id) references informixoltp.component_state (component_state_id);

ALTER TABLE informixoltp.submission_class_file  ADD CONSTRAINT submissionclassfile_submission_fk FOREIGN KEY (component_state_id, submission_number) references informixoltp.submission (component_state_id, submission_number);

ALTER TABLE informixoltp.long_test_group  ADD CONSTRAINT ltg_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.long_test_group  ADD CONSTRAINT ltg_solution_fk FOREIGN KEY (solution_id) references informixoltp.solution (solution_id);

ALTER TABLE informixoltp.long_test_group  ADD CONSTRAINT ltg_type_fk FOREIGN KEY (type_id) references informixoltp.ltg_type_lu (type_id);

ALTER TABLE informixoltp.long_test_group  ADD CONSTRAINT ltg_status_fk FOREIGN KEY (status_id) references informixoltp.ltg_status_lu (status_id);

ALTER TABLE informixoltp.long_test_case  ADD CONSTRAINT ltc_ltg_fk FOREIGN KEY (ltg_id) references informixoltp.long_test_group (ltg_id);

ALTER TABLE informixoltp.long_test_case  ADD CONSTRAINT ltc_status_fk FOREIGN KEY (status_id) references informixoltp.ltc_status_lu (status_id);

ALTER TABLE informixoltp.long_test_case  ADD CONSTRAINT ltc_sytem_test_case_fk FOREIGN KEY (test_case_id) references informixoltp.system_test_case (test_case_id);

ALTER TABLE informixoltp.long_test_result  ADD CONSTRAINT ltr_ltc_fk FOREIGN KEY (ltc_id) references informixoltp.long_test_case (ltc_id);

ALTER TABLE informixoltp.long_test_queue_mpsqas  ADD CONSTRAINT ltq_ltc_fk FOREIGN KEY (ltc_id) references informixoltp.long_test_case (ltc_id);

ALTER TABLE informixoltp.long_test_queue_mpsqas  ADD CONSTRAINT ltq_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.long_test_queue_mpsqas  ADD CONSTRAINT ltq_round_type_lu_fk FOREIGN KEY (round_type_id) references informixoltp.round_type_lu (round_type_id);

ALTER TABLE informixoltp.mpsqas_user_ltg_xref  ADD CONSTRAINT mpsqas_user_ltg_ltg_fk FOREIGN KEY (ltg_id) references informixoltp.long_test_group (ltg_id);

ALTER TABLE informixoltp.algo_rating  ADD CONSTRAINT algo_rating_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.algo_rating  ADD CONSTRAINT algo_rating_ratingtype_fk FOREIGN KEY (algo_rating_type_id) references informixoltp.algo_rating_type_lu (algo_rating_type_id);

ALTER TABLE informixoltp.season  ADD CONSTRAINT season_season_type_id_fkey FOREIGN KEY (season_type_id) references informixoltp.season_type_lu (season_type_id);

ALTER TABLE informixoltp.season_algo_rating  ADD CONSTRAINT season_algo_rating_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.region  ADD CONSTRAINT region_regiontype_fk FOREIGN KEY (region_type_id) references informixoltp.region_type_lu (region_type_id);

ALTER TABLE informixoltp.country_region_xref  ADD CONSTRAINT country_region_xref_region_fk FOREIGN KEY (region_id) references informixoltp.region (region_id);

ALTER TABLE informixoltp.round_group_xref  ADD CONSTRAINT round_group_xref_practice_group_fk FOREIGN KEY (group_id) references informixoltp.practice_group (group_id);

ALTER TABLE informixoltp.round_group_xref  ADD CONSTRAINT round_group_xref_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.team  ADD CONSTRAINT teamtypelu_teamtype_fk FOREIGN KEY (team_type) references informixoltp.team_type_lu (team_type_id);

ALTER TABLE informixoltp.member_contact_black_list  ADD CONSTRAINT member_contact_black_list_user_id_fk FOREIGN KEY (user_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.member_contact_black_list  ADD CONSTRAINT member_contact_black_list_blocked_user_id_fk FOREIGN KEY (blocked_user_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.member_contact_message  ADD CONSTRAINT member_contact_message_sender_id_fk FOREIGN KEY (sender_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.member_contact_message  ADD CONSTRAINT member_contact_message_recipient_id_fk FOREIGN KEY (recipient_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.staging_algo_rating  ADD CONSTRAINT stagingalgorating_backup_id_fk FOREIGN KEY (backup_id) references informixoltp.backup (backup_id);

ALTER TABLE informixoltp.round  ADD CONSTRAINT round_contest_fk FOREIGN KEY (contest_id) references informixoltp.contest (contest_id);

ALTER TABLE informixoltp.round  ADD CONSTRAINT round_roundtypelu_fk FOREIGN KEY (round_type_id) references informixoltp.round_type_lu (round_type_id);

ALTER TABLE informixoltp.round  ADD CONSTRAINT region_round_fk FOREIGN KEY (region_id) references informixoltp.region (region_id);

ALTER TABLE informixoltp.round  ADD CONSTRAINT round_coder_fk FOREIGN KEY (creator_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.command_execution  ADD CONSTRAINT commandexecution_command_fk FOREIGN KEY (command_id) references informixoltp.command (command_id);

ALTER TABLE informixoltp.long_test_score_id  ADD CONSTRAINT long_test_score_id_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.response  ADD CONSTRAINT response_question_fk FOREIGN KEY (question_id) references informixoltp.question (question_id);

ALTER TABLE informixoltp.response  ADD CONSTRAINT response_answer_fk FOREIGN KEY (answer_id) references informixoltp.answer (answer_id);

ALTER TABLE informixoltp.visa_letter_event  ADD CONSTRAINT cvisa_letter_event_contest_fk FOREIGN KEY (contest_id) references informixoltp.contest (contest_id);

ALTER TABLE informixoltp.visa_letter_request  ADD CONSTRAINT visa_letter_request_user_fkey FOREIGN KEY (user_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.visa_letter_request  ADD CONSTRAINT visa_letter_request_event_fkey FOREIGN KEY (visa_letter_event_id) references informixoltp.visa_letter_event (visa_letter_event_id);

ALTER TABLE informixoltp.assignment_document  ADD CONSTRAINT assignment_document_assignment_documenttypelu_fk FOREIGN KEY (assignment_document_type_id) references informixoltp.assignment_document_type_lu (assignment_document_type_id);

ALTER TABLE informixoltp.assignment_document  ADD CONSTRAINT assignment_document_assignment_documentstatuslu_fk FOREIGN KEY (assignment_document_status_id) references informixoltp.assignment_document_status_lu (assignment_document_status_id);

ALTER TABLE informixoltp.assignment_document_template  ADD CONSTRAINT assignment_document_template_assignment_documenttypelu_fk FOREIGN KEY (assignment_document_type_id) references informixoltp.assignment_document_type_lu (assignment_document_type_id);

ALTER TABLE informixoltp.payment_detail_status_reason_xref  ADD CONSTRAINT fk_payment_detail_reason FOREIGN KEY (payment_detail_id) references informixoltp.payment_detail (payment_detail_id);

ALTER TABLE informixoltp.payment_detail_status_reason_xref  ADD CONSTRAINT fk_payment_status_reason_reason FOREIGN KEY (payment_status_reason_id) references informixoltp.payment_status_reason_lu (payment_status_reason_id);

ALTER TABLE informixoltp.round_language  ADD CONSTRAINT round_language_language_fk FOREIGN KEY (language_id) references informixoltp.language (language_id);

ALTER TABLE informixoltp.round_language  ADD CONSTRAINT round_language_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.generic_counter  ADD CONSTRAINT generic_counter_generic_counter_client FOREIGN KEY (client_id) references informixoltp.generic_counter_client (client_id);

ALTER TABLE informixoltp.room_result  ADD CONSTRAINT roomresult_roundpayment_fk FOREIGN KEY (round_payment_id) references informixoltp.round_payment (round_payment_id);

ALTER TABLE informixoltp.room_result  ADD CONSTRAINT roomresult_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.room_result  ADD CONSTRAINT roomresult_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.room_result  ADD CONSTRAINT roomresult_room_fk FOREIGN KEY (room_id) references informixoltp.room (room_id);

ALTER TABLE informixoltp.classroom  ADD CONSTRAINT fk_classroom_classroomstatus FOREIGN KEY (status_id) references informixoltp.classroom_status_lu (status_id);

ALTER TABLE informixoltp.student_classroom_xref  ADD CONSTRAINT fk_studentclassroom_classroom FOREIGN KEY (classroom_id) references informixoltp.classroom (classroom_id);

ALTER TABLE informixoltp.student_classroom_xref  ADD CONSTRAINT fk_classroom_studentclassroomstatus FOREIGN KEY (status_id) references informixoltp.student_classroom_status_lu (status_id);

ALTER TABLE informixoltp.round_property  ADD CONSTRAINT fk_roundproperty_round FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.round_property  ADD CONSTRAINT fk_roundproperty_roundpropertylu FOREIGN KEY (round_property_type_id) references informixoltp.round_property_type_lu (round_property_type_id);

ALTER TABLE informixoltp.problem_set_component_xref  ADD CONSTRAINT fk_collegeproblemsetcomponent_problemset FOREIGN KEY (problem_set_id) references informixoltp.college_problem_set (problem_set_id);

ALTER TABLE informixoltp.problem_set_component_xref  ADD CONSTRAINT fk_collegeproblemsetcomponent_component FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.payment_type_lu  ADD CONSTRAINT r595_848 FOREIGN KEY (payment_reference_id) references informixoltp.payment_reference_lu (payment_reference_id);

ALTER TABLE informixoltp.long_system_test_data  ADD CONSTRAINT longsystemtestdata_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.long_system_test_data  ADD CONSTRAINT longsystemtestdata_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);

ALTER TABLE informixoltp.long_system_test_data  ADD CONSTRAINT longsystemtestdata_coder_fk FOREIGN KEY (coder_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.long_system_test_data  ADD CONSTRAINT longsystemtestdata_testcase_fk FOREIGN KEY (test_case_id) references informixoltp.system_test_case (test_case_id);

CREATE INDEX IF NOT EXISTS paymnt_dtl_studio_cntst_idx ON informixoltp.payment_detail
    (
    studio_contest_id
    );

ALTER TABLE informixoltp.invoice_record  ADD CONSTRAINT fk_invoicerecord_invoicetypelu FOREIGN KEY (invoice_type_id) references informixoltp.invoice_type_lu (invoice_type_id);
    
ALTER TABLE informixoltp.invoice_record  ADD CONSTRAINT fk_invoicerecord_payment FOREIGN KEY (payment_id) references informixoltp.payment (payment_id);

CREATE unique INDEX IF NOT EXISTS invoice_record1 ON informixoltp.invoice_record
    (
    jira_issue_id, contest_id,invoice_type_id,payment_id, reference_id
    );
    
CREATE UNIQUE INDEX IF NOT EXISTS invoice_invoice_number ON informixoltp.invoice (invoice_number);

ALTER TABLE informixoltp.round_event ADD CONSTRAINT round_event_pkey PRIMARY KEY (round_id, event_id);
    
ALTER TABLE informixoltp.round_event  ADD CONSTRAINT roundevt_round_to_event_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);
	
ALTER TABLE informixoltp.problem_round_type_lu ADD CONSTRAINT problem_round_type_lu_pk PRIMARY KEY (problem_round_type_id);
	
ALTER TABLE informixoltp.long_component_configuration ADD CONSTRAINT long_component_configuration_pk PRIMARY KEY (component_id);

ALTER TABLE informixoltp.long_component_configuration  ADD CONSTRAINT longcomponentconfiguration_component_fk FOREIGN KEY (component_id) references informixoltp.component (component_id);
    
ALTER TABLE informixoltp.custom_build_setting_type_lu ADD CONSTRAINT custom_build_setting_type_lu_pk PRIMARY KEY (custom_build_setting_type_id); 
    
ALTER TABLE informixoltp.custom_build_setting ADD CONSTRAINT custom_build_setting_pk PRIMARY KEY (custom_build_setting_id);

ALTER TABLE informixoltp.custom_build_setting  ADD CONSTRAINT custombuildsetting_custombuildsettingtype_fk FOREIGN KEY (custom_build_setting_type_id) references informixoltp.custom_build_setting_type_lu (custom_build_setting_type_id);
    
ALTER TABLE informixoltp.user_api_spin ADD CONSTRAINT user_api_spin_pkey PRIMARY KEY (user_id, api_ranking);
    
ALTER TABLE informixoltp.user_api_spin  ADD CONSTRAINT user_api_spin_user_id_fk FOREIGN KEY (user_id) references informixoltp.coder (coder_id);

ALTER TABLE informixoltp.round_prize  ADD CONSTRAINT round_prize_round_fk FOREIGN KEY (round_id) references informixoltp.round (round_id);

ALTER TABLE informixoltp.docusign_envelope ADD CONSTRAINT informixoltp PRIMARY KEY (docusign_envelope_id);

ALTER TABLE informixoltp.user_action_audit ADD CONSTRAINT user_action_audit_pk PRIMARY KEY (user_action_audit_id);
