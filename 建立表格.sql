USE
PersonalAssetManagement_PROD;
GO
CREATE TABLE InstitutionType(
	id varchar(10)PRIMARY KEY,
	name nvarchar(20) not null
)


CREATE TABLE Reigion(
id  varchar(5)PRIMARY KEY,
name  nvarchar(20) not null
)

CREATE TABLE Institutions(
id varchar(10) PRIMARY KEY,
typeCode varchar(10)  not null,
reigionCode  varchar(5) not null,
name varchar(20)not null,
deleted BIT not null,
createDateTime DateTime not null,
updateDateTime DateTime ,
deleteDateTime DateTime 
FOREIGN KEY (typeCode) References InstitutionType(id),
FOREIGN KEY (reigionCode) References reigion(id),
)
CREATE TABLE AccountingClassification(
    [id] varchar(8)PRIMARY KEY,
    [category] char(2) not null,
    [item] char(2) not null,
    [serial]char(2)not null,
    [name]char(2)not null,
)

CREATE TABLE AccountProductType (
    [id] varchar(10) PRIMARY KEY,
    name nvarchar(20) not null
)
CREATE TABLE Currencies(
ID varchar(3)PRIMARY KEY,
Name nvarchar(20) NOT NULL,
ShortName varchar(3)NOT NULL
)
CREATE TABLE Accounts(
	id varchar(10)PRIMARY KEY,
	institutionCode varchar(10) not null,
	name nvarchar(30) not null,
	productTypeCode varchar(10) not null,
	currencyCode varchar(3) not null,
	userCode varchar(10) not null,
	deleted BIT not null,
	createDateTime DateTime not null,
	updateDateTime DateTime ,
	deleteDateTime DateTime 
	FOREIGN KEY  (institutionCode) REFERENCES Institutions(ID),
	FOREIGN KEY  (currencyCode) REFERENCES Currencies(ID),
	FOREIGN KEY  (productTypeCode) REFERENCES AccountProductType(ID)
)
CREATE TABLE Cupon(
	[id] varchar(10)　PRIMARY KEY,
      [name] nvarchar(20)NOT NULL,
      [amount]　decimal(13, 2)NOT NULL
)
CREATE TABLE CouponAccount(
	[id]varchar(10)　Primary KEY,
	[accountCode]　varchar(10)　NOT NULL
      ,[couponCode]varchar(10)NOT NULL
      ,[startDate]　date not null
      ,[endDate]　date not null
      ,[status] varchar(8)not null 
)
CREATE TABLE NoSerial(
	[id] [varchar](10) Primary KEY,
	[name] [nvarchar](20) NOT NULL,
	[prefix] [varchar](4) NOT NULL,
	[currentIndex] [int] NOT NULL,
)
CREATE TABLE MaturityInstruction(
id [varchar](10) Primary KEY,
name [varchar](10) not null
)
ALTER TABLE MaturityInstruction
ADD name [varchar](10) not null

CREATE TABLE Users(
id varchar(10) PRIMARY KEY
)
CREATE TABLE TimeDepositMaster(
	[id] [varchar](10) Primary KEY,
	accountCode varchar(10) not null,
	postDate Date not null,
	maturityDate date not null,
	principal decimal(13,2) not null,
	currencyCode varchar(3) not null,
	rate decimal(13,2) not null,
	interest decimal(13,2) not null,
	maturityInstructionCode  [varchar](10) not null
	FOREIGN KEY (accountCode) REFERENCES Accounts(id),
	FOREIGN KEY (currencyCode) REFERENCES Currencies(id),
	FOREIGN KEY (maturityInstructionCode) REFERENCES MaturityInstruction(id)
)