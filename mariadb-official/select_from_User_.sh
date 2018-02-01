#!/bin/bash

#sql="use lportal;select userId,password_,emailAddress,firstName,middleName,lastName,loginDate,loginIP,lastLoginDate,lastLoginIP,lastFailedLoginDate,failedLoginAttempts,lockout,lockoutDate,emailAddressVerified,status from User_;"
sql="use lportal;select userId,password_,emailAddress,firstName,middleName,lastName,loginIP,lockout,status from User_;"
../mariadb-official/docker-exec-in-a-specific-container.sh fzl_mariadb_liferay7 "$sql"
