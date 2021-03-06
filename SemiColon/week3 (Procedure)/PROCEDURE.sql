CREATE OR REPLACE PROCEDURE TEINFO1
(TECODE     IN TE.TE_CODE%TYPE,
 TEPWD      IN TE.TE_PWD%TYPE,
 TENAME     OUT TE.TE_NAME%TYPE,
 SUNAME     OUT SU.SU_NAME%TYPE,
 TELEVEL    OUT TE.TE_LEVEL%TYPE,
 TEGRCODE   OUT TE.TE_GRCODE%TYPE,
 TECLCODE   OUT TE.TE_CLCODE%TYPE,
 STCOUNT    OUT NCHAR
)
IS
COMPARE NUMBER := 1;
IDD NUMBER;
PWD NUMBER;
BEGIN 
    SELECT COUNT(*) INTO IDD FROM TE WHERE TE_CODE = TECODE AND TE_PWD = TEPWD;
    
    IF COMPARE = IDD THEN
        SELECT 
            TE_NAME, 
            SU_NAME,
            TE_LEVEL,
            TE_GRCODE,
            TE_CLCODE,
            COUNT(ST_CLCODE)
            INTO TENAME, SUNAME, TELEVEL, TEGRCODE, TECLCODE, STCOUNT
            FROM TE INNER JOIN SU ON TE_SUCODE = SU_CODE 
                    INNER JOIN ST ON TE_GRCODE = ST_GRCODE AND TE_CLCODE = ST_CLCODE
            WHERE TE_CODE = '1002' AND TE_PWD = '0000' AND ST_STATE = 'C'
            GROUP BY TE_NAME, SU_NAME, TE_LEVEL, TE_GRCODE, TE_CLCODE;  
    END IF;
END TEINFO1;

SET SERVEROUTPUT ON;

DECLARE
 TENAME      TE.TE_NAME%TYPE;
 SUNAME      SU.SU_NAME%TYPE;
 TELEVEL     TE.TE_LEVEL%TYPE;
 TEGRCODE   TE.TE_GRCODE%TYPE;
 TECLCODE  TE.TE_CLCODE%TYPE;
 STCOUNT    NCHAR;

BEGIN
TEINFO1('1002', '0000', TENAME, SUNAME, TELEVEL, TEGRCODE, TECLCODE, STCOUNT);

DBMS_OUTPUT.PUT_LINE('TENAME : '||TENAME);
DBMS_OUTPUT.PUT_LINE('SUNAME : '||SUNAME);
DBMS_OUTPUT.PUT_LINE('TELEVEL : '||TELEVEL);
DBMS_OUTPUT.PUT_LINE('TEGRCODE : '||TEGRCODE);
DBMS_OUTPUT.PUT_LINE('TECLCODE : '||TECLCODE);
DBMS_OUTPUT.PUT_LINE('STCOUNT : '||STCOUNT);

END;


CREATE OR REPLACE PROCEDURE ISACCESS(
TECODE IN TE.TE_CODE%TYPE,
TEPWD IN TE.TE_PWD%TYPE,
TENAME OUT TE.TE_NAME%TYPE,
SUNAME OUT SU.SU_NAME%TYPE,
TELEVEL OUT TE.TE_LEVEL%TYPE,
TEGRCODE OUT TE.TE_GRCODE%TYPE,
TECLCODE OUT TE.TE_CLCODE%TYPE,
STUDENTS OUT NUMBER
)IS
CANNOT_COUNT EXCEPTION;
AC NUMBER := 1;
IDD NUMBER;
PWD NUMBER;
BEGIN
SELECT COUNT(TE_CODE) INTO IDD FROM TE WHERE TE_CODE = TECODE;
IF AC=IDD THEN
    SELECT COUNT(TE_CODE) INTO PWD FROM TE WHERE TE_CODE = TECODE AND TE_PWD=TEPWD;
    IF AC=PWD THEN
        SELECT TE_NAME , SU_NAME, TE_LEVEL, TE_GRCODE, TE_CLCODE
        INTO TENAME, SUNAME, TELEVEL, TEGRCODE, TECLCODE
        FROM TE 
        INNER JOIN SU ON SU_CODE = TE_SUCODE INNER JOIN ST ON ST_GRCODE = TE_GRCODE AND TE_CLCODE = ST_CLCODE
        WHERE TE_CODE = TECODE AND TE_PWD = TEPWD
        GROUP BY TE_NAME , SU_NAME, TE_LEVEL, TE_GRCODE, TE_CLCODE;

        SELECT COUNT(*) INTO STUDENTS FROM ST WHERE ST_CLCODE = TECLCODE AND ST_GRCODE = TEGRCODE AND ST_STATE = 'C';  

        IF STUDENTS IS NULL THEN
            RAISE CANNOT_COUNT;
        END IF;
    END IF;
END IF;

EXCEPTION 
WHEN CANNOT_COUNT THEN
    STUDENTS := 0;
END ISACCESS;