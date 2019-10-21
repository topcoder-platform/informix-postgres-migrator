SET search_path TO time_oltp;

create or replace function time_oltp.millis_to_time(milli_val decimal(14,0))returns TIMESTAMP AS $$
declare
	retval TIMESTAMP;
	num_seconds int;
	millis_in_day int := 86400000;
	num_days int;
begin
  num_days := trunc(milli_val/millis_in_day,0);
  num_seconds := (milli_val - (num_days * millis_in_day))/1000;

  retval := to_date('01-01-1970', 'DD-MM-YYYY')::TIMESTAMP;
  retval := retval + num_days * INTERVAL '1 day';
  retval := retval + num_seconds * INTERVAL '1 second';

  return retval;
end;
$$ language plpgsql;

create or replace function moverate() returns void as $$
DECLARE
rate_tmp MONEY;
cursor1 CURSOR FOR SELECT rate_id FROM comp_rate;
begin
	ALTER TABLE rate
		ALTER COLUMN rate TYPE MONEY,
		ALTER COLUMN rate set not NUll;

	-- ALTER TABLE comp_rate
    --	add column rate MONEY BEFORE creation_date;

	FOR rateid IN cursor1 LOOP
		SELECT rate INTO rate_tmp FROM rate WHERE rate_id = rateid;
		UPDATE comp_rate SET rate = rate_tmp WHERE rate_id = rateid;
	END LOOP;

	ALTER TABLE comp_rate
		ALTER COLUMN rate type MONEY,
		ALTER COLUMN rate set NOT null;
	ALTER TABLE rate DROP column rate;
END;
$$ language plpgsql;


create or replace function address_relation() returns void as $$
DECLARE user_account_id_var INTEGER;
 user_address_id_var INTEGER;
 user_creation_date_var TIMESTAMP(0);
 user_creation_user_var VARCHAR(64);
 user_modification_date_var TIMESTAMP(0);
 user_modification_user_var VARCHAR(64);
 company_id_var INTEGER;
 company_address_id_var INTEGER;
 company_creation_date_var TIMESTAMP(0);
 company_creation_user_var VARCHAR(64);
 company_modification_date_var TIMESTAMP(0);
 company_modification_user_var VARCHAR(64);
 v_cursor1_rec RECORD;
 v_cursor2_rec RECORD;
begin

	for v_cursor1_rec in SELECT user_account_id user_account_id_var, address_id user_address_id_var, creation_date user_creation_date_var, creation_user user_creation_user_var, modification_date user_modification_date_var, modification_user user_modification_user_var FROM user_address
		loop
			INSERT INTO address_relation (entity_id, address_type_id, creation_date, creation_user, modification_date, modification_user, address_id) VALUES (user_account_id_var, 4, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var, user_address_id_var);
	end loop;

	for v_cursor2_rec in SELECT company_id company_id_var, address_id company_address_id_var, creation_date company_creation_date_var, creation_user company_creation_user_var, modification_date company_modification_date_var, modification_user company_modification_user_var FROM company_address
	   loop
		INSERT INTO address_relation (entity_id, address_type_id, creation_date, creation_user, modification_date, modification_user, address_id) VALUES (company_id_var, 3, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var, company_address_id_var);
	end loop;

END;
$$ language plpgsql;


create or replace function contact_relation() returns void as $$
 DECLARE user_account_id_var INTEGER;
 user_contact_id_var INTEGER;
 user_creation_date_var TIMESTAMP(0);
 user_creation_user_var VARCHAR(64);
 user_modification_date_var TIMESTAMP(0);
 user_modification_user_var VARCHAR(64);
 company_id_var INTEGER;
 company_contact_id_var INTEGER;
 company_creation_date_var TIMESTAMP(0);
 company_creation_user_var VARCHAR(64);
 company_modification_date_var TIMESTAMP(0);
 company_modification_user_var VARCHAR(64);
 v_cursor1_rec RECORD;
 v_cursor2_rec RECORD;
begin

	for v_cursor1_rec in SELECT user_account_id user_account_id_var, contact_id user_contact_id_var, creation_date user_creation_date_var, creation_user user_creation_user_var, modification_date user_modification_date_var, modification_user user_modification_user_var FROM user_contact
	 loop
		INSERT INTO contact_relation (entity_id, creation_date, creation_user, modification_date, modification_user, contact_id, contact_type_id) VALUES (user_account_id_var, user_creation_date_var, user_creation_user_var, user_modification_date_var, user_modification_user_var, user_contact_id_var, 4);
	end loop;

	for v_cursor2_rec in SELECT company_id  company_id_var, contact_id company_contact_id_var, creation_date company_creation_date_var, creation_user company_creation_user_var, modification_date company_modification_date_var, modification_user  company_modification_user_var FROM company_contact
	loop
		INSERT INTO contact_relation (entity_id, creation_date, creation_user, modification_date, modification_user, contact_id, contact_type_id) VALUES (company_id_var, company_creation_date_var, company_creation_user_var, company_modification_date_var, company_modification_user_var, company_contact_id_var, 3);
	end loop;
END;
$$ language plpgsql;

create or replace function client_proj_addr_contact() returns void as $$
DECLARE
	max_address_id INTEGER;
 	max_contact_id INTEGER;
 	client_id_var INTEGER;
 	project_id_var INTEGER;
	cursor1 RECORD;
    cursor2 RECORD;
begin

	SELECT MAX(address_id)+20 INTO max_address_id FROM address;
	SELECT MAX(contact_id)+20 INTO max_contact_id FROM contact;

	for cursor1 in SELECT client_id client_id_var FROM client
	 loop
		INSERT INTO address(address_id, line1, city, country_name_id, state_name_id, zip_code, creation_date, creation_user, modification_date, modification_user) VALUES(max_address_id, '703 Hebron Avenue', 'Glastonbury', 840, 7, '06033', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO address_relation(entity_id, address_type_id, address_id, creation_date, creation_user, modification_date, modification_user) VALUES(client_id_var, 2, max_address_id, CURRENT, 'System', CURRENT, 'System');

		INSERT INTO contact(contact_id, first_name, last_name, phone, email, creation_date, creation_user, modification_date, modification_user) VALUES(max_contact_id, 'Bogus name', 'Auto generated', '860-633-5540', 'notexistent@topcoder.com', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO contact_relation(entity_id, contact_type_id, contact_id, creation_date, creation_user, modification_date, modification_user) VALUES(client_id_var, 2, max_contact_id, CURRENT, 'System', CURRENT, 'System');

		SELECT MAX(address_id)+1 INTO max_address_id FROM address;
		SELECT MAX(contact_id)+1 INTO max_contact_id FROM contact;
	end loop;


	SELECT MAX(address_id)+20 INTO max_address_id FROM address;
	SELECT MAX(contact_id)+20 INTO max_contact_id FROM contact;

	for cursor2 in SELECT project_id project_id_var FROM project
	   loop
		INSERT INTO address(address_id, line1, city, country_name_id, state_name_id, zip_code, creation_date, creation_user, modification_date, modification_user) VALUES(max_address_id, '703 Hebron Avenue', 'Glastonbury', 840, 7, '06033', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO address_relation(entity_id, address_type_id, address_id, creation_date, creation_user, modification_date, modification_user) VALUES(project_id_var, 1, max_address_id, CURRENT, 'System', CURRENT, 'System');

		INSERT INTO contact(contact_id, first_name, last_name, phone, email, creation_date, creation_user, modification_date, modification_user) VALUES(max_contact_id, 'Bogus name', 'Auto generated', '860-633-5540', 'notexistent@topcoder.com', CURRENT, 'System', CURRENT, 'System');
		INSERT INTO contact_relation(entity_id, contact_type_id, contact_id, creation_date, creation_user, modification_date, modification_user) VALUES(project_id_var, 1, max_contact_id, CURRENT, 'System', CURRENT, 'System');

		SELECT MAX(address_id)+1 INTO max_address_id FROM address;
		SELECT MAX(contact_id)+1 INTO max_contact_id FROM contact;
	end loop;
END ;
$$ language plpgsql;

create or replace function project_relation() returns void as $$
DECLARE
	client_id_var INTEGER;
 	project_id_var INTEGER;
 	entry_id_var INTEGER;
    cursor1 RECORD;
begin

	for cursor1 in SELECT project_id project_id_var, time_entry_id entry_id_var FROM project_time
	 loop
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE time_entry SET client_id = client_id_var, project_id = project_id_var WHERE time_entry.time_entry_id = entry_id_var;
	end loop;

	DELETE FROM time_entry WHERE client_id IS NULL AND project_id IS NULL;

	ALTER TABLE time_entry alter column client_id TYPE INTEGER, alter column client_id set NOT NULL;
	ALTER TABLE time_entry alter column project_id TYPE INTEGER, alter column project_id set NOT NULL;

	for cursor1 in SELECT project_id project_id_var, expense_entry_id entry_id_var FROM project_expense
	 loop
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE expense_entry SET client_id = client_id_var, project_id = project_id_var WHERE expense_entry.expense_entry_id = entry_id_var;
	end loop;

	DELETE FROM expense_entry WHERE client_id IS NULL AND project_id IS NULL;

	ALTER TABLE expense_entry alter column client_id type INTEGER, alter column client_id set NOT NULL;
	ALTER TABLE expense_entry alter column project_id type INTEGER, alter column project_id set NOT NULL;

	for cursor1 in SELECT project_id project_id_var, fix_bill_entry_id entry_id_var FROM project_fix_bill
	 loop
		SELECT client_id INTO client_id_var FROM client_project WHERE client_project.project_id = project_id_var;
		UPDATE fix_bill_entry SET client_id = client_id_var, project_id = project_id_var WHERE fix_bill_entry.fix_bill_entry_id = entry_id_var;
	end loop;
END ;
$$ language plpgsql;

grant execute on function millis_to_time(decimal) to public;

grant execute on function moverate() to public;

grant execute on function address_relation() to public;

grant execute on function contact_relation() to public;

grant execute on function client_proj_addr_contact() to public;

grant execute on function project_relation() to public;

create or replace function time_oltp.proc_account_status_change() returns trigger as $$
begin

  if (TG_OP = 'DELETE') then
	 insert into time_oltp.account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.account_status_id , old.description ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 		return old;
  elseif (TG_OP = 'INSERT') then
  	insert into time_oltp.account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,modification_date,modification_user)
        values (1 ,new.account_status_id ,new.description ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
    insert into time_oltp.account_status_audit (audit_action_id,account_status_id,description,creation_date,creation_user,
            modification_date,modification_user)
        values (2 , new.account_status_id ,new.description ,new.creation_date ,new.creation_user , new.modification_date ,
        new.modification_user);

    END if;
    return new;
end;
$$ language plpgsql;

grant execute on function time_oltp.proc_account_status_change() TO PUBLIC;

create trigger trig_change_account_status before delete or update or insert on account_status
for each row execute procedure time_oltp.proc_account_status_change();

create or replace function time_oltp.proc_state_name_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
    insert into time_oltp.state_name_audit (audit_action_id,state_name_id,name,abbreviation,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.state_name_id ,old.name ,old.abbreviation ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
	return old;
 elseif (TG_OP = 'INSERT') then
   insert into time_oltp.state_name_audit (audit_action_id,state_name_id,"name",abbreviation,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.state_name_id ,new.name ,new.abbreviation ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user);
 else
   insert into time_oltp.state_name_audit (audit_action_id,state_name_id,name,abbreviation,creation_date,creation_user,modification_date,modification_user)
       values (2 , new.state_name_id ,new.name ,new.abbreviation ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
  return new;
end;
$$ language plpgsql;


create trigger trig_state_name  before delete or update or insert on state_name
for each row execute procedure time_oltp.proc_state_name_change();

create or replace function time_oltp.proc_reject_reason_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
    insert into time_oltp.reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.reject_reason_id ,old.description ,old.active ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user);
	return old;
 elseif (TG_OP = 'INSERT') then
   insert into time_oltp.reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.reject_reason_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
    insert into time_oltp.reject_reason_audit (audit_action_id,reject_reason_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.reject_reason_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
  return new;
end;
$$ language plpgsql;

create trigger trig_reject_reason before delete or update or insert on reject_reason
for each row execute procedure time_oltp.proc_reject_reason_change();

create or replace function time_oltp.proc_address_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
  insert into time_oltp.address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.address_id ,old.line1 ,old.line2 ,old.city ,old.state_name_id ,old.zip_code ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
	return old;
 elseif (TG_OP = 'INSERT') then
  insert into time_oltp.address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.address_id ,new.line1 ,new.line2 ,new.city ,new.state_name_id ,new.zip_code ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
     insert into time_oltp.address_audit (audit_action_id,address_id,line1,line2,city,state_name_id,zip_code,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.address_id ,new.line1 ,new.line2 ,new.city ,new.state_name_id ,new.zip_code ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
  return new;
end;
$$ language plpgsql;

create trigger trig_address before delete or update or insert on address
for each row execute procedure time_oltp.proc_address_change();

create or replace function time_oltp.proc_company_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
    insert into time_oltp.company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.company_id ,old.name ,old.passcode ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
	return old;
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.company_id ,new.name ,new.passcode ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
    insert into time_oltp.company_audit (audit_action_id,company_id,name,passcode,creation_date,creation_user,modification_date,modification_user)
 		values (2 ,new.company_id ,new.name ,new.passcode ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_company before delete or update or insert on company
for each row execute procedure time_oltp.proc_company_change();

create or replace function time_oltp.proc_user_account_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
   insert into time_oltp.user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.user_account_id ,old.company_id ,old.account_status_id ,old.user_name ,old.password ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
	return old;
 elseif (TG_OP = 'INSERT') then
     insert into time_oltp.user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)
 values (1 ,new.user_account_id ,new.company_id ,new.account_status_id ,new.user_name ,new.password ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
     insert into time_oltp.user_account_audit (audit_action_id,user_account_id,company_id,account_status_id,user_name,password,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.user_account_id ,new.company_id ,new.account_status_id ,new.user_name ,new.password ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_company before delete or update or insert on user_account
for each row execute procedure time_oltp.proc_user_account_change();

create or replace function time_oltp.proc_contact_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
        insert into time_oltp.contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.contact_id ,old.first_name ,old.last_name ,old.phone ,old.email ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
	return old;
 elseif (TG_OP = 'INSERT') then
     insert into time_oltp.contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)  values
       (1 ,new.contact_id ,new.first_name ,new.last_name ,new.phone ,new.email ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
      insert into time_oltp.contact_audit (audit_action_id,contact_id,first_name,last_name,phone,email,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.contact_id ,new.first_name ,new.last_name ,new.phone ,new.email ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_contact before delete or update or insert on contact
for each row execute procedure time_oltp.proc_contact_change();

create or replace function time_oltp.proc_comp_rej_reason_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.company_id ,old.reject_reason_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user);
	return old;
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.company_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user);
 else
       insert into time_oltp.comp_rej_reason_audit (audit_action_id,company_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.company_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user);
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_comp_rej_reason before delete or update or insert on comp_rej_reason
for each row execute procedure time_oltp.proc_comp_rej_reason_change();

create or replace function time_oltp.proc_reject_email_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.reject_email_id ,old.body ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
      insert into time_oltp.reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.reject_email_id ,new.body ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
    insert into time_oltp.reject_email_audit (audit_action_id,reject_email_id,body,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.reject_email_id ,new.body,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_comp_rej_reason before delete or update or insert on reject_email
for each row execute procedure time_oltp.proc_reject_email_change();

create or replace function time_oltp.proc_expense_status_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
      insert into time_oltp.expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.expense_status_id ,old.description ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.expense_status_id ,new.description ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
       insert into time_oltp.expense_status_audit (audit_action_id,expense_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.expense_status_id ,new.description ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_expense_status before delete or update or insert on expense_status
for each row execute procedure time_oltp.proc_expense_status_change();

create or replace function time_oltp.proc_expense_type_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
        insert into time_oltp.expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.expense_type_id ,old.description ,old.active ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
  insert into time_oltp.expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.expense_type_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
        insert into time_oltp.expense_type_audit (audit_action_id,expense_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.expense_type_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_expense_type before delete or update or insert on expense_type
for each row execute procedure time_oltp.proc_expense_type_change();

create or replace function time_oltp.proc_expense_entry_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
      insert into time_oltp.expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.expense_entry_id ,old.company_id ,old.expense_type_id ,old.expense_status_id ,old.description ,old.entry_date ,old.amount ,old.billable ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
     insert into time_oltp.expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.expense_entry_id ,new.company_id ,new.expense_type_id ,new.expense_status_id ,new.description ,new.entry_date ,new.amount ,new.billable ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
      insert into time_oltp.expense_entry_audit (audit_action_id,expense_entry_id,company_id,expense_type_id,expense_status_id,description,entry_date,amount,billable,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.expense_entry_id ,new.company_id ,new.expense_type_id ,new.expense_status_id ,new.description ,new.entry_date ,new.amount ,new.billable ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_expense_entry before delete or update or insert on expense_entry
for each row execute procedure time_oltp.proc_expense_entry_change();

create or replace function time_oltp.proc_exp_reject_reason_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
        insert into time_oltp.exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.expense_entry_id ,old.reject_reason_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
	insert into time_oltp.exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.expense_entry_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
       insert into time_oltp.exp_reject_reason_audit (audit_action_id,expense_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.expense_entry_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_exp_reject_reason before delete or update or insert on exp_reject_reason
for each row execute procedure time_oltp.proc_exp_reject_reason_change();

create or replace function time_oltp.proc_comp_exp_type_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
     insert into time_oltp.comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.company_id ,old.expense_type_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
 insert into time_oltp.comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.company_id ,new.expense_type_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
      insert into time_oltp.comp_exp_type_audit (audit_action_id,company_id,expense_type_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.company_id ,new.expense_type_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_comp_exp_type before delete or update or insert on comp_exp_type
for each row execute procedure time_oltp.proc_comp_exp_type_change();

create or replace function time_oltp.proc_project_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
         insert into time_oltp.project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.project_id ,old.company_id ,old.name ,old.description ,old.start_date ,old.end_date ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.project_id ,new.company_id ,new.name ,new.description ,new.start_date ,new.end_date ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
      insert into time_oltp.project_audit (audit_action_id,project_id,company_id,name,description,start_date,end_date,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.project_id ,new.company_id ,new.name ,new.description ,new.start_date ,new.end_date ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_project before delete or update or insert on project
for each row execute procedure time_oltp.proc_project_change();

create or replace function time_oltp.proc_project_expense_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
         insert into time_oltp.project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)
       values (3 ,old.project_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user ,old.expense_entry_id );
 elseif (TG_OP = 'INSERT') then
        insert into time_oltp.project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)
       values (1 ,new.project_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user ,new.expense_entry_id );
  else
         insert into time_oltp.project_expense_audit (audit_action_id,project_id,creation_date,creation_user,modification_date,modification_user,expense_entry_id)
       values (2 ,new.project_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user ,new.expense_entry_id );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_project_expense before delete or update or insert on project_expense
for each row execute procedure time_oltp.proc_project_expense_change();


create or replace function time_oltp.proc_time_status_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.time_status_id ,old.description ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.time_status_id ,new.description ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
       insert into time_oltp.time_status_audit (audit_action_id,time_status_id,description,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.time_status_id ,new.description ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_time_status before delete or update or insert on time_status
for each row execute procedure time_oltp.proc_time_status_change();

create or replace function time_oltp.proc_task_type_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
         insert into time_oltp.task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.task_type_id ,old.description ,old.active ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
        insert into time_oltp.task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.task_type_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
          insert into time_oltp.task_type_audit (audit_action_id,task_type_id,description,active,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.task_type_id ,new.description ,new.active ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_task_type before delete or update or insert on task_type
for each row execute procedure time_oltp.proc_task_type_change();


create or replace function time_oltp.proc_time_entry_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
         insert into time_oltp.time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.time_entry_id ,old.company_id ,old.time_status_id ,old.task_type_id ,old.description ,old.entry_date ,old.hours ,old.billable ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
         insert into time_oltp.time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.time_entry_id ,new.company_id ,new.time_status_id ,new.task_type_id ,new.description ,new.entry_date ,new.hours ,new.billable ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
         insert into time_oltp.time_entry_audit (audit_action_id,time_entry_id,company_id,time_status_id,task_type_id,description,entry_date,hours,billable,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.time_entry_id ,new.company_id ,new.time_status_id ,new.task_type_id ,new.description ,new.entry_date ,new.hours ,new.billable ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_time_entry before delete or update or insert on time_entry
for each row execute procedure time_oltp.proc_time_entry_change();

create or replace function time_oltp.proc_time_reject_reason_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.time_entry_id ,old.reject_reason_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
   insert into time_oltp.time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.time_entry_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
        insert into time_oltp.time_reject_reason_audit (audit_action_id,time_entry_id,reject_reason_id,creation_date,creation_user,modification_date,modification_user)
 values (2 ,new.time_entry_id ,new.reject_reason_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_time_reject_reason before delete or update or insert on time_reject_reason
for each row execute procedure time_oltp.proc_time_reject_reason_change();

create or replace function time_oltp.proc_comp_task_type_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.company_id ,old.task_type_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
  insert into time_oltp.comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.company_id ,new.task_type_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
      insert into time_oltp.comp_task_type_audit (audit_action_id,company_id,task_type_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.company_id ,new.task_type_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_comp_task_type before delete or update or insert on comp_task_type
for each row execute procedure time_oltp.proc_comp_task_type_change();

create or replace function time_oltp.proc_project_time_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.project_id ,old.time_entry_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
       insert into time_oltp.project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.project_id ,new.time_entry_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
       insert into time_oltp.project_time_audit (audit_action_id,project_id,time_entry_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.project_id ,new.time_entry_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_project_time before delete or update or insert on project_time
for each row execute procedure time_oltp.proc_project_time_change();

create or replace function time_oltp.proc_project_manager_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.project_id ,old.user_account_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
      insert into time_oltp.project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.project_id ,new.user_account_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
      insert into time_oltp.project_manager_audit (audit_action_id,project_id,user_account_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.project_id ,new.user_account_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_project_manager before delete or update or insert on project_manager
for each row execute procedure time_oltp.proc_project_manager_change();

create or replace function time_oltp.proc_project_worker_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.project_id ,old.user_account_id ,old.start_date ,old.end_date ,old.pay_rate ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
     insert into time_oltp.project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.project_id ,new.user_account_id ,new.start_date ,new.end_date ,new.pay_rate ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
       insert into time_oltp.project_worker_audit (audit_action_id,project_id,user_account_id,start_date,end_date,pay_rate,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.project_id ,new.user_account_id ,new.start_date ,new.end_date ,new.pay_rate ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_project_worker before delete or update or insert on project_worker
for each row execute procedure time_oltp.proc_project_worker_change();


create or replace function time_oltp.proc_client_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
    insert into time_oltp.client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.client_id ,old.name ,old.company_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
      insert into time_oltp.client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.client_id ,new.name ,new.company_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  else
       insert into time_oltp.client_audit (audit_action_id,client_id,name,company_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.client_id ,new.name ,new.company_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_client before delete or update or insert on client
for each row execute procedure time_oltp.proc_client_change();

create or replace function time_oltp.proc_client_project_change() returns trigger as $$
begin
 if (TG_OP = 'DELETE') then
       insert into time_oltp.client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)
       values (3 ,old.client_id ,old.project_id ,old.creation_date ,old.creation_user ,old.modification_date ,old.modification_user );
 elseif (TG_OP = 'INSERT') then
    insert into time_oltp.client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)
       values (1 ,new.client_id ,new.project_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
 else
   insert into time_oltp.client_project_audit (audit_action_id,client_id,project_id,creation_date,creation_user,modification_date,modification_user)
       values (2 ,new.client_id ,new.project_id ,new.creation_date ,new.creation_user ,new.modification_date ,new.modification_user );
  end if;
 return new;
end;
$$ language plpgsql;

create trigger trig_client_project before delete or update or insert on client_project
for each row execute procedure time_oltp.proc_client_project_change();

create view client_company
as select * from time_oltp.company;
