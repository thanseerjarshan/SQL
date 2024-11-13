"""
Given a Weather table, write a SQL query to find all dates' Ids with higher
temperature compared to its previous (yesterday's) dates.
"""



CREATE TABLE WeatherRecords (
    Id INT PRIMARY KEY,
    RecordDate DATE,
    Temperature INT
);

INSERT INTO WeatherRecords (Id, RecordDate, Temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);


select * from WeatherRecords;

select w1.Id
from WeatherRecords w1, WeatherRecords w2
where  DATEDIFF(day,w2.RecordDate,w1.RecordDate) = 1
and w1.Temperature > w2.Temperature;