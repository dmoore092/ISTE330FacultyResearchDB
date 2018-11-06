#!/bin/bash
(cat combined.csv ; echo) | while IFS=',' read -r col1 col2 col3 col4 col5 col6 col7 col8 col9 col10 col11
do
    echo "INSERT INTO users(username, password, name, tagline, imagePath, title, interestArea, office, website, phone, email, role ) VALUES('$col1', '$col2', '$col3', '$col4', '$col5', '$col6', '$col7', '$col8', '$col9', '$col10', '$col11';)"
done | mysql -uroot iste330t01
