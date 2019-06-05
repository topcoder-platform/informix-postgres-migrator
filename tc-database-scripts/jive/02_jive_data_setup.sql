delete from template_project_forum where template_project_forum_id=2;
insert into template_project_forum (template_project_forum_id, template_id, name, description, display_order, direct_project_type_id) values (2, NULL, 'Project Requirements', 'Discuss Project Requirements here', 1, NULL);

delete from jiveuserperm where  objectid=-1 and userid=1 and permissiontype=1 and permission=59 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=1 and permissiontype=1 and permission=59 limit 1);
insert into jiveuserperm values(17,-1,1,1,59);
delete from jiveuserperm where  objectid=-1 and userid=-1 and permissiontype=1 and permission=0 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=-1 and permissiontype=1 and permission=0 limit 1);
insert into jiveuserperm values(17,-1,-1,1,0);
delete from jiveuserperm where  objectid=-1 and userid=0 and permissiontype=1 and permission=1 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=0 and permissiontype=1 and permission=1 limit 1);
insert into jiveuserperm values(17,-1,0,1,1);
delete from jiveuserperm where  objectid=-1 and userid=0 and permissiontype=1 and permission=2 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=0 and permissiontype=1 and permission=2 limit 1);
insert into jiveuserperm values(17,-1,0,1,2);
delete from jiveuserperm where  objectid=-1 and userid=0 and permissiontype=1 and permission=5 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=0 and permissiontype=1 and permission=5 limit 1);
insert into jiveuserperm values(17,-1,0,1,5);
delete from jiveuserperm where objectid=-1 and userid=0 and permissiontype=1 and permission=10 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=0 and permissiontype=1 and permission=10 limit 1);
insert into jiveuserperm values(17,-1,0,1,10);

delete from jiveuserprop where userid=1 and name = 'jiveAdminUserRange';
insert into jiveuserprop values(1,'jiveAdminUserRange','15');


delete from jiveid where idtype=any('{0,1,2,3,4,13,14,18,19,20,22,23,24,25,26,201,202}');
insert into jiveid values(0,9);
insert into jiveid values(1,11);
insert into jiveid values(2,16);
insert into jiveid values(3,3);
insert into jiveid values(4,1);
insert into jiveid values(13,1);
insert into jiveid values(14,2);
insert into jiveid values(18,1);
insert into jiveid values(19,1);
insert into jiveid values(20,1);
insert into jiveid values(22,1);
insert into jiveid values(23,1);
insert into jiveid values(24,1);
insert into jiveid values(25,1);
insert into jiveid values(26,1);
insert into jiveid values(201,1);
insert into jiveid values(202,1);


delete from jiveproperty where name=any(ARRAY['filter.global.filter1.properties.reservedWordEnd','filter.global.filter9.className','filter.global.filter0.className','filter.global.filter11.properties.allowedAttributesString','filter.global.filter5.properties.commentStart','filter.global.filter0.properties.filterNumber','filter.global.filter5.properties.reservedWordStart','filter.global.filter2.properties.lineNumberColor','filter.initialSetup','cron.propertiesUpgraded','cookieKey','jiveURL','rss.enabled','skin.default.aLinkColor','skin.default.activeColor','skin.default.bgColor','skin.default.borderColor','skin.default.breadcrumbColor','skin.default.breadcrumbColorHover','skin.default.changePasswordEnabled','skin.default.communityDescription','skin.default.communityName','skin.default.descrFontFace','skin.default.descrFontSize','skin.default.displayFullNames','skin.default.evenColor','skin.default.fontFace','skin.default.fontSize','skin.default.guiEditorEnabled','skin.default.headerHTML','skin.default.linkColor','skin.default.newAccountCreationEnabled','skin.default.oddColor','skin.default.showLastPostLink','skin.default.tableHeaderBgColor','skin.default.tableHeaderColor','skin.default.textColor','skin.default.threadMode','skin.default.trackIP','skin.default.useDefaultCommunityName','skin.default.useDefaultFooterHTML','skin.default.useDefaultHeaderHTML','skin.default.useDefaultWelcomeText','skin.default.usersChooseLocale','skin.default.usersChooseThreadMode','skin.default.vLinkColor','AuthFactory.className','filter.global.filter4.properties.filterNumber','filter.global.filter4.properties.commentStart','filter.filterClasses.filter21','filter.filterClasses.filter10','filter.filterClasses.filter7','filter.filterClasses.filter14','filter.filterClasses.filter13','filter.filterClasses.filter18','filter.filterClasses.filter4','filter.filterClasses.filter0','filter.filterClasses.filter3','filter.filterClasses.filter8','filter.filterClasses.filter15','filter.filterClasses.filter20','filter.filterClasses.filter9','filter.filterClasses.filter19','filter.global.filter11.properties.allowedTagsString','filter.global.filter1.properties.lineNumberColor','filter.global.filter4.properties.methodStart','filter.global.filter0.properties.filterMethod','filter.global.filter3.properties.tableLinePanelBackgroundColor','filter.global.filter4.properties.numberStart','filter.global.filter4.properties.filterMethod','filter.global.filter4.className','filter.global.filter2.properties.showLineCount','filter.global.filter5.properties.characterStart','filter.global.filter1.properties.filterMethod','filter.global.filter2.properties.numberStart','filter.global.filter2.properties.characterStart','filter.global.filter0.properties.lineNumberColor','filter.filterClasses.filter16','filter.global.filter3.properties.showLineCount','filter.global.filter2.properties.methodStart','filter.global.filter0.properties.methodEnd','filter.global.filter4.filterTypes','filter.global.filter3.properties.commentEnd','filter.global.filter4.properties.bracketEnd','filter.global.filter0.properties.applyTableSurround','filter.global.filter11.properties.blockEnd','filter.global.filter0.properties.commentStart','filter.global.filter5.properties.filterNumber','filter.global.filter4.properties.characterStart','filter.global.filter1.properties.tableBorderColor','filter.global.filter3.properties.applyTableSurround','filter.global.filter2.properties.bracketStart','filter.global.filter3.properties.stringStart','filter.global.filter2.properties.commentStart','filter.global.filter2.properties.tableBorderColor','filter.global.filter3.properties.filterMethod','filter.global.filter0.properties.showLineCount','filter.global.filter9.filterTypes','filter.global.filter2.properties.methodEnd','filter.global.filter8.filterTypes','filter.global.filter5.properties.characterEnd','filter.global.filter11.properties.disallowedKeywordsString','filter.global.filter7.properties.shortenLinks','filter.global.filter1.properties.applyTableSurround','filter.global.filter9.properties.preformatEnabled','filter.global.filter0.properties.tableLinePanelBackgroundColor','filter.global.filter11.className','filter.global.filter2.className','filter.global.filter1.properties.reservedWordStart','filter.global.filter3.properties.numberStart','filter.global.filter4.properties.showLineCount','filter.global.filter1.properties.bracketStart','filter.global.filter2.properties.reservedWordEnd','filter.global.filter3.properties.filterNumber','filter.global.filter7.properties.charsAfterEllipsis','filter.global.filter4.properties.tableBorderColor','filter.global.filter9.properties.underlineEnabled','filter.global.filter4.properties.tableLinePanelBackgroundColor','filter.global.filter1.filterTypes','filter.global.filter6.className','filter.global.filter3.properties.reservedWordStart','filter.global.filter11.properties.maxImageWidth','filter.global.filter11.properties.disallowedTagsString','filter.global.filter1.properties.characterEnd','filter.global.filter5.className','filter.global.filter0.properties.methodStart','filter.filterClasses.filter2','filter.global.filter8.properties.nobrEnabled','filter.global.filter5.properties.showLineCount','filter.global.filter3.properties.numberEnd','filter.global.filter3.properties.tableBorderColor','filter.global.filter2.properties.reservedWordStart','filter.global.filter3.properties.methodEnd','filter.global.filter11.properties.stripDisallowedTags','filter.global.filter0.properties.tableBorderColor','filter.global.filter2.properties.stringStart','filter.global.filter0.properties.reservedWordStart','filter.global.filter1.properties.bracketEnd','filter.global.filter0.properties.tableCodePanelBackgroundColor','filter.global.filter3.properties.reservedWordEnd','filter.global.filter5.properties.tableLinePanelBackgroundColor','filter.global.filter7.properties.charsBeforeEllipsis','filter.global.filter1.properties.numberEnd','filter.global.filter5.properties.lineNumberColor','filter.global.filter3.properties.bracketStart','filter.global.filter3.filterTypes','filter.global.filter2.properties.filterMethod','filter.global.filter3.className','filter.filterClasses.filter12','filter.global.filter4.properties.reservedWordStart','filter.global.filter1.properties.commentStart','filter.global.filter4.properties.characterEnd','filter.global.filter2.properties.tableCodePanelBackgroundColor','filter.global.filter5.properties.stringStart','filter.global.filter4.properties.applyTableSurround','filter.filterClasses.filter6','filter.global.filter0.properties.commentEnd','filter.global.filter1.className','filter.global.filter0.properties.numberStart','filter.global.filter0.properties.reservedWordEnd','filter.global.filter4.properties.reservedWordEnd','filter.global.filter1.properties.stringStart','filter.global.filter3.properties.characterEnd','filter.global.filter9.properties.boldEnabled','filter.global.filter4.properties.stringEnd','filter.global.filter5.properties.methodEnd','filter.global.filter7.filterTypes','filter.global.filter3.properties.methodStart','filter.global.filter4.properties.commentEnd','filter.global.filter1.properties.numberStart','filter.global.filter1.properties.tableCodePanelBackgroundColor','filter.global.filter0.properties.bracketStart','filter.global.filter2.properties.stringEnd','filter.global.filter7.properties.longLinkLen','filter.global.filter5.properties.bracketEnd','filter.filterClasses.filter11','filter.global.filter5.properties.bracketStart','filter.global.filter5.properties.reservedWordEnd','filter.global.filter1.properties.commentEnd','filter.global.filter5.properties.tableBorderColor','filter.global.filter5.properties.tableCodePanelBackgroundColor','filter.global.filter4.properties.stringStart','filter.global.filter0.filterTypes','filter.global.filter3.properties.tableCodePanelBackgroundColor','filter.global.filter11.properties.restrictImageWidth','filter.global.filter2.properties.tableLinePanelBackgroundColor','filter.filterClasses.filter1','filter.filterClasses.filter17','filter.global.filter8.className','filter.global.filter6.filterTypes','filter.global.filterCount','filter.global.filter5.filterTypes','filter.global.filter1.properties.tableLinePanelBackgroundColor','filter.global.filter1.properties.showLineCount','filter.global.filter2.properties.numberEnd','filter.global.filter5.properties.filterMethod','filter.global.filter3.properties.commentStart','filter.global.filter11.properties.blockStart','filter.global.filter9.properties.italicEnabled','filter.global.filter10.properties.imageURL','filter.filterClasses.filter5','filter.global.filter7.properties.newWindowEnabled','filter.global.filter11.filterTypes','filter.global.filter4.properties.lineNumberColor','filter.global.filter2.properties.filterNumber','filter.global.filter2.properties.commentEnd','filter.global.filter1.properties.methodStart','filter.global.filter5.properties.applyTableSurround','filter.global.filter4.properties.methodEnd','filter.global.filter4.properties.bracketStart','filter.global.filter3.properties.lineNumberColor','filter.global.filter11.properties.allowSymbols','filter.global.filter5.properties.numberStart','filter.global.filter5.properties.commentEnd','filter.global.filter1.properties.stringEnd','filter.global.filter1.properties.characterStart','filter.global.filter0.properties.numberEnd','filter.global.filter5.properties.numberEnd','filter.global.filter1.properties.filterNumber','filter.global.filter2.filterTypes','filter.global.filter5.properties.methodStart','filter.global.filter7.className','filter.global.filter3.properties.characterStart','filter.global.filter4.properties.tableCodePanelBackgroundColor','filter.global.filter0.properties.stringStart','filter.global.filter10.filterTypes','filter.global.filter0.properties.characterEnd','filter.global.filter11.properties.onlyFilterBlocksEnabled','filter.global.filter5.properties.stringEnd','filter.global.filter1.properties.methodEnd','filter.global.filter0.properties.characterStart','filter.global.filter2.properties.characterEnd','filter.global.filter10.className','filter.global.filter2.properties.bracketEnd','filter.global.filter3.properties.stringEnd','filter.global.filter0.properties.bracketEnd','filter.global.filter4.properties.numberEnd','filter.global.filter3.properties.bracketEnd','filter.global.filter0.properties.stringEnd','filter.global.filter2.properties.applyTableSurround']);
insert into jiveproperty values ('filter.global.filter1.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter9.className', 'com.jivesoftware.base.filter.TextStyle');
insert into jiveproperty values ('filter.global.filter0.className', 'com.topcoder.web.forums.util.filter.CPPHighlighter');
insert into jiveproperty values ('filter.global.filter11.properties.allowedAttributesString', 'a:href img:src,height,width');
insert into jiveproperty values ('filter.global.filter5.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.global.filter0.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter5.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter2.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.initialSetup', 'true');
insert into jiveproperty values ('cron.propertiesUpgraded', 'true');
insert into jiveproperty values ('cookieKey', '486VEaRLu5FAeXa');
insert into jiveproperty values ('jiveURL', 'http://172.16.20.41:8080/jive4');
insert into jiveproperty values ('rss.enabled', 'true');
insert into jiveproperty values ('skin.default.aLinkColor', '#ff0000');
insert into jiveproperty values ('skin.default.activeColor', '#ffffcc');
insert into jiveproperty values ('skin.default.bgColor', '#ffffff');
insert into jiveproperty values ('skin.default.borderColor', '#cccccc');
insert into jiveproperty values ('skin.default.breadcrumbColor', '#003399');
insert into jiveproperty values ('skin.default.breadcrumbColorHover', '#ff0000');
insert into jiveproperty values ('skin.default.changePasswordEnabled', 'true');
insert into jiveproperty values ('skin.default.communityDescription', 'Below you will find the topics currently being discussed. TopCoder Round Tables are forum style discussion topics. TopCoder members may use the Round Tables to discuss ideas with and make suggestions to the TopCoder community. The Round Tables are for discussions of any TopCoder related topics.');
insert into jiveproperty values ('skin.default.communityName', 'Round Tables');
insert into jiveproperty values ('skin.default.descrFontFace', 'verdana,arial,sans-serif');
insert into jiveproperty values ('skin.default.descrFontSize', '8pt');
insert into jiveproperty values ('skin.default.displayFullNames', 'false');
insert into jiveproperty values ('skin.default.evenColor', '#ffffff');
insert into jiveproperty values ('skin.default.fontFace', 'arial,helvetica,sans-serif');
insert into jiveproperty values ('skin.default.fontSize', '10pt');
insert into jiveproperty values ('skin.default.guiEditorEnabled', 'false');
insert into jiveproperty values ('skin.default.headerHTML', '<table cellspacing=0 class=pageTitleTable>\u000d\u000a    <tr>\u000d\u000a        <td width="100%" class=pageTitle><img border=0 src="images/tc/header_round_table.gif" alt="round_table"/></td><td align=right class=pageSubtitle>\u00a0\u00a0</td>\u000d\u000a    </tr>\u000d\u000a</table>');
insert into jiveproperty values ('skin.default.linkColor', '#003399');
insert into jiveproperty values ('skin.default.newAccountCreationEnabled', 'true');
insert into jiveproperty values ('skin.default.oddColor', '#eeeeee');
insert into jiveproperty values ('skin.default.showLastPostLink', 'true');
insert into jiveproperty values ('skin.default.tableHeaderBgColor', '#cccccc');
insert into jiveproperty values ('skin.default.tableHeaderColor', '#333333');
insert into jiveproperty values ('skin.default.textColor', '#000000');
insert into jiveproperty values ('skin.default.threadMode', 'flat');
insert into jiveproperty values ('skin.default.trackIP', 'true');
insert into jiveproperty values ('skin.default.useDefaultCommunityName', 'false');
insert into jiveproperty values ('skin.default.useDefaultFooterHTML', 'true');
insert into jiveproperty values ('skin.default.useDefaultHeaderHTML', 'false');
insert into jiveproperty values ('skin.default.useDefaultWelcomeText', 'false');
insert into jiveproperty values ('skin.default.usersChooseLocale', 'true');
insert into jiveproperty values ('skin.default.usersChooseThreadMode', 'false');
insert into jiveproperty values ('skin.default.vLinkColor', '#003399');
insert into jiveproperty values ('AuthFactory.className', 'com.topcoder.web.forums.model.TCAuthFactory');
insert into jiveproperty values ('filter.global.filter4.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter4.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.filterClasses.filter21', 'com.topcoder.web.forums.util.filter.VBHighlighter');
insert into jiveproperty values ('filter.filterClasses.filter10', 'com.jivesoftware.base.filter.Regex');
insert into jiveproperty values ('filter.filterClasses.filter7', 'com.jivesoftware.base.filter.QuoteFilter');
insert into jiveproperty values ('filter.filterClasses.filter14', 'com.topcoder.web.forums.util.filter.CodeHighlighter');
insert into jiveproperty values ('filter.filterClasses.filter13', 'com.topcoder.web.forums.util.filter.TCHandleTag');
insert into jiveproperty values ('filter.filterClasses.filter18', 'com.topcoder.web.forums.util.filter.PythonHighlighter');
insert into jiveproperty values ('filter.filterClasses.filter4', 'com.jivesoftware.base.filter.Profanity');
insert into jiveproperty values ('filter.filterClasses.filter0', 'com.jivesoftware.base.filter.HTMLFilter');
insert into jiveproperty values ('filter.filterClasses.filter3', 'com.jivesoftware.base.filter.URLConverter');
insert into jiveproperty values ('filter.filterClasses.filter8', 'com.jivesoftware.base.filter.Emoticon');
insert into jiveproperty values ('filter.filterClasses.filter15', 'com.topcoder.web.forums.util.filter.CPPHighlighter');
insert into jiveproperty values ('filter.filterClasses.filter20', 'com.topcoder.web.forums.util.filter.TCURLConverter');
insert into jiveproperty values ('filter.filterClasses.filter9', 'com.jivesoftware.base.filter.MSWordToText');
insert into jiveproperty values ('filter.filterClasses.filter19', 'com.topcoder.web.forums.util.filter.TCHTMLFilter');
insert into jiveproperty values ('filter.global.filter11.properties.allowedTagsString', 'annot,a,abbr,acronym,blockquote,b,br,em,font,i,img,li,ol,p,pre,s,strike,sub,sup,strong,table,td,tr,tt,u,ul');
insert into jiveproperty values ('filter.global.filter1.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.global.filter4.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.global.filter0.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter3.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.global.filter4.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter4.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter4.className', 'com.topcoder.web.forums.util.filter.VBHighlighter');
insert into jiveproperty values ('filter.global.filter2.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter5.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter1.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter2.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter0.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.filterClasses.filter16', 'com.topcoder.web.forums.util.filter.CSharpHighlighter');
insert into jiveproperty values ('filter.global.filter3.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.global.filter0.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter4.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter3.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter4.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.global.filter0.properties.applyTableSurround', 'false');
insert into jiveproperty values ('filter.global.filter11.properties.blockEnd', '</pre>');
insert into jiveproperty values ('filter.global.filter0.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.global.filter5.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter4.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter1.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter3.properties.applyTableSurround', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter3.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter2.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.global.filter2.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter3.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter0.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter9.filterTypes', '24');
insert into jiveproperty values ('filter.global.filter2.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter8.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter5.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter11.properties.disallowedKeywordsString', 'javascript');
insert into jiveproperty values ('filter.global.filter7.properties.shortenLinks', 'false');
insert into jiveproperty values ('filter.global.filter1.properties.applyTableSurround', 'false');
insert into jiveproperty values ('filter.global.filter9.properties.preformatEnabled', 'true');
insert into jiveproperty values ('filter.global.filter0.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.global.filter11.className', 'com.topcoder.web.forums.util.filter.TCHTMLFilter');
insert into jiveproperty values ('filter.global.filter2.className', 'com.topcoder.web.forums.util.filter.JavaHighlighter');
insert into jiveproperty values ('filter.global.filter1.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter3.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter4.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter1.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter2.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter3.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter7.properties.charsAfterEllipsis', '15');
insert into jiveproperty values ('filter.global.filter4.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter9.properties.underlineEnabled', 'true');
insert into jiveproperty values ('filter.global.filter4.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.global.filter1.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter6.className', 'com.topcoder.web.forums.util.filter.TCHandleTag');
insert into jiveproperty values ('filter.global.filter3.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter11.properties.maxImageWidth', '600');
insert into jiveproperty values ('filter.global.filter11.properties.disallowedTagsString', 'o:~,st1:~');
insert into jiveproperty values ('filter.global.filter1.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.className', 'com.topcoder.web.forums.util.filter.CodeHighlighter');
insert into jiveproperty values ('filter.global.filter0.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.filterClasses.filter2', 'com.jivesoftware.base.filter.TextStyle');
insert into jiveproperty values ('filter.global.filter8.properties.nobrEnabled', 'true');
insert into jiveproperty values ('filter.global.filter5.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter3.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter3.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter2.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter3.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter11.properties.stripDisallowedTags', 'false');
insert into jiveproperty values ('filter.global.filter0.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter2.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter0.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter1.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.global.filter0.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter3.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter5.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.global.filter7.properties.charsBeforeEllipsis', '25');
insert into jiveproperty values ('filter.global.filter1.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.global.filter3.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter3.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter2.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter3.className', 'com.topcoder.web.forums.util.filter.PythonHighlighter');
insert into jiveproperty values ('filter.filterClasses.filter12', 'com.jivesoftware.base.filter.XMLFilter');
insert into jiveproperty values ('filter.global.filter4.properties.reservedWordStart', '<font color="navy"><b>');
insert into jiveproperty values ('filter.global.filter1.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.global.filter4.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter2.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter5.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter4.properties.applyTableSurround', 'false');
insert into jiveproperty values ('filter.filterClasses.filter6', 'com.jivesoftware.base.filter.WordBreak');
insert into jiveproperty values ('filter.global.filter0.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.className', 'com.topcoder.web.forums.util.filter.CSharpHighlighter');
insert into jiveproperty values ('filter.global.filter0.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter0.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter4.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter1.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter3.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter9.properties.boldEnabled', 'true');
insert into jiveproperty values ('filter.global.filter4.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter7.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter3.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.global.filter4.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter1.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter0.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter2.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter7.properties.longLinkLen', '80');
insert into jiveproperty values ('filter.global.filter5.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.filterClasses.filter11', 'com.jivesoftware.forum.filter.JIRAFilter');
insert into jiveproperty values ('filter.global.filter5.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter5.properties.reservedWordEnd', '</b></font>');
insert into jiveproperty values ('filter.global.filter1.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.properties.tableBorderColor', '#999999');
insert into jiveproperty values ('filter.global.filter5.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter4.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter0.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter3.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter11.properties.restrictImageWidth', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.filterClasses.filter1', 'com.jivesoftware.base.filter.Newline');
insert into jiveproperty values ('filter.filterClasses.filter17', 'com.topcoder.web.forums.util.filter.JavaHighlighter');
insert into jiveproperty values ('filter.global.filter8.className', 'com.jivesoftware.base.filter.Newline');
insert into jiveproperty values ('filter.global.filter6.filterTypes', '16');
insert into jiveproperty values ('filter.global.filterCount', '12');
insert into jiveproperty values ('filter.global.filter5.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter1.properties.tableLinePanelBackgroundColor', '#dddddd');
insert into jiveproperty values ('filter.global.filter1.properties.showLineCount', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.properties.filterMethod', 'false');
insert into jiveproperty values ('filter.global.filter3.properties.commentStart', '<font color="darkgreen">');
insert into jiveproperty values ('filter.global.filter11.properties.blockStart', '<pre>');
insert into jiveproperty values ('filter.global.filter9.properties.italicEnabled', 'true');
insert into jiveproperty values ('filter.global.filter10.properties.imageURL', 'images/emoticons');
insert into jiveproperty values ('filter.filterClasses.filter5', 'com.jivesoftware.base.filter.JavaCodeHighlighter');
insert into jiveproperty values ('filter.global.filter7.properties.newWindowEnabled', 'true');
insert into jiveproperty values ('filter.global.filter11.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter4.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.global.filter2.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.global.filter5.properties.applyTableSurround', 'false');
insert into jiveproperty values ('filter.global.filter4.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter4.properties.bracketStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter3.properties.lineNumberColor', '#555555');
insert into jiveproperty values ('filter.global.filter11.properties.allowSymbols', 'true');
insert into jiveproperty values ('filter.global.filter5.properties.numberStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter5.properties.commentEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter0.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter5.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.filterNumber', 'false');
insert into jiveproperty values ('filter.global.filter2.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter5.properties.methodStart', '<font color="brown">');
insert into jiveproperty values ('filter.global.filter7.className', 'com.topcoder.web.forums.util.filter.TCURLConverter');
insert into jiveproperty values ('filter.global.filter3.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter4.properties.tableCodePanelBackgroundColor', '#ffffff');
insert into jiveproperty values ('filter.global.filter0.properties.stringStart', '<font color="red">');
insert into jiveproperty values ('filter.global.filter10.filterTypes', '24');
insert into jiveproperty values ('filter.global.filter0.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter11.properties.onlyFilterBlocksEnabled', 'false');
insert into jiveproperty values ('filter.global.filter5.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter1.properties.methodEnd', '</font>');
insert into jiveproperty values ('filter.global.filter0.properties.characterStart', '<font color="navy">');
insert into jiveproperty values ('filter.global.filter2.properties.characterEnd', '</font>');
insert into jiveproperty values ('filter.global.filter10.className', 'com.jivesoftware.base.filter.Emoticon');
insert into jiveproperty values ('filter.global.filter2.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.global.filter3.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter0.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.global.filter4.properties.numberEnd', '</font>');
insert into jiveproperty values ('filter.global.filter3.properties.bracketEnd', '</font>');
insert into jiveproperty values ('filter.global.filter0.properties.stringEnd', '</font>');
insert into jiveproperty values ('filter.global.filter2.properties.applyTableSurround', 'false');


delete from jivecategory where categoryid=any('{1,6,8,13,14,15,17,18,19,21,22,23250}');
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  VALUES (1, 	'Forums', '',	0	,1329774808358,	1	,23384);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  VALUES(6,'Sponsor Discussions','Our sponsors are eager to communicate with TopCoder members.  There are discussions about job openings, what it''s like to work for our sponsors, and products our sponsors have available.  If you have a question you''d like to ask our sponsors, this is the place to go.',	'1119465172180',	'1328108292599',	'22914',	'22915');
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(8,	'News Discussions',	'Any news article posted at http://www.topcoder.com/tc can be discussed here.  You will find plenty of interesting discussions on everything new at TopCoder, including features we''ve added to the website/competition arena, press releases, articles written about TopCoder and TopCoder members, and tournament information.	', 1124475999659	,1329617406059	,4,	5);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(13,	'Round Tables'	,'This is where TopCoder members can go to discuss the details of Algorithm, Design, and Development Competitions.  You will also find a forum for giving feedback and suggestions, as well as pointing out any bugs you may have found.  Other topics include plugins for the competition arena and TopCoder''s business strategy.',	1124901972333,	1329772990486	,2,	3);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(14	,'Algorithm Matches', 	'Have a question about a problem solution from the Match Editorials? Anything exciting happened during a match that you can''t wait to talk about? Discuss anything about a particular SRM or Tournament Round here.',	1126043632657,	1329762711379,	6,	7);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(15, 'Internal Forums', null, 1130179671608,	 1316438993744	,22918	,22919);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(17,	'Marathon Matches','Discuss Marathon Matches.', 1134663268239,1329774808358, 	8,	9);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(18,	'College Tour',	null,	1136572584080,	1229162839340,	22916,	22917);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(19,'Assembly Contests','Discuss Assembly Contests.  Create competition teams here.',	1142431136970	,1288158371672	,22921,	22922);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(21,	'High School Matches',	'Discuss High School Matches.',	1149260523691,	1314890188427,	22912,	22913);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(22,	'Software Forums',	null	,1170979211601,	1329774211851	,12,	22909);
  insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(23250,	'Design Forums',	null	,1401291440837,	1401291440837	, 45290,	45291);

delete from jiveforum where forumid=any('{7126,7166,7167,148126,205768,244237,327735,440104,505803,506048,525532,532159,532159,534409,534410,544456}');
insert into jiveforum
  values( 7126	,'Evolving Strategy',	'evolving_strategy',	'Discuss TopCoder''s business model and direction.',	1	,1,	975607958957	,1325625553678,	13	,0	,1557);
insert into jiveforum
  values(7166	,'Bugs, Suggestions and General Feedback',	'bugs__suggestions_and_general_feedback','Report bugs, request enhancements, provide general feedback on existing functionality.  This includes TopCoder''s website as well as the algorithm arena.',	1,	1,	976743253048	,1329646908073	,13	,1,	19943);
insert into jiveforum
  values(7167,	'TopCoder Algorithm Competitions',	'algorithm_competition_discussion'	,'Discuss topics pertaining to TopCoder''s Single Round Matches (SRMs), such as strategy and competition formats.',	1	,1,	976743575856,	1329749809019,	13,	2,	42106);
insert into jiveforum
  values(148126,	'TopCoder Arena Plugins Discussion',	'topcoder_arena_plugins_discussion',	'Discuss the arena plug-ins for the algorithm competitions.  Get support, announce a new plug-in, or request a new feature.',	1,	1	,1024073650458	,1329689854142	,13,	3,	2525);
insert into jiveforum
  values(205768,	'Software Competition Discussion',	'component_competition_discussion',	'Discuss software competitions, specifications, reviews, submissions, and development tools.',	1,	1,	1066936685515,	1329749335658	,13,	4	,43036);
insert into jiveforum
  values(244237,	'General Discussion'	,'general_discussion',	'Discuss anything "TopCoder" that doesn''t fit into the other categories.',  	1	,1	,1079032994392	,1329740824930	,13,	5,	46072);
insert into jiveforum
  values(327735,	'Getting Started in TopCoder Competitions',	'getting_started	','Check here for help and advice on getting started as a TopCoder competitor.',	1	,1	,1086986284762,	1329011431892,	13,	6,	2559);
insert into jiveforum
  values(440104,	'General Employment Discussion',	'employment_discussion',	'A place to get useful advice on your career direction and choices.',	1,	1,	1107901125756,	1324382288679,	13,	7,	1651);
insert into jiveforum
  values(505803,	'Educational Discussion',	'round_tables.educational_discussion',	'Get helpful advice and become a better programmer.',	1,	1,	1128089041236,	1329751446712,	13,	8,	33057);
insert into jiveforum
  values(506048,	'Marathon Match Discussion',	'round_tables.marathon_match_discussion',	'Discuss topics pertaining to TopCoder''s Marathon Matches, such as strategy and competition formats.',	1	,1,	1149268170838	,1329600165882	,13,	9,	2459);
insert into jiveforum
  values(525532,	'Bug Races',	'round_tables.bug_races',	'Announcements and Discussions about TopCoder Bug Races',	1,	1,	1233340408420	,1329266239309	,13,	10,	269);
insert into jiveforum
  values(532159,	'External Competitions',	'round_tables.external_competitions',	'A place to discuss non-TopCoder software or algorithmic competitions and related events.  Remember, there will be no spamming or advertising by commercial entities permitted in the TopCoder forums.',	1	,1	,1258042419038	,1329772990486,	13,	11,	6151);
insert into jiveforum
  values(534409,	'TopCoder Prototype Competitions' , 'round_tables.topcoder_prototype_competitions',	'Discuss Prototype Competitions, HTML, CSS, JavaScript, Browsers, Contest Specifications and Reviews.', 	1	,1	,1268408197442	,1323892569184	,13,	12,	198);
insert into jiveforum
  values(534410	,'TopCoder RIA Competitions', 'round_tables.topcoder_ria_competitions',	'Discuss Rich Internet Applications, Flash, Flex, Contest Specifications and Reviews.',
	1	,1,	1268408217427,	1320138445875,	13,	13,	36);
insert into jiveforum
    values(544456,	'Copilot Discussion'	,'round_tables.copilot_discussion',	'Announcements and Discussions of the copilot work',	1	,1	,1305958287478	,1329510770796,	13	,14	,158);

delete from jiveuserperm where objectid=-1 and userid=100129 and permissiontype=1 and permission=59 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=100129 and permissiontype=1 and permission=59 limit 1);
insert into jiveuserperm values (17,-1,100129,1,59);
delete from jiveuserperm where objectid=-1 and userid=132458 and permissiontype=1 and permission=59 and objecttype in (select objecttype from jiveuserperm where  objecttype=17 and objectid=-1 and userid=132458 and permissiontype=1 and permission=59 limit 1);
insert into jiveuserperm values (17,-1,132458,1,59);

delete from jivecategoryprop where categoryid=any('{1,15,18,19}') and name='showEmptyForumsOnMain';
delete from jivecategoryprop where categoryid=any('{6,8,14,17,21,22,23250,13}') and name=any(Array['showEmptyForumsOnMain','leftNavName']);
delete from jivecategoryprop where categoryid=13 and name='leftNavName';
insert into jivecategoryprop values (1,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (6,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (6,'leftNavName', 'Sponsor Discussions');
insert into jivecategoryprop values (8,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (8,'leftNavName', 'News Discussions');
insert into jivecategoryprop values (13,'leftNavName', 'Round Tables');
insert into jivecategoryprop values (13,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (14,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (14,'leftNavName', 'Algorithm Matches');
insert into jivecategoryprop values (15,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (17,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (17,'leftNavName', 'Marathon Matches');
insert into jivecategoryprop values (18,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (19,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values(21,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (21,'leftNavName', 'High School Matches');
insert into jivecategoryprop values(22,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (22,'leftNavName', 'Software Forums');
insert into jivecategoryprop values(23250,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (23250,'leftNavName', 'Design Forums');

delete from jivegroup where groupid=6;
insert into jivegroup values (6, 'Software Admins', 'Software Admins', 1170993541468, 1332771806201);
