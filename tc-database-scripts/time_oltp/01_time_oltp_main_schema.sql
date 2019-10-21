CREATE schema IF NOT EXISTS time_oltp authorization postgres;
SET search_path TO time_oltp;

CREATE ROLE time_tracker;

GRANT USAGE ON SCHEMA time_oltp to coder;
GRANT USAGE ON SCHEMA time_oltp to time_tracker;

-- User public does not have connect privilege;
create table time_oltp.id_sequences (
    name VARCHAR(255) not null,
    next_block_start INT not null,
    block_size INT not null,
    exhausted INT not null
);

revoke all on id_sequences from public;

create table time_oltp.principal (
    principal_id INT not null,
    principal_name VARCHAR(255)
);

revoke all on principal from public;

create table time_oltp.role (
    role_id INT not null,
    role_name VARCHAR(255)
);
revoke all on role from public;

create table time_oltp.principal_role (
    principal_id INT not null,
    role_id INT not null
);
revoke all on principal_role from public;

create table time_oltp.action (
    action_id INT not null,
    class_name VARCHAR(255) not null,
    action_name VARCHAR(255)
);

revoke all on action from public;

create table time_oltp.action_context (
    action_context_id INT not null,
    action_context_name VARCHAR(255),
    action_context_parent_id INT,
    class_name VARCHAR(255) not null
);

revoke all on action_context from public;

create table time_oltp.role_action_context_permission (
    role_id INT not null,
    action_id INT not null,
    action_context_id INT not null,
    permission INT not null
);

revoke all on role_action_context_permission from public;

create table time_oltp.principal_action_context_permission (
    principal_id INT not null,
    action_id INT not null,
    action_context_id INT not null,
    permission INT not null
);

revoke all on principal_action_context_permission from public;

create table time_oltp.state_name (
    state_name_id INT not null,
    name VARCHAR(64) not null,
    abbreviation VARCHAR(2) not null,
    creation_date timestamp(0) null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on state_name from public;

create table time_oltp.address (
    address_id INT not null,
    line1 VARCHAR(100) not null,
    line2 VARCHAR(100),
    city VARCHAR(30) not null,
    country_name_id INT not null,
    state_name_id INT not null,
    zip_code VARCHAR(10) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on address from public;

create table time_oltp.company (
    company_id INT not null,
    name VARCHAR(64),
    passcode VARCHAR(64) not null,
    is_deleted SMALLINT,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company from public;

create table time_oltp.user_account (
    user_account_id INT not null,
    company_id INT,
    account_status_id INT not null,
    user_name VARCHAR(64) not null,
    password VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    user_status_id INT,
    user_type_id INT,
    billable_type INT
);

revoke all on user_account from public;

create table time_oltp.contact (
    contact_id INT not null,
    first_name VARCHAR(64) not null,
    last_name VARCHAR(64) not null,
    phone VARCHAR(30) not null,
    email VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on contact from public;

create table time_oltp.comp_rej_reason (
    company_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_rej_reason from public;

create table time_oltp.reject_email (
    reject_email_id INT not null,
    body varchar(4096) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on reject_email from public;

create table time_oltp.exp_reject_reason (
    expense_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on exp_reject_reason from public;

create table time_oltp.comp_exp_type (
    company_id INT not null,
    expense_type_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_exp_type from public;

create table time_oltp.project_expense (
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    expense_entry_id INT
);

revoke all on project_expense from public;

create table time_oltp.time_reject_reason (
    time_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_reject_reason from public;

create table time_oltp.comp_task_type (
    company_id INT not null,
    task_type_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_task_type from public;

create table time_oltp.project_time (
    project_id INT not null,
    time_entry_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_time from public;

create table time_oltp.project_manager (
    project_id INT not null,
    user_account_id INT not null,
    pay_rate DECIMAL(9,2),
    cost DECIMAL(5,2) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_manager from public;

create table time_oltp.client (
    client_id INT not null,
    name VARCHAR(64) not null,
    company_id INT not null,
    payment_term_id INT not null,
    status SMALLINT not null,
    salestax DECIMAL(7,3) not null,
    start_date timestamp(0) not null,
    end_date timestamp(0) not null,
    code_name VARCHAR(64),
    is_deleted SMALLINT DEFAULT 0,
    client_status_id INTEGER,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    cmc_account_id VARCHAR(100),
    customer_number VARCHAR(100),
    enable_effort_hours SMALLINT
);

revoke all on client from public;

create table time_oltp.client_project (
    client_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on client_project from public;

create table time_oltp.audit_action (
    audit_action_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on audit_action from public;

create table time_oltp.account_status_audit (
    audit_action_id INT not null,
    account_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on account_status_audit from public;

create table time_oltp.state_name_audit (
    audit_action_id INT not null,
    state_name_id INT not null,
    name VARCHAR(64) not null,
    abbreviation VARCHAR(2) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on state_name_audit from public;

create table time_oltp.reject_reason_audit (
    audit_action_id INT not null,
    reject_reason_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on reject_reason_audit from public;

create table time_oltp.address_audit (
    audit_action_id INT not null,
    address_id INT not null,
    line1 VARCHAR(100) not null,
    line2 VARCHAR(100),
    city VARCHAR(30) not null,
    state_name_id INT not null,
    zip_code VARCHAR(10) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on address_audit from public;

create table time_oltp.company_audit (
    audit_action_id INT not null,
    company_id INT not null,
    name VARCHAR(64),
    passcode VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company_audit from public;

create table time_oltp.company_address_audit (
    audit_action_id INT not null,
    company_id INT not null,
    address_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company_address_audit from public;

create table time_oltp.user_account_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    company_id INT,
    account_status_id INT not null,
    user_name VARCHAR(64) not null,
    "password" VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_account_audit from public;

create table time_oltp.user_address_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    address_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_address_audit from public;

create table time_oltp.contact_audit (
    audit_action_id INT not null,
    contact_id INT not null,
    first_name VARCHAR(64) not null,
    last_name VARCHAR(64) not null,
    phone VARCHAR(30) not null,
    email VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on contact_audit from public;

create table time_oltp.user_contact_audit (
    audit_action_id INT not null,
    user_account_id INT not null,
    contact_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_contact_audit from public;

create table time_oltp.company_contact_audit (
    audit_action_id INT not null,
    company_id INT not null,
    contact_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company_contact_audit from public;

create table time_oltp.comp_rej_reason_audit (
    audit_action_id INT not null,
    company_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_rej_reason_audit from public;

create table time_oltp.reject_email_audit (
    audit_action_id INT not null,
    reject_email_id INT not null,
    body VARCHAR(255) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on reject_email_audit from public;
create table time_oltp.comp_reject_email_audit (
    audit_action_id INT not null,
    company_id INT not null,
    reject_email_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_reject_email_audit from public;
create table time_oltp.expense_status_audit (
    audit_action_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on expense_status_audit from public;
create table time_oltp.expense_type_audit (
    audit_action_id INT not null,
    expense_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on expense_type_audit from public;
create table time_oltp.expense_entry_audit (
    audit_action_id INT not null,
    expense_entry_id INT not null,
    company_id INT not null,
    expense_type_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(64) not null,
    entry_date timestamp(0) not null,
    amount MONEY not null,
    billable SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on expense_entry_audit from public;
create table time_oltp.exp_reject_reason_audit (
    audit_action_id INT not null,
    expense_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on exp_reject_reason_audit from public;
create table time_oltp.comp_exp_type_audit (
    audit_action_id INT not null,
    company_id INT not null,
    expense_type_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_exp_type_audit from public;
create table time_oltp.project_audit (
    audit_action_id INT not null,
    project_id INT not null,
    company_id INT not null,
    name VARCHAR(64) not null,
    description VARCHAR(64) not null,
    start_date timestamp(0) not null,
    end_date timestamp(0) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_audit from public;
create table time_oltp.project_expense_audit (
    audit_action_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    expense_entry_id INT
);

revoke all on project_expense_audit from public;
create table time_oltp.time_status_audit (
    audit_action_id INT not null,
    time_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_status_audit from public;
create table time_oltp.task_type_audit (
    audit_action_id INT not null,
    task_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on task_type_audit from public;
create table time_oltp.time_entry_audit (
    audit_action_id INT not null,
    time_entry_id INT not null,
    company_id INT not null,
    time_status_id INT not null,
    task_type_id INT not null,
    description VARCHAR(64) not null,
    entry_date timestamp(0) not null,
    hours FLOAT not null,
    billable SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_entry_audit from public;
create table time_oltp.time_reject_reason_audit (
    audit_action_id INT not null,
    time_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_reject_reason_audit from public;
create table time_oltp.comp_task_type_audit (
    audit_action_id INT not null,
    company_id INT not null,
    task_type_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_task_type_audit from public;
create table time_oltp.project_time_audit (
    audit_action_id INT not null,
    project_id INT not null,
    time_entry_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_time_audit from public;
create table time_oltp.project_manager_audit (
    audit_action_id INT not null,
    project_id INT not null,
    user_account_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_manager_audit from public;
create table time_oltp.project_worker_audit (
    audit_action_id INT not null,
    project_id INT not null,
    user_account_id INT not null,
    start_date timestamp(0) not null,
    end_date timestamp(0) not null,
    pay_rate INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_worker_audit from public;
create table time_oltp.client_audit (
    audit_action_id INT not null,
    client_id INT not null,
    name VARCHAR(64) not null,
    company_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on client_audit from public;
create table time_oltp.client_project_audit (
    audit_action_id INT not null,
    client_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on client_project_audit from public;
create table time_oltp.dual (
    value INT
);

revoke all on dual from public;
create table time_oltp.project_worker (
    project_id INT not null,
    user_account_id INT not null,
    start_date timestamp(0) not null,
    end_date timestamp(0) not null,
    pay_rate DECIMAL(9,2),
    cost DECIMAL(5,2) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_worker from public;
create table time_oltp.project (
    project_id INT not null,
    company_id INT not null,
    name VARCHAR(64) not null,
    active SMALLINT not null,
    sales_tax DECIMAL(8,3) not null,
    po_box_number VARCHAR(20) not null,
    payment_terms_id INT not null,
    description VARCHAR(255),
    start_date timestamp(0) not null,
    end_date timestamp(0) not null,
    project_status_id INTEGER,
    client_id INTEGER,
    parent_project_id INTEGER,
    is_deleted SMALLINT DEFAULT 0,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    is_manual_prize_setting SMALLINT DEFAULT 0,
    budget DECIMAL(10,3),
    subscription_number  VARCHAR(64),
    billable boolean default 'f'
);

revoke all on project from public;
create table time_oltp.task_type (
    task_type_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on task_type from public;
create table time_oltp.time_entry (
    time_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    time_status_id INT not null,
    task_type_id INT not null,
    description VARCHAR(255),
    entry_date timestamp(0) not null,
    hours FLOAT not null,
    billable SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_entry from public;
create table time_oltp.time_status (
    time_status_id INT not null,
    description VARCHAR(255),
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on time_status from public;
create table time_oltp.expense_entry (
    expense_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    expense_type_id INT not null,
    expense_status_id INT not null,
    description VARCHAR(255),
    entry_date timestamp(0) not null,
    amount MONEY not null,
    billable SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    mileage INT
);

revoke all on expense_entry from public;
create table time_oltp.expense_status (
    expense_status_id INT not null,
    description VARCHAR(255),
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on expense_status from public;
create table time_oltp.expense_type (
    expense_type_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on expense_type from public;
create table time_oltp.reject_reason (
    reject_reason_id INT not null,
    description VARCHAR(255),
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on reject_reason from public;
create table time_oltp.comp_rate (
    company_id INT not null,
    rate_id INT not null,
    rate MONEY not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_rate from public;
create table time_oltp.user_contact_backup (
    user_account_id INT not null,
    contact_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_contact_backup from public;
create table time_oltp.user_address_backup (
    user_account_id INT not null,
    address_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_address_backup from public;
create table time_oltp.company_contact_backup (
    company_id INT not null,
    contact_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company_contact_backup from public;
create table time_oltp.company_address_backup (
    company_id INT not null,
    address_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on company_address_backup from public;
create table time_oltp.sequence_object (
    name VARCHAR(255),
    id INT,
    current_value INT
);

revoke all on sequence_object from public;
create table time_oltp.job (
    jobid INT,
    name VARCHAR(40),
    startdate DATE,
    starttime INT,
    enddate DATE,
    dateunit VARCHAR(60),
    dateunitdays VARCHAR(20),
    dateunitweek VARCHAR(2),
    dateunitmonth VARCHAR(2),
    interval INT,
    recurrence INT,
    active CHAR(1),
    jobtype VARCHAR(20),
    jobcommand VARCHAR(64),
    dependencejobname VARCHAR(60),
    dependencejobstatus VARCHAR(20),
    dependencejobdelay VARCHAR(20)
);

revoke all on job from public;
create table time_oltp.message (
    messageid INT,
    ownerid INT,
    "name" VARCHAR(40),
    fromaddress VARCHAR(40),
    subject VARCHAR(40),
    templatetext VARCHAR(1),
    recipients TEXT
);

revoke all on message from public;
create table time_oltp.group (
    groupid INT,
    "name" VARCHAR(40)
);

revoke all on "group" from public;
create table time_oltp.groupjob (
    groupid INT,
    jobid INT
);

revoke all on groupjob from public;
create table time_oltp.country_name (
    country_name_id INT not null,
    name VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on country_name from public;
create table time_oltp.address_type (
    address_type_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on address_type from public;
create table time_oltp.address_relation (
    entity_id INT not null,
    address_type_id INT not null,
    address_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on address_relation from public;
create table time_oltp.contact_type (
    contact_type_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on contact_type from public;
create table time_oltp.contact_relation (
    entity_id INT not null,
    contact_type_id INT not null,
    contact_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on contact_relation from public;
create table time_oltp.payment_terms (
    payment_terms_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    active SMALLINT not null,
    term INT not null
);

revoke all on payment_terms from public;
create table time_oltp.application_area (
    app_area_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on application_area from public;
create table time_oltp.audit (
    audit_id INT not null,
    app_area_id INT not null,
    client_id INT,
    company_id INT,
    project_id INT,
    account_user_id INT,
    entity_id INT not null,
    table_name VARCHAR(64) not null,
    action_type INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null
);

revoke all on audit from public;
create table time_oltp.audit_detail (
    audit_detail_id INT not null,
    audit_id INT not null,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    column_name VARCHAR(64) not null
);

revoke all on audit_detail from public;
create table time_oltp.fix_bill_status (
    fix_bill_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on fix_bill_status from public;
create table time_oltp.fix_bill_type (
    fix_bill_type_id INT not null,
    description VARCHAR(64) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on fix_bill_type from public;
create table time_oltp.comp_fb_type (
    company_id INT not null,
    fix_bill_type_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_fb_type from public;
create table time_oltp.cut_off_time (
    cut_off_time_id INT not null,
    company_id INT not null,
    cut_off_time timestamp(0) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on cut_off_time from public;
create table time_oltp.invoice_status (
    invoice_status_id INT not null,
    description VARCHAR(64) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on invoice_status from public;
create table time_oltp.invoice (
    invoice_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null,
    salestax DECIMAL(7,3) not null,
    payment_terms_id INT not null,
    invoice_number VARCHAR(64),
    po_number VARCHAR(64),
    invoice_date DATE not null,
    due_date DATE not null,
    paid SMALLINT not null,
    company_id INT not null,
    invoice_status_id INT not null
);

revoke all on invoice from public;
create table time_oltp.fix_bill_entry (
    fix_bill_entry_id INT not null,
    company_id INT not null,
    client_id INT not null,
    project_id INT not null,
    invoice_id INT,
    fix_bill_status_id INT not null,
    description VARCHAR(255) not null,
    entry_date DATE not null,
    amount DECIMAL(17,2) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on fix_bill_entry from public;
create table time_oltp.fb_reject_reason (
    fix_bill_entry_id INT not null,
    reject_reason_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on fb_reject_reason from public;
create table time_oltp.project_fix_bill (
    fix_bill_entry_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on project_fix_bill from public;
create table time_oltp.service_details (
    service_detail_id INT not null,
    time_entry_id INT not null,
    invoice_id INT not null,
    rate INT not null,
    amount DECIMAL(16,2) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on service_details from public;
create table time_oltp.notify_clients (
    notification_id INT not null,
    client_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on notify_clients from public;
create table time_oltp.notify_projects (
    notification_id INT not null,
    project_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on notify_projects from public;
create table time_oltp.notify_resources (
    notification_id INT not null,
    user_account_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on notify_resources from public;
create table time_oltp.account_status (
    account_status_id INT not null,
    description VARCHAR(255) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on account_status from public;
create table time_oltp.comp_rej_email (
    company_id INT not null,
    reject_email_id INT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on comp_rej_email from public;
create table time_oltp.rate (
    rate_id INT not null,
    description VARCHAR(255),
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on rate from public;
create table time_oltp.user_status (
    user_status_id INT not null,
    company_id INT not null,
    description VARCHAR(255) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_status from public;
create table time_oltp.user_type (
    user_type_id INT not null,
    company_id INT not null,
    description VARCHAR(255) not null,
    active SMALLINT not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on user_type from public;
create table time_oltp.notification (
    notification_id INT not null,
    company_id INT not null,
    from_address VARCHAR(255) not null,
    subject VARCHAR(255) not null,
    message varchar(2000) not null,
    last_time_sent DATE,
    next_time_send DATE,
    status SMALLINT not null,
    job_name VARCHAR(40) not null,
    creation_date timestamp(0) not null,
    creation_user VARCHAR(64) not null,
    modification_date timestamp(0) not null,
    modification_user VARCHAR(64) not null
);

revoke all on notification from public;
create table time_oltp.data_type (
    data_type_id DECIMAL(5,0),
    data_type_desc VARCHAR(16)
);

revoke all on data_type from public;
create table time_oltp.command_group_lu (
    command_group_id DECIMAL(5,0) not null,
    command_group_name VARCHAR(100)
);

revoke all on command_group_lu from public;
create table time_oltp.command (
    command_id DECIMAL(10,0),
    command_desc VARCHAR(100),
    command_group_id DECIMAL(5,0)
);

revoke all on command from public;
create table time_oltp.command_execution (
    command_id DECIMAL(10,0),
    "timestamp" timestamp(3) default now(),
    execution_time INT,
    inputs varchar(2000)
);

revoke all on command_execution from public;
create table time_oltp.query (
    query_id DECIMAL(10,0),
    text TEXT,
    name VARCHAR(100),
    ranking INT,
    column_index INT
);

revoke all on query from public;
create table time_oltp.input_lu (
    input_id DECIMAL(10,0),
    input_code VARCHAR(25),
    data_type_id DECIMAL(5,0),
    input_desc VARCHAR(100)
);

revoke all on input_lu from public;
create table time_oltp.query_input_xref (
    query_id DECIMAL(10,0),
    optional CHAR(1),
    default_value VARCHAR(100),
    input_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
);

revoke all on query_input_xref from public;
create table time_oltp.command_query_xref (
    command_id DECIMAL(10,0),
    query_id DECIMAL(10,0),
    sort_order DECIMAL(3,0)
);

revoke all on command_query_xref from public;

CREATE TABLE time_oltp.client_user_xref (
  client_id         INTEGER NOT NULL,
  user_id           INTEGER NOT NULL,
  creation_date    timestamp(0) DEFAULT now(),
  creation_user     VARCHAR(64),
  modification_date timestamp(3) DEFAULT now(),
  modification_user VARCHAR(64)
);

revoke all on client_user_xref from public;
-- project_user_xref
CREATE TABLE project_user_xref (
  project_id        INTEGER NOT NULL,
  user_id           INTEGER NOT NULL,
  creation_date     timestamp(3) DEFAULT now(),
  creation_user     VARCHAR(64),
  modification_date timestamp(3) DEFAULT now(),
  modification_user VARCHAR(64)
);

revoke all on project_user_xref from public;
-- client_status
CREATE TABLE client_status (
  client_status_id  INTEGER NOT NULL,
  name              VARCHAR(64),
  description       VARCHAR(255),
  is_deleted        SMALLINT,
  creation_date     timestamp(3) DEFAULT now(),
  creation_user     VARCHAR(64),
  modification_date timestamp(3) DEFAULT now(),
  modification_user VARCHAR(64)
);

revoke all on client_status from public;
-- project_status
CREATE TABLE project_status (
  project_status_id INTEGER NOT NULL,
  name              VARCHAR(64),
  description       VARCHAR(255),
  is_deleted        SMALLINT,
  creation_date     timestamp(3) DEFAULT now(),
  creation_user     VARCHAR(64),
  modification_date timestamp(3) DEFAULT now(),
  modification_user VARCHAR(64)
);

revoke all on project_status from public;
-- project_xref
CREATE TABLE project_xref (
  parent_project_id INTEGER NOT NULL,
  child_project_id  INTEGER NOT NULL,
  is_deleted        SMALLINT,
  creation_date     timestamp(3) DEFAULT now(),
  creation_user     VARCHAR(64),
  modification_date timestamp(3) DEFAULT now(),
  modification_user VARCHAR(64)
);

revoke all on project_xref from public;


CREATE TABLE project_contest_fee(
project_contest_fee_id INTEGER NOT NULL,
project_id INTEGER NOT NULL,
---contest_type VARCHAR(64) NOT NULL,
---sub_type VARCHAR(64),
is_studio smallint NOT NULL,
contest_type_id INTEGER NOT NULL,
contest_fee DECIMAL(5,0),
creation_user VARCHAR(64),
creation_date timestamp(3),
modification_user VARCHAR(64),
modification_date timestamp(3),
is_deleted smallint,
"name" VARCHAR(64)
);

revoke all on project_contest_fee from public;


CREATE TABLE project_contest_fee_percentage(
    project_contest_fee_percentage_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    contest_fee_percentage DECIMAL(7,2),
    active BOOLEAN,
    creation_user VARCHAR(64),
    creation_date timestamp(3),
    modification_user VARCHAR(64),
    modification_date timestamp(3)
);

revoke all on project_contest_fee_percentage from public;


CREATE TABLE customer_platform_fee(
customer_platform_fee_id INTEGER NOT NULL,
client_id INTEGER NOT NULL,
payment_date timestamp(0),
amount DECIMAL(7,2),
creation_user VARCHAR(64),
creation_date timestamp(3),
modification_user VARCHAR(64),
modification_date timestamp(3)
);

revoke all on customer_platform_fee from public;

CREATE TABLE invoice_upload (
  invoice_upload_id        INTEGER NOT NULL,
  client_id				   INTEGER NOT NULL,
  invoice_upload_date      timestamp(3) DEFAULT now() NOT NULL,
  description              varchar(500),
  file_name	               VARCHAR(255) NOT NULL,
  creation_date            timestamp(3) DEFAULT now(),
  creation_user            VARCHAR(64),
  modification_date        timestamp(3) DEFAULT now(),
  modification_user        VARCHAR(64)
);

revoke all on invoice_upload from public;

CREATE SEQUENCE invoice_upload_seq;

grant select on time_oltp.invoice_upload_seq to public;

grant insert on principal to public;

grant select on principal to public;

grant update on principal to public;

grant delete on principal to public;

grant update on role to public;

grant select on role to public;

grant insert on role to public;

grant delete on role to public;

grant select on principal_role to public;

grant update on principal_role to public;

grant delete on principal_role to public;

grant insert on principal_role to public;

grant insert on action to public;

grant update on action to public;

grant delete on action to public;

grant select on action to public;

grant select on action_context to public;

grant update on action_context to public;

grant delete on action_context to public;

grant insert on action_context to public;

grant insert on role_action_context_permission to public;

grant select on role_action_context_permission to public;

grant update on role_action_context_permission to public;

grant delete on role_action_context_permission to public;

grant insert on principal_action_context_permission to public;

grant update on principal_action_context_permission to public;

grant select on principal_action_context_permission to public;

grant delete on principal_action_context_permission to public;

grant insert on comp_rej_email to public;

grant update on comp_rej_email to public;

grant select on comp_rej_email to public;

grant delete on comp_rej_email to public;

grant select on state_name to public;

grant insert on state_name to public;

grant update on state_name to public;

grant delete on state_name to public;

grant update on user_status to public;

grant select on user_status to public;

grant delete on user_status to public;

grant insert on user_status to public;

grant update on address to public;

grant delete on address to public;

grant insert on address to public;

grant select on address to public;

grant select on company to public;

grant update on company to public;

grant insert on company to public;

grant delete on company to public;

grant insert on user_type to public;

grant select on user_type to public;

grant delete on user_type to public;

grant update on user_type to public;

grant select on user_account to public;

grant insert on user_account to public;

grant delete on user_account to public;

grant update on user_account to public;

grant insert on notification to public;

grant delete on notification to public;

grant update on notification to public;

grant select on notification to public;

grant delete on contact to public;

grant select on contact to public;

grant insert on contact to public;

grant update on contact to public;

grant update on data_type to public;

grant insert on data_type to public;

grant select on data_type to public;

grant delete on data_type to public;

grant update on command_group_lu to public;

grant insert on command_group_lu to public;

grant select on command_group_lu to public;

grant delete on command_group_lu to public;

grant insert on comp_rej_reason to public;

grant delete on comp_rej_reason to public;

grant select on comp_rej_reason to public;

grant update on comp_rej_reason to public;

grant update on reject_email to public;

grant delete on reject_email to public;

grant insert on reject_email to public;

grant select on reject_email to public;

grant select on rate to public;

grant update on rate to public;

grant delete on rate to public;

grant insert on rate to public;

grant update on expense_type to public;

grant delete on expense_type to public;

grant select on expense_type to public;

grant insert on expense_type to public;

grant select on reject_reason to public;

grant delete on reject_reason to public;

grant update on reject_reason to public;

grant insert on reject_reason to public;

grant insert on expense_status to public;

grant update on expense_status to public;

grant delete on expense_status to public;

grant select on expense_status to public;

grant update on exp_reject_reason to public;

grant select on exp_reject_reason to public;

grant delete on exp_reject_reason to public;

grant insert on exp_reject_reason to public;

grant delete on comp_exp_type to public;

grant update on comp_exp_type to public;

grant insert on comp_exp_type to public;

grant select on comp_exp_type to public;

grant select on task_type to public;

grant insert on task_type to public;

grant delete on task_type to public;

grant update on task_type to public;

grant update on project_expense to public;

grant select on project_expense to public;

grant insert on project_expense to public;

grant delete on project_expense to public;

grant update on expense_entry to public;

grant insert on expense_entry to public;

grant select on expense_entry to public;

grant delete on expense_entry to public;

grant update on time_entry to public;

grant insert on time_entry to public;

grant select on time_entry to public;

grant delete on time_entry to public;

grant update on time_status to public;

grant select on time_status to public;

grant insert on time_status to public;

grant delete on time_status to public;

grant select on time_reject_reason to public;

grant delete on time_reject_reason to public;

grant insert on time_reject_reason to public;

grant update on time_reject_reason to public;

grant insert on comp_task_type to public;

grant delete on comp_task_type to public;

grant select on comp_task_type to public;

grant update on comp_task_type to public;

grant insert on project_time to public;

grant select on project_time to public;

grant update on project_time to public;

grant delete on project_time to public;

grant select on project_manager to public;

grant insert on project_manager to public;

grant delete on project_manager to public;

grant update on project_manager to public;

grant delete on command to public;

grant insert on command to public;

grant select on command to public;

grant update on command to public;

grant insert on client to public;

grant delete on client to public;

grant select on client to public;

grant update on client to public;

grant update on client_project to public;

grant delete on client_project to public;

grant select on client_project to public;

grant insert on client_project to public;

grant update on audit_action to public;

grant select on audit_action to public;

grant insert on audit_action to public;

grant delete on audit_action to public;

grant select on account_status_audit to public;

grant delete on account_status_audit to public;

grant insert on account_status_audit to public;

grant update on account_status_audit to public;

grant delete on state_name_audit to public;

grant update on state_name_audit to public;

grant select on state_name_audit to public;

grant insert on state_name_audit to public;

grant insert on reject_reason_audit to public;

grant delete on reject_reason_audit to public;

grant select on reject_reason_audit to public;

grant update on reject_reason_audit to public;

grant delete on address_audit to public;

grant update on address_audit to public;

grant insert on address_audit to public;

grant select on address_audit to public;

grant insert on company_audit to public;

grant select on company_audit to public;

grant delete on company_audit to public;

grant update on company_audit to public;

grant update on company_address_audit to public;

grant insert on company_address_audit to public;

grant select on company_address_audit to public;

grant delete on company_address_audit to public;

grant delete on user_account_audit to public;

grant select on user_account_audit to public;

grant insert on user_account_audit to public;

grant update on user_account_audit to public;

grant delete on user_address_audit to public;

grant select on user_address_audit to public;

grant insert on user_address_audit to public;

grant update on user_address_audit to public;

grant insert on contact_audit to public;

grant delete on contact_audit to public;

grant select on contact_audit to public;

grant update on contact_audit to public;

grant select on user_contact_audit to public;

grant update on user_contact_audit to public;

grant insert on user_contact_audit to public;

grant delete on user_contact_audit to public;

grant select on company_contact_audit to public;

grant delete on company_contact_audit to public;

grant insert on company_contact_audit to public;

grant update on company_contact_audit to public;

grant insert on comp_rej_reason_audit to public;

grant delete on comp_rej_reason_audit to public;

grant select on comp_rej_reason_audit to public;

grant update on comp_rej_reason_audit to public;

grant update on reject_email_audit to public;

grant select on reject_email_audit to public;

grant delete on reject_email_audit to public;

grant insert on reject_email_audit to public;

grant select on comp_reject_email_audit to public;

grant update on comp_reject_email_audit to public;

grant insert on comp_reject_email_audit to public;

grant delete on comp_reject_email_audit to public;

grant update on expense_status_audit to public;

grant insert on expense_status_audit to public;

grant select on expense_status_audit to public;

grant delete on expense_status_audit to public;

grant update on expense_type_audit to public;

grant delete on expense_type_audit to public;

grant select on expense_type_audit to public;

grant insert on expense_type_audit to public;

grant delete on expense_entry_audit to public;

grant insert on expense_entry_audit to public;

grant select on expense_entry_audit to public;

grant update on expense_entry_audit to public;

grant insert on exp_reject_reason_audit to public;

grant select on exp_reject_reason_audit to public;

grant delete on exp_reject_reason_audit to public;

grant update on exp_reject_reason_audit to public;

grant select on comp_exp_type_audit to public;

grant delete on comp_exp_type_audit to public;

grant update on comp_exp_type_audit to public;

grant insert on comp_exp_type_audit to public;

grant insert on project_audit to public;

grant delete on project_audit to public;

grant update on project_audit to public;

grant select on project_audit to public;

grant delete on project_expense_audit to public;

grant insert on project_expense_audit to public;

grant update on project_expense_audit to public;

grant select on project_expense_audit to public;

grant select on time_status_audit to public;

grant delete on time_status_audit to public;

grant update on time_status_audit to public;

grant insert on time_status_audit to public;

grant delete on task_type_audit to public;

grant insert on task_type_audit to public;

grant select on task_type_audit to public;

grant update on task_type_audit to public;

grant select on time_entry_audit to public;

grant update on time_entry_audit to public;

grant delete on time_entry_audit to public;

grant insert on time_entry_audit to public;

grant update on time_reject_reason_audit to public;

grant select on time_reject_reason_audit to public;

grant insert on time_reject_reason_audit to public;

grant delete on time_reject_reason_audit to public;

grant insert on comp_task_type_audit to public;

grant select on comp_task_type_audit to public;

grant delete on comp_task_type_audit to public;

grant update on comp_task_type_audit to public;

grant delete on project_time_audit to public;

grant select on project_time_audit to public;

grant insert on project_time_audit to public;

grant update on project_manager_audit to public;

grant select on project_manager_audit to public;

grant delete on project_manager_audit to public;

grant insert on project_manager_audit to public;

grant insert on project_worker_audit to public;

grant select on project_worker_audit to public;

grant delete on project_worker_audit to public;

grant update on project_worker_audit to public;

grant select on client_audit to public;

grant delete on client_audit to public;

grant insert on client_audit to public;

grant update on client_audit to public;

grant delete on client_project_audit to public;

grant update on client_project_audit to public;

grant insert on client_project_audit to public;

grant select on client_project_audit to public;

grant insert on dual to public;

grant select on dual to public;

grant update on dual to public;

grant delete on dual to public;

grant select on project_worker to public;

grant insert on project_worker to public;

grant update on project_worker to public;

grant delete on project_worker to public;

grant insert on project to public;

grant select on project to public;

grant update on project to public;

grant delete on project to public;

grant select on comp_rate to public;

grant update on comp_rate to public;

grant insert on comp_rate to public;

grant delete on comp_rate to public;

grant insert on job to public;

grant select on job to public;

grant update on job to public;

grant delete on job to public;

grant delete on message to public;

grant select on message to public;

grant update on message to public;

grant insert on message to public;

grant select on "group" to public;

grant insert on "group" to public;

grant delete on "group" to public;

grant update on "group" to public;

grant delete on command_execution to public;

grant insert on command_execution to public;

grant update on command_execution to public;

grant select on command_execution to public;

grant insert on query to public;

grant update on query to public;

grant delete on query to public;

grant select on query to public;

grant delete on input_lu to public;

grant insert on input_lu to public;

grant update on input_lu to public;

grant select on input_lu to public;

grant select on query_input_xref to public;

grant update on query_input_xref to public;

grant insert on query_input_xref to public;

grant delete on query_input_xref to public;

grant delete on command_query_xref to public;

grant select on command_query_xref to public;

grant update on command_query_xref to public;

grant insert on command_query_xref to public;

grant insert on user_contact_backup to public;

grant update on user_contact_backup to public;

grant delete on user_contact_backup to public;

grant select on user_contact_backup to public;

grant delete on user_address_backup to public;

grant select on user_address_backup to public;

grant update on user_address_backup to public;

grant insert on user_address_backup to public;

grant update on company_contact_backup to public;

grant delete on company_contact_backup to public;

grant insert on company_contact_backup to public;

grant select on company_contact_backup to public;

grant insert on company_address_backup to public;

grant select on company_address_backup to public;

grant update on company_address_backup to public;

grant delete on company_address_backup to public;

grant update on sequence_object to public;

grant delete on sequence_object to public;

grant insert on sequence_object to public;

grant select on sequence_object to public;

grant update on groupjob to public;

grant insert on groupjob to public;

grant delete on groupjob to public;

grant select on groupjob to public;

grant update on country_name to public;

grant insert on country_name to public;

grant select on country_name to public;

grant delete on country_name to public;

grant update on address_type to public;

grant select on address_type to public;

grant delete on address_type to public;

grant insert on address_type to public;

grant delete on address_relation to public;

grant update on address_relation to public;

grant insert on address_relation to public;

grant select on address_relation to public;

grant update on contact_type to public;

grant select on contact_type to public;

grant insert on contact_type to public;

grant delete on contact_type to public;

grant select on contact_relation to public;

grant delete on contact_relation to public;

grant update on contact_relation to public;

grant insert on contact_relation to public;

grant update on payment_terms to public;

grant delete on payment_terms to public;

grant insert on payment_terms to public;

grant select on payment_terms to public;

grant select on application_area to public;

grant delete on application_area to public;

grant update on application_area to public;

grant insert on application_area to public;

grant insert on audit to public;

grant update on audit to public;

grant select on audit to public;

grant delete on audit to public;

grant update on audit_detail to public;

grant delete on audit_detail to public;

grant select on audit_detail to public;

grant insert on audit_detail to public;

grant select on fix_bill_status to public;

grant insert on fix_bill_status to public;

grant update on fix_bill_status to public;

grant delete on fix_bill_status to public;

grant update on fix_bill_type to public;

grant select on fix_bill_type to public;

grant insert on fix_bill_type to public;

grant delete on fix_bill_type to public;

grant update on comp_fb_type to public;

grant delete on comp_fb_type to public;

grant select on comp_fb_type to public;

grant insert on comp_fb_type to public;

grant insert on cut_off_time to public;

grant select on cut_off_time to public;

grant update on cut_off_time to public;

grant delete on cut_off_time to public;

grant update on invoice_status to public;

grant select on invoice_status to public;

grant insert on invoice_status to public;


grant delete on invoice_status to public;

grant delete on invoice to public;

grant insert on invoice to public;

grant select on invoice to public;

grant update on invoice to public;

grant update on fix_bill_entry to public;

grant delete on fix_bill_entry to public;

grant select on fix_bill_entry to public;

grant insert on fix_bill_entry to public;

grant insert on fb_reject_reason to public;

grant select on fb_reject_reason to public;

grant delete on fb_reject_reason to public;

grant update on fb_reject_reason to public;

grant select on project_fix_bill to public;

grant insert on project_fix_bill to public;

grant update on project_fix_bill to public;

grant delete on project_fix_bill to public;

grant delete on service_details to public;

grant update on service_details to public;

grant insert on service_details to public;

grant select on service_details to public;

grant update on notify_clients to public;

grant insert on notify_clients to public;

grant delete on notify_clients to public;

grant select on notify_clients to public;

grant update on notify_projects to public;

grant insert on notify_projects to public;

grant select on notify_projects to public;

grant delete on notify_projects to public;

grant select on notify_resources to public;

grant delete on notify_resources to public;

grant insert on notify_resources to public;

grant update on notify_resources to public;

grant update on account_status to public;

grant insert on account_status to public;

grant delete on account_status to public;

grant select on account_status to public;

grant update on client_user_xref to public;

grant insert on client_user_xref to public;

grant delete on client_user_xref to public;

grant select on client_user_xref to public;

grant update on project_user_xref to public;

grant insert on project_user_xref to public;

grant delete on project_user_xref to public;

grant select on project_user_xref to public;

grant update on client_status to public;

grant insert on client_status to public;

grant delete on client_status to public;

grant select on client_status to public;

grant update on project_status to public;

grant insert on project_status to public;

grant delete on project_status to public;

grant select on project_status to public;

grant update on project_xref to public;

grant insert on project_xref to public;

grant delete on project_xref to public;

grant select on project_xref to public;

grant update on project_contest_fee to public;

grant insert on project_contest_fee to public;

grant delete on project_contest_fee to public;

grant select on project_contest_fee to public;

create sequence PROJECT_CONTEST_FEE_SEQ;


grant select on time_oltp.PROJECT_CONTEST_FEE_SEQ to public;

CREATE SEQUENCE project_contest_fee_percentage_seq;

grant select on time_oltp.project_contest_fee_percentage_seq to public;


grant update on project_contest_fee_percentage to public;

grant insert on project_contest_fee_percentage to public;

grant delete on project_contest_fee_percentage to public;

grant select on project_contest_fee_percentage to public;

CREATE SEQUENCE customer_platform_fee_seq;

grant select on time_oltp.customer_platform_fee_seq to public;

grant update on customer_platform_fee to public;
grant insert on customer_platform_fee to public;
grant delete on customer_platform_fee to public;
grant select on customer_platform_fee to public;

grant update on invoice_upload to public;
grant insert on invoice_upload to public;
grant delete on invoice_upload to public;
grant select on invoice_upload to public;


CREATE SEQUENCE SEQUENCE_PROJECT_SEQ INCREMENT BY 1 START WITH 10000000;
revoke all on time_oltp.SEQUENCE_PROJECT_SEQ from public;
grant select on time_oltp.SEQUENCE_PROJECT_SEQ to public;

CREATE SEQUENCE SEQUENCE_CLIENT_SEQ INCREMENT BY 1 START WITH 10000000;
revoke all on time_oltp.SEQUENCE_CLIENT_SEQ from public;
grant select on time_oltp.SEQUENCE_CLIENT_SEQ to public;

CREATE SEQUENCE SEQUENCE_ADDRESS_SEQ INCREMENT BY 1 START WITH 10000000;
revoke all on time_oltp.SEQUENCE_ADDRESS_SEQ from public;
grant select on time_oltp.SEQUENCE_ADDRESS_SEQ to public;

CREATE SEQUENCE SEQUENCE_CONTACT_SEQ INCREMENT BY 1 START WITH 10000000;
revoke all on time_oltp.SEQUENCE_CONTACT_SEQ from public;
grant select on time_oltp.SEQUENCE_CONTACT_SEQ to public;

CREATE SEQUENCE SEQUENCE_USER_ACCOUNT_SEQ INCREMENT BY 1 START WITH 10000000;
revoke all on time_oltp.SEQUENCE_USER_ACCOUNT_SEQ from public;
grant select on time_oltp.SEQUENCE_USER_ACCOUNT_SEQ to public;
