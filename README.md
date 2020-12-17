# Database

### 데이터베이스 설계 및 기본 쿼리에 관한 정보들

#### DataBase Term
 - Relation = Table
 - Attribute = Field = Column = 속성 --> 일관된 데이터타입만 저장 가능
 - Tuple = Record = Row = 속성들의 집합
 - Domain : 속성이 취할 수 있는 값의 범위
 - Cardinality : Tuple의 수
 - Degree : Attribute의 수
 - Relation Schema : 속성의 이름
 - Relation Instance : Tuple의 집합
 - Key : Row를 구분하기 위한 하나 이상의 Column
 
   - Primary Key : 수 많은 Record사이에서 현재 레코드의 유일한 특성을 갖게 하는 하나 이상의 속성  
                 : 1개의 테이블에 1개의 PK만 존재
                  
   - Foreign Key : 1:N관계를 갖는 두 개의 테이블에서 N의 속성을 갖고 있는 테이블의 
                    Column Data는 반드시 1의 속성을 갖는 테이블의 Column Data와
                    일치시킴으로써 두 개의 테이블의 관계에서 Object Integrity와 
                    Reference Integrity을 유지하도록 한다.
                
                    
#### DataBase Normalization
 - 데이터의 중복으로 인한 이상(Anomaly) 현상 제거
   - Insert Anomaly
      : 새로운 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야 하는 문제
   - Update Anomaly
      : 중복 튜플 중 일부만 변경하여 데이터가 불일치하게 되는 문제 
   - Deletion Anomaly
      : 데이터를 삭제할 경우 데이터가 포함된 레코드가 삭제되므로 삭제하지 말아야 할
        데이터도 함께 삭제되는 문제

#### 테이블 설계

   0. PROCESS 
      ENTITY 도출 --> ENTITY 배치 --> ENTITY RELATIONSHIP
      
   1. ENTITY
      - KEY ENTITY
      - MAIN ENTITY
      - ACTION ENTITY
      - PRODUCTION ENTITY
   2. NORMALIZATION
   3. ATTRIBUTE
   4. IDENTIFIER
   5. RELATIONSHIP
   6. DOMAIN


:: TABLE
   - PROCESS
      - CREATE :: ATTRIBUTES 
      - CREATE :: TABLESPACE 
      - ALTER  :: CONSTRAINTS
      - CREATE :: SYNONYM  --> 소유주만 사용가능
          - PUBLIC SYNONYM --> 소유주 뿐만 아니라 권한을 부여받은 계정도 사용, DML구문에서만 사용 가능 
      - GRANT  :: OBJECT PRIVILEGE
