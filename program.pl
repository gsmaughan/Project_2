#!/usr/bin/perl

use DBI;
use strict;

my $driver   = "SQLite"; 
my $database = "database.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) 
   or die $DBI::errstr;

print "Opened database successfully\n";

my $stmt = qq(CREATE TABLE DATA
   (
      FIRST_NAME           TEXT    NOT NULL,
      LAST_NAME            TEXT    ,
      HOME                 TEXT    NOT NULL,
   ););

my $rv = $dbh->do($stmt);
if($rv < 0) {
   print $DBI::errstr;
} else {
   print "Table created successfully\n";

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Rose', 'Tyler', 'Earth'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Zoe', 'Heriot', 'Space Station W3'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Jo', 'Grant', 'Earth'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Rose', 'Tyler', 'Earth'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Leela', null, 'Unspecified'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Romana', null, 'Gallifrey'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Clara', 'Oswald', 'Earth'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Adric', null, 'Alzarius'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

my $stmt = qq(INSERT INTO DATA (FIRST_NAME, LAST_NAME, HOME)
               VALUES ('Susan', 'Foreman', 'Gallifrey'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

print "Records created successfully\n";

my $stmt = qq(SELECT FIRST_NAME, LAST_NAME, HOME FROM DATA;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
      print "FIRST_NAME = ". $row[0] . "\n";
      print "LAST_NAME = ". $row[1] ."\n";
     
      print "HOME =  ". $row[2] ."\n\n";
}

print "Operation done successfully\n";

$dbh->disconnect();

