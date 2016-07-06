mysql --user='root' --password='apprentice' --execute='CREATE DATABASE capstone_test;'
mysql -h "localhost" -u "root" "-papprentice" "capstone_test" < "capstoneprewipe.sql"

mysql -h "localhost" -u "root" "-papprentice" "capstone_test" < "capstone.sql"




