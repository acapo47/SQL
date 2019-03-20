1.18 - SQL is an internationally recognized database language used by all commercial DBMS’s. 
>      This is an important standard because it allows for companies to work with each other on cross platforms with this language. 
>      It is a strict code and can only be used for database purposes; making it reliable and secure. 
1.19 - DBMS stands for ‘database management system’
1.20 - A DBMS creates, processes and also administers databases. 
1.21 - 3 examples of companies who sell DBMS products are: Microsoft, Google and IBM.
1.22 - A database is a collection of information all stored in a convenient and accessible place which allows ease of updating, managing etc..
1.23 - A database is considered to be self-describing because the format of the program allows for the storage of various different types of objects.
>      This creates an easily accessible list of paths to follow. 
1.24 - Metadata is information that summarizes basic information about certain data
1.25 - When the metadata is stored in tables it is easy to query the database in order to see what is accessible in the database 
1.33 - An enterprise-class database system has 4 parts: the user, the database application, the database and lastly the DBMS. 
1.35 - The data written and read from the database is implemented through a sorting algorithm that categorizes the data into indexes and then further into tables. 
1.36 - The five DBMS products discussed this chapter were Microsoft Access, Microsoft SQL Server, Oracle Database, MySQL 5.6 and IBM DB2. 
>	   Microsoft Access is the simplest of the 5 and best utilized for smaller applications while systems like Microsoft SQL and IBM DB2 are more meant for enterprise-class systems. 
>      Products like oracle and Microsoft SQL also have the ability to be utilized through cloud networking; further expanding capabilities. 
>      Ease of access for these programs might go in an order similar to this, from easiest to most complex: Microsoft Access, MySQL, Microsoft SQL, Oracle DB and IBM DB2. 
1.39 - A data warehouse is a large collection of data comprised of information from various sources within a company. 
>	   Since it comes from several sources it allows management to make key decisions based on the information provided from this warehouse. 
1.41 - Databases can be redesigned by updating and changing columns/rows to fit more or less categories. 
>      It can also be redesigned by transferring the information stored on particular database which would then be transferred to a differently arranged database software program.

/* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

3.11 – A functional dependency is a relationship between attributes in which one attribute or group determines the value of another.
3.12 – Since functional dependencies use information that can’t be calculated, there has to be a place they can store the data for future use. 
>      This type of storage method is done by using relations. 
3.13 – If given a person’s First name and Last name, one is able to obtain that person’s phone number. 
3.15 – No, just having A by itself does not determine the value of C.
3.16 – Yes, since A determines B and A determines C.
3.34 – The relations found in 1NF are: rows containing data about an entity, columns contain data about attributes of the entities, all entries in a column are of the same kind.
>      Each column has a unique name, cells of the table hold a single value.
>      The order of the columns is unimportant, and the order of the rows is unimportant, no two rows may be identical. 
3.36 – Relations in 2NF must be in 1NF and all non-key attributes are functionally dependent on the primary key.
3.37 – Relations in 3NF must also be in 2NF and have no transitive functional dependencies. 
3.38 – Relations in BCNF must be in 3NF and create tables so that every determinant is a candidate key.
3.40 – Changing a non-BCNF relation into a BCNF relation is done by the “Straight-to-BCNF” or general normalization method. 
>      This method identifies every functional dependency and candidate key and then proceeds until every determinant of a relation is a candidate key. 
A. - 1. False 2. False 3. True 4. True 5. False 6. True
B. - ProjectID
C. - Both EmployeeName and EmployeeSalary are dependents of ProjectID
D. - 3NF
E. - Two anomalies affecting project could be that for: 
>	 One: a query for the salaries of a project might bring up multiple people.
>    Two: if a query for a salary was done, it might bring up more than one project. 
F. - ProjectID is a determinant for EmployeeName and EmployeeSalary but may cover more than one person and/or salary for each project. 
G. - EmployeeName is a determinant of EmployeeSalary because there are different salaries for the same projects. 
H. - Yes, they are dependents for EmployeeSalary.
I. - Yes, EmployeeSalary is a determinant of EmployeeName
J. - Yes, ProjectID holds a functional dependency with EmployeeName and EmployeeSalary.

/* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

A. 
1. LastName is a determinant for Firstname and Phone
2. FirstName is a determinant for LastName and Phone
3. Phone is a determinant for FirstName and LastName
4. InvoiceDate is not a determinant for anything.
5. Price is a determinant of tax
6. Tax is a determinant of Price

B.
1. LastName is not a good primary key because there can be multiple people with the same last name. 
2. LastName & FirstName are not good as a primary key because there can be multiple John Smith’s
3. Phone would work because there are very few other people with the same phone number, and they would all be in the same household
4. LastName, FirstName, InvoiceDate would not be good because you could have two people with the same first and last name come in on the same day to make a purchase.
5. LastName, FirstName, InvoiceItem is less likely to occur but you could still have two people with the same name purchase the same product.
6. LastName, FirstName, InvoiceDate would still not be good because you could have two people with the same first and last name come in on the same day to make a purchase.
7. LastName, FirstName, InvoiceDate would still not be good because you could have two people with the same first and last name come in on the same day to make a purchase.
8. LastName, FirstName, InvoiceDate would still not be good because you could have two people with the same first and last name come in on the same day to make a purchase.
*The best option would be #3 because phone number is going to be the most unique option for identifying unique information.

C. 
1. SaleID could act as a connector between tables to identify the specific transaction and item details when a person made a purchase, their information and what they purchased, etc.  
2. By looking up a phone number you could call up the CustomerID and SaleID giving you all the information you need about a that specific transaction.

