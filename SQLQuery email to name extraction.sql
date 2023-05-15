SELECT LEFT (
		'shishir.sachan710@gmail.com',
	CHARINDEX('.',
	SUBSTRING('shishir.sachan710@gmail.com',1,14)
	)-1
	) AS first_name
	, 
	+
	--RIGHT(
	--'shishir.sachan710@gmail.com',
	--CHARINDEX('.',
	--SUBSTRING('shishir.sachan710@gmail.com',1,14)
	--)
	--)


	-- SELECT 
RIGHT (SUBSTRING('shishir.sachan710@gmail.com',1,14),CHARINDEX('.', 'shishir.sachan710@gmail.com')-2 ) as last_name