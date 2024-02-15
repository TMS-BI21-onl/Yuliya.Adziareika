CREATE TABLE FunctionStatistics (
    Function_name NVARCHAR(50) UNIQUE,
    Function_count INT NOT NULL
);
    
MERGE INTO FunctionStatistics AS target
USING (
    SELECT Alex Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Alex IS NOT NULL
     GROUP BY Alex
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Carlos Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Carlos IS NOT NULL
     GROUP BY Carlos
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);
    
MERGE INTO FunctionStatistics AS target
USING (
    SELECT Charles Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Charles IS NOT NULL
     GROUP BY Charles
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Daniel Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Daniel IS NOT NULL
     GROUP BY Daniel
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Esteban Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Esteban IS NOT NULL
     GROUP BY Esteban
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Fred Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Fred IS NOT NULL
     GROUP BY Fred
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT George Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE George IS NOT NULL
     GROUP BY George
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Lando Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Lando IS NOT NULL
     GROUP BY Lando
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

MERGE INTO FunctionStatistics AS target
USING (
    SELECT Lewis Function_name, COUNT(*) Function_count
      FROM [AdventureWorks2017].[dbo].[data_for_merge]
     WHERE Lewis IS NOT NULL
     GROUP BY Lewis
) AS source ON target.Function_name = source.Function_name
WHEN MATCHED THEN
    UPDATE SET target.Function_count = target.Function_count + source.Function_count
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Function_name, Function_count)
    VALUES (source.Function_name, source.Function_count);

