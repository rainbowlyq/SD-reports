CREATE TABLE IF NOT EXISTS `customer`(
	`cusid` CHAR(5) PRIMARY KEY,
	`srchterm` CHAR(3) UNIQUE
);

CREATE TABLE IF NOT EXISTS `material`(
	`matid` CHAR(8) PRIMARY KEY,
	`division` VARCHAR(10),
	`weight` int
);

CREATE TABLE IF NOT EXISTS `inquiry`(
	`inqid` CHAR(8) PRIMARY KEY,
	`sorg` CHAR(4),
	`dischannel` CHAR(2),
	`division` CHAR(2),
	`soldtoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`shiptoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`cusref` CHAR(3) UNIQUE,
	`validfrom` DATE,
	`validto` DATE,
	`reqdelivdate` DATE,
	`expordvalue` int,
	`currency` VARCHAR(5),
	`weight` int,
	`contype` CHAR(4),
	`conamount` int
);

CREATE TABLE IF NOT EXISTS `inquire`(
	`inqid` CHAR(8) REFERENCES `inquiry`(`inqid`),
	`matid` CHAR(8) REFERENCES `material`(`matid`),
	`ordquantity` int,
	`salesunit` VARCHAR(4),
	`probability` int,
	`description` VARCHAR(1000),
	 PRIMARY KEY(`inqid`,`matid`)
);

CREATE TABLE IF NOT EXISTS `quotation`(
	`quoid` CHAR(8) PRIMARY KEY,
	`sorg` CHAR(4),
	`dischannel` CHAR(2),
	`division` CHAR(2),
	`soldtoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`shiptoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`cusref` CHAR(3) UNIQUE,
	`validfrom` DATE,
	`validto` DATE,
	`reqdelivdate` DATE,
	`netvalue` int,
	`expordvalue` int,
	`currency` VARCHAR(5),
	`weight` int,
	`contype` CHAR(4),
	`conamount` int,
	`refinqid` CHAR(8) REFERENCES `inquiry`(`inqid`)
);

CREATE TABLE IF NOT EXISTS `quotate`(
	`quoid` CHAR(8) REFERENCES `quotation`(`quoid`),
	`matid` CHAR(8) REFERENCES `material`(`matid`),
	`ordquantity` int,
	`salesunit` VARCHAR(4),
	`contype` CHAR(4),
	`conamount` int,
	`description` VARCHAR(1000),
	 PRIMARY KEY(`quoid`,`matid`)
);

CREATE TABLE IF NOT EXISTS `salesorder`(
	`salordid` CHAR(8) PRIMARY KEY,
	`sorg` CHAR(4),
	`dischannel` CHAR(2),
	`division` CHAR(2),
	`soldtoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`shiptoparty` CHAR(5) REFERENCES `customer`(`cusid`),
	`cusref` CHAR(3) UNIQUE,
	`reqdelivdate` DATE,
	`pricingdate` DATE,
	`netvalue` int,
	`expordvalue` int,
	`currency` VARCHAR(5),
	`weight` int,
	`contype` CHAR(4),
	`conamount` int,
	`refquoid` CHAR(8) REFERENCES `inquiry`(`inqid`),
	`status` VARCHAR(20),
	`issue` VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `sell`(
	`salordid` CHAR(8) REFERENCES `salesorder`(`salordid`),
	`matid` CHAR(8) REFERENCES `material`(`matid`),
	`ordquantity` int,
	`salesunit` VARCHAR(4),
	`contype` CHAR(4),
	`conamount` int,
	`description` VARCHAR(1000),
	 PRIMARY KEY(`salordid`,`matid`)
);