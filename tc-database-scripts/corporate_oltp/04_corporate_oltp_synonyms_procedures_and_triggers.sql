-- CREATE schema corporate_oltp authorization postgres;
CREATE schema IF NOT EXISTS corporate_oltp authorization postgres;

set search_path to corporate_oltp;

create view "user" as select * from common_oltp.user;
create view company as select * from common_oltp.company;
create view contact as select * from common_oltp.contact;
create view phone as select * from common_oltp.phone;
create view address as select * from common_oltp.address;
create view country as select * from common_oltp.country;
create view email as select * from common_oltp.email;
create view state as select * from common_oltp.state;
create view user_address_xref as select * from common_oltp.user_address_xref;
create view security_roles as select * from common_oltp.security_roles;
create view user_group_xref as select * from common_oltp.user_group_xref;
create view security_user as select * from common_oltp.security_user;
create view user_role_xref as select * from common_oltp.user_role_xref;
create view security_groups as select * from common_oltp.security_groups;
create view key_generation as select * from common_oltp.key_generation;
create view security_perms as select * from common_oltp.security_perms;
create view group_role_xref as select * from common_oltp.group_role_xref;
create view sequence_object as select * from common_oltp.sequence_object;
create view terms_of_use as select * from common_oltp.terms_of_use;
create view user_terms_of_use_xref as select * from common_oltp.user_terms_of_use_xref;
create view timezone_lu as select * from common_oltp.timezone_lu;


create or replace function corporate_oltp.get_current() returns TIMESTAMP as $body$
begin
    return now();
end;
$body$ language plpgsql;


create or replace function corporate_oltp.nextval(i_seqnum integer) returns int  as $body$
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

-- Used in triggers on several tables
create or replace function corporate_oltp.proc_modify_date() returns trigger as $body$
begin
  NEW.modify_date := current_timestamp;

  return NEW;
end;
$body$ language plpgsql;

grant execute on function get_current() to public;
grant execute on function nextval(integer) to public;

create trigger unit_type_lu_upd before update of unit_type_desc
on unit_type_lu
for each row execute procedure corporate_oltp.proc_modify_date();

create trigger unit_upd before update of unit_desc,unit_type_id
on unit
for each row execute procedure corporate_oltp.proc_modify_date();

create trigger product_upd before update of product_desc, cost
on product
for each row execute procedure corporate_oltp.proc_modify_date();

create trigger purchase_upd before update of company_id,product_id,start_date,end_date,paid
on purchase
for each row execute procedure corporate_oltp.proc_modify_date();

create trigger product_unit_xref_upd before update of num_units
on product_unit_xref
for each row execute procedure corporate_oltp.proc_modify_date();

