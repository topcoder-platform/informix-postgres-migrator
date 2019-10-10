set search_path to informixoltp;

create view address
as select * from common_oltp.address;

create view calendar
as select * from common_oltp.calendar;

create view company
as select * from common_oltp.company;

create view company_datasource_xref
as select * from common_oltp.company_datasource_xref;

create view contact
as select * from common_oltp.contact;

create view country
as select * from common_oltp.country;

create view datasource_lu
as select * from common_oltp.datasource_lu;

create view datasource_type_lu
as select * from common_oltp.datasource_type_lu;

create view demographic_answer
as select * from common_oltp.demographic_answer;

create view demographic_assignment
as select * from common_oltp.demographic_assignment;

create view demographic_question
as select * from common_oltp.demographic_question;

create view demographic_response
as select * from common_oltp.demographic_response;

create view email
as select * from common_oltp.email;

create view email_user
as select * from common_oltp.email_user;

create view event
as select * from common_oltp.event;

--BUGR-4316 : 206: The specified table (common_oltp:informix.event_question_xref) is not in the database.
--create view event_question_xref
--as select * from common_oltp.event_question_xref;

create view event_registration
as select * from common_oltp.event_registration;

create view event_type_lu
as select * from common_oltp.event_type_lu;

create view group_role_xref
as select * from common_oltp.group_role_xref;

create view id_sequences
as select * from common_oltp.id_sequences;

create view note
as select * from common_oltp.note;

create view note_type_lu
as select * from common_oltp.note_type_lu;

create view notify_lu
as select * from common_oltp.notify_lu;

create view notify_type_lu
as select * from common_oltp.notify_type_lu;

create view password_recovery
as select * from common_oltp.password_recovery;

create view phone
as select * from common_oltp.phone;

create view preference_group_lu
as select * from common_oltp.preference_group_lu;

create view preference_lu
as select * from common_oltp.preference_lu;

create view preference_type_lu
as select * from common_oltp.preference_type_lu;

create view preference_value
as select * from common_oltp.preference_value;

create view professor
as select * from common_oltp.professor;

create view professor_status_lu
as select * from common_oltp.professor_status_lu;

create view registration_type_lu
as select * from common_oltp.registration_type_lu;

create view registration_type_notify_xref
as select * from common_oltp.registration_type_notify_xref;

create view registration_type_preference_xref
as select * from common_oltp.registration_type_preference_xref;

create view school
as select * from common_oltp.school;

create view school_association_type_lu
as select * from common_oltp.school_association_type_lu;

create view school_type_lu
as select * from common_oltp.school_type_lu;

create view secret_question
as select * from common_oltp.secret_question;

create view security_groups
as select * from common_oltp.security_groups;

create view security_perms
as select * from common_oltp.security_perms;

create view security_roles
as select * from common_oltp.security_roles;

create view security_user
as select * from common_oltp.security_user;

create view sequence_object
as select * from common_oltp.sequence_object;

create view state
as select * from common_oltp.state;

create view terms_of_use
as select * from common_oltp.terms_of_use;

create view terms_of_use_type
as select * from common_oltp.terms_of_use_type;

create view timezone_lu
as select * from common_oltp.timezone_lu;

create view "user"
as select * from common_oltp.user;

create view user_achievement
as select * from common_oltp.user_achievement;

create view user_address_xref
as select * from common_oltp.user_address_xref;

create view user_group_xref
as select * from common_oltp.user_group_xref;

create view user_note_xref
as select * from common_oltp.user_note_xref;

create view user_notify_xref
as select * from common_oltp.user_notify_xref;

create view user_preference
as select * from common_oltp.user_preference;

create view user_role_xref
as select * from common_oltp.user_role_xref;

create view user_school
as select * from common_oltp.user_school;

create view user_terms_of_use_xref
as select * from common_oltp.user_terms_of_use_xref;

create view user_security_key
as select * from common_oltp.user_security_key;

create view terms_of_use_agreeability_type_lu
as select * from common_oltp.terms_of_use_agreeability_type_lu;

create view invalid_handles
as select * from common_oltp.invalid_handles;

create view user_social_login
as select * from common_oltp.user_social_login;

create or replace function informixoltp.calc_seconds(start_timestamp timestamp , end_timestamp timestamp)
returns int as $body$
declare
    x int;
    i interval second ;
begin
    i := end_timestamp - start_timestamp;
    x := i::varchar(20)::numeric;
    return x;
end;
$body$ language plpgsql;

create or replace function informixoltp.get_current() returns timestamp as $body$
begin
    return now();
end;
$body$ language plpgsql;

create or replace function informixoltp.nextval(i_seqnum INTEGER) returns int as $body$
declare
    v numeric := -1;
begin
    update sequence_object
    set current_value = current_value +1
    where id = i_seqnum
    returning current_value into v;
    return v;
end;
$body$ language plpgsql;

create or replace function proc_ratinghistory(
  i_roundId           integer
, i_coderId           integer
, i_new_rating        integer, i_old_rating integer
, i_new_num_ratings   integer, i_old_num_ratings integer
, i_new_vol           integer, i_old_vol integer
, i_new_rating_no_vol integer, i_old_rating_no_vol integer
) returns void as $body$
begin
  insert into rating_history
       (round_id, coder_id
       , new_rating, old_rating
       , new_num_ratings, old_num_ratings
       , new_vol, old_vol
       , new_rating_no_vol, old_rating_no_vol, timestamp)
  values (i_roundId, i_coderId
       , i_new_rating, i_old_rating
       , i_new_num_ratings, i_old_num_ratings
       , i_new_vol ,  i_old_vol
       , i_new_rating_no_vol, i_old_rating_no_vol,  current_timestamp );
    update rating set modify_date = current_timestamp where coder_id = i_coderId ;
end ;
$body$ language plpgsql;

create or replace function jmsfix() returns void as $body$
begin
    lock tablejmsmessagequeue in share mode;
    create TEMP table jmsfix1 as
    select consumerid, messageid, state from JMSMessageQueue
    where exists (select *  from  JMSMessageQueue MQ1
                  WHERE JMSMessageQueue.state  < MQ1.state
                    AND JMSMessageQueue.messageId  = MQ1.messageId
                    AND JMSMessageQueue.consumerId = MQ1.consumerId);
    delete from jmsmessagequeue where exists (select * from jmsfix1 where
                        jmsmessagequeue.state = jmsfix1.state
                    AND JMSMessageQueue.messageId  = jmsfix1.messageId
                    AND JMSMessageQueue.consumerId = jmsfix1.consumerId) ;
    drop table jmsfix1;
end ;
$body$ language plpgsql;

create or replace function proc_problem_insert() returns trigger as $body$
begin
    update problem set create_date = current_timestamp
    where problem_id = NEW.problem_Id;
    return NEW;
end ;
$body$ language plpgsql;

create or replace function proc_coder_update() returns trigger as $body$
begin
    if (OLD.quote != NEW.quote) then
     insert into audit_coder (column_name, old_value, new_value, user_id)
     values ('QUOTE', OLD.quote , NEW.quote, OLD.coder_id);
    end if;

    if (OLD.coder_type_id != NEW.coder_type_id) then
     insert into audit_coder (column_name, old_value, new_value, user_id)
     values ('CODER_TYPE', OLD.coder_type_id , NEW.coder_type_id, OLD.coder_id);
    end if;
    if (OLD.language_id != NEW.language_id) then
     insert into audit_coder (column_name, old_value, new_value, user_id)
     values ('LANGUAGE', OLD.language_id , NEW.language_id, OLD.coder_id);
    end if;
    if (OLD.comp_country_code != NEW.comp_country_code) then
     insert into audit_coder (column_name, old_value, new_value, user_id)
     values ('COMP_COUNTRY', OLD.comp_country_code , NEW.comp_country_code, OLD.coder_id);
    end if;
    update coder set modify_date = current where coder_id = OLD.coder_id;
    return NEW;
end ;
$body$ language plpgsql;

create or replace function proc_systemtest_modified() returns trigger as $body$
begin
  update system_test_case set
        system_test_case.modify_date = current_timestamp
        where (test_case_id = OLD.test_case_id ) AND (component_id = OLD.component_id);
  return NEW;
end ;
$body$ language plpgsql;

create or replace function proc_current_school_update() returns trigger as $body$
begin
    if (OLD.school_id != NEW.school_id or OLD.viewable != NEW.viewable or OLD.gpa != NEW.gpa or OLD.gpa_scale != NEW.gpa_scale) then
     insert into current_school_audit (coder_id, school_id, gpa, gpa_scale, viewable)
     values (OLD.coder_id, OLD.school_id, OLD.gpa, OLD.gpa_scale, OLD.viewable);
    end if;
    update current_school set modify_date = current where coder_id = OLD.coder_id;
    return NEW;
end ;
$body$ language plpgsql;

create or replace function millis_to_time(milli_val decimal(14,0)) returns timestamp as $body$
declare
	retval timestamp;
	num_seconds int;
	millis_in_day int := 86400000;
	num_days int;
begin
    num_days := trunc(milli_val/millis_in_day,0);
    num_seconds := (milli_val - (num_days * millis_in_day))/1000;
    retval := to_date('01-01-1970', 'DD-MM-YYYY')::timestamp;
    retval := retval + num_days * INTERVAL '1 day';
    retval := retval + num_seconds * INTERVAL '1 second';
    return retval;
end;
$body$ language plpgsql;

-- Used in triggers on several tables
create or replace function proc_modify_date() returns trigger as $body$
begin
    NEW.modify_date := current_timestamp;
    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_coder_skill_modified() returns trigger as $body$
begin
    update coder_skill set coder_skill.modify_date = current_timestamp  where (skill_id = OLD.skill_id ) AND (coder_id = OLD.coder_id );
    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_skill_type_modified() returns trigger as $body$
begin
    update skill_type set skill_type.modify_date = current_timestamp  where (skill_type_id = OLD.skill_type_id );
    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_server_connections_insert() returns trigger as $body$
begin
    insert into connection_history (coder_id,start_time,client_ip,server_id,connection_id)  values (NEW.coder_id ,
        current_timestamp, NEW.client_ip , NEW.server_id , NEW.connection_id );

    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_server_connections_delete() returns trigger as $body$
begin
    update connection_history set connection_history.end_time = current_timestamp
	    where (server_id = OLD.server_id ) AND (connection_id = old.connection_id );

    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_coderimagexref_modified() returns trigger as $body$
begin
    update coder_image_xref
        set coder_image_xref.modify_date = current_timestamp where coder_id = OLD.coder_id  AND image_id = OLD.image_id;
    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_user_payment_method_modified() returns trigger as $body$
begin
    update user_payment_method set
            user_payment_method.modify_date = current_timestamp
    where(user_id = OLD.user_id)
             AND(payment_method_id != OLD.payment_method_id);
    return NEW;
 end;
$body$ language plpgsql;


create or replace function proc_resume_modified() returns trigger as $body$
begin
    NEW.resume := current_timestamp;
    return NEW;
end;
$body$ language plpgsql;

create or replace function proc_create_date_modified() returns trigger as $body$
begin
    NEW.create_date := current_timestamp;
    return NEW;
end;
$body$ language plpgsql;


create or replace function proc_coderteam_event() returns trigger as $body$
declare
begin
    if (TG_OP = 'DELETE') then
    insert into audit_coder (user_id,column_name,old_value,new_value,timestamp)
       values (OLD.coder_id ,'TEAM' ,OLD.team_id ,NULL ,current_timestamp);
    else
     insert into audit_coder(user_id,column_name,old_value,new_value,timestamp)
     values (OLD.coder_id ,'TEAM' ,OLD.team_id ,NEW.team_id , current_timestamp);
    END if;
    return NEW;
end;
$body$ language plpgsql;

grant execute on function calc_seconds(timestamp,timestamp) to public;

grant execute on function nextval(integer) to public;

grant execute on function get_current() to public;

grant execute on function proc_ratinghistory(integer,integer,integer,integer,integer,integer,integer,integer,integer,integer) to public;

grant execute on function jmsfix() to public;

grant execute on function proc_problem_insert() to public;

grant execute on function proc_coder_update() to public;

grant execute on function proc_current_school_update() to public;

grant execute on function millis_to_time(decimal) to public;

grant execute on function proc_modify_date() to public;

grant execute on function proc_coder_skill_modified() to public;

grant execute on function proc_skill_type_modified() to public;

grant execute on function proc_server_connections_insert() to public;

grant execute on function proc_server_connections_delete() to public;

grant execute on function proc_coderimagexref_modified() to public;

grant execute on function proc_user_payment_method_modified() to public;

grant execute on function proc_resume_modified() to public;

grant execute on function proc_create_date_modified() to public;

grant execute on function proc_coderteam_event() to public;


create trigger trig_coder_skill_modified before update of coder_id,skill_id,ranking
on coder_skill
for each row execute procedure proc_coder_skill_modified();

create trigger trig_skill_type_modified before update of skill_type_desc,skill_type_order,status
on skill_type
for each row execute procedure proc_skill_type_modified();


create trigger trig_audit_coder before update of quote,language_id,coder_type_id,comp_country_code
on coder
for each row execute procedure proc_coder_update();

create trigger trig_server_connections_insert after insert
on server_connection
for each row execute procedure proc_server_connections_insert();

create trigger trig_server_connections_delete before delete on server_connection
for each row execute procedure proc_server_connections_delete();

create trigger trig_image_modified before update of file_name,image_type_id,path_id,link,height,width
on image
for each row execute procedure proc_modify_date();

create trigger trig_coderimagexref_modified before update of display_flag
on coder_image_xref
for each row execute procedure proc_coderimagexref_modified();

create trigger trig_path_modified before update of path
on path
for each row execute procedure proc_modify_date();

create trigger trig_resume_modified before update of coder_id,file_name,file_type_id,file
on resume
for each row execute procedure proc_resume_modified();

create trigger trig_problem_modified before update of problem_id,problem_text,problem_type_id,proposed_division_id,proposed_difficulty_id,create_date,status_id,name
on problem
for each row execute procedure proc_modify_date();

create trigger trig_problem_inserted before insert
on problem
for each row execute procedure proc_problem_insert();

create trigger trig_team_modified before update of team_name,team_type,school_id
on team
for each row execute procedure proc_modify_date();

create trigger trig_coderteam_delete before delete on
team_coder_xref
for each row execute procedure proc_coderteam_event();

create trigger trig_coderteam_modified before update of team_id
on team_coder_xref
for each row execute procedure proc_coderteam_event();

create trigger trig_skill_modified before update of skill_type_id,skill_desc,status,skill_order
on skill
for each row execute procedure proc_modify_date();

create trigger trig_systemtest_modified before update of args,expected_result,component_id
on system_test_case
for each row execute procedure proc_systemtest_modified();

create trigger trig_message_insert before insert
on message
for each row execute procedure proc_create_date_modified();

create trigger trig_user_message_insert before insert
on user_message
for each row execute procedure proc_create_date_modified();

create trigger trig_algo_rating_modified before update of rating,vol,round_id,num_ratings,algo_rating_type_id
on algo_rating
for each row execute procedure proc_modify_date();

create trigger trig_season_algo_rating_modified before update of rating,vol,round_id,num_ratings
on season_algo_rating
for each row execute procedure proc_modify_date();

create trigger trig_audit_current_school before update of school_id,gpa,gpa_scale,viewable
on current_school
for each row execute procedure proc_current_school_update();

create trigger trig_payment_type_modified before update of payment_type_desc,show_in_profile_ind,show_details_ind,payment_reference_id,due_date_interval
on payment_type_lu
for each row execute procedure proc_modify_date();

create trigger trig_payment_detail_modified before update of net_amount,date_paid,gross_amount,payment_status_id,payment_address_id,modification_rationale_id,payment_desc,payment_type_id,date_due,payment_method_id,client,algorithm_round_id,algorithm_problem_id,component_contest_id,component_project_id,studio_contest_id,digital_run_stage_id,digital_run_season_id,parent_payment_id,charity_ind,total_amount,installment_number
on payment_detail
for each row execute procedure proc_modify_date();

create trigger trig_payment_modified before update of user_id,most_recent_detail_id,referral_payment_id,pay_referrer
on payment
for each row execute procedure proc_modify_date();

create trigger trig_user_payment_method_modified before UPDATE OF
    payment_method_id
ON user_payment_method
for each row execute procedure proc_user_payment_method_modified();

create trigger trig_user_payment_method_inserted before insert
ON user_payment_method
for each row execute procedure proc_modify_date();

--BUGR-4316 : 556: Cannot create, drop, or modify an object that is external to current database.
set search_path to common_oltp;
grant select on user_security_key to coder;

