set search_path to tcs_catalog;

create view calendar
as select * from common_oltp.calendar;

create view company
as select * from common_oltp.company;

create view contact
as select * from common_oltp.contact;

create view email
as select * from common_oltp.email;

create view event
as select * from common_oltp.event;

create view group_role_xref
as select * from common_oltp.group_role_xref;

create view id_sequences
as select * from common_oltp.id_sequences;

create view permission_code
as select * from common_oltp.permission_code;

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

create view terms_of_use
as select * from common_oltp.terms_of_use;

create view "user"
as select * from common_oltp.user;

create view user_group_xref
as select * from common_oltp.user_group_xref;

create view user_role_xref
as select * from common_oltp.user_role_xref;

create view user_status
as select * from common_oltp.user_status;

create view user_terms_of_use_xref
as select * from common_oltp.user_terms_of_use_xref;

create view project_role_terms_of_use_xref
as select * from common_oltp.project_role_terms_of_use_xref;

--create view client
--as select * from  time_oltp.client;

--create view tt_project
--as select * from time_oltp.project;

--create view tt_client
--as select * from  time_oltp.client;

--create view tt_client_project
--as select * from  time_oltp.client_project;

--create view tt_user_account
--as select * from  time_oltp.user_account;

--create view tt_project_worker
--as select * from  time_oltp.project_worker;

--create view tt_project_manager
--as select * from  time_oltp.project_manager;

create view contest_eligibility
as select * from common_oltp.contest_eligibility;

create view group_contest_eligibility
as select * from common_oltp.group_contest_eligibility;

create view client_terms_mapping
as select * from common_oltp.client_terms_mapping;

-- CORPORATE_OLTP SYNONYMS

--create view tc_direct_project
--as select * from corporate_oltp.tc_direct_project;

--create view permission_type
--as select * from corporate_oltp.permission_type;

--create view user_permission_grant
--as select * from corporate_oltp.user_permission_grant;

--create view PERMISSION_SEQ
--as select * from corporate_oltp.PERMISSION_SEQ;

--create view spec_review_status_type_lu
--as select * from corporate_oltp.spec_review_status_type_lu;

--create view spec_review_section_type_lu
--as select * from corporate_oltp.spec_review_section_type_lu;

--create view spec_review_user_role_type_lu
--as select * from corporate_oltp.spec_review_user_role_type_lu;

--create view spec_review
--as select * from corporate_oltp.spec_review;

--create view spec_review_reviewer_xref
--as select * from corporate_oltp.spec_review_reviewer_xref;

--create view spec_section_review
--as select * from corporate_oltp.spec_section_review;

--create view spec_section_review_comment
--as select * from corporate_oltp.spec_section_review_comment;

--create view spec_review_comment_view
--as select * from corporate_oltp.spec_review_comment_view;

--create view SPEC_REVIEW_REVIEWER_SEQ
--as select * from corporate_oltp.SPEC_REVIEW_REVIEWER_SEQ;

create view coder
as select * from informixoltp.coder;

create view current_school
as select * from informixoltp.current_school;

create view coder_referral
as select * from informixoltp.coder_referral;

create view secret_question
as select * from common_oltp.secret_question;

create view professor
as select * from common_oltp.professor;

create view professor_status_lu
as select * from common_oltp.professor_status_lu;

create view user_security_key
as select * from common_oltp.user_security_key;

create VIEW image
as select * from informixoltp.image;

-- JIVE synonyms

create view jivecategory
as select * from jive.jivecategory;

create view jiveforum
as select * from jive.jiveforum;

create view jivemessage
as select * from jive.jivemessage;

create view event_registration
as select * from common_oltp.event_registration;


--create view direct_project_type
--as select * from corporate_oltp.direct_project_type;

--create view direct_project_category
--as select * from corporate_oltp.direct_project_category;

--create view direct_project_account
--as select * from corporate_oltp.direct_project_account;

create view corona_event
as select * from common_oltp.corona_event;

create role read_only;

create or replace function get_current() returns timestamp as $body$
begin
    return now();
end;
$body$ language plpgsql;


create or replace function predictor(project_id decimal(12,0)) returnS decimal(5,4) AS $body$
declare
    reliability decimal(5,4);
    product decimal(5,4);
begin

  	product := 1.0;

 	for reliability in select COALESCE(ur.rating, 0.0)
                from project_result pr
                   , user_reliability ur
                   , project p
               where pr.project_id = project_id
                 and pr.user_id = ur.user_id
                 and pr.project_id = p.project_id
                 and p.project_category_id + 111 = ur.phase_id LOOP
  		product := product * (1.0 - reliability);
 	end LOOP;

 	return 1.0 - product;
 END ;
 $body$ language plpgsql;


create or replace function proc_rating_update() returns trigger as $body$
begin
 IF (TG_OP = 'UPDATE') then
      if (OLD.rating != NEW.rating) then
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('RATING', OLD.rating, NEW.rating, OLD.user_id, OLD.phase_id);
      end If;

      if (OLD.vol != NEW.vol) then
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('VOL', OLD.vol, NEW.vol, OLD.user_id, OLD.phase_id);
      end if;

      if (OLD.num_ratings != NEW.num_ratings) then
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('NUM_RATINGS', OLD.num_ratings, NEW.num_ratings, OLD.user_id, OLD.phase_id);
      end if;

      if (OLD.last_rated_project_id != NEW.last_rated_project_id) then
         insert into user_rating_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('LAST_RATED_PROJECT_ID', OLD.last_rated_project_id, NEW.last_rated_project_id, OLD.user_id, OLD.phase_id);
      end if;

      update user_rating set mod_date_time = current where user_id = OLD.user_id and phase_id = OLD.phase_id;

   end if;

   return NEW;
end ;
$body$ language plpgsql;


create or replace function proc_reliability_update() returns trigger as $body$
begin

    if (TG_OP = 'UPDATE') then
      if (OLD.rating != new_rating) then
         insert into user_reliability_audit (column_name, old_value, new_value, user_id, phase_id)
         values ('RATING', OLD.rating, NEW.rating, OLD.user_id, OLD.phase_id);
      End If;

      update user_reliability set modify_date = current where user_id = OLD.user_id and phase_id = OLD.phase_id;
    end if;

  return NEW;
end ;
$body$ language plpgsql;

create or replace function millis_to_time(milli_val decimal(14,0)) returns timestamp as $body$
declare
  retval timestamp;
  num_days int;
  num_seconds int;
  millis_in_day int;
begin
  millis_in_day := 86400000;
  num_days := trunc(milli_val/millis_in_day,0);
  num_seconds := (milli_val - (num_days * millis_in_day))/1000;

  retval := to_date('01-01-1970', 'DD-MM-YYYY')::timestamp;
  retval := retval + num_days * interval '1' day;
  retval := retval + num_seconds * interval '1' second;

  return retval;

end;
$body$ language plpgsql;


create or replace function category_list( i_component_id decimal(12)) returns varchar(1000) as $body$
declare
    o_cat_list varchar(1000);
    t_cat_desc varchar(1000);
begin
    o_cat_list := '';
    for t_cat_desc
    in select cat.category_name
    from comp_categories cc, categories cat
    where cc.category_id = cat.category_id
     and cc.component_id = i_component_id
    order by cat.category_name loop

     if length(o_cat_list) = 0 then
        o_cat_list := t_cat_desc;
      else
        o_cat_list := o_cat_list || ', ' || t_cat_desc;
      end if;

    end loop;

    return o_cat_list;

end ;
$body$ language plpgsql;


grant execute on function get_current() to public;

grant execute on function predictor(decimal) to public;

grant execute on function proc_rating_update() to public;

grant execute on function proc_reliability_update() to public;

grant execute on function millis_to_time(decimal) to public;

grant execute on function category_list(decimal) to public;


create or replace function last_posters(forumid decimal(12,0)) returns varchar(255) AS $body$
declare
    posters varchar(255);
    userid varchar(255);
    handle varchar(255);
    daysAgo varchar(255);
begin
    posters := '';

	if forumid is not null then
		for userid, handle, daysAgo in select distinct u.user_id, u.handle, to_number(TRIM(((current - Millis_to_time(max(m.modificationdate)))::INTERVAL DAY)::CHAR(10))) as modificationdate
				 from   jivemessage m,
						 USER u,
						 jivecategory jc,
						 jiveforum jf
				 where  u.user_id = m.userid
						 and jc.categoryid = forumid
						 and jc.categoryid = jf.categoryid
						 and m.forumid = jf.forumid
						 group by user_id, handle
						 order by modificationdate asc limit 3 LOOP
				if length(posters) == 0 then
					posters := userid || ',' || handle || ',' || daysAgo;
				else
					posters := posters || ';' || userid || ',' || handle || ',' || daysAgo;
				end if;
	    END LOOP;
	end if;

    return posters;
END ;
$body$ language plpgsql;

grant execute on function last_posters(decimal) to public;


set search_path to tcs_catalog;

create or replace function component_developer(component_id decimal(12)) returns varchar(1000) as $body$
declare
    user_list varchar(1000);
    users_desc varchar(1000);
begin

	users_desc := '';

	for user_list
		in select u.handle || "|" || u.user_id || "|mailto:" || e.address
		  from resource r
			 , resource_info ri
			 , security_user s
			 , project_info pi
			 , project p
			 , comp_catalog c
			 , comp_versions v
			 , user u
			 , email e
		 where r.resource_id = ri.resource_id
		   and ri.resource_info_type_id = 1
		   and ri.value = s.login_id
		   and r.project_id = pi.project_id
		   and r.project_id = p.project_id
		   and pi.project_info_type_id = 1
		   and (r.resource_role_id = 1 and exists (select 1 from project_info piW where piW.project_info_type_id = 23 and piW.project_id = p.project_id and piW.value = s.login_id ))
		   and c.component_id = component_id
		   and p.project_status_id = 7
		   and p.project_category_id in (1,2)
		   and c.component_id = v.component_id
		   and pi.value = v.comp_vers_id
		   and pi.value = v.comp_vers_id
		   and c.current_version = v.version
		   and s.login_id = u.user_id
		   and e.user_id = u.user_id loop

  		if length(users_desc) = 0 then
    		users_desc := user_list;
  		else
		    users_desc := users_desc || "," || user_list;
 	 	end if;
	end loop;

	return users_desc;
end;
$body$ language plpgsql;

grant execute on function component_developer(decimal) to public;

create or replace function categories(i_component_vers_id decimal(12)) returns varchar(1000) as $body$
declare
    o_cat_list varchar(1000);
    t_cat_desc varchar(1000);
begin

	o_cat_list := '';

	for t_cat_desc
		in select tt.technology_name || "|" || tt.technology_type_id
		  from comp_technology ct, technology_types tt
		 where ct.comp_vers_id = i_component_vers_id
		   and ct.technology_type_id = tt.technology_type_id
		 order by tt.technology_name loop

  		if length(o_cat_list) = 0 then
    		o_cat_list := t_cat_desc;
  		else
    		o_cat_list := o_cat_list || "," || t_cat_desc;
  		end if;
	end loop;

	return o_cat_list;
end;
$body$ language plpgsql;

grant execute on function categories(decimal) to public;

create or replace function all_categories() returns varchar(1000) as $body$
declare
    o_cat_list varchar(1000);
    t_cat_desc varchar(1000);
begin

	o_cat_list := '';

	for t_cat_desc
		in select tt.technology_name || "|" || tt.technology_type_id
		  from  technology_types tt
		 order by tt.technology_name loop

  		if length(o_cat_list) = 0 then
		    o_cat_list := t_cat_desc;
  		else
	    	o_cat_list := o_cat_list || "," || t_cat_desc;
  		end if;
	end loop;

	return o_cat_list;
end;
$body$ language plpgsql;

grant execute on function all_categories() to public;

create or replace function component_versions(i_component_vers_id decimal(12)) returns varchar(1000) as $body$
declare cv_desc varchar(1000);
    cv_list varchar(1000);
begin

	cv_desc := '';

	for cv_list
		in select cv.version_text || "|" || cv.create_time  || "|" ||  coalesce(cv.revision, "  ")  || "|" ||  cv.comp_vers_id
		  from comp_versions cv
		 where cv.component_id = i_component_vers_id loop

  		if length(cv_desc) = 0 then
    		cv_desc := cv_list;
  		else
    		cv_desc := cv_desc || "," || cv_list;
  		end if;
	end loop;

	return cv_desc;
end;
$body$ language plpgsql;

grant execute on function component_versions(decimal) to public;

create or replace function technology_list( i_comp_vers_id decimal(12)  )
    returns varchar(1000) as $body$
declare
    o_cat_list varchar(1000);
    t_cat_desc varchar(1000);
begin

    o_cat_list := '';

    for t_cat_desc in select tt.technology_name
        from comp_technology ct,
        technology_types tt
        where ct.technology_type_id = tt.technology_type_id
        and ct.comp_vers_id = i_comp_vers_id
        order by tt.technology_name loop

        if length(o_cat_list) = 0 then
            o_cat_list := t_cat_desc;
        else
            o_cat_list := o_cat_list || ", " || t_cat_desc;
        end if;

    end loop;

    return o_cat_list;

end;
$body$ language plpgsql;

grant execute on function technology_list(decimal) to public;

create or replace function platform_list( i_project_id decimal(12) )
    returns varchar(1000) as $body$
declare
    o_cat_list varchar(1000);
    t_cat_desc varchar(1000);
begin

    o_cat_list := '';

    for t_cat_desc

        in select ppl.name
        from project_platform_lu ppl
        inner join project_platform pp
        on ppl.project_platform_id = pp.project_platform_id
        where pp.project_id = i_project_id
        order by ppl.name loop

        if length(o_cat_list) = 0 then
            o_cat_list := t_cat_desc;
        else
            o_cat_list := o_cat_list || ", " || t_cat_desc;
        end if;

    end loop;

    return o_cat_list;

end;
$body$ language plpgsql;

grant execute on function platform_list(decimal) to public;

create or replace function proc_resource_insert() returns trigger as $body$
begin

    if (NEW.resoure_info_type_id == 1 and exists (select resource_id from resource where resource_id = NEW.resource_id
     and resource_role_id = 1)) then
        insert into corona_event (corona_event_type_id,user_id)  values (3, TO_NUMBER(NEW.value));
    end if;

    return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_resource_insert() to public;

create or replace function proc_contest_creation_insert () returns trigger as $body$
begin

    if (NEW.project_status_id == 1) then
        insert into corona_event (corona_event_type_id,user_id)  values (5, TO_NUMBER(NEW.create_user));
    end if;

    return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_contest_creation_insert() to public;

create or replace function proc_contest_creation_update() returns trigger as $body$
begin

    if (OLD.project_status_id != NEW.project_status_id and NEW.project_status_id == 1) then
        insert into corona_event (corona_event_type_id,user_id)  values (5, TO_NUMBER(NEW.create_user));
    end if;

    return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_contest_creation_update() to public;


create or replace function proc_review_scorecard_completion () returns trigger as $body$
declare
    project_category_id INT;
    scorecard_type_id INT;
    project_type_id INT;
begin
    if(NEW.committed == 1) then
        select s.project_category_id into project_category_id from review r, scorecard s where r.review_id = NEW.review_id and r.scorecard_id = s.scorecard_id;
        select s.scorecard_type_id into scorecard_type_id from review r, scorecard s where r.review_id = NEW.review_id and r.scorecard_id = s.scorecard_id;
		select pc.project_type_id into project_type_id from review r, resource re, project p, project_category_lu pc where r.review_id = NEW.review_id and re.resource_id = r.resource_id and p.project_id = re.project_id and p.project_category_id = pc.project_category_id;
        if ((NEW.project_type_id in (1,2) and NEW.project_category_id not in (29, 9) and (scorecard_type_Id == 2 or scorecard_type_id == 5))
		          or (project_type_id == 3 and (scorecard_type_Id == 1 or scorecard_type_id == 5 or scorecard_type_id == 6))) then
						insert into corona_event (corona_event_type_id,user_id)  values (6, TO_NUMBER(NEW.modify_user));
        end if;
    end if;
    return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_review_scorecard_completion() to public;

create or replace function proc_contest_submission() returns trigger as $body$
begin
    if(NEW.submission_type_id in (1,3)) then
        insert into corona_event (corona_event_type_id,user_id)  values (4, TO_NUMBER(NEW.modify_user));
    end if;
    return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_contest_submission() to public;

create or replace function create_project_event() returns trigger as $body$
declare source_id int;
begin
    if (TG_TABLE_NAME = 'project') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.project_id;
        else
          source_id = NEW.project_id;
        end if;
    elsif (TG_TABLE_NAME = 'resource') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.resource_id;
        else
          source_id = NEW.resource_id;
        end if;
    elsif (TG_TABLE_NAME = 'project_info') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.project_info_type_id;
        else
          source_id = NEW.project_info_type_id;
        end if;
    elsif (TG_TABLE_NAME = 'project_phase') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.project_phase_id;
        else
          source_id = NEW.project_phase_id;
        end if;

    elsif (TG_TABLE_NAME = 'project_spec') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.project_spec_id;
        else
          source_id = NEW.project_spec_id;
        end if;
    elsif (TG_TABLE_NAME = 'prize') then
        if (TG_OP = 'DELETE') then
          source_id = OLD.prize_id;
        else
          source_id = NEW.prize_id;
        end if;
    end if;
    if (TG_OP = 'DELETE') then
        insert into project_event_log(project_id, operation, source, source_id) values (OLD.project_id, 'DELETE', TG_TABLE_NAME, source_id);
        return OLD;
    elsif (TG_OP = 'UPDATE') then
        insert into project_event_log(project_id, operation, source, source_id) values (NEW.project_id, 'UPDATE', TG_TABLE_NAME, source_id);
        return NEW;
    elsif (TG_OP = 'INSERT') then
        insert into project_event_log(project_id, operation, source, source_id) values (NEW.project_id, 'INSERT', TG_TABLE_NAME, source_id);
       return NEW;
    end if;
    return NULL;
end;
$body$ language plpgsql;

grant execute on function create_project_event() to public;

create or replace function create_project_studio_event() returns trigger as $body$
declare
    first_project_id int;
    p_project_studio_spec_id int;
    p_operation varchar(10);
    p_source varchar(64);
begin
    first_project_id := NULL;
    p_source := TG_TABLE_NAME;
    p_operation := TG_OP;
    if (TG_OP = 'DELETE') then
        p_project_studio_spec_id = OLD.submission_id;
    else
        p_project_studio_spec_id = NEW.submission_id;
    end if;
    select project_id into first_project_id from project p where p.project_studio_spec_id = p_project_studio_spec_id limit 1;
    execute create_project_event(first_project_id, p_operation, p_source, p_project_studio_spec_id);
end;
$body$ language plpgsql;

grant execute on function create_project_studio_event() to public;

create or replace function create_submission_event() returns trigger as $body$
declare
    first_project_id int;
    p_submission_id int;
    p_upload_id int;
    p_operation varchar(10);
    p_source varchar(64);
begin
    first_project_id := NULL;
    p_source := TG_TABLE_NAME;
    p_operation := TG_OP;
    if (TG_OP = 'DELETE') then
        p_submission_id = OLD.submission_id;
    else
        p_submission_id = NEW.submission_id;
    end if;

    select project_id into first_project_id from upload u where u.upload_id = p_upload_id limit 1;
    execute create_project_event(first_project_id, p_operation, p_source, p_submission_id);

end;
$body$ language plpgsql;

grant execute on function create_project_studio_event() to public;

create or replace function proc_project_result_modified() returns trigger as $body$
begin
  update project_result set project_result.modify_date = current_timestamp  where (project_id = OLD.project_id ) and (user_id = OLD.user_id );
  return NEW;
end;
$body$ language plpgsql;

grant execute on function proc_project_result_modified() to public;

-- Used in triggers on several tables
create or replace function proc_modify_date() returns trigger LANGUAGE 'plpgsql' as $body$
begin
  NEW.modify_date := current_timestamp;
  return NEW;
end;
$body$;

create trigger trig_comp_version_dates_modified before update of comp_vers_id,phase_id,posting_date,initial_submission_date,winner_announced_date,final_submission_date,estimated_dev_date,price,total_submissions,status_id,level_id,screening_complete_date,review_complete_date,aggregation_complete_date,phase_complete_date,production_date,aggregation_complete_date_comment,phase_complete_date_comment,review_complete_date_comment,winner_announced_date_comment,initial_submission_date_comment,screening_complete_date_comment,final_submission_date_comment,production_date_comment
on comp_version_dates
for each row execute procedure proc_modify_date();

create trigger trig_contest_prize_modified before update of contest_id,prize_type_id,place,prize_amount,prize_desc
on contest_prize
for each row execute procedure proc_modify_date();

create trigger trig_royalty_modified before update of user_id,amount,description,royalty_date
on royalty
for each row execute procedure proc_modify_date();

create trigger trig_user_event_xref_modified before update of user_id,event_id,create_date
on user_event_xref
for each row execute procedure proc_modify_date();

create trigger trig_comp_catalog_modified before update of current_version,short_desc,description,function_desc,status_id,root_category_id
on comp_catalog
for each row execute procedure proc_modify_date();

create trigger trig_audit_rating before update of rating,vol,num_ratings,last_rated_project_id
on user_rating
for each row execute procedure proc_rating_update();

create trigger trig_reliability_audit before update of rating
on user_reliability
for each row execute procedure proc_reliability_update();

create trigger trig_comp_versions_modified before update of component_id,version,version_text,phase_id,phase_time,price,comments,suspended_ind
on comp_versions
for each row execute procedure proc_modify_date();

create trigger trig_project_result_modified before update of old_rating,new_rating,raw_score,final_score,payment,placed,rating_ind,valid_submission_ind,passed_review_ind,point_adjustment,rating_order
on project_result
for each row execute procedure proc_project_result_modified();

create trigger trig_season_modified before update of name,rookie_competition_ind,next_rookie_season_id
on season
for each row execute procedure proc_modify_date();

create trigger trig_stage_modified before update of season_id,name,start_date,end_date
on stage
for each row execute procedure proc_modify_date();

create trigger trig_contest_modified before update of contest_name,phase_id,contest_type_id,start_date,end_date,event_id,contest_result_calculator_id
on contest
for each row execute procedure proc_modify_date();

create trigger trig_resource_insert before insert
on resource_info
for each row execute procedure proc_resource_insert();

create trigger trig_project_insert before insert
on project
for each row execute procedure proc_contest_creation_insert();

create trigger trig_project_update before update
on project
for each row execute procedure proc_contest_creation_update();

create trigger trig_project_table_insert after insert or update or delete
on project
for each row execute procedure create_project_event();

create trigger trig_review_completion after insert on review
for each row  execute procedure proc_review_scorecard_completion();

create trigger trig_contest_submission after insert
on submission
for each row execute procedure proc_contest_submission();

create trigger trig_resource_table_insert after insert or update or delete
on resource
for each row execute procedure create_project_event();

create trigger trig_project_info_insert after insert or update or delete
on project_info
for each row execute procedure create_project_event();

create trigger trig_project_phase_insert after insert or update or delete
on project_phase
for each row execute procedure create_project_event();

create trigger trig_project_spec_insert after insert or update or delete
on project_spec
for each row execute procedure create_project_event();

create trigger trig_project_studio_specification_insert after insert or update or delete
on project_studio_specification
for each row execute procedure create_project_studio_event();

create trigger trig_prize_insert after insert or update or delete
on prize
for each row execute procedure create_project_event();

create trigger trig_submission_insert after insert or update or delete
on submission
for each row execute procedure create_submission_event();
