CREATE TABLE `board` (
	`boardId`	int	NOT NULL,
	`memberID`	varchar(8)	NOT NULL,
	`title`	varchar(100)	NULL,
	`content`	text	NULL
);

CREATE TABLE `member` (
	`memberID`	varchar(8)	NOT NULL,
	`name`	varchar(255)	NULL,
	`tel`	varchar(20)	NULL
);

ALTER TABLE `Untitled` ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
	`boardId`,
	`memberID`
);

ALTER TABLE `Untitled2` ADD CONSTRAINT `PK_UNTITLED2` PRIMARY KEY (
	`memberID`
);

ALTER TABLE `Untitled` ADD CONSTRAINT `FK_Untitled2_TO_Untitled_1` FOREIGN KEY (
	`memberID`
)
REFERENCES `Untitled2` (
	`memberID`
);

