SET search_path TO common_oltp;

CREATE unique INDEX IF NOT EXISTS security_user_i2 ON common_oltp.security_user
    (
    user_id
    );

ALTER TABLE common_oltp.security_user ADD CONSTRAINT pk_security_user PRIMARY KEY (login_id);

CREATE UNIQUE INDEX IF NOT EXISTS user_role_xref_i2 ON common_oltp.user_role_xref
    (
    login_id, 
    role_id
    );
ALTER TABLE common_oltp.user_role_xref CLUSTER ON user_role_xref_i2;

ALTER TABLE common_oltp.user_role_xref ADD CONSTRAINT pk_user_role_xref PRIMARY KEY (user_role_id);

CREATE UNIQUE INDEX IF NOT EXISTS user_grp_xref_i2 ON common_oltp.user_group_xref
    (
    login_id, 
    group_id
    );
ALTER TABLE common_oltp.user_group_xref CLUSTER ON user_grp_xref_i2;

ALTER TABLE common_oltp.user_group_xref ADD CONSTRAINT pk_user_group_xref PRIMARY KEY (user_group_id);

ALTER TABLE common_oltp.security_groups ADD CONSTRAINT pk_security_groups PRIMARY KEY (group_id);

CREATE UNIQUE INDEX IF NOT EXISTS group_role_xref_i2 ON common_oltp.group_role_xref
    (
    group_id, 
    role_id
    );
ALTER TABLE common_oltp.group_role_xref CLUSTER ON group_role_xref_i2;

ALTER TABLE common_oltp.group_role_xref ADD CONSTRAINT pk_group_role_xref PRIMARY KEY (group_role_id);

ALTER TABLE common_oltp.security_roles ADD CONSTRAINT pk_security_roles PRIMARY KEY (role_id);

ALTER TABLE common_oltp.security_perms ADD CONSTRAINT pk_security_perms PRIMARY KEY (role_id, permission);

ALTER TABLE common_oltp.address ADD CONSTRAINT u107_20 PRIMARY KEY (address_id);

ALTER TABLE common_oltp.address_type_lu ADD CONSTRAINT u108_21 PRIMARY KEY (address_type_id);

ALTER TABLE common_oltp.phone_type_lu ADD CONSTRAINT u109_22 PRIMARY KEY (phone_type_id);

CREATE INDEX IF NOT EXISTS email_user_id_idx ON common_oltp.email
    (
    user_id, 
    primary_ind
    );

ALTER TABLE common_oltp.email ADD CONSTRAINT u110_23 PRIMARY KEY (email_id);

ALTER TABLE common_oltp.user_address_xref ADD CONSTRAINT u111_24 PRIMARY KEY (user_id, address_id);

CREATE INDEX IF NOT EXISTS phone_user_id_idx ON common_oltp.phone
    (
    user_id, 
    primary_ind
    );

CREATE INDEX IF NOT EXISTS contest_elig_idx1 ON common_oltp.contest_eligibility
	(
	contest_id
	);


CREATE unique INDEX IF NOT EXISTS page_tracker_i2 ON common_oltp.page_tracker
(
tracking_id
);
	
CREATE unique INDEX IF NOT EXISTS page_tracker_action_i2 ON common_oltp.page_tracker_action
    (
    action_id
    );
	
	
ALTER TABLE common_oltp.phone ADD CONSTRAINT u112_25 PRIMARY KEY (phone_id);

ALTER TABLE common_oltp.user_status_lu ADD CONSTRAINT u113_26 PRIMARY KEY (user_status_id);

ALTER TABLE common_oltp.terms_of_use_agreeability_type_lu ADD CONSTRAINT terms_of_use_agreeability_type_lu_pk PRIMARY KEY (terms_of_use_agreeability_type_id);

ALTER TABLE common_oltp.terms_of_use_dependency ADD CONSTRAINT terms_of_use_dependency_pk PRIMARY KEY (dependency_terms_of_use_id, dependent_terms_of_use_id);
	
ALTER TABLE common_oltp.terms_of_use ADD CONSTRAINT u114_27 PRIMARY KEY (terms_of_use_id);

ALTER TABLE common_oltp.terms_of_use  ADD CONSTRAINT terms_of_use_terms_of_use_agreeability_type_fk FOREIGN KEY (terms_of_use_agreeability_type_id) references common_oltp.terms_of_use_agreeability_type_lu (terms_of_use_agreeability_type_id);

ALTER TABLE common_oltp.terms_of_use_dependency  ADD CONSTRAINT terms_of_use_dependency_fk FOREIGN KEY (dependency_terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.terms_of_use_dependency  ADD CONSTRAINT terms_of_use_dependent_fk FOREIGN KEY (dependent_terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.terms_of_use_type ADD CONSTRAINT u115_28 PRIMARY KEY (terms_of_use_type_id);

ALTER TABLE common_oltp.user_terms_of_use_xref ADD CONSTRAINT u116_29 PRIMARY KEY (user_id, terms_of_use_id);

ALTER TABLE common_oltp.user_terms_of_use_ban_xref ADD CONSTRAINT user_terms_of_use_ban_xref_pk PRIMARY KEY (user_id, terms_of_use_id);

ALTER TABLE common_oltp.project_role_terms_of_use_xref ADD CONSTRAINT pk_project_role_terms_of_use_xref PRIMARY KEY (project_id, resource_role_id, terms_of_use_id, group_ind);

ALTER TABLE common_oltp.terms_of_use_docusign_template_xref ADD CONSTRAINT terms_of_use_docusign_template_xref_pk PRIMARY KEY (terms_of_use_id);

ALTER TABLE common_oltp.terms_of_use_docusign_template_xref  ADD CONSTRAINT terms_of_use_docusign_template_xref_terms_of_use_fk FOREIGN KEY (terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.state ADD CONSTRAINT state_pkey PRIMARY KEY (state_code);

ALTER TABLE common_oltp.country ADD CONSTRAINT country_pkey PRIMARY KEY (country_code);

ALTER TABLE common_oltp.continent ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);

ALTER TABLE common_oltp.note ADD CONSTRAINT note_pk PRIMARY KEY (note_id);

ALTER TABLE common_oltp.user_note_xref ADD CONSTRAINT user_note_xref_pk PRIMARY KEY (user_id, note_id);

ALTER TABLE common_oltp.note_type_lu ADD CONSTRAINT note_type_lu_pk PRIMARY KEY (note_type_id);

ALTER TABLE common_oltp.email_type_lu ADD CONSTRAINT email_type_lu_pk PRIMARY KEY (email_type_id);

ALTER TABLE common_oltp.key_generation ADD CONSTRAINT key_generation_pk PRIMARY KEY (user_def);

ALTER TABLE common_oltp.company ADD CONSTRAINT u171_139 PRIMARY KEY (company_id);

CREATE INDEX IF NOT EXISTS sequence_object_idx1 ON common_oltp.sequence_object
    (
    id
    );

ALTER TABLE common_oltp.sequence_object ADD CONSTRAINT sequence_object_pkey PRIMARY KEY (name);

ALTER TABLE common_oltp.company_datasource_xref ADD CONSTRAINT company_datasource_pkey PRIMARY KEY (company_id, datasource_id);

ALTER TABLE common_oltp.datasource_type_lu ADD CONSTRAINT u131_66 PRIMARY KEY (datasource_type_id);

ALTER TABLE common_oltp.datasource_lu ADD CONSTRAINT u130_61 PRIMARY KEY (datasource_id);

ALTER TABLE common_oltp.achievement_type_lu ADD CONSTRAINT achv_type_lu_pkey PRIMARY KEY (achievement_type_id);

ALTER TABLE common_oltp.preference_group_lu ADD CONSTRAINT preferencegroup_pk PRIMARY KEY (preference_group_id);

ALTER TABLE common_oltp.preference_lu ADD CONSTRAINT preference_pk PRIMARY KEY (preference_id);

ALTER TABLE common_oltp.user_status_type_lu ADD CONSTRAINT userstatustypelu_pk PRIMARY KEY (user_status_type_id);

ALTER TABLE common_oltp.user_status ADD CONSTRAINT userstatus_pk PRIMARY KEY (user_id, user_status_type_id);

ALTER TABLE common_oltp.event_lu ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);

ALTER TABLE common_oltp.user_event_status_lu ADD CONSTRAINT usereventstatuslu_pkey PRIMARY KEY (status_id);

ALTER TABLE common_oltp.user_event ADD CONSTRAINT userevent_pkey PRIMARY KEY (user_event_id);

ALTER TABLE common_oltp.email_status_lu ADD CONSTRAINT email_status_lu_pk PRIMARY KEY (status_id);

ALTER TABLE common_oltp.bounce_type_lu ADD CONSTRAINT bounce_type_lu_pkey PRIMARY KEY (bounce_type);

ALTER TABLE common_oltp.preference_value ADD CONSTRAINT preferencevalue_pk PRIMARY KEY (preference_value_id);

ALTER TABLE common_oltp.preference_type_lu ADD CONSTRAINT preferencetype_pk PRIMARY KEY (preference_type_id);

ALTER TABLE common_oltp.timezone_lu ADD CONSTRAINT timezone_lu_pk PRIMARY KEY (timezone_id);

ALTER TABLE common_oltp.company_terms_of_use_xref ADD CONSTRAINT company_terms_of_use_pk PRIMARY KEY (company_id, terms_of_use_id);

ALTER TABLE common_oltp.user_preference ADD CONSTRAINT userpreference_pk PRIMARY KEY (user_id, preference_id);

CREATE INDEX IF NOT EXISTS calendar_date_idx ON common_oltp.calendar
    (
    date
    );

ALTER TABLE common_oltp.calendar ADD CONSTRAINT calendar_pkey PRIMARY KEY (calendar_id);

CREATE INDEX IF NOT EXISTS audituser_userid_indx ON common_oltp.audit_user
    (
    user_id
    );

ALTER TABLE common_oltp.security_status_lu ADD CONSTRAINT securitystatuslu_pkey PRIMARY KEY (security_status_id);

ALTER TABLE common_oltp.registration_type_lu ADD CONSTRAINT registrationtypelu_pkey PRIMARY KEY (registration_type_id);

ALTER TABLE common_oltp.notify_lu ADD CONSTRAINT notify_lu_pk PRIMARY KEY (notify_id);

ALTER TABLE common_oltp.user_notify_xref ADD CONSTRAINT usernotifyxref_pk PRIMARY KEY (user_id, notify_id);

ALTER TABLE common_oltp.registration_type_notify_xref ADD CONSTRAINT regtypenotifyxref_pk PRIMARY KEY (registration_type_id, notify_id);

ALTER TABLE common_oltp.demographic_question ADD CONSTRAINT demographic_question_pkey PRIMARY KEY (demographic_question_id);

CREATE INDEX IF NOT EXISTS demographicquesans_idx ON common_oltp.demographic_answer
    (
    demographic_question_id, 
    demographic_answer_id
    );

ALTER TABLE common_oltp.demographic_answer ADD CONSTRAINT demographic_answer_pkey PRIMARY KEY (demographic_answer_id);

CREATE INDEX IF NOT EXISTS demographic_response_idx1 ON common_oltp.demographic_response
    (
    demographic_question_id, 
    demographic_answer_id, 
    user_id
    );

ALTER TABLE common_oltp.demographic_assignment ADD CONSTRAINT demographic_assignment_pkey PRIMARY KEY (demographic_question_id, coder_type_id, registration_type_id);

ALTER TABLE common_oltp.id_sequences ADD CONSTRAINT id_sequences_pkey PRIMARY KEY (name);

ALTER TABLE common_oltp.password_recovery ADD CONSTRAINT password_recovery_pkey PRIMARY KEY (password_recovery_id);

ALTER TABLE common_oltp.secret_question ADD CONSTRAINT secret_question_pkey PRIMARY KEY (user_id);

ALTER TABLE common_oltp.event_type_lu ADD CONSTRAINT event_type_pkey PRIMARY KEY (event_type_id);

ALTER TABLE common_oltp.event ADD CONSTRAINT event_prkey PRIMARY KEY (event_id);

ALTER TABLE common_oltp.event_registration ADD CONSTRAINT eventregistration_pkey PRIMARY KEY (user_id, event_id);

CREATE INDEX IF NOT EXISTS user_handle_idx ON common_oltp.user
    (
    handle
    );

CREATE INDEX IF NOT EXISTS user_lower_handle_idx ON common_oltp.user
    (
    handle_lower
    );

ALTER TABLE common_oltp.user ADD CONSTRAINT u175_45 PRIMARY KEY (user_id);

ALTER TABLE common_oltp.registration_type_preference_xref ADD CONSTRAINT regtypepreferencexref_pk PRIMARY KEY (registration_type_id, preference_id);

ALTER TABLE common_oltp.notify_type_lu ADD CONSTRAINT notifytype_pk PRIMARY KEY (notify_type_id);

ALTER TABLE common_oltp.school_type_lu ADD CONSTRAINT schooltypelu_pk PRIMARY KEY (school_type_id);

ALTER TABLE common_oltp.school ADD CONSTRAINT school_pkey PRIMARY KEY (school_id);

ALTER TABLE common_oltp.school_association_type_lu ADD CONSTRAINT school_association_type_pkey PRIMARY KEY (school_association_type_id);

ALTER TABLE common_oltp.user_school ADD CONSTRAINT user_school_pk PRIMARY KEY (user_school_id);

ALTER TABLE common_oltp.professor_status_lu ADD CONSTRAINT pk_professorstatus PRIMARY KEY (status_id);

ALTER TABLE common_oltp.professor ADD CONSTRAINT pk_professor PRIMARY KEY (user_id);

ALTER TABLE common_oltp.permission_code ADD CONSTRAINT pk_permission_code PRIMARY KEY (code);
	
ALTER TABLE common_oltp.invalid_handles ADD CONSTRAINT pk_invalid_hand556 PRIMARY KEY (invalid_handle_id);
	
ALTER TABLE common_oltp.page_tracker ADD CONSTRAINT pk_page_tracker PRIMARY KEY (tracking_id);

ALTER TABLE common_oltp.page_tracker_action ADD CONSTRAINT pk_page_tracker_action PRIMARY KEY (action_id);

ALTER TABLE common_oltp.gov_id_document ADD CONSTRAINT goviddocument_pkey PRIMARY KEY (gov_id_document_id);

ALTER TABLE common_oltp.corona_event_type ADD CONSTRAINT corona_event_type_pkey PRIMARY KEY (corona_event_type_id);

ALTER TABLE common_oltp.corona_event ADD CONSTRAINT corona_event_prkey PRIMARY KEY (corona_event_id);
	
ALTER TABLE common_oltp.social_login_provider ADD CONSTRAINT social_provider_prkey PRIMARY KEY (social_login_provider_id);
	
ALTER TABLE common_oltp.user_social_login ADD CONSTRAINT user_social_prkey PRIMARY KEY (user_id, social_login_provider_id);

ALTER TABLE common_oltp.sso_login_provider ADD CONSTRAINT sso_provider_prkey PRIMARY KEY (sso_login_provider_id);
	
ALTER TABLE common_oltp.user_sso_login ADD CONSTRAINT user_sso_prkey PRIMARY KEY (user_id, provider_id);

CREATE INDEX IF NOT EXISTS idx_user_social_login_sso_user_id_provider_id ON common_oltp.user_sso_login
    (
    sso_user_id,
    provider_id
    );

ALTER TABLE common_oltp.user_role_xref ADD CONSTRAINT fk_user_role_xref1 FOREIGN KEY (login_id)
    references common_oltp.security_user
    (login_id) ON delete CASCADE;

ALTER TABLE common_oltp.user_role_xref ADD CONSTRAINT fk_user_role_xref2 FOREIGN KEY (role_id)
    references common_oltp.security_roles
    (role_id) ON delete CASCADE;

ALTER TABLE common_oltp.user_role_xref  ADD CONSTRAINT userrolexref_status_fk FOREIGN KEY (security_status_id) references common_oltp.security_status_lu (security_status_id);

ALTER TABLE common_oltp.user_group_xref ADD CONSTRAINT fk_user_grp_xref1 FOREIGN KEY (login_id)
    references common_oltp.security_user
    (login_id) ON delete CASCADE;

ALTER TABLE common_oltp.user_group_xref ADD CONSTRAINT fk_user_grp_xref2 FOREIGN KEY (group_id)
    references common_oltp.security_groups
    (group_id) ON delete CASCADE;

ALTER TABLE common_oltp.user_group_xref  ADD CONSTRAINT usergroupxref_status_fk FOREIGN KEY (security_status_id) references common_oltp.security_status_lu (security_status_id);

ALTER TABLE common_oltp.group_role_xref ADD CONSTRAINT fk_grp_role_xref1 FOREIGN KEY (group_id)
    references common_oltp.security_groups
    (group_id) ON delete CASCADE;

ALTER TABLE common_oltp.group_role_xref ADD CONSTRAINT fk_grp_role_xref2 FOREIGN KEY (role_id)
    references common_oltp.security_roles
    (role_id) ON delete CASCADE;

ALTER TABLE common_oltp.group_role_xref  ADD CONSTRAINT grouprolexref_status_fk FOREIGN KEY (security_status_id) references common_oltp.security_status_lu (security_status_id);

ALTER TABLE common_oltp.security_perms ADD CONSTRAINT fk_security_perm FOREIGN KEY (role_id)
    references common_oltp.security_roles
    (role_id) ON delete CASCADE;

ALTER TABLE common_oltp.security_perms  ADD CONSTRAINT securityperms_status_fk FOREIGN KEY (security_status_id) references common_oltp.security_status_lu (security_status_id);

ALTER TABLE common_oltp.email  ADD CONSTRAINT email_emailtypelu_fk FOREIGN KEY (email_type_id) references common_oltp.email_type_lu (email_type_id);

ALTER TABLE common_oltp.email  ADD CONSTRAINT email_emailstatuslu_fk FOREIGN KEY (status_id) references common_oltp.email_status_lu (status_id);

ALTER TABLE common_oltp.phone  ADD CONSTRAINT phone_phonetypelu_fk FOREIGN KEY (phone_type_id) references common_oltp.phone_type_lu (phone_type_id);

ALTER TABLE common_oltp.user_terms_of_use_xref  ADD CONSTRAINT userterms_terms_fk FOREIGN KEY (terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.user_terms_of_use_xref  ADD CONSTRAINT usertermsofusexref_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_terms_of_use_ban_xref  ADD CONSTRAINT usertermsofusebanxref_termsofuse_fk FOREIGN KEY (terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.user_terms_of_use_ban_xref  ADD CONSTRAINT usertermsofusebanxref_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.terms_of_use  ADD CONSTRAINT termsofuse_termsofusetype_fk FOREIGN KEY (terms_of_use_type_id) references common_oltp.terms_of_use_type (terms_of_use_type_id);

ALTER TABLE common_oltp.project_role_terms_of_use_xref  ADD CONSTRAINT project_role_terms_terms_fk FOREIGN KEY (terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.contact  ADD CONSTRAINT contact_company_fk FOREIGN KEY (company_id) references common_oltp.company (company_id);

ALTER TABLE common_oltp.contact  ADD CONSTRAINT contact_user_fk FOREIGN KEY (contact_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.note  ADD CONSTRAINT note_note_type_lu_fk FOREIGN KEY (note_type_id) references common_oltp.note_type_lu (note_type_id);

ALTER TABLE common_oltp.user_note_xref  ADD CONSTRAINT user_note_xref_note FOREIGN KEY (note_id) references common_oltp.note (note_id);

ALTER TABLE common_oltp.user_note_xref  ADD CONSTRAINT user_note_xref_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.company  ADD CONSTRAINT company_timezone_fk FOREIGN KEY (timezone_id) references common_oltp.timezone_lu (timezone_id);

ALTER TABLE common_oltp.datasource_lu  ADD CONSTRAINT fk_datasource_type FOREIGN KEY (datasource_type_id) references common_oltp.datasource_type_lu (datasource_type_id);

ALTER TABLE common_oltp.user_achievement  ADD CONSTRAINT achv_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_achievement  ADD CONSTRAINT achv_type_fk FOREIGN KEY (achievement_type_id) references common_oltp.achievement_type_lu (achievement_type_id);

ALTER TABLE common_oltp.preference_lu  ADD CONSTRAINT preference_preference_group_fk FOREIGN KEY (preference_group_id) references common_oltp.preference_group_lu (preference_group_id);

ALTER TABLE common_oltp.preference_lu  ADD CONSTRAINT preference_preferencetype_fk FOREIGN KEY (preference_type_id) references common_oltp.preference_type_lu (preference_type_id);

ALTER TABLE common_oltp.user_status  ADD CONSTRAINT userstatus_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_status  ADD CONSTRAINT userstatus_userstatustype_fk FOREIGN KEY (user_status_type_id) references common_oltp.user_status_type_lu (user_status_type_id);

ALTER TABLE common_oltp.user_status  ADD CONSTRAINT userstatus_userstatuslu_fk FOREIGN KEY (user_status_id) references common_oltp.user_status_lu (user_status_id);

ALTER TABLE common_oltp.user_event  ADD CONSTRAINT userevent_eventlu_fk FOREIGN KEY (event_id) references common_oltp.event_lu (event_id);

ALTER TABLE common_oltp.user_event  ADD CONSTRAINT userevent_usereventstatuslu_fk FOREIGN KEY (status_id) references common_oltp.user_event_status_lu (status_id);

ALTER TABLE common_oltp.user_event  ADD CONSTRAINT userevent_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.preference_value  ADD CONSTRAINT preferencevalue_preference_fk FOREIGN KEY (preference_id) references common_oltp.preference_lu (preference_id);

ALTER TABLE common_oltp.company_terms_of_use_xref  ADD CONSTRAINT companytermsofuse_company_fk FOREIGN KEY (company_id) references common_oltp.company (company_id);

ALTER TABLE common_oltp.user_preference  ADD CONSTRAINT userpreference_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_preference  ADD CONSTRAINT userpreference_preference_fk FOREIGN KEY (preference_id) references common_oltp.preference_lu (preference_id);

ALTER TABLE common_oltp.user_preference  ADD CONSTRAINT userpreference_preferencevalue_fk FOREIGN KEY (preference_value_id) references common_oltp.preference_value (preference_value_id);

ALTER TABLE common_oltp.registration_type_lu  ADD CONSTRAINT regtype_securitygroup_fkey FOREIGN KEY (security_group_id) references common_oltp.security_groups (group_id);

ALTER TABLE common_oltp.notify_lu  ADD CONSTRAINT notify_notifytype_fk FOREIGN KEY (notify_type_id) references common_oltp.notify_type_lu (notify_type_id);

ALTER TABLE common_oltp.user_notify_xref  ADD CONSTRAINT usernotifyxref_notifylu_fk FOREIGN KEY (notify_id) references common_oltp.notify_lu (notify_id);

ALTER TABLE common_oltp.user_notify_xref  ADD CONSTRAINT usernotifyxref_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.registration_type_notify_xref  ADD CONSTRAINT regtypexref_notifylu_fk FOREIGN KEY (notify_id) references common_oltp.notify_lu (notify_id);

ALTER TABLE common_oltp.registration_type_notify_xref  ADD CONSTRAINT regtypexref_notify_fk FOREIGN KEY (registration_type_id) references common_oltp.registration_type_lu (registration_type_id);

ALTER TABLE common_oltp.demographic_answer  ADD CONSTRAINT demoanswer_demoquestion_fk FOREIGN KEY (demographic_question_id) references common_oltp.demographic_question (demographic_question_id);

ALTER TABLE common_oltp.demographic_response  ADD CONSTRAINT demoresponse_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.demographic_response  ADD CONSTRAINT demoresponse_demoquestion_fk FOREIGN KEY (demographic_question_id) references common_oltp.demographic_question (demographic_question_id);

ALTER TABLE common_oltp.demographic_response  ADD CONSTRAINT demoresponse_demoanswer_fk FOREIGN KEY (demographic_answer_id) references common_oltp.demographic_answer (demographic_answer_id);

ALTER TABLE common_oltp.demographic_assignment  ADD CONSTRAINT demoassign_demoquestion_fk FOREIGN KEY (demographic_question_id) references common_oltp.demographic_question (demographic_question_id);

ALTER TABLE common_oltp.password_recovery  ADD CONSTRAINT password_recovery_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.secret_question  ADD CONSTRAINT secret_question_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.event  ADD CONSTRAINT event_terms_fk FOREIGN KEY (terms_of_use_id) references common_oltp.terms_of_use (terms_of_use_id);

ALTER TABLE common_oltp.event  ADD CONSTRAINT event_eventtype_fk FOREIGN KEY (event_type_id) references common_oltp.event_type_lu (event_type_id);

ALTER TABLE common_oltp.event  ADD CONSTRAINT event_parent_id_fk FOREIGN KEY (parent_event_id) references common_oltp.event (event_id);

ALTER TABLE common_oltp.event_registration  ADD CONSTRAINT eventreg_event_fk FOREIGN KEY (event_id) references common_oltp.event (event_id);

ALTER TABLE common_oltp.event_registration  ADD CONSTRAINT eventreg_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user  ADD CONSTRAINT user_timezonelu_fk FOREIGN KEY (timezone_id) references common_oltp.timezone_lu (timezone_id);

ALTER TABLE common_oltp.registration_type_preference_xref  ADD CONSTRAINT regtypexref_preferencelu_fk FOREIGN KEY (preference_id) references common_oltp.preference_lu (preference_id);

ALTER TABLE common_oltp.registration_type_preference_xref  ADD CONSTRAINT regtypexref_preference_fk FOREIGN KEY (registration_type_id) references common_oltp.registration_type_lu (registration_type_id);

ALTER TABLE common_oltp.school  ADD CONSTRAINT school_schooltype_fk FOREIGN KEY (school_type_id) references common_oltp.school_type_lu (school_type_id);

ALTER TABLE common_oltp.user_school  ADD CONSTRAINT user_school_school_fk FOREIGN KEY (school_id) references common_oltp.school (school_id);

ALTER TABLE common_oltp.user_school  ADD CONSTRAINT userschool_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_school  ADD CONSTRAINT userschool_schoolassociationtype_fk FOREIGN KEY (school_association_type_id) references common_oltp.school_association_type_lu (school_association_type_id);

ALTER TABLE common_oltp.professor  ADD CONSTRAINT fk_professor_user FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.professor  ADD CONSTRAINT fk_professor_professorstatus FOREIGN KEY (status_id) references common_oltp.professor_status_lu (status_id);

ALTER TABLE common_oltp.permission_code  ADD CONSTRAINT fk_permission_code_security_groups FOREIGN KEY (group_id) references common_oltp.security_groups (group_id);


ALTER TABLE common_oltp.group_contest_eligibility  ADD CONSTRAINT contest_eligibility_fk FOREIGN KEY (contest_eligibility_id) references common_oltp.contest_eligibility (contest_eligibility_id);

ALTER TABLE common_oltp.client_terms_mapping  ADD CONSTRAINT client_terms_mapping_terms_fk FOREIGN KEY (terms_of_use_id ) references common_oltp.terms_of_use (terms_of_use_id);


ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_image_security_groups_fk FOREIGN KEY (vm_security_group_id) references common_oltp.vm_security_group (vm_security_group_id);

ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_image_instance_type_fk FOREIGN KEY (vm_instance_type_id) references common_oltp.vm_instance_type (vm_instance_type_id);

ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_image_availability_zone_fk FOREIGN KEY (vm_availability_zone_id) references common_oltp.vm_availability_zone (vm_availability_zone_id);

ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_image_key_pair_fk FOREIGN KEY (vm_key_pair_id) references common_oltp.vm_key_pair (vm_key_pair_id);

ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_provider_fk FOREIGN KEY (vm_provider_id) references common_oltp.vm_provider (vm_provider_id);
    
ALTER TABLE common_oltp.vm_image_user_data  ADD CONSTRAINT vm_image_user_data_vm_image_fk FOREIGN KEY (vm_image_id) references common_oltp.vm_image (vm_image_id);

ALTER TABLE common_oltp.vm_image_user_data  ADD CONSTRAINT vm_image_user_data_user_data_fk FOREIGN KEY (vm_user_data_id) references common_oltp.vm_user_data (vm_user_data_id);
    
    
ALTER TABLE common_oltp.vm_instance  ADD CONSTRAINT vm_instance_image_fk FOREIGN KEY (vm_image_id) references common_oltp.vm_image (vm_image_id);

 ALTER TABLE common_oltp.vm_image  ADD CONSTRAINT vm_image_vm_accout_fk FOREIGN KEY (vm_account_id) references common_oltp.vm_account (vm_account_id);
	
ALTER TABLE common_oltp.vm_account_user  ADD CONSTRAINT vm_account_user_vm_account_fk FOREIGN KEY (vm_account_id) references common_oltp.vm_account (vm_account_id);
        
ALTER TABLE common_oltp.vm_account_user  ADD CONSTRAINT vm_account_user_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);
	
ALTER TABLE common_oltp.vm_instance  ADD CONSTRAINT vm_instance_account_user_fk FOREIGN KEY (vm_account_user_id) references common_oltp.vm_account_user (vm_account_user_id);


 ALTER TABLE common_oltp.vm_instance  ADD CONSTRAINT vm_instance_usage_fk FOREIGN KEY (vm_usage_id) references common_oltp.vm_usage (vm_usage_id);

ALTER TABLE common_oltp.vm_instance  ADD CONSTRAINT vm_instance_contest_type_fk FOREIGN KEY (vm_contest_type_id) references common_oltp.vm_contest_type (vm_contest_type_id);

ALTER TABLE common_oltp.member_image ADD CONSTRAINT member_image_photo_fk FOREIGN KEY (image_id) references common_oltp.photo_image (image_id);
        
ALTER TABLE common_oltp.member_image ADD CONSTRAINT member_image_user_fk FOREIGN KEY (member_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.page_tracker  ADD CONSTRAINT action_fk FOREIGN KEY (action_id) references common_oltp.page_tracker_action (action_id);

ALTER TABLE common_oltp.gov_id_document  ADD CONSTRAINT goviddocument_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.gov_id_document  ADD CONSTRAINT goviddocument_country_fk FOREIGN KEY (country_code) references common_oltp.country (country_code);
	

ALTER TABLE access_token ADD CONSTRAINT pk_access_token PRIMARY KEY (access_token_id);
    
ALTER TABLE authorization_code_grant ADD CONSTRAINT pk_authorization_code_grant PRIMARY KEY (authorization_code_grant_id);


ALTER TABLE oauth_permission ADD CONSTRAINT pk_permission PRIMARY KEY (permission_id);


ALTER TABLE http_verb ADD CONSTRAINT pk_http_verb PRIMARY KEY (http_verb_id);


ALTER TABLE http_uri ADD CONSTRAINT pk_http_uri PRIMARY KEY (http_uri_id);


ALTER TABLE oauth_permission_has_http_verb ADD CONSTRAINT pk_permission_has_http_verb PRIMARY KEY (permission_permission_id, http_verb_http_verb_id);
    
ALTER TABLE oauth_permission_has_http_verb  ADD CONSTRAINT fk_permission_has_http_verb_1 FOREIGN KEY (permission_permission_id) references common_oltp.oauth_permission (permission_id);
    
ALTER TABLE oauth_permission_has_http_verb  ADD CONSTRAINT fk_permission_has_http_verb_2 FOREIGN KEY (http_verb_http_verb_id) references common_oltp.http_verb (http_verb_id);


ALTER TABLE oauth_permission_has_http_uri ADD CONSTRAINT pk_permission_has_http_uri PRIMARY KEY (permission_permission_id, http_uri_http_uri_id);
    
ALTER TABLE oauth_permission_has_http_uri  ADD CONSTRAINT fk_permission_has_http_uri_1 FOREIGN KEY (permission_permission_id) references common_oltp.oauth_permission (permission_id);
    
ALTER TABLE oauth_permission_has_http_uri  ADD CONSTRAINT fk_permission_has_http_uri_2 FOREIGN KEY (http_uri_http_uri_id) references common_oltp.http_uri (http_uri_id);


ALTER TABLE access_token_has_permission ADD CONSTRAINT pk_access_token_has_permission PRIMARY KEY (access_token_access_token_id, permission_permission_id);
    
ALTER TABLE access_token_has_permission  ADD CONSTRAINT fk_access_token_has_permission_1 FOREIGN KEY (permission_permission_id) references common_oltp.oauth_permission (permission_id);
    
ALTER TABLE access_token_has_permission  ADD CONSTRAINT fk_access_token_has_permission_2 FOREIGN KEY (access_token_access_token_id) references common_oltp.access_token (access_token_id);


ALTER TABLE authorization_code_grant_has_permission ADD CONSTRAINT pk_authorization_code_grant_has_permission PRIMARY KEY (permission_permission_id, code_grant_id);
    
ALTER TABLE authorization_code_grant_has_permission  ADD CONSTRAINT fk_authorization_code_grant_has_permission_1 FOREIGN KEY (permission_permission_id) references common_oltp.oauth_permission (permission_id);
    
ALTER TABLE authorization_code_grant_has_permission  ADD CONSTRAINT fk_authorization_code_grant_has_permission_2 FOREIGN KEY (code_grant_id) references common_oltp.authorization_code_grant (authorization_code_grant_id);

ALTER TABLE common_oltp.password_reset_token ADD CONSTRAINT pk_password_reset_token PRIMARY KEY (user_id);

ALTER TABLE common_oltp.email_request ADD CONSTRAINT pk_email_request PRIMARY KEY (request_id);

ALTER TABLE common_oltp.email_request  ADD CONSTRAINT emailrequest_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.corona_event  ADD CONSTRAINT corona_event_eventtype_fk FOREIGN KEY (corona_event_type_id) references common_oltp.corona_event_type (corona_event_type_id);

ALTER TABLE common_oltp.corona_event  ADD CONSTRAINT corona_event_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_social_login  ADD CONSTRAINT user_social_provider_fk FOREIGN KEY (social_login_provider_id) references common_oltp.social_login_provider (social_login_provider_id);

ALTER TABLE common_oltp.user_social_login  ADD CONSTRAINT user_social_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_sso_login  ADD CONSTRAINT user_sso_login_user_fk FOREIGN KEY (user_id) references common_oltp.user (user_id);

ALTER TABLE common_oltp.user_sso_login  ADD CONSTRAINT user_sso_login_provider_fk FOREIGN KEY (provider_id) references common_oltp.sso_login_provider (sso_login_provider_id);







