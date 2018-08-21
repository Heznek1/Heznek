select *
from users
where averageDegree > 80


CREATE PROC person_info @firstname nvarchar(20) @lastname nvarchar(20) AS
SELECT id, datediff(year, dateOfBirth, getdate())
FROM user
WHERE name = @firstname and surName = @lastname


EXECUTE person _info ‘Elinor’ ‘Azran’
