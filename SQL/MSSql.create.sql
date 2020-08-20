



CREATE TABLE [ДеньИзЖизни] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Дата] DATETIME  NULL,

	 [МояЖизнь_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [РезультатДня] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Тип] VARCHAR(13)  NULL,

	 [Описание] VARCHAR(255)  NULL,

	 [ДеньИзЖизни_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [МояЖизнь] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Описание] VARCHAR(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Привычка] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Наименование] VARCHAR(255)  NULL,

	 [Приоритет] TINYINT  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ПривычкаДня] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Впечатление] VARCHAR(255)  NULL,

	 [Привычка_m0] UNIQUEIDENTIFIER  NOT NULL,

	 [ДеньИзЖизни_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMNETLOCKDATA] (

	 [LockKey] VARCHAR(300)  NOT NULL,

	 [UserName] VARCHAR(300)  NOT NULL,

	 [LockDate] DATETIME  NULL,

	 PRIMARY KEY ([LockKey]))


CREATE TABLE [STORMSETTINGS] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Module] varchar(1000)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [User] varchar(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMAdvLimit] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [User] varchar(255)  NULL,

	 [Published] bit  NULL,

	 [Module] varchar(255)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [HotKeyData] int  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERSETTING] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMWEBSEARCH] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [Order] INT  NOT NULL,

	 [PresentView] varchar(255)  NOT NULL,

	 [DetailedView] varchar(255)  NOT NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERDETAIL] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Caption] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 [ConnectMasterProp] varchar(255)  NOT NULL,

	 [OwnerConnectProp] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERLOOKUP] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [DataObjectType] varchar(255)  NOT NULL,

	 [Container] varchar(255)  NULL,

	 [ContainerTag] varchar(255)  NULL,

	 [FieldsToView] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [UserSetting] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [AppName] varchar(256)  NULL,

	 [UserName] varchar(512)  NULL,

	 [UserGuid] uniqueidentifier  NULL,

	 [ModuleName] varchar(1024)  NULL,

	 [ModuleGuid] uniqueidentifier  NULL,

	 [SettName] varchar(256)  NULL,

	 [SettGuid] uniqueidentifier  NULL,

	 [SettLastAccessTime] DATETIME  NULL,

	 [StrVal] varchar(256)  NULL,

	 [TxtVal] varchar(max)  NULL,

	 [IntVal] int  NULL,

	 [BoolVal] bit  NULL,

	 [GuidVal] uniqueidentifier  NULL,

	 [DecimalVal] decimal(20,10)  NULL,

	 [DateTimeVal] DATETIME  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ApplicationLog] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Category] varchar(64)  NULL,

	 [EventId] INT  NULL,

	 [Priority] INT  NULL,

	 [Severity] varchar(32)  NULL,

	 [Title] varchar(256)  NULL,

	 [Timestamp] DATETIME  NULL,

	 [MachineName] varchar(32)  NULL,

	 [AppDomainName] varchar(512)  NULL,

	 [ProcessId] varchar(256)  NULL,

	 [ProcessName] varchar(512)  NULL,

	 [ThreadName] varchar(512)  NULL,

	 [Win32ThreadId] varchar(128)  NULL,

	 [Message] varchar(2500)  NULL,

	 [FormattedMessage] varchar(max)  NULL,

	 PRIMARY KEY ([primaryKey]))




 ALTER TABLE [ДеньИзЖизни] ADD CONSTRAINT [ДеньИзЖизни_FМояЖизнь_0] FOREIGN KEY ([МояЖизнь_m0]) REFERENCES [МояЖизнь]
CREATE INDEX ДеньИзЖизни_IМояЖизнь_m0 on [ДеньИзЖизни] ([МояЖизнь_m0])

 ALTER TABLE [РезультатДня] ADD CONSTRAINT [РезультатДня_FДеньИзЖизни_0] FOREIGN KEY ([ДеньИзЖизни_m0]) REFERENCES [ДеньИзЖизни]
CREATE INDEX РезультатДня_IДеньИзЖизни_m0 on [РезультатДня] ([ДеньИзЖизни_m0])

 ALTER TABLE [ПривычкаДня] ADD CONSTRAINT [ПривычкаДня_FПривычка_0] FOREIGN KEY ([Привычка_m0]) REFERENCES [Привычка]
CREATE INDEX ПривычкаДня_IПривычка_m0 on [ПривычкаДня] ([Привычка_m0])

 ALTER TABLE [ПривычкаДня] ADD CONSTRAINT [ПривычкаДня_FДеньИзЖизни_0] FOREIGN KEY ([ДеньИзЖизни_m0]) REFERENCES [ДеньИзЖизни]
CREATE INDEX ПривычкаДня_IДеньИзЖизни_m0 on [ПривычкаДня] ([ДеньИзЖизни_m0])

 ALTER TABLE [STORMWEBSEARCH] ADD CONSTRAINT [STORMWEBSEARCH_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERDETAIL] ADD CONSTRAINT [STORMFILTERDETAIL_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERLOOKUP] ADD CONSTRAINT [STORMFILTERLOOKUP_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

