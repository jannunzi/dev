-- 1. (5pts) Create Productivity applications: Keynote, Pages, Outlook, Word, PowerPoint, and Numbers
-- create base instances
insert into application(id,name,created,category) values (1,'Keynote','2014-02-01','PRODUCTIVITY');
insert into application(id,name,created,category) values (2,'Pages','2014-02-24','PRODUCTIVITY');
insert into application(id,name,created,category) values (3,'Outlook','2014-02-24','PRODUCTIVITY');
insert into application(id,name,created,category) values (4,'Word','2014-02-24','PRODUCTIVITY');
insert into application(id,name,created,category) values (5,'PowerPoint','2014-02-24','PRODUCTIVITY');
insert into application(id,name,created,category) values (6,'Numbers','2014-02-24','PRODUCTIVITY');
-- create derived instances
insert into webapplication(id,url,price,subscribers,browser) values (1,'keynote.com',12.23,123,'safari');
insert into webapplication(id,url,price,subscribers,browser) values (2,'pages.com',23.32,234,'chrome');
insert into webapplication(id,url,price,subscribers,browser) values (3,'outlook.com',21.32,221,'firefox');
insert into webapplication(id,url,price,subscribers,browser) values (4,'word.com',32.23,322,'ie');
insert into webapplication(id,url,price,subscribers,browser) values (5,'powerpoint.com',43.34,323,'safari');
insert into webapplication(id,url,price,subscribers,browser) values (6,'numbers.com',11.22,3232,'chrome');

-- 2. (5pts) Create Game applications: Minecraft, Asteroids, Space Invaders, Galaga, and Centipide
-- create base instances
insert into application(id,name,created,category) values (8,'Minecraft','2014-02-24','GAMES');
insert into application(id,name,created,category) values (9,'Asteroids','2014-02-24','GAMES');
insert into application(id,name,created,category) values (10,'Space Invaders','2014-02-24','GAMES');
insert into application(id,name,created,category) values (11,'Galaga','2014-01-24','GAMES');
insert into application(id,name,created,category) values (12,'Centipide','2014-03-24','GAMES');
-- create derived instances
insert into webapplication(id,url,price,subscribers,browser) values (8,'minecraft.com',21.21,3212,'firefox');
insert into webapplication(id,url,price,subscribers,browser) values (9,'asteroids.com',32.43,444,'ie');
insert into webapplication(id,url,price,subscribers,browser) values (10,'space.com',44.55,567,'safari');
insert into webapplication(id,url,price,subscribers,browser) values (11,'galaga.com',65.65,323,'chrome');
insert into webapplication(id,url,price,subscribers,browser) values (12,'centipide.com',324.33,654,'firefox');

-- 3. (10pts) Create the following Developers with the following roles in the specified Application categories:
-- <First Name> <Last Name>, <Role>, <Application Category>
-- Alice Wonderland, Architect, Games
-- Bob Marley, User Experience, Games
-- Charly Garcia, Developer, Games
-- Frank Herbert, Project Manager, Productivity
-- Gregory Peck, Product Manager, Games
-- Edward Norton, User Experience, Productivity

-- Create Developers
insert into developer(id,firstName,lastName) values (1,'Alice','Wonderland');
insert into developer(id,firstName,lastName) values (2,'Bob','Marley');
insert into developer(id,firstName,lastName) values (3,'Charley','Garcia');
insert into developer(id,firstName,lastName) values (4,'Frank','Herbert');
insert into developer(id,firstName,lastName) values (5,'Gregory','Peck');
insert into developer(id,firstName,lastName) values (6,'Edward','Norton');

-- Alice Wonderland, Architect, Games
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'ARCHITECT' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Alice'
AND d.lastName = 'Wonderland'
AND a.category = 'GAMES';

-- Bob Marley, User Experience, Games
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'USER EXPERIENCE' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Bob'
AND d.lastName = 'Marley'
AND a.category = 'GAMES';

-- Charly Garcia, Developer, Games
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'DEVELOPER' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Charley'
AND d.lastName = 'Garcia'
AND a.category = 'GAMES';

-- Frank Herbert, Project Manager, Productivity
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'PROJECT MANAGER' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Frank'
AND d.lastName = 'Herbert'
AND a.category = 'PRODUCTIVITY';

-- Gregory Peck, Product Manager, Games
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'PRODUCT MANAGER' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Gregory'
AND d.lastName = 'Peck'
AND a.category = 'GAMES';

-- Edward Norton, User Experience, Productivity
INSERT INTO role (id,applicationId,developerId,roleType)
SELECT NULL AS ID,a.id AS applicationId,
  d.id AS developerId,'USER EXPERIENCE' AS roleType
FROM DEVELOPER d, APPLICATION a
WHERE d.firstName = 'Edward'
AND d.lastName = 'Norton'
AND a.category = 'PRODUCTIVITY';

-- 4. (10pts) Give the following developers the privileges listed below
-- <First Name> <Last Name>, <Privilege>, <Application>, <Asset> 
-- Charley Garcia, All, Centipede, Views
-- Edward Norton, Update, Outlook, Scripts

delete from privilege;

-- Charley Garcia, All, Centipede, Views
insert into privilege (applicationId,developerId,privilege,assetType)
SELECT app.id  AS  applicationId,dev.id  AS  developerId,
	'ALL'   AS  privilege,'VIEW'  AS  assetType
FROM APPLICATION app, DEVELOPER dev, ASSET ast, ROLE role
WHERE dev.firstName = 'Charley'
AND   dev.lastName  = 'Garcia'
AND   role.developerId   = dev.id
AND   role.applicationId = app.id
AND   app.name           = 'Centipide'
AND   ast.applicationId  = app.id
AND   ast.assetType      = 'VIEW';

-- Edward Norton, Update, Outlook, Scripts
insert into privilege (applicationId,developerId,privilege,assetType)
SELECT app.id  AS  applicationId,dev.id  AS  developerId,
	'UPDATE'   AS  privilege,'SCRIPT'  AS  assetType
FROM APPLICATION app, DEVELOPER dev, ASSET ast, ROLE role
WHERE dev.firstName = 'Edward'
AND   dev.lastName  = 'Norton'
AND   role.developerId   = dev.id
AND   role.applicationId = app.id
AND   app.name           = 'Outlook'
AND   ast.applicationId  = app.id
AND   ast.assetType      = 'SCRIPT';


-- 5. (10pts) Change Frank Herbert's role as a Project Manager to Product Manager of all his applications

CREATE VIEW FRANKS_ROLE AS
SELECT d.firstName, d.lastName, a.name, r.roleType
FROM ROLE r, DEVELOPER d, APPLICATION a
WHERE r.developerId = d.id
AND   r.roleType = 'PROJECT MANAGER'
AND   r.applicationId = a.id;

UPDATE FRANKS_ROLE SET roleType = 'PRODUCT MANAGER';

-- 6. (10pts) Promote Gregory Peck's role to Director of all Web Applications

CREATE VIEW WEBAPP_ROLES AS
SELECT app.name, r.roleType
FROM APPLICATION app, WEBAPPLICATION webapp, ROLE r
WHERE app.id = webapp.id
AND   r.applicationId = app.id;

UPDATE WEBAPP_ROLES SET roleType = 'DIRECTOR';

-- 7. (10pts) Revoke Edward Norton’s Update privileges on Scripts on Productivity application Outlook


-- 10. (10pts) List all views of Web applications that had a decline in sales of at least 10%
--      from the previous month for each Product Manager

-- THIS MONTH
select a.name, d.firstName, app.name, s.sold, s.quantity, wapp.price, s.quantity * wapp.price AS GROSS
from developer d, role r, sales s, application app, webapplication wapp, asset a
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and app.id = a.applicationId
and a.assetType = 'VIEW'
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date)
and extract(year FROM s.sold) = extract(year FROM current_date);

-- LAST MONTH
select a.name, d.firstName, app.name, s.sold, s.quantity, wapp.price, s.quantity * wapp.price AS GROSS
from developer d, role r, sales s, application app, webapplication wapp, asset a
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and app.id = a.applicationId
and a.assetType = 'VIEW'
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date) - 1
and extract(year FROM s.sold) = extract(year FROM current_date);

-- first identify the applications and then we can list the views
-- gross income for this month
select d.firstName, app.name, s.sold, s.quantity, wapp.price,
		s.quantity * wapp.price AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date)
and extract(year FROM s.sold) = extract(year FROM current_date);

-- gross income for last month
select d.firstName, app.name, s.sold, s.quantity, wapp.price,
		s.quantity * wapp.price AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date) - 1
and extract(year FROM s.sold) = extract(year FROM current_date);

-- aggregate income
-- gross income for this month
select app.id as webAppId, sum(s.quantity * wapp.price) AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date)
and extract(year FROM s.sold) = extract(year FROM current_date)
group by app.id;

-- gross income for last month
select app.id as webAppId, sum(s.quantity * wapp.price) AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date) - 1
and extract(year FROM s.sold) = extract(year FROM current_date)
group by app.id;

-- views for this month
create view gross_this_month as
select app.id as webAppId, sum(s.quantity * wapp.price) AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date)
and extract(year FROM s.sold) = extract(year FROM current_date)
group by app.id;

-- views for last month
create view gross_last_month as
select app.id as webAppId, sum(s.quantity * wapp.price) AS GROSS
from developer d, role r, sales s, application app, webapplication wapp
where
    d.id = r.developerId
and r.roleType = 'PRODUCT MANAGER'
and r.applicationId = app.id
and app.id = wapp.id
and d.id = s.developerId
and s.applicationId = app.id
and extract(month FROM s.sold) = extract(month FROM current_date) - 1
and extract(year FROM s.sold) = extract(year FROM current_date)
group by app.id;

-- 10%
select a.name, l.webAppId, l.GROSS as lgross, t.GROSS as tgross, abs((l.GROSS - t.gross)/l.GROSS) as diff
from gross_last_month l, gross_this_month t, asset a
where l.webAppId = t.webAppId
and   abs((l.GROSS - t.gross)/l.GROSS) > 0.1
and   a.assetType = 'VIEW'
and   a.applicationId = l.webAppId



-- 12. (10pts) Which developer sold most mobile applications this month?

SELECT d.firstName, sum(s.quantity) as q
FROM application app, mobileapplication mapp, sales s, developer d, role r
WHERE app.id = mapp.id
and   r.applicationId = app.id
and   r.developerId = d.id
AND   s.applicationId = app.id
and   extract(MONTH from CURRENT_DATE()) = extract(MONTH from s.sold)
and   extract(year from CURRENT_DATE()) = extract(year from s.sold)
group by d.firstName
order by q desc
limit 0,1;