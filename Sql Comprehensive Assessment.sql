create database library;
use library;
create table Branch(Branch_no int PRIMARY KEY, Manager_Id int, Branch_address varchar(100), Contact_no bigint);
create table Employee(Emp_Id  int PRIMARY KEY, Emp_name varchar(25), Position varchar(25), 
Salary int,Branch_no int, foreign key(Branch_no) references Branch(Branch_no));
create table Books(ISBN int primary key,Book_title varchar(50),Category varchar(50),Rental_Price int, Status varchar(3),
Author varchar(50), Publisher varchar(50));
create table Customer(Customer_Id int PRIMARY KEY, Customer_name varchar(50), Customer_address varchar(100), Reg_date date);
create table IssueStatus(Issue_Id int PRIMARY KEY,Issued_cust int, FOREIGN KEY(Issued_cust) references Customer(Customer_id),
Issue_date date, Isbn_book int, FOREIGN KEY(Isbn_book) references Books(ISBN));
create table ReturnStatus(Return_Id int PRIMARY KEY, Return_cust varchar(50), Return_book_name varchar(50), Return_date date, 
Isbn_book2 int, FOREIGN KEY(Isbn_book2) references Books(ISBN));

insert into Branch values(1,10,"oijaf,dffon,fsdud",999999999),(2,8,"spdcko,cfcda,gbfgf",999999888),
(3,5,"sfvfs,hbbhf,jngngnj",999999777),(4,9,"acccd,vgdv,vdsc",999999666),(5,2,"wxzre,rvvr,rvvrbb",999999555),
(6,3,"edssf,eseff,rgdgdr",999999444),(7,1,"ezce,vfgrve,vrvrv",999999333),(8,7,"cbdhc,tcbhbt,bhyvteg",999999222),
(9,6,"efve,bchrbh,tbcbt",999999111),(10,4,"vsss,vrvrg,tbhhtb",999999999);
select * from Branch;
insert into Employee values(1,'John','Junior Manager', 30000,7),(2,'Michael','Senior Manager', 60000,2),
(3,'Olivia','Manager', 35000,6),(4,'Sophia','Senior Manager', 54000,3),(5,'Jane','Manager', 34000,1),
(6,'Benjamin','Junior Manager', 31000,5),(7,'Charlotte','Manager',50000,4),(8,'James','Senior Manager', 48000,9),
(9,'Mathew','Sweeper', 35000,10),(10,'Isabella','Senior Manager', 47000,8);
select * from Employee;
insert into Books values
(915,'LOTR','Fiction',50,'Yes','RR Tolkein','Allen and Unwin'),
(918,'JJK','Manga',25,'No','Gege Akutami','Viz Media'),
(916,'Naruto','Manga',20,'No','Kishimoto','Viz Media'),
(920,'Dune','Science Fiction',50,'Yes','Frank Herbert','Chilton Books'),
(921,'Moneyball','History',50,'Yes','Michael Lewis','W. W. Norton & Company'),
(924,'Wings Of Fire','Autobiography',50,'No','APJ Abdul Kalam and Arun Tiwari','Universities Press'),
(919,'Waiting for a Visa','Autobiography',50,'No','BR Ambedkar','Lector House'),
(917,'Gandhi Before India (M K Gandhi)','Biography',40,'Yes','Ramachandra Guha','Penguin Books'),
(922,'To Kill a Mockingbird','Novel',50,'Yes','Harper Lee','Bibliomania'),
(923,'The Black Swan','Novel',50,'No','Nassim Nicholas Taleb','Penguin Books');
select * from books;
insert into Customer values
(1,'Adam','cau cwjokw kmevk', '2000-07-20'),(2,'Anil','wrge rhhyr hreh', '1998-11-12'),
(3,'Aswathy','ijda adpiac sfvso', '2020-01-01'),(4,'Athira','adiph vsuhsv svougsdv', '2020-01-01'),
(5,'Askar','dwcw vwvw rwvw', '2005-03-12'),(6,'Anil','wrge rhhyr hreh', '1990-02-25'),
(7,'Abdullah','rgbf dbdf bgdbdg', '2022-12-23'),(8,'Asur','adiph vsuhsv svougsdv', '2023-03-01'),
(9,'Akhil','accv dvsvad advdv', '1995-10-11'),(10,'Azeez','ereth yjryr theeht', '1999-06-29');
select * from Customer;
insert into IssueStatus values
(1,3,'2023-06-19',924),(2,10,'2024-01-30',922),(3,4,'2024-02-22',919),(4,8,'2024-02-22',916),
(5,2,'2024-02-24',917),(6,5,'2024-02-26',924),(7,3,'2024-03-25',920),(8,3,'2024-03-15',923),
(9,7,'2024-03-19',915),(10,8,'2024-03-19',918);
select * from IssueStatus;
insert into ReturnStatus values
(1,1,'Moneyball','2024-01-15',921),(2,3,'Wings Of Fire','2024-02-25',924),
(3,2,'Gandhi Before India (M K Gandhi)','2024-02-28',917),(4,9,'LOTR','2024-03-02',915),
(5,7,'LOTR','2024-02-25',915),(6,3,'Dune','2024-03-29',920),(7,3,'The Black Swan','2024-03-30',923),
(8,7,'Wings Of Fire','2024-03-30',924),(9,10,'To Kill a Mockingbird','2024-04-01',922),(10,8,'JJK','2024-04-15',918);
select * from ReturnStatus;
select Book_title,Category,Rental_Price from Books where Status='Yes';
select Emp_name, Salary from Employee order by Salary desc;
select Book_title,Customer.Customer_name from Books right join IssueStatus on Books.ISBN=IssueStatus.Isbn_book
left join Customer on IssueStatus.Issued_cust=Customer.Customer_id;
select Category,count(*) as number from Books group by Category;
Select Emp_name, Position from employee where Salary>50000;
select Customer_name,Reg_date from Customer where Reg_date < '2022-01-01' and 
Customer_Id not in (select Issued_cust from issuestatus);
select Branch_no,Count(*) from employee group by Branch_no;
select Customer_name from customer where Customer_id in 
(Select Issued_cust from issuestatus where MONTH(Issue_date)=6);
select Book_title from books where Category='History';
select Branch_no,Count(*) as greater_than_5 from employee group by Branch_no having Count(*)>5;
select Emp_name,employee.Branch_no,branch.Branch_address from employee left join 
branch on branch.Branch_no=employee.Branch_no where employee.Position like '%manager%';
select Customer_name from customer where Customer_Id in 
(Select Issued_cust from issuestatus where Isbn_book in 
(Select ISBN from books where Rental_Price>25));