-- Generates a SQL script that will drop all databases (except system ones) on the current server.

DECLARE @name nvarchar(255)

DECLARE db CURSOR FOR 
SELECT Name FROM sysdatabases
WHERE Name NOT IN ('master', 'tempdb', 'model', 'msdb')

OPEN db;

FETCH NEXT FROM db 
INTO @name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'DROP DATABASE "' + @name + '"'
    PRINT 'GO'
    
    FETCH NEXT FROM db 
    INTO @name

END
CLOSE db;
DEALLOCATE db;