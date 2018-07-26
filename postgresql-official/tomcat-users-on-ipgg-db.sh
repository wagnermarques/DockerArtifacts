#!/bin/bash

source ./pgsql_container_properties.sh

#tabelas utilizadas pelo tomcat em um jdbcRealm
CREATE_TABLE_USERS="create table users (user_name varchar(15) not null primary key, user_pass varchar(15) not null)"
CREATE_TABLE_ROLES="create table user_roles (user_name varchar(15) not null,role_name varchar(15) not null, primary key (user_name, role_name))";

#./createdb.sh ipgg
docker exec -i pgsql bash <<EOF
       psql ipgg postgres -c "CREATE TABLE users( 
            user_name varchar(15) not null primary key, 
            user_pass varchar(15) not null);"

       psql ipgg postgres -c "create table user_roles (
            user_name         varchar(15) not null,
            role_name         varchar(15) not null,
            primary key (user_name, role_name));"
            
       psql ipgg postgres -c "delete from users;"     
       psql ipgg postgres -c "delete from user_roles;"

       psql ipgg postgres -c "insert into users
            (user_name,user_pass) values
            ('admin','admin123');"

       psql ipgg postgres -c "insert into user_roles
            (user_name,role_name) values
            ('admin','manager-gui'),
            ('admin','manager-script'),
            ('admin','manager-jmx'),
            ('admin','manager-status'),
            ('admin','admin-gui'),
            ('admin','admin-script'),
            ('admin','orbeon-service'),            
            ('admin','orbeon-user');"

       psql ipgg postgres -c "select * from users";     
       psql ipgg postgres -c "select * from user_roles";
exit
EOF


