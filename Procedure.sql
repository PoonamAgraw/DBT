/*DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1()
BEGIN
SELECT "HELLO WROLD";
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1()
BEGIN
DECLARE X INT DEFAULT 100;
DECLARE Y INT;
SET Y := 200;
SELECT X + Y;
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1(X INT , Y INT)
BEGIN
SELECT X + Y;
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1(X INT , Y INT ,OUT Z INT)
BEGIN
SET Z := X + Y;
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1()
BEGIN
INSERT INTO DEPT VALUES(8,'ABC','BARODA','XYZ','24-03-1989');
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS PRO1;
DELIMITER $
CREATE PROCEDURE PRO1(P_DNAME VARCHAR(20), P_LOC VARCHAR(20), P_PWD VARCHAR(20), P_STARTEDON VARCHAR(20))
BEGIN
DECLARE V_DEPTNO INT DEFAULT 0;
SELECT MAX(DEPTNO) + 1 INTO V_DEPTNO FROM DEPT;
INSERT INTO DEPT VALUES(V_DEPTNO,P_DNAME , P_LOC, P_PWD, P_STARTEDON );
SELECT  "Record inserted ....." A S MESSAGE;
END $
DELIMITER ;

drop procedure if exists pro1;
delimiter $
create procedure pro1(p_dname varchar(20), p_loc varchar(20), p_pwd varchar(20), p_STARTEDON varchar(20) )
BEGIN
	declare v_deptno int default 0;
	select max(deptno) + 1 into v_deptno from dept;
	insert into dept values(v_deptno, upper(p_dname),  upper(p_loc) , p_pwd, p_STARTEDON);
	select  "Record inserted ....." as Message;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	declare exit handler for sqlexception
	BEGIN
	    ROLLBACK;
		SELECT 'Transaction failed. Rolled back.' AS message;
	end;
	Start Transaction Read Write;

	insert into a1 values(2);
	insert into a2 values(2);
	commit;
	
end $
delimiter ;

drop function if exists fn1;
delimiter $
create function fn1() returns varchar(20)
DETERMINISTIC
b1:BEGIN
	declare x varchar(20);
   select 'Hello World' into x;
   set @a := x;
   return x;
end b1$
delimiter ;

drop function if exists fn1;
delimiter $
create function fn1(x int , y int) returns int
DETERMINISTIC
b1:BEGIN
   return x+y;
end b1$
delimiter ;


drop function if exists fn1;
delimiter $
create function fn1(x int , y int) returns int
DETERMINISTIC
b1:BEGIN
   return ifnull(x,0)+ifnull(y,0);
end b1$
delimiter ;

drop function if exists fn1;
delimiter $
create function fn1() returns int
DETERMINISTIC
BEGIN
	declare v_deptno int default 0;
	select max(deptno) + 1 into v_deptno from dept;	
	return v_deptno;
end $
delimiter ;

DROP FUNCTION IF EXISTS fn1;
 delimiter $
 CREATE FUNCTION fn1() RETURNS INT
 DETERMINISTIC
 begin
 return CONCAT(UPPER(LEFT(x,1)), SUBSTR(LOWER(x), 2 ));
 end $
 delimiter ;

DROP FUNCTION IF EXISTS fn1;
 delimiter $
 CREATE FUNCTION fn1() RETURNS VARCHAR(40)
 deterministic
 begin
 declare x, y, z VARCHAR(40) default "";
 declare cnt INT default 1;
 lbl:loop
 SELECT CAST(CHAR(FLOOR(65 + RAND() * 27)) as CHAR) INTO y;
 SELECT CAST(CHAR(FLOOR( 97 + RAND() * 27)) as CHAR) INTO z;
 SET x := CONCAT(x, y, z);
 if cnt > 2 then
 leave lbl;
 end if;
 SET cnt := cnt + 1;
 end loop lbl;
 return(x);
 end $
 delimiter ;


DROP FUNCTION IF EXISTS fn1;
 delimiter $$
 CREATE FUNCTION fn1(xx INT) RETURNS VARCHAR(50)
 DETERMINISTIC
 begin
 declare x BOOL;
 SELECT True INTO x FROM emp WHERE empno = xx;
 if x then
 return (SELECT CONCAT(ename, " ", job, " ", sal) FROM emp WHERE empno = xx);
 else
 return "deptno is not valid";
 end if; 
end $$
 delimiter ;


DROP TRIGGER IF EXISTS tr1;
 delimiter $
 CREATE TRIGGER tr1 after INSERT ON dept FOR EACH ROW
 begin
 SELECT 'Hello World' into @x;  
 end $
 delimiter ;
 
 
 
 drop trigger if exists tr1;
 delimiter $
 create trigger tr1 before insert on d for each row 
	begin 
	if new.c2 <> 'baroda' then
	signal sqlstate '45000' set message_text = 'Invalid city';
	end if;
end $
delimiter ;*/

 drop trigger if exists tr1
 delimiter $
 create trigger tr1 update on d for each row 
 begin	
	insert into d_history values(old.c2);
end $
delimiter ;

 