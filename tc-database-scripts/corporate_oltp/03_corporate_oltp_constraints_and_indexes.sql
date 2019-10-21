SET search_path TO corporate_oltp;

alter table corporate_oltp.tc_direct_project_status_lu add constraint pk_tc_direct_project_status_lu
    primary key (project_status_id);


alter table corporate_oltp.command add constraint command_command_group_fk
    foreign key (command_group_id) references corporate_oltp.command_group_lu;

alter table corporate_oltp.product_role_xref add constraint product_role_xref_product_fk
    foreign key (product_id) references corporate_oltp.product;

alter table corporate_oltp.product_unit_xref add constraint unit_product_unit_xref_fk
    foreign key (unit_id) references corporate_oltp.unit;

alter table corporate_oltp.product_unit_xref add constraint product_product_unit_xref_fk
    foreign key (product_id) references corporate_oltp.product;

alter table corporate_oltp.purchase add constraint purchase_product_fk
    foreign key (product_id) references corporate_oltp.product;

alter table corporate_oltp.product_country_eligibility add constraint prodid_pk
    foreign key (product_id) references corporate_oltp.product;

alter table corporate_oltp.command_execution add constraint commandexecution_command_fk
    foreign key (command_id) references corporate_oltp.command;

alter table corporate_oltp.user_permission_grant add constraint fk_user_permission_grant1
    foreign key (permission_type_id) references corporate_oltp.permission_type;

alter table corporate_oltp.tc_direct_project add constraint fk_directproject_projectstatuslu_projectstatusid
    foreign key	(project_status_id)	references corporate_oltp.tc_direct_project_status_lu (project_status_id);

ALTER TABLE corporate_oltp.tc_direct_project ADD constraint fk_tcdirectproject_directprojecttype_directprojecttypeid
    foreign key (direct_project_type_id) references corporate_oltp.direct_project_type (direct_project_type_id);

ALTER TABLE corporate_oltp.tc_direct_project ADD CONSTRAINT fk_tcdirectproject_directprojectcategory_directprojectcategoryid
    foreign key(direct_project_category_id)  references corporate_oltp.direct_project_category
    (direct_project_category_id);

ALTER TABLE corporate_oltp.direct_project_category ADD CONSTRAINT fk_directprojectcategory_directprojecttype_directprojecttypeid
    foreign key (direct_project_type_id) references corporate_oltp.direct_project_type (direct_project_type_id);

ALTER TABLE corporate_oltp.direct_project_account ADD constraint fk_directprojectaccount_tcdirectproject_projectid
    foreign key (project_id) references corporate_oltp.tc_direct_project (project_id);

create unique index inputlu_inputcode_idx on corporate_oltp.input_lu (input_code);

CREATE INDEX userpermissiongrant_resource_idx ON corporate_oltp.user_permission_grant(resource_id);

CREATE INDEX userpermissiongrant_user_resource_idx ON corporate_oltp.user_permission_grant(user_id, resource_id);

alter table corporate_oltp.direct_project_account add constraint u_project_id_billing_account_id unique
	(project_id, billing_account_id);

ALTER TABLE corporate_oltp.project_question	ADD CONSTRAINT project_question_pk
    primary key(question_id);

ALTER TABLE corporate_oltp.project_question ADD CONSTRAINT project_question_direct_project_type_fk
	foreign key(direct_project_type_id) references corporate_oltp.direct_project_type(direct_project_type_id);

ALTER TABLE corporate_oltp.project_question_option ADD CONSTRAINT project_question_option_pk
    primary key(question_option_id);

ALTER TABLE corporate_oltp.project_question_option
	ADD CONSTRAINT project_question_option_project_question_fk foreign key(question_id) references corporate_oltp.project_question(question_id);

ALTER TABLE corporate_oltp.project_answer
	ADD constraint project_answer_pk primary key(answer_id);

ALTER TABLE corporate_oltp.project_answer
	ADD constraint project_answer_tcdirect_project_fk foreign key(tc_direct_project_id) references corporate_oltp.tc_direct_project(project_id);

ALTER TABLE corporate_oltp.project_answer
	ADD CONSTRAINT project_answer_project_question_fk foreign key(question_id) references corporate_oltp.project_question(question_id);

ALTER TABLE corporate_oltp.project_multiple_answer
	ADD constraint project_multiple_answer_pk primary key(project_multiple_answer_id);

ALTER TABLE corporate_oltp.project_multiple_answer
	ADD CONSTRAINT project_multiple_answer_project_answer_fk foreign key(answer_id) references corporate_oltp.project_answer(answer_id);

ALTER TABLE corporate_oltp.project_answer_option
	ADD CONSTRAINT project_answer_option_pk primary key(project_answer_option_id);

ALTER TABLE corporate_oltp.project_answer_option
	ADD CONSTRAINT project_answer_option_project_answer_fk foreign key(answer_id) references corporate_oltp.project_answer(answer_id);

ALTER TABLE corporate_oltp.project_answer_option
	ADD constraint project_answer_option_project_question_option_fk foreign key(question_option_id) references corporate_oltp.project_question_option(question_option_id);

alter table corporate_oltp.tc_direct_project_audit add constraint pk_tc_direct_project_audit primary key
    (tc_direct_project_audit_id);

alter table corporate_oltp.user_permission_grant_audit add constraint pk_user_permission_grant_audit primary key
    (user_permission_grant_audit_id);

alter table corporate_oltp.audit_action_type_lu add constraint audit_action_type_lu_pkey primary key
    (audit_action_type_id);

alter table corporate_oltp.tc_direct_project_audit add constraint tc_direct_project_audit_audit_action_type_lu_fk foreign key
    (audit_action_type_id)
    references corporate_oltp.audit_action_type_lu
    (audit_action_type_id);

alter table corporate_oltp.user_permission_grant_audit add constraint user_permission_grant_audit_audit_action_type_lu_fk foreign key
    (audit_action_type_id)
    references corporate_oltp.audit_action_type_lu
    (audit_action_type_id);

CREATE INDEX bac_id_ix ON direct_project_account (billing_account_id);
