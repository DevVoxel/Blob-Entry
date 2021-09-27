drop database if exists imagedb;
create database if not exists imagedb;

use imagedb;

-- USER INFORMATION TABLE

CREATE TABLE USER (
	user_id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(256) NULL,
	user_pass VARCHAR(256) NULL,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	mi CHAR(1),
	is_moderator BOOLEAN,
	join_date DATETIME DEFAULT current_timestamp,
    pin INT
);

-- POST INFORMATION TABLE

CREATE TABLE POST (
	post_id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT unsigned NOT NULL,
	date_created TIMESTAMP,
	post_title VARCHAR(256),
	post_body VARCHAR(1000),
	FOREIGN KEY (user_id) REFERENCES USER(user_id)
);

-- FOREIGN KEY (status_id) REFERENCES STATUS(status_id)
-- status_id INT unsigned NOT NULL,

CREATE TABLE IMAGE (
	image_id INT unsigned auto_increment PRIMARY KEY,
    file_name NVARCHAR(255) NOT NULL,
    mimetype NVARCHAR(50) NOT NULL,
    img_data longblob NOT NULL,
    post_id INT unsigned NOT NULL
);
-- foreign key (post_id) REFERENCES POST(post_id) on delete cascade



-- STATUS TABLE MAY BE ADDED. YET TO BE DETERMINED.  IF ADDED WILL BE USED FOR MODERATOR APPROVAL OF POSTS.
/*

	CREATE TABLE STATUS (
		status_id INT unsigned NOT NULL PRIMARY KEY,
		post_id INT unsigned NOT NULL,
		status_set VARCHAR(100),
		status_approved BOOLEAN,
		status_declined BOOLEAN,
		status_waiting BOOLEAN,
		status_blocked BOOLEAN,
		FOREIGN KEY (post_id) REFERENCES POST(post_id)
);

*/

-- USER TABLE CONSTRAINTS

ALTER TABLE USER
	ADD CONSTRAINT first_name_check CHECK (firstname NOT LIKE '%[^A-Z]%');

ALTER TABLE USER
	ADD CONSTRAINT last_name_check CHECK (lastname NOT LIKE '%[^A-Z]%');

ALTER TABLE USER
	ADD CONSTRAINT mi_name_check CHECK (mi NOT LIKE '%[^A-Z]%');

ALTER TABLE IMAGE
	ADD UNIQUE KEY file_name(file_name);


SELECT * FROM USER;
SELECT * FROM POST;
-- SELECT * FROM STATUS;
SELECT * FROM IMAGE;
