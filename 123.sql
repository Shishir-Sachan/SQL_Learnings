CREATE VIEW v_department AS
SELECT 
DISTINCT department , YEAR(GETDATE()) y, MONTH(GETDATE()) m,DAY(GETDATE()) d
FROM employees

