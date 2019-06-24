SET search_path TO informixoltp.ltp;

create synonym informixoltp.address
for common_oltp:informixoltp.address;

create synonym informixoltp.calendar
for common_oltp:informixoltp.calendar;

create synonym informixoltp.company
for common_oltp:informixoltp.company;

create synonym informixoltp.company_datasource_xref
for common_oltp:informixoltp.company_datasource_xref;

create synonym informixoltp.contact
for common_oltp:informixoltp.contact;

create synonym informixoltp.country
for common_oltp:informixoltp.country;

create synonym informixoltp.datasource_lu
for common_oltp:informixoltp.datasource_lu;

create synonym informixoltp.datasource_type_lu
for common_oltp:informixoltp.datasource_type_lu;

create synonym informixoltp.demographic_answer
for common_oltp:informixoltp.demographic_answer;

create synonym informixoltp.demographic_assignment
for common_oltp:informixoltp.demographic_assignment;

create synonym informixoltp.demographic_question
for common_oltp:informixoltp.demographic_question;

create synonym informixoltp.demographic_response
for common_oltp:informixoltp.demographic_response;

create synonym informixoltp.email
for common_oltp:informixoltp.email;

create synonym informixoltp.email_user
for common_oltp:informixoltp.email_user;

create synonym informixoltp.event
for common_oltp:informixoltp.event;

--BUGR-4316 : 206: The specified table (common_oltp:informixoltp.event_question_xref) is not in the database.
--create synonym informixoltp.event_question_xref
--for common_oltp:informixoltp.event_question_xref;

create synonym informixoltp.event_registration
for common_oltp:informixoltp.event_registration;

create synonym informixoltp.event_type_lu
for common_oltp:informixoltp.event_type_lu;

create synonym informixoltp.group_role_xref
for common_oltp:informixoltp.group_role_xref;

create synonym informixoltp.id_sequences
for common_oltp:informixoltp.id_sequences;

create synonym informixoltp.note
for common_oltp:informixoltp.note;

create synonym informixoltp.note_type_lu
for common_oltp:informixoltp.note_type_lu;

create synonym informixoltp.notify_lu
for common_oltp:informixoltp.notify_lu;

create synonym informixoltp.notify_type_lu
for common_oltp:informixoltp.notify_type_lu;

create synonym informixoltp.password_recovery
for common_oltp:informixoltp.password_recovery;

create synonym informixoltp.phone
for common_oltp:informixoltp.phone;

create synonym informixoltp.preference_group_lu
for common_oltp:informixoltp.preference_group_lu;

create synonym informixoltp.preference_lu
for common_oltp:informixoltp.preference_lu;

create synonym informixoltp.preference_type_lu
for common_oltp:informixoltp.preference_type_lu;

create synonym informixoltp.preference_value
for common_oltp:informixoltp.preference_value;

create synonym informixoltp.professor
for common_oltp:informixoltp.professor;

create synonym informixoltp.professor_status_lu
for common_oltp:informixoltp.professor_status_lu;

create synonym informixoltp.registration_type_lu
for common_oltp:informixoltp.registration_type_lu;

create synonym informixoltp.registration_type_notify_xref
for common_oltp:informixoltp.registration_type_notify_xref;

create synonym informixoltp.registration_type_preference_xref
for common_oltp:informixoltp.registration_type_preference_xref;

create synonym informixoltp.school
for common_oltp:informixoltp.school;

create synonym informixoltp.school_association_type_lu
for common_oltp:informixoltp.school_association_type_lu;

create synonym informixoltp.school_type_lu
for common_oltp:informixoltp.school_type_lu;

create synonym informixoltp.secret_question
for common_oltp:informixoltp.secret_question;

create synonym informixoltp.security_groups
for common_oltp:informixoltp.security_groups;

create synonym informixoltp.security_perms
for common_oltp:informixoltp.security_perms;

create synonym informixoltp.security_roles
for common_oltp:informixoltp.security_roles;

create synonym informixoltp.security_user
for common_oltp:informixoltp.security_user;

create synonym informixoltp.sequence_object
for common_oltp:informixoltp.sequence_object;

create synonym informixoltp.state
for common_oltp:informixoltp.state;

create synonym informixoltp.terms_of_use
for common_oltp:informixoltp.terms_of_use;

create synonym informixoltp.terms_of_use_type
for common_oltp:informixoltp.terms_of_use_type;

create synonym informixoltp.timezone_lu
for common_oltp:informixoltp.timezone_lu;

create synonym informixoltp.user
for common_oltp:informixoltp.user;

create synonym informixoltp.user_achievement
for common_oltp:informixoltp.user_achievement;

create synonym informixoltp.user_address_xref
for common_oltp:informixoltp.user_address_xref;

create synonym informixoltp.user_group_xref
for common_oltp:informixoltp.user_group_xref;

create synonym informixoltp.user_note_xref
for common_oltp:informixoltp.user_note_xref;

create synonym informixoltp.user_notify_xref
for common_oltp:informixoltp.user_notify_xref;

create synonym informixoltp.user_preference
for common_oltp:informixoltp.user_preference;

create synonym informixoltp.user_role_xref
for common_oltp:informixoltp.user_role_xref;

create synonym informixoltp.user_school
for common_oltp:informixoltp.user_school;

create synonym informixoltp.user_terms_of_use_xref
for common_oltp:informixoltp.user_terms_of_use_xref;

create synonym informixoltp.user_security_key
for common_oltp:informixoltp.user_security_key;

create synonym informixoltp.terms_of_use_agreeability_type_lu
for common_oltp:informixoltp.terms_of_use_agreeability_type_lu;

create synonym informixoltp.invalid_handles
for common_oltp:informixoltp.invalid_handles;

create synonym informixoltp.user_social_login for common_oltp:informixoltp.user_social_login;
 

create procedure informixoltp.calc_seconds( start TIMESTAMP , 
                                      end   TIMESTAMP )
returning int;
 define x int;
   define i interval second(9) to second ;
let i = end - start;
let x = i::varchar(20)::numeric;
return x;
end procedure;
create procedure informixoltp.nextval(i_seqnum INTEGER)
returning int;
   define v numeric;
   define doCommit varchar(5,0);
   set lock mode to wait 5;
   set isolation to committed read;
   let doCommit = 'true';
   BEGIN
     on exception in (-535)
       let doCommit = 'false';
     end exception with resume;
     begin work;
   END
   update sequence_object set current_value = current_value +1 where id = i_seqnum;
   let v = nvl ( (select current_value from sequence_object where id = i_seqnum), -1);
   if (doCommit = 'true') then
      commit;
   end if;
   return v;
end procedure;
create procedure informixoltp.get_current() returning TIMESTAMP;
  return CURRENT;
end procedure;
create procedure informixoltp.proc_ratinghistory(
  i_roundId           INTEGER
, i_coderId           INTEGER 
, i_new_rating        INTEGER, i_old_rating INTEGER
, i_new_num_ratings   INTEGER, i_old_num_ratings INTEGER
, i_new_vol           INTEGER, i_old_vol INTEGER
, i_new_rating_no_vol INTEGER, i_old_rating_no_vol INTEGER 
)
  INSERT INTO rating_history
       (round_id, coder_id
       , new_rating, old_rating
       , new_num_ratings, old_num_ratings
       , new_vol, old_vol
       , new_rating_no_vol, old_rating_no_vol, timestamp)
  VALUES (i_roundId, i_coderId
       , i_new_rating, i_old_rating
       , i_new_num_ratings, i_old_num_ratings
       , i_new_vol ,  i_old_vol
       , i_new_rating_no_vol, i_old_rating_no_vol,now() year to fraction(3) );
update rating set modify_date = now() where coder_id = i_coderId ;
end procedure;
create procedure informixoltp.jmsfix()
set lock mode to wait 5;
select consumerid, messageid, state FROM JMSMessageQueue 
WHERE EXISTS (SELECT *  FROM  JMSMessageQueue MQ1  
              WHERE JMSMessageQueue.state  < MQ1.state   
                AND JMSMessageQueue.messageId  = MQ1.messageId     
                AND JMSMessageQueue.consumerId = MQ1.consumerId) into temp jmsfix1 ;
delete from jmsmessagequeue where exists (select * from jmsfix1 where 
                    jmsmessagequeue.state = jmsfix1.state
                AND JMSMessageQueue.messageId  = jmsfix1.messageId     
                AND JMSMessageQueue.consumerId = jmsfix1.consumerId) ;
drop table jmsfix1;
end procedure;
create procedure informixoltp.proc_problem_insert(i_problemId decimal (10,0))
  update problem set create_date = now()
  where problem_id = i_problemId;
end procedure ;
create procedure informixoltp.proc_coder_update(
v_oldcoder_id decimal(10,0),
v_oldquote varchar(255),v_newquote varchar (255),
v_oldlanguage_id decimal(3,0), v_newlanguage_id decimal(3,0),
v_oldcoder_type_id decimal(3,0), v_newcoder_type_id decimal(3,0),
v_oldcomp_country_code varchar(3), v_newcomp_country_code varchar(3)
)
 
      if (v_oldquote != v_newquote) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('QUOTE', v_oldquote , v_newquote, v_oldcoder_id);
      End if;

      if (v_oldcoder_type_id != v_newcoder_type_id) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('CODER_TYPE', v_oldcoder_type_id , v_newcoder_type_id, v_oldcoder_id);
      End if;

      if (v_oldlanguage_id != v_newlanguage_id) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('LANGUAGE', v_oldlanguage_id , v_newlanguage_id, v_oldcoder_id);
      End if;

      if (v_oldcomp_country_code != v_newcomp_country_code) then
         insert into audit_coder (column_name, old_value, new_value, user_id)
         values ('COMP_COUNTRY', v_oldcomp_country_code , v_newcomp_country_code, v_oldcoder_id);
      End if;
 
   update coder set modify_date = current where coder_id = v_oldcoder_id;
end procedure;
create procedure informixoltp.proc_current_school_update(
old_coder_id DECIMAL(10,0),
old_school_id decimal(10,0),
new_school_id decimal(10,0),
old_gpa decimal(4,2),
new_gpa decimal(4,2),
old_gpa_scale decimal(4,2),
new_gpa_scale decimal(4,2),
old_viewable VARCHAR(1,0),
new_viewable VARCHAR(1,0)
)
 
      if (old_school_id != new_school_id or old_viewable != new_viewable or old_gpa != new_gpa or old_gpa_scale != new_gpa_scale) then
         insert into current_school_audit (coder_id, school_id, gpa, gpa_scale, viewable)
         values (old_coder_id, old_school_id, old_gpa, old_gpa_scale, old_viewable);
      End if;

      update current_school set modify_date = current where coder_id = old_coder_id;

end procedure;
create procedure informixoltp.millis_to_time(milli_val decimal(14,0))
 returning TIMESTAMP;

  define retval TIMESTAMP;
  define num_days int;
  define num_seconds int;
  define millis_in_day int;

  let millis_in_day = 86400000;
  let num_days = trunc(milli_val/millis_in_day,0);
  let num_seconds = (milli_val - (num_days * millis_in_day))/1000;

  let retval = extend(mdy(1,1,1970), year to fraction(3));
  let retval = retval + num_days units day;
  let retval = retval + num_seconds units second;

  return retval;

end procedure;

grant execute on procedure ifx_load_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_trigger_cols(integer) to 'public' as 'informix';

grant execute on procedure ifx_trigger_action(integer,char) to 'public' as 'informix';

grant execute on procedure ifx_unload_module(varchar,varchar) to 'public' as 'informix';

grant execute on procedure ifx_replace_module(varchar,varchar,varchar) to 'public' as 'informix';

grant execute on procedure systdist(integer,integer) to 'public' as 'informix';

grant execute on procedure calc_seconds(datetime,datetime) to 'public' as 'informix';

grant execute on procedure nextval(integer) to 'public' as 'informix';

grant execute on procedure get_current() to 'public' as 'informix';

grant execute on procedure proc_ratinghistory(integer,integer,integer,integer,integer,integer,integer,integer,integer,integer) to 'public' as 'informix';

grant execute on procedure jmsfix() to 'public' as 'informix';

grant execute on procedure proc_problem_insert(decimal) to 'public' as 'informix';

grant execute on procedure proc_coder_update(decimal,varchar,varchar,decimal,decimal,decimal,decimal,varchar,varchar) to 'public' as 'informix';

grant execute on procedure proc_current_school_update(decimal,decimal,decimal,decimal,decimal,decimal,decimal,varchar,varchar) to 'public' as 'informix';

grant execute on procedure millis_to_time(decimal) to 'public' as 'informix';

create trigger informixoltp.trig_coder_skill_modified update of coder_id,skill_id,ranking on informixoltp.coder_skill referencing old as old                                                                                                                            for each row
        (
        update informixoltp.coder_skill set informixoltp.coder_skill.modify_date = now()  where ((skill_id = old.skill_id ) AND (coder_id = old.coder_id ) ) );
create trigger informixoltp.trig_skill_type_modified update of skill_type_desc,skill_type_order,status on informixoltp.skill_type referencing old as old                                                                                                                for each row
        (
        update informixoltp.skill_type set informixoltp.skill_type.modify_date = now()  where (skill_type_id = old.skill_type_id ) );
create trigger informixoltp.trig_audit_coder update of quote,language_id,coder_type_id,comp_country_code on informixoltp.coder referencing old as old new as new                                                                                                        for each row
        (
        execute procedure informixoltp.proc_coder_update(old.coder_id ,old.quote ,new.quote ,old.language_id ,new.language_id ,old.coder_type_id ,new.coder_type_id ,old.comp_country_code ,new.comp_country_code ));
create trigger informixoltp.trig_server_connections_insert insert on informixoltp.server_connection referencing new as nw                                                                                                                                               for each row
        (
        insert into informixoltp.connection_history (coder_id,start_time,client_ip,server_id,connection_id)  values (nw.coder_id ,now() year to fraction(3) ,nw.client_ip ,nw.server_id ,nw.connection_id ));
create trigger informixoltp.trig_server_connections_delete delete on informixoltp.server_connection referencing old as older                                                                                                                                            for each row
        (
        update informixoltp.connection_history set informixoltp.connection_history.end_time = now()  where ((server_id = older.server_id ) AND (connection_id = older.connection_id ) ) );
create trigger informixoltp.trig_image_modified update of file_name,image_type_id,path_id,link,height,width on informixoltp.image referencing old as old                                                                                                                for each row
        (
        update informixoltp.image set informixoltp.image.modify_date = now()  where (image_id = old.image_id ) );
create trigger informixoltp.trig_coderimagexref_modified update of display_flag on informixoltp.coder_image_xref referencing old as old                                                                                                                                 for each row
        (
        update informixoltp.coder_image_xref set informixoltp.coder_image_xref.modify_date = now()  where ((coder_id = old.coder_id ) AND (image_id = old.image_id ) ) );
create trigger informixoltp.trig_path_modified update of path on informixoltp.path referencing old as old                                                                                                                                                               for each row
        (
        update informixoltp.path set informixoltp.path.modify_date = now()  where (path_id = old.path_id ) );
create trigger informixoltp.trig_resume_modified update of coder_id,file_name,file_type_id,file on informixoltp.resume referencing old as old                                                                                                                           for each row
        (
        execute function informixoltp.get_current() into informixoltp.resume.timestamp);
create trigger informixoltp.trig_problem_modified update of problem_id,problem_text,problem_type_id,proposed_division_id,proposed_difficulty_id,create_date,status_id,name on informixoltp.problem referencing old as old                                               for each row
        (
        update informixoltp.problem set informixoltp.problem.modify_date = now()  where (problem_id = old.problem_id ) );
create trigger informixoltp.trig_problem_inserted insert on informixoltp.problem referencing new as new                                                                                                                                                                 for each row
        (
        execute procedure informixoltp.proc_problem_insert(new.problem_id ));
create trigger informixoltp.trig_team_modified update of team_name,team_type,school_id on informixoltp.team referencing old as old                                                                                                                                      for each row
        (
        execute function informixoltp.get_current() into informixoltp.team.modify_date);
create trigger informixoltp.trig_coderteam_delete delete on informixoltp.team_coder_xref referencing old as old                                                                                                                                                         for each row
        (
        insert into informixoltp.audit_coder (user_id,column_name,old_value,new_value,timestamp)  values (old.coder_id ,'TEAM' ,old.team_id ,NULL ,now() year to fraction(3) ));
create trigger informixoltp.trig_coderteam_modified update of team_id on informixoltp.team_coder_xref referencing old as old new as new                                                                                                                                 for each row
        (
        insert into informixoltp.audit_coder (user_id,column_name,old_value,new_value,timestamp)  values (old.coder_id ,'TEAM' ,old.team_id ,new.team_id ,now() year to fraction(3) ));
create trigger informixoltp.trig_skill_modified update of skill_type_id,skill_desc,status,skill_order on informixoltp.skill referencing old as old                                                                                                                      for each row
        (
        update informixoltp.skill set informixoltp.skill.modify_date = now()  where (skill_id = old.skill_id ) );
create trigger informixoltp.trig_systemtest_modified update of args,expected_result,component_id on informixoltp.system_test_case referencing old as old new as new                                                                                                     for each row
        (
        update informixoltp.system_test_case set informixoltp.system_test_case.modify_date = now()  where ((test_case_id = old.test_case_id ) AND (component_id = old.component_id ) ) );
create trigger informixoltp.trig_message_insert insert on informixoltp.message referencing new as nw                                                                                                                                                                    for each row
        (
        execute function informixoltp.get_current() into informixoltp.message.create_date);
create trigger informixoltp.trig_user_message_insert insert on informixoltp.user_message referencing new as nw                                                                                                                                                          for each row
        (
        execute function informixoltp.get_current() into informixoltp.user_message.create_date);
create trigger informixoltp.trig_algo_rating_modified update of rating,vol,round_id,num_ratings,algo_rating_type_id on informixoltp.algo_rating referencing old as old                                                                                                  for each row
        (
        execute function informixoltp.get_current() into informixoltp.algo_rating.modify_date);
create trigger informixoltp.trig_season_algo_rating_modified update of rating,vol,round_id,num_ratings on informixoltp.season_algo_rating referencing old as old                                                                                                        for each row
        (
        execute function informixoltp.get_current() into informixoltp.season_algo_rating.modify_date);
create trigger informixoltp.trig_audit_current_school update of school_id,gpa,gpa_scale,viewable on informixoltp.current_school referencing old as old new as new                                                                                                       for each row
        (
        execute procedure informixoltp.proc_current_school_update(old.coder_id ,old.school_id ,new.school_id ,old.gpa ,new.gpa ,old.gpa_scale ,new.gpa_scale ,old.viewable ,new.viewable ));
create trigger informixoltp.trig_payment_type_modified update of payment_type_desc,show_in_profile_ind,show_details_ind,payment_reference_id,due_date_interval on informixoltp.payment_type_lu referencing old as old                                                   for each row
        (
        update informixoltp.payment_type_lu set informixoltp.payment_type_lu.modify_date = now()  where (payment_type_id = old.payment_type_id ) );
create trigger informixoltp.trig_payment_detail_modified update of net_amount,date_paid,gross_amount,payment_status_id,payment_address_id,modification_rationale_id,payment_desc,payment_type_id,date_due,payment_method_id,client,algorithm_round_id,algorithm_problem_id,component_contest_id,component_project_id,studio_contest_id,digital_run_stage_id,digital_run_season_id,parent_payment_id,charity_ind,total_amount,installment_number on informixoltp.payment_detail referencing old as old                                   for each row
        (
        execute function informixoltp.get_current() into informixoltp.payment_detail.date_modified);
create trigger informixoltp.trig_payment_modified update of user_id,most_recent_detail_id,referral_payment_id,pay_referrer on informixoltp.payment referencing old as old                                                                                               for each row
        (
        execute function informixoltp.get_current() into informixoltp.payment.modify_date);

CREATE TRIGGER informixoltp.trig_user_payment_method_modified UPDATE OF 
    payment_method_id ON informixoltp.user_payment_method REFERENCING OLD AS OLD
FOR EACH ROW(
        UPDATE informixoltp.user_payment_method SET "informix"
                .user_payment_method.modify_date = now()
        WHERE((user_id = old.user_id)
                 AND(payment_method_id != old.payment_method_id)));

CREATE TRIGGER informixoltp.trig_user_payment_method_inserted INSERT ON "informix"
    .user_payment_method REFERENCING NEW AS NEW
FOR EACH ROW(EXECUTE FUNCTION informixoltp.get_current() INTO "informix"
            .user_payment_method.modify_date);

--BUGR-4316 : 556: Cannot create, drop, or modify an object that is external to current database.
SET search_path TO common_oltp;
GRANT SELECT ON informixoltp.user_security_key TO coder;


