load data infile '/var/lib/mysql-files/lil.csv' into table lilheaders fields terminated by ',';
load data infile '/var/lib/mysql-files/ab2.csv' into table ab2headers fields terminated by ',';
load data infile '/var/lib/mysql-files/big.csv' into table bigheaders fields terminated by ',';
describe  bigheaders;
SELECT * from lilheaders;
delete from lilheaders limit 1;
ALTER TABLE bigheaders1 CHANGE COLUMN country country1 text;
create table bigheaders1 like bigheaders;
INSERT INTO bigheaders1 SELECT * FROM bigheaders;
create table lilheaders1 like lilheaders;
INSERT INTO lilheaders1 SELECT * FROM lilheaders;
UPDATE `lilheaders1` SET `country` = TRIM(BOTH '"' FROM `country`);
select * from bigheaders1 left join lilheaders1 on bigheaders1.country = lilheaders1.country;
create table biglil AS select * from bigheaders1 left join lilheaders1 on bigheaders1.country1 = lilheaders1.country;
create table bigliloneday as SELECT * FROM biglil where date like '%2020-03-13%';

  

describe bigliloneday;
select * from bigliloneday;
select * from bigheaders;
select * from lilheaders1;
select * from biglil;
