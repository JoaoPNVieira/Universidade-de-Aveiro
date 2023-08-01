# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used						 | Index Op.               | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :---------						 | :-------------------    | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 18        | WorkOrderID (PK)					 | Clustered Index Scan    |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  | 1     | 0.0033| 26         | 0         | WorkOrderID (PK)					 | Clustered Index Seek    |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               | 11    | 0.0033| 26         | 0         | WorkOrderID (PK)					 | Clustered Index Seek    |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   | 72591 | 0.473 | 556        | 19        | WorkOrderID (PK)					 | Clustered Index Seek	   |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          | 72591 | 0.473 | 1743       | 7         | WorkOrderID (PK)					 | Clustered Index Scan	   |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   | 9     | 0.0340| 46         | 2         | ProductID						 | Key Lookup (Clustered)  |			|
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              | 9     | 0.0340| 46         | 2         | ProductID Covered (StartDate)     | Key Lookup (Clustered)  |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              | 1105  | 0.393 | 556        | 7         | ProductID Covered (StartDate)     | Clustered Index Scan    |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            | 1     | 0.393 | 558        | 7         | ProductID Covered (StartDate)     | Clustered Index Scan    |            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' | 1     | 0.393 | 558        | 7         | ProductID and StartDate           | Clustered Index Scan    |            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' | 1     | 0.393 | 558        | 6         |  Composite (ProductID, StartDate) | Clustered Index Scan    |            |

## ​8.2.

```
DBCC FREEPROCCACHE; 
DBCC DROPCLEANBUFFERS; 
GO
DROP TABLE IF EXISTS mytemp;
GO
CREATE TABLE mytemp (       
rid  BIGINT /*IDENTITY (1, 1)*/ NOT NULL,
at1  INT NULL,   
at2  INT NULL,   
at3	 INT NULL,   
lixo varchar(100) NULL 
);
CREATE CLUSTERED INDEX rid ON mytemp(rid);
GO
-- Record the Start Time 
DECLARE @start_time DATETIME, @end_time DATETIME; 
SET @start_time = GETDATE(); 
PRINT @start_time 

-- Generate random records 
DECLARE @val as int = 1; 
DECLARE @nelem as int = 50000;  

SET nocount ON   

WHILE @val <= @nelem 
BEGIN     
	DBCC DROPCLEANBUFFERS;    -- need to be sysadmin      
	INSERT mytemp (rid, at1, at2, at3, lixo)  
	SELECT cast((RAND()*@nelem*40000) as int),  cast((RAND()*@nelem) as int),       
		cast((RAND()*@nelem) as int),  cast((RAND()*@nelem) as int),      
		'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';     
	SET @val = @val + 1;      
END       

PRINT 'Inserted ' + str(@nelem) + ' total records'       

-- Duration of Insertion Process      
SET @end_time = GETDATE(); 
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));
```

## ​8.3.

```
i) 
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Ssn - unique clustered index																				  |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Pnumber - unique clustered index																			  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

ii)
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Fname, Lname - composite clustered index																      |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Pnumber - unique clustered index																			  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

iii)
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Dno - clustered index				    																  |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Pnumber - unique clustered index																			  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

iv)
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Ssn - unique clustered index																				  |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Pnumber - unique clustered index																			  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

v) 
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Ssn - unique clustered index																				  |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Pnumber - unique clustered index																			  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

vi)
| Table          | Index                                                                                                      | 
| :---           | :--------------------------------------------------------------------------------------------------------- | 
| EMPLOYEE       | Ssn - unique clustered index																				  |
| DEPARTMENT     | Dnumber - unique clustered index																			  |
| DEPT_LOCATIONS | Dnumber, Dlocation - composite clustered index; Dlocation, Dnumber - composite non-clustered index		  |
| PROJECT		 | Dnum - clustered index; Pnumber - unique non-clustered index																		  |
| WORKS_ON       | Essn, Pno - composite clustered index																      |
| DEPENDENT      | Essn, Dependent_name - composite clustered index                                                           |

```
