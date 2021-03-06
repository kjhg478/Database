INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201703020101', '20180510190118', '흡연상');
INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201703020103', '20191115170824', '스티브잡스 상'); 
INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201703020202', '20181005201029', '아인슈타인 상'); 
INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201703020205', '20190510181529', 'E-SPORTS LOL 부문 우승'); 


INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201903020203', '20190919201925', '프로그래머(해킹) 우승'); 
INSERT INTO PR(PR_STCODE, PR_DATE, PR_NAME) 
VALUES('201903020102', '20191101181558', '성적 우수상');

DELETE FROM PR WHERE PR_NAME = '흡연상';

SELECT * FROM PR;

SELECT * FROM ST WHERE ST_CODE LIKE '2017%';

SELECT * FROM TE;

SELECT * FROM CO;
SELECT * FROM AT;

INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','A','20180302');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','A','20180401');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','A','20180501');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','A','20180601');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','C','20180901');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','','20181001');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','C','20181101');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020101','A','20181201');

INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20180302');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20180401');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20180501');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20180601');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20180901');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20181001');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20181101');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020102','A','20181201');

INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','','20180302');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','C','20180401');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','A','20180501');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','A','20180601');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','A','20180901');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','A','20181001');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','A','20181101');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020103','C','20181201');

INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','A','20180302');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','A','20180401');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','A','20180501');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','A','20180601');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','','20180901');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','C','20181001');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','C','20181101');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020104','A','20181201');

INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20180302');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20180401');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20180501');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20180601');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20180901');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20181001');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20181101');
INSERT INTO AT(AT_STCODE, AT_STATE, AT_DATE) 
VALUES('201803020105','A','20181201');

SELECT * FROM AT;

ROLLBACK;



COMMIT;