

/* Create Tables */

CREATE TABLE LOGIN_STATUSES
(
	USER_ID INT NOT NULL COMMENT 'ユーザID',
	LOGIN_DATETIME DATETIME NOT NULL COMMENT 'ログイン日時'
) COMMENT = 'ログイン状態';


CREATE TABLE MATCH_RELATIONS
(
	USER_ID INT NOT NULL COMMENT 'ユーザid : ユーザID',
	PARTNER_ID INT NOT NULL COMMENT '相手のID : マッチしてくれた人のID',
	MATCH_STATE INT NOT NULL COMMENT 'マッチング状態 : 0: dislike
1: like
2: super like',
	SELECTED_DATETIME DATETIME NOT NULL COMMENT '選択した日',
	CONSTRAINT UQ_match_relations UNIQUE (USER_ID, PARTNER_ID)
) COMMENT = 'マッチ関係';


CREATE TABLE MESSAGES
(
	USER_ID INT NOT NULL COMMENT 'ユーザID',
	PARTNER_ID INT NOT NULL COMMENT 'メッセージを送る相手のID',
	MESSAGE TEXT NOT NULL COMMENT 'メッセージ',
	SEND_DATETIME DATETIME NOT NULL COMMENT 'メッセージを送った日時'
) COMMENT = 'メッセージ';


CREATE TABLE USERS
(
	USER_ID INT NOT NULL AUTO_INCREMENT COMMENT 'ユーザID',
	USER_NAME VARCHAR(30) NOT NULL COMMENT '名前',
	SEX INT NOT NULL COMMENT '性別 : 0 : unknown
1 : male
2 : female',
	BIRTHDAY DATE NOT NULL COMMENT '誕生日',
	PROFILE TEXT COMMENT 'プロフィール : 
',
	CREATED_AT DATE NOT NULL COMMENT '登録日 : サービスに登録した日',
	MAIL_ADDRESS VARCHAR(255) NOT NULL UNIQUE COMMENT 'mail_address',
	PASSWORD VARCHAR(255) NOT NULL COMMENT 'password',
	PROFILE_IMAGE VARCHAR(256) NOT NULL COMMENT 'プロフィール画像 : プロフィール画像のパスを入れる
',
	PRIMARY KEY (USER_ID)
) COMMENT = 'ユーザ';


CREATE TABLE USERS_LOCATION
(
	USER_ID INT NOT NULL COMMENT 'ユーザid',
	LATITUDE DECIMAL(7,4) NOT NULL COMMENT '緯度',
	LONGITUDE DECIMAL(7,4) NOT NULL COMMENT '経度'
) COMMENT = 'ユーザの現在地';



/* Create Foreign Keys */

ALTER TABLE LOGIN_STATUSES
	ADD CONSTRAINT FK_LOGIN_STATUS_USERS FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RELATIONS
	ADD CONSTRAINT FK_MATCH_USERS FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MESSAGES
	ADD CONSTRAINT FK_MESSAGES_USERS FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USERS_LOCATION
	ADD CONSTRAINT FK_USER_LOCATION_USERS FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


