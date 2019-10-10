CREATE schema IF NOT EXISTS jive authorization postgres;
SET search_path TO jive;

create table if not exists dual
  (
    value integer
  );

create table if not exists jiveforum
  (
    forumid integer not null ,
    name varchar(255) not null ,
    nntpname varchar(255) not null ,
    description varchar(2048),
    moddefaultthreadval integer not null ,
    moddefaultmsgval integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    categoryid integer not null ,
    categoryindex integer not null ,
    forumindexcounter integer not null ,
    primary key (forumid)
  );

create table if not exists jiveforumprop
  (
    forumid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (forumid,name)
  );


create table if not exists jivethreadprop
  (
    threadid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (threadid,name)
  );


create table if not exists jivemessageprop
  (
    messageid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (messageid,name)
  );


create table if not exists jiveannounce
  (
    announcementid integer not null ,
    objecttype integer not null ,
    objectid integer,
    userid integer not null ,
    subject varchar(255),
    body text,
    startdate decimal(14,0) not null ,
    enddate decimal(14,0),
    primary key (announcementid)
  ) ;


create table if not exists jiveannounceprop
  (
    announcementid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (announcementid,name)
  );


create table if not exists jivepmessage
  (
    pmessageid integer not null ,
    ownerid integer not null ,
    senderid integer,
    recipientid integer,
    subject varchar(255),
    body text,
    readstatus integer not null ,
    folderid integer not null ,
    pmessagedate decimal(14,0) not null ,
    primary key (pmessageid)
  );


create table if not exists jivepmessageprop
  (
    pmessageid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (pmessageid,name)
  );


create table if not exists jivepmessagefldr
  (
    folderid integer not null ,
    userid integer not null ,
    name varchar(255) not null ,
    primary key (folderid,userid)
  ) ;

create table if not exists jiveuserperm
  (
    objecttype integer not null ,
    objectid integer not null ,
    userid integer not null ,
    permissiontype integer not null ,
    permission integer not null
  );


create table if not exists jiveuserprop
  (
    userid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (userid,name)
  ) ;


create table if not exists jivegroup
  (
    groupid integer not null ,
    name varchar(100) not null ,
    description varchar(255),
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (groupid)
  );


create table if not exists jivegroupperm
  (
    objecttype integer not null ,
    objectid integer not null ,
    groupid integer not null ,
    permissiontype integer not null ,
    permission integer not null
  ) ;


create table if not exists jivegroupprop
  (
    groupid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (groupid,name)
  );


create table if not exists jivegroupuser
  (
    groupid integer not null ,
    userid integer not null ,
    administrator integer not null ,
    primary key (groupid,userid,administrator)
  );


create table if not exists jiveid
  (
    idtype integer not null ,
    id integer not null ,
    primary key (idtype)
  );


create table if not exists jiveproperty
  (
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (name)
  );


create table if not exists jivemoderation
  (
    objectid integer not null ,
    objecttype integer not null ,
    userid integer,
    moddate decimal(14,0) not null ,
    modvalue integer not null
  );


create table if not exists jivewatch
  (
    userid integer not null ,
    objectid integer not null ,
    objecttype integer not null ,
    watchtype integer not null ,
    expirable integer not null ,
    primary key (userid,objectid,objecttype,watchtype)
  );


create table if not exists jivebatchwatch
  (
    userid integer not null ,
    frequency varchar(50) not null ,
    prevemaildate decimal(14,0),
    primary key (userid)
  );

create table if not exists jivereward
  (
    userid integer not null ,
    creationdate decimal(14,0) not null ,
    rewardpoints integer not null ,
    messageid integer,
    threadid integer
  );


create table if not exists jiveuserreward
  (
    userid integer not null ,
    rewardpoints integer not null ,
    primary key (userid)
  );


create table if not exists jiveattachment
  (
    attachmentid integer not null ,
    objecttype integer not null ,
    objectid integer,
    filename varchar(255) not null ,
    filesize integer not null ,
    contenttype varchar(50) not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (attachmentid)
  );


create table if not exists jiveattachdata
  (
    attachmentid integer not null ,
    attachmentdata bytea not null ,
    primary key (attachmentid)
  );


create table if not exists jiveattachmentprop
  (
    attachmentid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (attachmentid,name)
  );

create table if not exists jivecategory
  (
    categoryid integer not null ,
    name varchar(255) not null ,
    description varchar(2048),
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    lft integer not null ,
    rgt integer not null ,
    primary key (categoryid)
  );

create table if not exists jivecategoryprop
  (
    categoryid integer not null ,
    name varchar(100) not null ,
    propvalue varchar(2048) not null ,
    primary key (categoryid,name)
  );


create table if not exists jiveuserroster
  (
    userid integer not null ,
    subuserid integer not null ,
    primary key (userid,subuserid)
  );

create table if not exists jivereadtracker
  (
    userid integer not null ,
    objecttype integer not null ,
    objectid integer not null ,
    readdate decimal(14,0) not null ,
    primary key (userid,objecttype,objectid)
  );


create table if not exists jiveratingtype
  (
    score integer not null ,
    description varchar(255) not null ,
    primary key (score)
  );

create table if not exists jiverating
  (
    objectid integer not null ,
    objecttype integer not null ,
    userid integer,
    score integer not null
  );


create table if not exists jivepolloption
  (
    pollid integer not null ,
    optionindex integer not null ,
    optiontext varchar(255) not null ,
    primary key (pollid,optionindex)
  );


create table if not exists jivepollvote
  (
    pollid integer not null ,
    userid integer,
    guestid varchar(255),
    optionindex integer not null ,
    votedate decimal(15,0) not null
  );


create table if not exists jivesearch
  (
    searchid integer not null ,
    searchtype integer not null ,
    userid integer,
    query varchar(2048) not null ,
    searchduration integer not null ,
    numresults integer not null ,
    searchdate decimal(14,0) not null ,
    primary key (searchid)
  );


create table if not exists jivesearchcriteria
  (
    searchid integer not null ,
    criterianame varchar(100) not null ,
    criteriavalue varchar(2048) not null
  );

create table if not exists jivesearchclick
  (
    searchid integer not null ,
    messageid integer not null ,
    clickdate decimal(14,0) not null ,
    primary key (searchid,messageid,clickdate)
  );


create table if not exists jiveviewcount
  (
    objecttype integer not null ,
    objectid integer not null ,
    parentobjectid integer,
    viewcount integer  default 0,
    primary key (objecttype,objectid)
  );


create table if not exists jivereadstat
  (
    readstatid integer not null ,
    userid integer,
    objecttype integer not null ,
    objectid integer not null ,
    creationdate decimal(14,0) not null ,
    sessionid integer not null ,
    primary key (readstatid)
  );

create table if not exists jivereadstatsession
  (
    sessionid integer not null ,
    visitorid varchar(32),
    creationdate decimal(14,0) not null ,
    primary key (sessionid)
  );


create table if not exists jivehttpreadstatsession
  (
    referrer varchar(255),
    useragent varchar(255),
    ip varchar(16),
    country varchar(4),
    bytessent integer default 0,
    sessionid integer not null
  );


create table if not exists jivenntpreadstatsession
  (
    creationdate decimal(14,0) not null ,
    enddate decimal(14,0),
    bytesreceived integer default 0,
    bytessent integer default 0,
    ip varchar(16),
    country varchar(4),
    sessionid integer not null
  );

create table if not exists jivemessage
  (
    messageid integer not null ,
    parentmessageid integer,
    threadid integer not null ,
    forumid integer not null ,
    forumindex integer not null ,
    userid integer,
    subject varchar(255),
    body text,
    modvalue integer not null ,
    rewardpoints integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (messageid)
  );


create table if not exists jivethread
  (
    threadid integer not null ,
    forumid integer not null ,
    rootmessageid integer not null ,
    modvalue integer not null ,
    rewardpoints integer not null ,
    creationdate decimal(14,0) not null ,
    modificationdate decimal(14,0) not null ,
    primary key (threadid)
  );


create table if not exists message_history
  (
    historyid serial not null ,
    messageid integer,
    subject varchar(255),
    body text,
    modificationdate decimal(14,0),
    primary key (historyid)
  );


create table if not exists jivepoll
  (
    pollid integer not null ,
    objecttype integer not null ,
    objectid integer not null ,
    userid integer,
    name varchar(255) not null ,
    description varchar(2048),
    pollmode integer not null ,
    creationdate decimal(15,0) not null ,
    modificationdate decimal(15,0) not null ,
    startdate decimal(14,0) not null ,
    enddate decimal(15,0) not null ,
    expiredate decimal(15,0) not null ,
    primary key (pollid)
  );


create table if not exists template
  (
    template_id integer not null ,
    template_type integer not null ,
    description varchar(255) not null ,
    primary key (template_id)
  );



create table if not exists template_forum
  (
    template_forum_id integer not null ,
    template_id integer,
    name varchar(255) not null ,
    description varchar(255) not null ,
    display_order integer not null ,
    project_category_id integer,
    primary key (template_forum_id)
  );


create table if not exists template_project_forum
  (
    template_project_forum_id integer not null ,
    template_id integer,
    name varchar(255) not null ,
    description varchar(255) not null ,
    display_order integer not null ,
    direct_project_type_id integer,
    primary key (template_project_forum_id)
  );


create table if not exists question_thread_xref (
  question_id int not null,
  thread_id int not null,
  forum_id int not null,
  primary key (question_id, forum_id)
);


create table if not exists comment_message_xref (
  comment_id serial not null,
  message_id int not null,
  primary key (comment_id)
);


create table if not exists jive_reply_to_identifiers
  (
    reply_to_identifier_id bigserial not null,
    reply_to_identifier varchar(50) not null ,
    user_id decimal(10, 0) not null ,
    message_id integer not null,
    primary key (reply_to_identifier_id)
  );

