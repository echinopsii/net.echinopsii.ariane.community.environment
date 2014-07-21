# - hibernate h2 base configuration
#hibernate.connection.driver_class=org.h2.Driver
#hibernate.dialect=org.hibernate.dialect.H2Dialect
#hibernate.connection.url=jdbc:h2:mem:db1;DB_CLOSE_DELAY=-1;MVCC=TRUE
#hibernate.connection.username=sa
#hibernate.connection.password=sa
#hibernate.hbm2ddl.auto=create-drop
#hibernate.hbm2ddl.auto=update

# - hibernate mariadb base configuration
hibernate.connection.driver_class=org.mariadb.jdbc.Driver
#hibernate.connection.driver_class=com.mysql.jdbc.Driver
hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.connection.url=%%DIRECTORY_DB_URL
hibernate.connection.username=%%DIRECTORY_DB_USER
hibernate.connection.password=%%DIRECTORY_DB_PWD
hibernate.hbm2ddl.auto=update
hibernate.c3p0.min_size=5
hibernate.c3p0.max_size=40
hibernate.c3p0.timeout=300
hibernate.c3p0.max_statements=50
hibernate.c3p0.idle_test_period=100
