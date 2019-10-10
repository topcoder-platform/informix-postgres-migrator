SET search_path TO jive;
create index if not exists jiveforum_forumidxctr_idx  on jiveforum  using btree(forumindexcounter);
create index if not exists jivefourm_cdate_idx on jiveforum using btree(creationdate);
create index if not exists jivefourm_mdate_idx on jiveforum using btree(modificationdate);
create unique index if not exists nntp_unique_idx on jiveforum using btree(nntpname);
create index if not exists jiveannounce_container_idx on jiveannounce using btree(objecttype,objectid);
create index if not exists jiveannounce_edate_idx on jiveannounce using btree(enddate);
create index if not exists jiveannounce_sdate_idx on jiveannounce using btree(startdate);
create index if not exists jiveannounce_user_idx on jiveannounce using btree(userid) ;
create index if not exists jivepmessage_rid_idx on jivepmessage using btree(recipientid);
create index if not exists jiveuserperm_object_idx on jiveuserperm using btree(objecttype,objectid);
create index if not exists jiveuserperm_userid_idx on jiveuserperm using btree(userid);
create index if not exists jivegroup_cdate_idx on jivegroup using btree(creationdate);
create unique index if not exists name_unique_idx on jivegroup using btree(name);
create index if not exists jivegroupperm_groupid_idx on jivegroupperm  using btree(groupid);
create index if not exists jivegroupperm_object_idx on jivegroupperm  using btree(objecttype,objectid);
create index if not exists jivegroupuser_userid_idx on jivegroupuser  using btree(userid);
create index if not exists jivemoderation_objectid_idx on jivemoderation  using btree(objectid);
create index if not exists jivemoderation_objecttype_idx on jivemoderation using btree(objecttype) ;
create index if not exists jivemoderation_userid_idx on jivemoderation using btree(userid) ;
create index if not exists jivewatch_combo_idx on jivewatch using btree(objecttype,objectid,watchtype);

create index if not exists jivewatch_objectid_idx on jivewatch using btree(objectid) ;
create index if not exists jivewatch_objecttype_idx on jivewatch using btree(objecttype);
create index if not exists jivewatch_userid_idx on jivewatch using btree(userid);
create index if not exists jivereward_creationdate_idx on jivereward using btree(creationdate);
create index if not exists jivereward_messageid_idx on jivereward using btree(messageid);
create index if not exists jivereward_threadid_idx on jivereward using btree(threadid);
create index if not exists jivereward_userid_idx on jivereward using btree(userid);
create index if not exists jiveattachment_object_idx on jiveattachment using btree(objecttype,objectid);
create index if not exists jivecategory_lft_idx on jivecategory using btree(lft);
create index if not exists jjivecategory_rgt_idx on jivecategory using btree(rgt) ;
create index if not exists jiverating_oid_otype_idx on jiverating  using btree(objectid,objecttype);
create index if not exists jiverating_userid_idx on jiverating using btree(userid);
create index if not exists jivepollvote_pollid_idx on jivepollvote using btree(pollid) ;
create index if not exists jivesearch_type_idx on jivesearch using btree(searchtype);
create index if not exists jivesearch_userid_idx on jivesearch using btree(userid);
create index if not exists jivesearchcrit_sid_idx on jivesearchcriteria using btree(searchid);
create index if not exists jiveviewcount_po_idx on jiveviewcount using btree(parentobjectid) ;
create index if not exists jiveviewcount_vc_idx on jiveviewcount using btree(viewcount);
create index if not exists jivereadstat_cd_idx on jivereadstat using btree(creationdate);
create index if not exists jiverss_cd_idx on jivereadstatsession using btree(creationdate) ;
create index if not exists jivehrss_bs_idx on jivehttpreadstatsession using btree(bytessent) ;
create index if not exists jivehrss_sid_idx on jivehttpreadstatsession using btree(sessionid);
create index if not exists jivenrss_cd_idx on jivenntpreadstatsession using btree(creationdate);
create index if not exists jivenrss_ed_idx on jivenntpreadstatsession using btree(enddate) ;
create index if not exists jivemessage_cdate_idx on jivemessage using btree(creationdate);
create index if not exists jivemessage_forumid_idx on jivemessage using btree(forumid,forumindex);
create index if not exists jivemessage_forumid_modval_idx on jivemessage  using btree(forumid,modvalue);
create index if not exists jivemessage_mdate_idx on jivemessage using btree(modificationdate desc);
create index if not exists jivemessage_threadid_idx on jivemessage using btree(threadid);
create index if not exists jivemessage_userid_idx on jivemessage using btree(userid);
create index if not exists jivemessage_parentmessageid_idx on jivemessage using btree(parentmessageid);
create index if not exists jivethread_cdate_idx on jivethread using btree(creationdate) ;
create index if not exists jivethread_fid_mv_idx on jivethread using btree(forumid,modvalue);
create index if not exists jivethread_forumid_idx on jivethread using btree(forumid);
create index if not exists jivethread_mdate_idx on jivethread using btree(modificationdate desc);
create index if not exists jivethread_modvalue_idx on jivethread using btree(modvalue);
create index if not exists historyid_idx on message_history using btree(messageid);
create index if not exists jivepoll_cdate_idx on jivepoll using btree(creationdate);
create index if not exists jivepoll_edate_idx on jivepoll using btree(enddate desc) ;
create index if not exists jivepoll_mdate_idx on jivepoll using btree(modificationdate desc);
create index if not exists jivepoll_oid_otype_idx on jivepoll  using btree(objectid,objecttype);
create index if not exists jivepoll_sdate_idx on jivepoll using btree(startdate desc);

alter table jiveforumprop drop constraint if exists jiveforumprop_forumid_fk;
alter table jiveforumprop add constraint jiveforumprop_forumid_fk foreign key (forumid) references jiveforum;

alter table jiverating drop constraint if exists jiverating_score_fk;
alter table jiverating add constraint jiverating_score_fk foreign key (score) references jiveratingtype;

alter table jivepolloption drop constraint if exists jivepolloption_pollid_fk;
alter table jivepolloption add constraint jivepolloption_pollid_fk foreign key (pollid) references jivepoll;

alter table jivesearchcriteria drop constraint if exists jivesearchcriteria_sid_fk;
alter table jivesearchcriteria add constraint jivesearchcriteria_sid_fk foreign key (searchid) references jivesearch;

alter table jivesearchclick drop constraint if exists jivesearchclick_searchid_fk;
alter table jivesearchclick add constraint jivesearchclick_searchid_fk foreign key (searchid) references jivesearch;

alter table jivenntpreadstatsession drop constraint if exists jivenntpreadstatsession_sid_fk;
alter table jivenntpreadstatsession add constraint jivenntpreadstatsession_sid_fk foreign key (sessionid) references jivereadstatsession;

alter table jivemessage drop constraint if exists jivemessage_threadid_fk;
alter table jivemessage add constraint jivemessage_threadid_fk foreign key(threadid) references jivethread;

alter table jivemessage drop constraint if exists jivemessage_forumid_fk;
alter table jivemessage add constraint jivemessage_forumid_fk foreign key(forumid) references jiveforum;

alter table jivemessageprop drop constraint if exists jivemessageprop_msgid_fk;
alter table jivemessageprop add constraint jivemessageprop_msgid_fk foreign key (messageid) references jivemessage;

alter table question_thread_xref drop constraint if exists question_thread_xref_thread_fk;
alter table question_thread_xref add constraint question_thread_xref_thread_fk foreign key(thread_id) references jivethread(threadid);

alter table question_thread_xref drop constraint if exists question_thread_xref_forum_fk;
alter table question_thread_xref add constraint question_thread_xref_forum_fk foreign key(forum_id) references jiveforum(forumid);

alter table comment_message_xref drop constraint if exists comment_message_xref_message_fk;
alter table comment_message_xref add constraint comment_message_xref_message_fk foreign key(message_id) references jivemessage (messageid);

create unique index if not exists jive_reply_to_identifiers_identifier_idx on jive_reply_to_identifiers using btree(reply_to_identifier) ;
create unique index if not exists jive_reply_to_identifiers_user_id_msg_id_idx on jive_reply_to_identifiers using btree(user_id, message_id);

alter table jive_reply_to_identifiers drop constraint if exists jive_reply_to_identifiers_msgid_fk;
alter table jive_reply_to_identifiers add constraint jive_reply_to_identifiers_msgid_fk foreign key (message_id) references jivemessage;
