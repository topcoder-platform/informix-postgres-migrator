SET search_path to time_oltp;

alter table time_oltp.id_sequences add constraint u100_1
	primary key (name);

alter table time_oltp.principal add constraint u101_6 primary key
	(principal_id);

alter table time_oltp.role add constraint u102_8 primary key
	(role_id);


alter table time_oltp.principal_role add constraint u103_10 primary key
	(principal_id, role_id);

alter table time_oltp.action add constraint u104_13 primary key
	(action_id);

alter table time_oltp.action_context add constraint u105_16 primary key
	(action_context_id);

alter table time_oltp.role_action_context_permission add constraint u106_19 primary key
	(role_id, action_id, action_context_id);

alter table time_oltp.principal_action_context_permission add constraint u107_24 primary key
	(principal_id, action_id, action_context_id);

alter table time_oltp.state_name add constraint u109_36 primary key
	(state_name_id);


alter table time_oltp.address add constraint u111_52 primary key
	(address_id);

alter table time_oltp.company add constraint u112_62 unique
	(passcode);

alter table time_oltp.company add constraint u112_63 primary key
	(company_id);

alter table time_oltp.user_account add constraint u114_77 primary key
	(user_account_id);

alter table time_oltp.contact add constraint u116_93 primary key
	(contact_id);

alter table time_oltp.comp_rej_reason add constraint u119_117 primary key
	(company_id, reject_reason_id);

alter table time_oltp.reject_email add constraint u120_124 primary key
	(reject_email_id);

alter table time_oltp.exp_reject_reason add constraint u125_166 primary key
	(expense_entry_id, reject_reason_id);

alter table time_oltp.comp_exp_type add constraint u126_173 primary key
	(company_id, expense_type_id);

alter table time_oltp.project_expense add constraint u128_191 primary key
	(project_id, expense_entry_id);

alter table time_oltp.time_reject_reason add constraint u132_225 primary key
	(time_entry_id, reject_reason_id);

alter table time_oltp.comp_task_type add constraint u133_232 primary key
	(company_id, task_type_id);

alter table time_oltp.project_time add constraint u134_239 primary key
	(project_id, time_entry_id);

alter table time_oltp.project_manager add constraint u135_246 primary key
	(project_id, user_account_id);

alter table time_oltp.client add constraint u137_263 unique
	(name);

alter table time_oltp.client add constraint u137_264 primary key
	(client_id);

alter table time_oltp.client_project add constraint u138_272 primary key
	(client_id, project_id);

alter table time_oltp.audit_action add constraint u139_279 primary key
	(audit_action_id);

alter table time_oltp.project_worker add constraint u172_253 primary key
	(project_id, user_account_id);

alter table time_oltp.project add constraint u174_180 primary key
	(project_id);

alter table time_oltp.task_type add constraint u175_204 primary key
	(task_type_id);

alter table time_oltp.time_entry add constraint u176_212 primary key
	(time_entry_id);

alter table time_oltp.time_status add constraint u177_197 primary key
	(time_status_id);

alter table time_oltp.expense_entry add constraint u178_153 primary key
	(expense_entry_id);

alter table time_oltp.expense_status add constraint u179_138 primary key
	(expense_status_id);

alter table time_oltp.expense_type add constraint u180_145 primary key
	(expense_type_id);

alter table time_oltp.reject_reason add constraint u181_44 primary key
	(reject_reason_id);

alter table time_oltp.comp_rate add constraint comp_rate_pk primary key
	(company_id, rate_id);

alter table time_oltp.user_contact_backup add constraint pk_user_account_contact_backup primary key
	(user_account_id, contact_id);

alter table time_oltp.user_address_backup add constraint pk_user_account_address_backup primary key
	(user_account_id, address_id);

alter table time_oltp.company_contact_backup add constraint pk_company_contact_backup primary key
	(company_id, contact_id);

alter table time_oltp.company_address_backup add constraint pk_company_address_backup primary key
	(company_id, address_id);

alter table time_oltp.job add constraint pk_job primary key
	(jobid);

alter table time_oltp.message add constraint pk_message primary key
	(messageid);

alter table time_oltp.group add constraint pk_group primary key
	(groupid);

alter table time_oltp.groupjob add constraint pk_groupjob primary key
	(groupid, jobid);

alter table time_oltp.country_name add constraint pk_country_name primary key
	(country_name_id);

alter table time_oltp.address_type add constraint pk_address_type primary key
	(address_type_id);

alter table time_oltp.address_relation add constraint pk_address_relation primary key
	(address_id, address_type_id, entity_id);

alter table time_oltp.contact_type add constraint pk_contact_type primary key
	(contact_type_id);

alter table time_oltp.contact_relation add constraint pk_contact_relation primary key
	(contact_id, contact_type_id, entity_id);

alter table time_oltp.payment_terms add constraint pk_payment_terms primary key
	(payment_terms_id);

alter table time_oltp.application_area add constraint pk_application_area primary key
	(app_area_id);

alter table time_oltp.audit add constraint pk_audit primary key
	(audit_id);

alter table time_oltp.audit_detail add constraint pk_audit_detail primary key
	(audit_detail_id);

alter table time_oltp.fix_bill_status add constraint pk_fix_bill_status primary key
	(fix_bill_status_id);

alter table time_oltp.fix_bill_type add constraint pk_fix_bill_type primary key
	(fix_bill_type_id);

alter table time_oltp.comp_fb_type add constraint pk_comp_fb_type primary key
	(company_id, fix_bill_type_id);

alter table time_oltp.cut_off_time add constraint pk_cut_off_time primary key
	(cut_off_time_id);

alter table time_oltp.invoice_status add constraint pk_invoice_status primary key
	(invoice_status_id);

alter table time_oltp.invoice add constraint pk_invoice primary key
	(invoice_id);

alter table time_oltp.fix_bill_entry add constraint pk_fix_bill_entry primary key
	(fix_bill_entry_id);

alter table time_oltp.fb_reject_reason add constraint pk_fb_reject_reason primary key
	(fix_bill_entry_id, reject_reason_id);

alter table time_oltp.project_fix_bill add constraint pk_project_fix_bill primary key
	(fix_bill_entry_id, project_id);

alter table time_oltp.service_details add constraint  pk_service_details primary key
	(service_detail_id);

alter table time_oltp.notify_clients add constraint pk_notify_clients primary key
	(notification_id, client_id);

alter table time_oltp.notify_projects add constraint pk_notify_projects primary key
	(notification_id, project_id);

alter table time_oltp.notify_resources add constraint pk_notify_resources primary key
	(notification_id, user_account_id);

alter table time_oltp.account_status add constraint u227_29 primary key
	(account_status_id);

alter table time_oltp.comp_rej_email add constraint pk_comp_rej_email primary key
	(company_id, reject_email_id);

alter table time_oltp.rate add constraint rate_pk primary key
	(rate_id);

alter table time_oltp.user_status add constraint u230_1023 primary key
	(user_status_id);

alter table time_oltp.user_type add constraint u231_1032 primary key
	(user_type_id);

alter table time_oltp.notification add constraint pk_notification primary key
	(notification_id);

alter table time_oltp.data_type add constraint data_type_pk primary key
	(data_type_id);

alter table time_oltp.command_group_lu add constraint  command_group_lu_pk primary key
	(command_group_id);

alter table time_oltp.command add constraint command_pk primary key
	(command_id);

alter table time_oltp.query add constraint query_pk primary key
	(query_id);

create unique index inputlu_inputcode_idx on time_oltp.input_lu
	(
	input_code
	);

alter table time_oltp.input_lu add constraint input_lu_pkey primary key
	(input_id);

alter table time_oltp.query_input_xref add constraint query_input_pk primary key
	(query_id, input_id);

alter table time_oltp.command_query_xref add constraint commandqueryxref_pk primary key
	(command_id, query_id);

alter table time_oltp.project_contest_fee add constraint project_contest_fee_pk primary key
	(project_contest_fee_id);

ALTER TABLE project_contest_fee_percentage ADD constraint project_contest_fee_percentage_pk PRIMARY KEY
    (project_contest_fee_percentage_id);

ALTER TABLE customer_platform_fee ADD CONSTRAINT  customer_platform_fee_pk PRIMARY KEY
    (customer_platform_fee_id);

alter table time_oltp.invoice_upload add constraint pk_invoice_upload primary key
    (invoice_upload_id);

alter table time_oltp.principal_role add constraint r103_534 foreign key
	(principal_id)
	references time_oltp.principal
	(principal_id);

alter table time_oltp.principal_role add constraint r103_535 foreign key
	(role_id)
	references time_oltp.role
	(role_id);

alter table time_oltp.action_context add constraint r105_536 foreign key
	(action_context_parent_id)
	references time_oltp.action_context
	(action_context_id);

alter table time_oltp.role_action_context_permission add constraint r106_537 foreign key
	(role_id)
	references time_oltp.role
	(role_id);

alter table time_oltp.role_action_context_permission add constraint r106_538 foreign key
	(action_id)
	references time_oltp.action
	(action_id);

alter table time_oltp.role_action_context_permission add constraint r106_539 foreign key
	(action_context_id)
	references time_oltp.action_context
	(action_context_id);

alter table time_oltp.principal_action_context_permission add constraint  r107_540 foreign key
	(principal_id)
	references time_oltp.principal
	(principal_id);

alter table time_oltp.principal_action_context_permission add constraint r107_541 foreign key
	(action_id)
	references time_oltp.action
	(action_id);

alter table time_oltp.principal_action_context_permission add constraint r107_542 foreign key
	(action_context_id)
	references time_oltp.action_context
	(action_context_id);

alter table time_oltp.address add constraint r111_543 foreign key
	(state_name_id)
	references time_oltp.state_name
	(state_name_id);

alter table time_oltp.user_account add constraint r114_546 foreign key
	(account_status_id)
	references time_oltp.account_status
	(account_status_id);

alter table time_oltp.user_account add constraint r114_547 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.user_account add constraint fk_useraccount_userstatus_userstatusid foreign key
	(user_status_id)
	references time_oltp.user_status
	(user_status_id);

alter table time_oltp.user_account add constraint fk_useraccount_usertype_usertypeid foreign key
	(user_type_id)
	references time_oltp.user_type
	(user_type_id);

alter table time_oltp.comp_rej_reason add constraint r119_554 foreign key
	(reject_reason_id)
	references time_oltp.reject_reason
	(reject_reason_id);

alter table time_oltp.comp_rej_reason add constraint r119_555 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.exp_reject_reason add constraint r125_561 foreign key
	(reject_reason_id)
	references time_oltp.reject_reason
	(reject_reason_id);

alter table time_oltp.exp_reject_reason add constraint  r125_562 foreign key
	(expense_entry_id)
	references time_oltp.expense_entry
	(expense_entry_id);

alter table time_oltp.comp_exp_type add constraint r126_563 foreign key
	(expense_type_id)
	references time_oltp.expense_type
	(expense_type_id);

alter table time_oltp.comp_exp_type add constraint r126_564 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.project_expense add constraint r128_566 foreign key
	(expense_entry_id)
	references time_oltp.expense_entry
	(expense_entry_id);

alter table time_oltp.project_expense add constraint r128_567 foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.time_reject_reason add constraint r132_571 foreign key
	(reject_reason_id)
	references time_oltp.reject_reason
	(reject_reason_id);

alter table time_oltp.time_reject_reason add constraint r132_572 foreign key
	(time_entry_id)
	references time_oltp.time_entry
	(time_entry_id);

alter table time_oltp.comp_task_type add constraint r133_573 foreign key
	(task_type_id)
	references time_oltp.task_type
	(task_type_id);

alter table time_oltp.comp_task_type add constraint r133_574 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.project_time add constraint r134_575 foreign key
	(time_entry_id)
	references time_oltp.time_entry
	(time_entry_id);

alter table time_oltp.project_time add constraint r134_576 foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.project_manager add constraint  r135_577 foreign key
	(user_account_id)
	references time_oltp.user_account
	(user_account_id);

alter table time_oltp.project_manager add constraint r135_578 foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.client add constraint r137_581 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.client_project add constraint r138_582 foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.client_project add constraint r138_583 foreign key
	(client_id)
	references time_oltp.client
	(client_id);

alter table time_oltp.account_status_audit add constraint r140_584 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.state_name_audit add constraint r141_585 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.reject_reason_audit add constraint r142_586 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.address_audit add constraint r143_587 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.company_audit add constraint r144_588 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.company_address_audit add constraint r145_589 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.user_account_audit add constraint r146_590 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.user_address_audit add constraint r147_591 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.contact_audit add constraint r148_592 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.user_contact_audit add constraint r149_593 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.company_contact_audit add constraint r150_594 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.comp_rej_reason_audit add constraint r151_595 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.reject_email_audit add constraint r152_596 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.comp_reject_email_audit add constraint r153_597 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.expense_status_audit add constraint r154_598 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.expense_type_audit add constraint r155_599 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.expense_entry_audit add constraint r156_600 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.exp_reject_reason_audit add constraint r157_601 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.comp_exp_type_audit add constraint r158_602 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_audit add constraint r159_603 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_expense_audit add constraint r160_604 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.time_status_audit add constraint r161_605 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.task_type_audit add constraint r162_606 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.time_entry_audit add constraint r163_607 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.time_reject_reason_audit add constraint r164_608 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.comp_task_type_audit add constraint r165_609 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_time_audit add constraint r166_610 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_manager_audit add constraint r167_611 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_worker_audit add constraint r168_612 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.client_audit add constraint r169_613 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.client_project_audit add constraint r170_614 foreign key
	(audit_action_id)
	references time_oltp.audit_action
	(audit_action_id);

alter table time_oltp.project_worker add constraint r172_579 foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.project_worker add constraint r172_580 foreign key
	(user_account_id)
	references time_oltp.user_account
	(user_account_id);

alter table time_oltp.project add constraint r174_565 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.time_entry add constraint r176_568 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.time_entry add constraint r176_569 foreign key
	(time_status_id)
	references time_oltp.time_status
	(time_status_id);

alter table time_oltp.time_entry add constraint r176_570 foreign key
	(task_type_id)
	references time_oltp.task_type
	(task_type_id);

alter table time_oltp.time_entry add constraint fk_timeentry_invoice_invoiceid foreign key
	(invoice_id)
	references time_oltp.invoice
	(invoice_id);

alter table time_oltp.expense_entry add constraint r178_558 foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.expense_entry add constraint r178_559 foreign key
	(expense_status_id)
	references time_oltp.expense_status
	(expense_status_id);

alter table time_oltp.expense_entry add constraint r178_560 foreign key
	(expense_type_id)
	references time_oltp.expense_type
	(expense_type_id);

alter table time_oltp.expense_entry add constraint fk_expenseentry_invoice_invoiceid foreign key
	(invoice_id)
	references time_oltp.invoice
	(invoice_id);

alter table time_oltp.comp_rate add constraint fk_comp_rate_company foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.comp_rate add constraint fk_comp_rate_rate foreign key
	(rate_id)
	references time_oltp.rate
	(rate_id);

alter table time_oltp.address_relation add constraint fk_addressrelation_address_addressid foreign key
	(address_id)
	references time_oltp.address
	(address_id);

alter table time_oltp.address_relation add constraint fk_addressrelation_addresstype_addresstypeid foreign key
	(address_type_id)
	references time_oltp.address_type
	(address_type_id);

alter table time_oltp.contact_relation add constraint fk_contactrelation_contacttype_contacttypeid foreign key
	(contact_type_id)
	references time_oltp.contact_type
	(contact_type_id);

alter table time_oltp.contact_relation add constraint k_contactrelation_contact_contactid foreign key
	(contact_id)
	references time_oltp.contact
	(contact_id);

alter table time_oltp.audit add constraint fk_audit_applicationarea_appareaid foreign key
	(app_area_id)
	references time_oltp.application_area
	(app_area_id);

alter table time_oltp.audit add constraint fk_audit_client_clientid foreign key
	(client_id)
	references time_oltp.client
	(client_id);

alter table time_oltp.audit add constraint fk_audit_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.audit add constraint fk_audit_project_projectid foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.audit add constraint fk_audit_useraccount_useraccountid foreign key
	(account_user_id)
	references time_oltp.user_account
	(user_account_id);

alter table time_oltp.audit_detail add constraint fk_auditdetail_audit_auditid foreign key
	(audit_id)
	references time_oltp.audit
	(audit_id);

alter table time_oltp.comp_fb_type add constraint fk_compfbtype_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.comp_fb_type add constraint fk_compfbtype_fixbilltype_fixbilltypeid foreign key
	(fix_bill_type_id)
	references time_oltp.fix_bill_type
	(fix_bill_type_id);

alter table time_oltp.cut_off_time add constraint fk_cutofftime_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.invoice add constraint fk_invoice_project_projectid foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.invoice add constraint fk_invoice_paymentterms_paymenttermsid foreign key
	(payment_terms_id)
	references time_oltp.payment_terms
	(payment_terms_id);

alter table time_oltp.invoice add constraint fk_invoice_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.invoice add constraint fk_invoice_invoicestatus_invoicestatusid foreign key
	(invoice_status_id)
	references time_oltp.invoice_status
	(invoice_status_id);

alter table time_oltp.fix_bill_entry add constraint fk_fixbillentry_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.fix_bill_entry add constraint fk_fixbillentry_client_clientid foreign key
	(client_id)
	references time_oltp.client
	(client_id);

alter table time_oltp.fix_bill_entry add constraint fk_fixbillentry_project_projectid foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.fix_bill_entry add constraint fk_fixbillentry_invoice_invoiceid foreign key
	(invoice_id)
	references time_oltp.invoice
	(invoice_id);

alter table time_oltp.fix_bill_entry add constraint fk_fixbillentry_fixbillstatus_fixbillstatusid foreign key
	(fix_bill_status_id)
	references time_oltp.fix_bill_status
	(fix_bill_status_id);

alter table time_oltp.fb_reject_reason add constraint fk_fbrejectreason_fixbillentry_fixbillentryid foreign key
	(fix_bill_entry_id)
	references time_oltp.fix_bill_entry
	(fix_bill_entry_id);

alter table time_oltp.fb_reject_reason add constraint fk_fbrejectreason_rejectreason_rejectreasonid foreign key
	(reject_reason_id)
	references time_oltp.reject_reason
	(reject_reason_id);

alter table time_oltp.project_fix_bill add constraint fk_projectfixbill_project_projectid foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.project_fix_bill add constraint fk_projectfixbill_fixbillentry_fixbillentryid foreign key
	(fix_bill_entry_id)
	references time_oltp.fix_bill_entry
	(fix_bill_entry_id);

alter table time_oltp.service_details add constraint fk_servicedetails_timeentry_timeentryid foreign key
	(time_entry_id)
	references time_oltp.time_entry
	(time_entry_id);

alter table time_oltp.service_details add constraint fk_servicedetails_invoice_invoiceid foreign key
	(invoice_id)
	references time_oltp.invoice
	(invoice_id);

alter table time_oltp.notify_clients add constraint fk_notifyclients_notification_notificationid foreign key
	(notification_id)
	references time_oltp.notification
	(notification_id);

alter table time_oltp.notify_clients add constraint fk_notifyclients_client_clientid foreign key
	(client_id)
	references time_oltp.client
	(client_id);

alter table time_oltp.notify_projects add constraint fk_notifyprojects_notification_notificationid foreign key
	(notification_id)
	references time_oltp.notification
	(notification_id);

alter table time_oltp.notify_projects add constraint fk_notifyprojects_project_projectid foreign key
	(project_id)
	references time_oltp.project
	(project_id);

alter table time_oltp.notify_resources add constraint fk_notifyresources_notification_notificationid foreign key
	(notification_id)
	references time_oltp.notification
	(notification_id);

alter table time_oltp.notify_resources add constraint fk_notifyresources_useraccount_useraccountid foreign key
	(user_account_id)
	references time_oltp.user_account
	(user_account_id);

alter table time_oltp.comp_rej_email add constraint fk_comprejemail_company_companyid foreign key
	(company_id)
	references time_oltp.company
	(company_id);

alter table time_oltp.comp_rej_email add constraint fk_comprejemail_rejectemail_rejectemailid foreign key
	(reject_email_id)
	references time_oltp.reject_email
	(reject_email_id);

alter table time_oltp.command add constraint command_command_group_fk foreign key
	(command_group_id)
	references time_oltp.command_group_lu
	(command_group_id);

alter table time_oltp.command_execution add constraint commandexecution_command_fk foreign key
	(command_id)
	references time_oltp.command
	(command_id);


alter table time_oltp.client_status add constraint client_status_pk primary key
	(client_status_id);

alter table time_oltp.project_status add constraint project_status_pk primary key
	(project_status_id);

alter table time_oltp.project_xref add constraint project_xref_pk primary key
	(parent_project_id, child_project_id);

alter table time_oltp.client_user_xref add constraint  client_user_xref_client_fk foreign key
	(client_id) references time_oltp.client (client_id);

alter table time_oltp.client_user_xref add constraint client_user_xref_user_account_fk foreign key
	(user_id) references time_oltp.user_account (user_account_id);

alter table time_oltp.project_user_xref add constraint project_user_xref_user_account_fk foreign key
	(user_id) references time_oltp.user_account (user_account_id);

alter table time_oltp.project_user_xref add constraint project_user_xref_project_fk foreign key
	(project_id) references time_oltp.project (project_id);

alter table time_oltp.project_xref add constraint  project_xref_parent_project_fk foreign key
	(parent_project_id) references time_oltp.project (project_id);

alter table time_oltp.project_xref add constraint project_xref_child_project_fk foreign key
	(child_project_id) references time_oltp.project (project_id);

alter table time_oltp.client add constraint client_client_status_fk foreign key
	(client_status_id) references time_oltp.client_status (client_status_id);

alter table time_oltp.project add constraint  project_client_fk foreign key
	(client_id) references time_oltp.client (client_id);

alter table time_oltp.project add constraint project_project_status_fk foreign key
	(project_status_id) references time_oltp.project_status (project_status_id);

alter table time_oltp.project add constraint project_parent_project_fk foreign key
	(parent_project_id) references time_oltp.project (project_id);


ALTER TABLE project_contest_fee_percentage ADD constraint project_contest_fee_percentage_to_project_fk FOREIGN KEY
    (project_id) references project(project_id);

ALTER TABLE customer_platform_fee ADD CONSTRAINT r_customer_platform_fee_client_id FOREIGN KEY
	(client_id) references client (client_id);

alter table time_oltp.invoice_upload add constraint fk_invoice_upload_client foreign key
    (client_id)
    references time_oltp.client
    (client_id);
