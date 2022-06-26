
--Exercise 1
/* Create a function that returns summary information about given Series No and Episode No.*/
CREATE FUNCTION 
	tblEpisode3 (@Seriesno INT, @Episodeno INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		* 
	FROM 
		tblEpisode 
	WHERE 
		SeriesNumber = @Seriesno and EpisodeNumber = @Episodeno
)

SELECT * FROM tblEpisode3(2,1)

/* Show the number of episodes whose title contain the words “on” and “ol” Using CTE */
WITH 
	Episode(title) 
AS
	(SELECT title FROM dbo.tblEpisode
WHERE 
	title LIKE '%on%' AND title LIKE '%ol%')
SELECT 
	COUNT(*) 
AS
	[number of episodes]
FROM 
	Episode;
	
/* Create a stored procedure, which will output a comma-delimited list of the Doctors who have done 15 or more episodes */
CREATE PROCEDURE list_of_Doctors
AS
BEGIN
SELECT 
	DoctorNumber,
	COUNT(DoctorName),
	STRING_AGG(DoctorName, ',') 
	WITHIN GROUP(ORDER BY DoctorName) AS doc_list
FROM
	dbo.tblEpisode te
LEFT JOIN tblDoctor td 
ON 
	te.DoctorId = td.DoctorId
GROUP BY
	DoctorNumber
Having
	COUNT(DoctorName) >= 15;
END;

EXECUTE list_of_Doctors;

/*Generate a new column called NumberEnemies(DataType = INT) in the tblEpisode table */
ALTER TABLE 
	dbo.tblEpisode
ADD COLUMN 
	NumberEnemies INT;

/*Write an update query which will set NumberEnemies column to equal the number of enemies for each episode (but within a transaction), 
then: Roll back this transaction if more than 100 rows are affected (displaying a suitable message, as shown below); 
or Commit it otherwise and show a list of all of the episodes, including the newly populated field.*/
select * from dbo.tblEpisode

BEGIN TRAN
DECLARE @rowId INT 
 UPDATE 
	dbo.tblEpisode 
SET 
	NumberEnemies = (
						SELECT
							COUNT(*)
						FROM
							tblEpisodeEnemy AS ee
						WHERE
							ee.EpisodeId = te.EpisodeId
					)
FROM
tblEpisode AS te 
SET 
	@rowId = @@ROWCOUNT
IF @rowId > 100
BEGIN
	ROLLBACK TRAN		
END
	ELSE 
BEGIN
	COMMIT TRAN
END

--Exercise 2
--1 
SELECT 
	Payment_date, 
	SumAmt,
	SUM(SumAmt) OVER(ORDER BY payment_date) AS Cumulative_sum 
FROM
	(
	SELECT 
		Payment_Date, 
		SUM(Amount) AS 'SumAmt' 
	FROM 
		dbo.Payment 
	GROUP BY 
		Payment_date
	)A

--Exercise 4
--1
SELECT 
	PersonID, 
	COUNT(PersonID) AS no_of_friends, 
	SUM(Score) AS sum_of_scores
FROM 
		(
		SELECT 
			f.PersonID,
			f.FriendID,
			p.Score
		FROM 
			dbo.person2 p
			INNER JOIN 
			dbo.friend f
				ON f.FriendID = p.PersonID
		) 
AS 
	bk 
GROUP BY 
	PersonID
HAVING 
	SUM(Score) > 100;

--2
SELECT DISTINCT 
	t.[Name],
	COUNT([FLOOR]) AS No_of_Entries,
	(
		SELECT TOP 1 f.[floor]
		FROM dbo.entries f
		WHERE 
			f.[name]=t.[name]
		GROUP BY 
			f.[floor]
		ORDER BY COUNT(*) DESC
	) AS [Floor],
		(
			SELECT 
				STRING_AGG(Resources,',') WITHIN GROUP(ORDER BY Resources ASC) 
				from
				(
					SELECT DISTINCT 
						u.Resources 
					FROM 
						dbo.entries u 
					WHERE 
						t.[name]=u.[name])t) AS 'Resources'
FROM 
	dbo.entries t

GROUP BY 
	t.[name]

--3
SELECT 
	MAX([NaMe]) AS [Name] 
FROM 
	(
	SELECT SUM(strength) AS strnght, 
	STRING_AGG([name], ',') AS [NaMe] 
	FROM 
		(
		SELECT 
			[name], 
			strength, 
			bh.id, 
			bh.[zone] 
		FROM 
			(
				SELECT 
					d.id, 
					STRING_AGG([zone], ',') AS [zone] 
				FROM dbo.details d 
				GROUP BY 
					d.id
			)  
		AS 
			bh inner join dbo.animals on animals.id = bh.id) AS pk 
		GROUP BY 
			[zone]
)
a

--4
SELECT 
CASE WHEN t.id is null THEN s.id
	WHEN s.id is null THEN t.id
	WHEN (s.id=t.id and s.[name] <> t.[name]) THEN s.id
END AS ID
	,CASE WHEN t.id is null THEN 'New in source'
	WHEN s.id is null THEN 'New in target'
	 WHEN (s.id=t.id and s.[name] <> t.[name]) THEN 'Mismatch'
END AS Comment
FROM dbo.source_tbl s
FULL join dbo.target_tbl t on t.id=s.id
WHERE t.id is null
or s.id is null
or (s.id=t.id and s.[name] <> t.[name]);

--write a sql query such that each team play with every other team just once
WITH matches AS
	(SELECT 
		row_number() over(order by team_name) AS id, t.*
	FROM 
		dbo.teams t)
SELECT 
	team.team_name 
AS 
	team, opponent.team_name AS opponent
FROM 
	matches team
JOIN 
	matches opponent 
ON 
	team.id > opponent.id
ORDER BY 
	team;

--write a query such that each team plays with every other team twic
WITH matches AS
	(SELECT 
		ROW_NUMBER() over(order by team_name) AS id, t.*
	FROM 
		dbo.teams t)
SELECT 
	team.team_name 
AS 
	team, opponent.team_name AS opponent
FROM 
	matches[team]
JOIN 
	matches[opponent] 
ON 
	team.id<>opponent.id
ORDER BY 
	team;



		

