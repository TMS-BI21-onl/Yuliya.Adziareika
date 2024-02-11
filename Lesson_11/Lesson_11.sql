CREATE TABLE FunctionStatistics (
    Function_name NVARCHAR(50) UNIQUE,
    Function_count INT NOT NULL
);

MERGE INTO FunctionStatistics AS target
  USING (
    SELECT Function_name, COUNT(*) Function_count
    FROM (
        SELECT Alex AS Function_name FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Carlos FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Charles FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Daniel FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Esteban FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Fred FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT George FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Lando FROM [AdventureWorks2017].[dbo].[data_for_merge]
    UNION ALL
        SELECT Lewis FROM [AdventureWorks2017].[dbo].[data_for_merge]
    ) AS merged_data
    GROUP BY Function_name
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);