#install the packages
install.packages("RMySQL")

library("RMySQL")
library("DBI")

#connect the existing database (user and password)
dbcon = dbConnect(MySQL(), user = 'root', password = 'mysql', dbname = 'RStudent',
                  host = 'localhost')

#
dbcon = dbConnect(MySQL(), user = 'root', password = 'mysql',
                  host = 'localhost')


# List the tables available in this database.
dbListTables(dbcon);

##creatimmg the database and use it 

#create and use database
dbSendQuery(dbcon, "CREATE DATABASE bookstores3")

dbSendQuery(dbcon, "USE bookstores")
#creating the table
dbSendQuery(dbcon, "
            CREATE TABLE books1 (
            book_id INT primary key,
            title VARCHAR(50),
            author VARCHAR(50));")



#Inserting Data into the Tables
dbSendQuery(dbcon,
            "insert into RStud(id, name, dob, gender) values(1,'raviteja','2017-07-07','male')"
);

dbSendQuery(dbcon, "desc books1")
#select from table where conditions
result = dbSendQuery(dbcon, "select * from rstud");

result = dbSendQuery(dbcon, "select * from rstud where name='t'");
result = dbSendQuery(dbcon, "select id from rstud where name='raviteja'");

data.frame = fetch(result,n=-1)
data.frame = fetch(result)

print(data)
#operations

result=dbSendQuery(dbcon,"select max(id) from rstud");

#delete from table

result=dbSendQuery(dbcon,"delete from rstud where name='raviteja'");
result=dbSendQuery(dbcon,"delete from employee");

#update table
result=dbSendQuery(dbcon,"update rstud set id=11 where id=1");


#db mtcars;
dbWriteTable(dbcon, "mtcars", mtcars[, ], overwrite = TRUE)

#drop the table
dbSendQuery(dbcon, 'drop table if exists mtcars')
dbSendQuery(dbcon, 'drop table employee')


#truncate table
result=dbSendQuery(dbcon,"truncate table employee");


on.exit(dbDisconnect(dbcon))
dbClearResult(result)

dbWriteTable(dbcon, name='rstud', value=data.frame.result)

dbSendQuery(dbcon, "create table student(id int(10),name varchar(20), age int(3))")
