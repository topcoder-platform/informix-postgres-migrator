SET search_path TO common_oltp;

CREATE OR REPLACE FUNCTION common_oltp.get_current() returns TIMESTAMP LANGUAGE 'plpgsql' As $body$
BEGIN
    return now();
END;
$body$;

-- Used in triggers on several tables
CREATE OR REPLACE FUNCTION common_oltp.proc_modify_date() returns TRIGGER LANGUAGE 'plpgsql' As $body$
BEGIN
  NEW.modify_date := current_timestamp;
    
  RETURN NEW;
END;
$body$;

CREATE OR REPLACE FUNCTION common_oltp.proc_note_update() returns TRIGGER LANGUAGE 'plpgsql' As $body$
BEGIN
  if (OLD.text != NEW.text) or (OLD.submitted_by != NEW.submitted_by) or (OLD.note_type_id != NEW.note_type_id) Then
    NEW.modify_date := current_timestamp;
  end If;
    
  RETURN NEW;
END;
$body$;

CREATE OR REPLACE FUNCTION common_oltp.nextval(i_seqnum INTEGER) returns int LANGUAGE 'plpgsql' AS $body$
    DECLARE v numeric := -1;
   
    BEGIN
        update sequence_object
        set current_value = current_value +1 
        where id = i_seqnum
        returning current_value into v;
   
        return v;
    END;
$body$;

-- Handles INSERT AND UPDATE
CREATE OR REPLACE FUNCTION common_oltp.proc_user_update() returns TRIGGER
AS $body$
BEGIN
      IF (TG_OP = 'UPDATE') THEN
              if ((OLD.first_name != NEW.first_name) or (OLD.last_name != NEW.last_name ) or (OLD.middle_name != NEW.middle_name )) then
                 insert into audit_user (column_name, old_value, new_value, user_id)
                 values ('NAME', NULLIF(OLD.first_name, '') || ' ' || NULLIF(OLD.middle_name, '') || ' ' || NULLIF(OLD.last_name, ''),
                         NULLIF(NEW.first_name, '') || ' ' || NULLIF(NEW.middle_name, '') || ' ' || NULLIF(NEW.last_name, ''), OLD.user_id);
              End if;
              
              if (OLD.handle != NEW.handle) then 
                 insert into audit_user (column_name, old_value, new_value, user_id)
                 values ('HANDLE', OLD.handle, NEW.handle, OLD.user_id);
              End If;
        
              if (OLD.status != NEW.status) then 
                 insert into audit_user (column_name, old_value, new_value, user_id)
                 values ('STATUS', OLD.status, NEW.status, OLD.user_id);
              End If;
        
              if (OLD.activation_code != NEW.activation_code) then 
                 insert into audit_user (column_name, old_value, new_value, user_id)
                 values ('ACTIVATION_CODE', OLD.activation_code, NEW.activation_code, OLD.user_id);
              End If;
        
              if (OLD.timezone_id != NEW.timezone_id) then 
                 insert into audit_user (column_name, old_value, new_value, user_id)
                 values ('TIMEZONE_ID', OLD.timezone_id, NEW.timezone_id, OLD.user_id);
              End If;
        
              NEW.modify_date = current_timestamp;
              
        END IF;

      NEW.handle_lower = lower(NEW.handle);
      
      RETURN NEW;
END;
$body$ LANGUAGE 'plpgsql';

-- revoke execute on procedure common_oltp.proc_user_update(decimal,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,decimal,decimal) from PUBLIC;

-- proc_email_update
CREATE OR REPLACE FUNCTION common_oltp.proc_email_update() returns TRIGGER
AS $body$
BEGIN 
      if (OLD.email_type_id != NEW.email_type_id) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('EMAIL_TYPE', OLD.email_type_id, NEW.email_type_id, OLD.user_id);
      End If;

      if (OLD.status_id != NEW.status_id) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('EMAIL_STATUS', OLD.status_id, NEW.status_id, OLD.user_id);
      End If;

      if (OLD.address != NEW.address) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('EMAIL_ADDRESS', OLD.address, NEW.address, OLD.user_id);
      End If;

      if (OLD.primary_ind != NEW.primary_ind) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('EMAIL_PRIMARY_IND', OLD.primary_ind, NEW.primary_ind, OLD.user_id);
      End If;

      NEW.modify_date = current_timestamp;
      
      RETURN NEW;
END;
$body$ LANGUAGE 'plpgsql';

-- proc_phone_update
CREATE OR REPLACE FUNCTION common_oltp.proc_phone_update() returns TRIGGER 
AS $body$
BEGIN 
      if (OLD.phone_type_id != NEW.phone_type_id) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('PHONE_TYPE', OLD.phone_type_id, NEW.phone_type_id, OLD.user_id);
      End If;

      if (OLD.phone_number != NEW.phone_number) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('PHONE_NUMBER', OLD.phone_number, NEW.phone_number, OLD.user_id);
      End If;

      if (OLD.primary_ind != NEW.primary_ind) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('PHONE_PRIMARY_IND', OLD.primary_ind, NEW.primary_ind, OLD.user_id);
      End If;
     
      NEW.modify_date = current_timestamp;
      
      RETURN NEW;
END;
$body$ LANGUAGE 'plpgsql';

-- millis_to_time
CREATE OR REPLACE FUNCTION common_oltp.millis_to_time(milli_val decimal(14,0)) returns TIMESTAMP AS $$
DECLARE
	retval TIMESTAMP;
	num_seconds int;
	millis_in_day int := 86400000;
	num_days int;
BEGIN
  num_days := trunc(milli_val/millis_in_day,0);
  num_seconds := (milli_val - (num_days * millis_in_day))/1000;

  retval := to_date('01-01-1970', 'DD-MM-YYYY')::TIMESTAMP;
  retval := retval + num_days * INTERVAL '1 day';
  retval := retval + num_seconds * INTERVAL '1 second';

  return retval;
END;
$$ LANGUAGE 'plpgsql';

-- tc_lower
CREATE OR REPLACE FUNCTION common_oltp.tc_lower( val varchar(255) ) returns varchar(255) AS $$
BEGIN
    return lower(val);
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION common_oltp.get_sequence_ids(sequence_name VARCHAR(254)) 
	returns TABLE(next_block_start DECIMAL(12,0), block_size DECIMAL(10,0)) AS $$
DECLARE 
	n DECIMAL(12,0);
	k DECIMAL(10,0);
BEGIN
  IF sequence_name NOT IN (SELECT name FROM id_sequences) THEN
    RAISE EXCEPTION 'Invalid sequence name %', $1;
  END IF;
  
  LOCK TABLE id_sequences IN SHARE ROW EXCLUSIVE MODE;
  
  SELECT id_sequences.next_block_start, id_sequences.block_size INTO n, k
    FROM id_sequences
    WHERE id_sequences.name = $1;
    
  UPDATE id_sequences
    SET next_block_start = n + k
    WHERE id_sequences.name = $1;
  
  return query select n, k;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION common_oltp.proc_address_update() returns TRIGGER AS $$
DECLARE 
        user_id DECIMAL(10,0);
BEGIN
      user_id := NULLIF((select min(x.user_id) from user_address_xref x where x.address_id = OLD.address_id), -1);
      
      if (user_id > 0 and OLD.address1 != NEW.address1) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS1', OLD.address1, NEW.address1, user_id);
      End If;

      if (user_id > 0 and OLD.address2 != NEW.address2) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS2', OLD.address2, NEW.address2, user_id);
      End If;

      if (user_id > 0 and OLD.address3 != NEW.address3) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS3', OLD.address3, NEW.address3, user_id);
      End If;

      if (user_id > 0 and OLD.city != NEW.city) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS_CITY', OLD.city, NEW.city, user_id);
      End If;

      if (user_id > 0 and OLD.state_code != NEW.state_code) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS_STATE', OLD.state_code, NEW.state_code, user_id);
      End If;

      if (user_id > 0 and OLD.province != NEW.province) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS_PROVINCE', OLD.province, NEW.province, user_id);
      End If;

      if (user_id > 0 and OLD.zip != NEW.zip) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS_ZIP', OLD.zip, NEW.zip, user_id);
      End If;
      
      if (user_id > 0 and OLD.country_code != NEW.country_code) then 
         insert into audit_user (column_name, old_value, new_value, user_id)
         values ('ADDRESS_COUNTRY', OLD.country_code, NEW.country_code, user_id);
      End If;

      NEW.modify_date = current_timestamp;
      
      RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION common_oltp.proc_user_last_login () returns TRIGGER AS $$
BEGIN
      if (OLD.last_login != NEW.last_login) then
         insert into common_oltp.corona_event(corona_event_type_id, user_id, corona_event_timestamp)
         values (1, OLD.user_id, NEW.last_login);
      end if;
      
      RETURN NULL;
END;
$$ LANGUAGE 'plpgsql';

GRANT EXECUTE ON FUNCTION get_current() TO PUBLIC;

GRANT EXECUTE ON FUNCTION nextval(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION proc_user_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION proc_email_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION proc_phone_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION millis_to_time(decimal) TO PUBLIC;

GRANT EXECUTE ON FUNCTION tc_lower(varchar) TO PUBLIC;

GRANT EXECUTE ON FUNCTION proc_address_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION get_sequence_ids(varchar) TO PUBLIC;

create trigger trig_audit_address 
before update on "address"
for each row execute procedure common_oltp.proc_address_update();

create trigger trig_audit_email 
before update on common_oltp.email 
for each row execute procedure common_oltp.proc_email_update();

create trigger trig_audit_phone
before update on common_oltp.phone
for each row execute procedure common_oltp.proc_phone_update();

create trigger trig_note_modified 
before update on common_oltp.note 
for each row execute procedure common_oltp.proc_note_update();

create trigger trig_audit_user 
before update or insert on common_oltp.user 
for each row execute procedure common_oltp.proc_user_update();

create trigger trig_user_preference_update 
before update on common_oltp.user_preference 
for each row execute procedure common_oltp.proc_modify_date();

create trigger trig_event_reg_modified 
before update on common_oltp.event_registration 
for each row execute procedure common_oltp.proc_modify_date();

create trigger trig_demographic_response_modified 
before update on common_oltp.demographic_response 
for each row execute procedure common_oltp.proc_modify_date();

create trigger trig_event_modified 
before update or insert on common_oltp.event 
for each row execute procedure common_oltp.proc_modify_date();

--create trigger trig_user_last_login 
--before update or insert on common_oltp.user 
--for each row execute procedure common_oltp.proc_modify_date();

create trigger trig_user_last_login
after update on common_oltp.user 
for each row execute procedure common_oltp.proc_user_last_login();

