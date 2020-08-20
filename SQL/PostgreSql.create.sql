




CREATE TABLE ДеньИзЖизни (

 primaryKey UUID NOT NULL,

 Дата TIMESTAMP(3) NULL,

 МояЖизнь_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE РезультатДня (

 primaryKey UUID NOT NULL,

 Тип VARCHAR(13) NULL,

 Описание VARCHAR(255) NULL,

 ДеньИзЖизни_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE МояЖизнь (

 primaryKey UUID NOT NULL,

 Описание VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE Привычка (

 primaryKey UUID NOT NULL,

 Наименование VARCHAR(255) NULL,

 Приоритет SMALLINT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE ПривычкаДня (

 primaryKey UUID NOT NULL,

 Впечатление VARCHAR(255) NULL,

 Привычка_m0 UUID NOT NULL,

 ДеньИзЖизни_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMNETLOCKDATA (

 LockKey VARCHAR(300) NOT NULL,

 UserName VARCHAR(300) NOT NULL,

 LockDate TIMESTAMP(3) NULL,

 PRIMARY KEY (LockKey));



CREATE TABLE STORMSETTINGS (

 primaryKey UUID NOT NULL,

 Module VARCHAR(1000) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 "User" VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMAdvLimit (

 primaryKey UUID NOT NULL,

 "User" VARCHAR(255) NULL,

 Published BOOLEAN NULL,

 Module VARCHAR(255) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 HotKeyData INT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERSETTING (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMWEBSEARCH (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 "Order" INT NOT NULL,

 PresentView VARCHAR(255) NOT NULL,

 DetailedView VARCHAR(255) NOT NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERDETAIL (

 primaryKey UUID NOT NULL,

 Caption VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 ConnectMasterProp VARCHAR(255) NOT NULL,

 OwnerConnectProp VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE STORMFILTERLOOKUP (

 primaryKey UUID NOT NULL,

 DataObjectType VARCHAR(255) NOT NULL,

 Container VARCHAR(255) NULL,

 ContainerTag VARCHAR(255) NULL,

 FieldsToView VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE UserSetting (

 primaryKey UUID NOT NULL,

 AppName VARCHAR(256) NULL,

 UserName VARCHAR(512) NULL,

 UserGuid UUID NULL,

 ModuleName VARCHAR(1024) NULL,

 ModuleGuid UUID NULL,

 SettName VARCHAR(256) NULL,

 SettGuid UUID NULL,

 SettLastAccessTime TIMESTAMP(3) NULL,

 StrVal VARCHAR(256) NULL,

 TxtVal TEXT NULL,

 IntVal INT NULL,

 BoolVal BOOLEAN NULL,

 GuidVal UUID NULL,

 DecimalVal DECIMAL(20,10) NULL,

 DateTimeVal TIMESTAMP(3) NULL,

 PRIMARY KEY (primaryKey));



CREATE TABLE ApplicationLog (

 primaryKey UUID NOT NULL,

 Category VARCHAR(64) NULL,

 EventId INT NULL,

 Priority INT NULL,

 Severity VARCHAR(32) NULL,

 Title VARCHAR(256) NULL,

 Timestamp TIMESTAMP(3) NULL,

 MachineName VARCHAR(32) NULL,

 AppDomainName VARCHAR(512) NULL,

 ProcessId VARCHAR(256) NULL,

 ProcessName VARCHAR(512) NULL,

 ThreadName VARCHAR(512) NULL,

 Win32ThreadId VARCHAR(128) NULL,

 Message VARCHAR(2500) NULL,

 FormattedMessage TEXT NULL,

 PRIMARY KEY (primaryKey));




 ALTER TABLE ДеньИзЖизни ADD CONSTRAINT FKbac78d2b4f7e4670a038cc536e5dcc30 FOREIGN KEY (МояЖизнь_m0) REFERENCES МояЖизнь; 
CREATE INDEX Indexe3bd5688192e821b85e0cd24e78098f0e5123dee on ДеньИзЖизни (МояЖизнь_m0); 

 ALTER TABLE РезультатДня ADD CONSTRAINT FK1be0577a57654c50b69fdbc7f0aef36f FOREIGN KEY (ДеньИзЖизни_m0) REFERENCES ДеньИзЖизни; 
CREATE INDEX Index5639ba26dbba7f76f75e37bfc307498834437593 on РезультатДня (ДеньИзЖизни_m0); 

 ALTER TABLE ПривычкаДня ADD CONSTRAINT FK508ec7d6bbe14640b81392fc2a6b7ce4 FOREIGN KEY (Привычка_m0) REFERENCES Привычка; 
CREATE INDEX Indexc1c2dcafebb38eb8fc95e8a0ef2cab879b43aba5 on ПривычкаДня (Привычка_m0); 

 ALTER TABLE ПривычкаДня ADD CONSTRAINT FKe1fb0a8801db48b48e2c7b67c5cafa45 FOREIGN KEY (ДеньИзЖизни_m0) REFERENCES ДеньИзЖизни; 
CREATE INDEX Index511ecd1e85fd4b1a180ea5e1b93c5cc7a39bb4b9 on ПривычкаДня (ДеньИзЖизни_m0); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FK340bad5a497c418fb01bed145a757e83 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK20d2b19050ae4d74a33fea19e7d7ea4f FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FKc2d71e68c1e14540b30f1bcf140dcf78 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

