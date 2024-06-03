CREATE DATABASE PRIMAGAMA
GO
USE PRIMAGAMA
GO

CREATE TABLE [MsStudent] (
	StudentID CHAR(5) PRIMARY KEY CHECK (StudentID LIKE 'ST[0-9][0-9][0-9]'),
	StudentName VARCHAR(50) NOT NULL,
	StudentGender VARCHAR(10) NOT NULL,
	StudentAddress VARCHAR(50)NOT NULL,
	StudentDOB DATE NOT NULL
);
INSERT INTO [MsStudent] (StudentID, StudentName, StudentGender, StudentAddress, StudentDOB)
VALUES 
    ('ST011', 'Michael Thompson', 'Male', '741 Oak St', '2001-02-28'),
    ('ST012', 'Emma Davis', 'Female', '369 Elm Ave', '2000-07-14'),
    ('ST013', 'Christopher Martinez', 'Male', '852 Pine Ln', '1999-09-20'),
    ('ST014', 'Ava Harris', 'Female', '147 Maple Rd', '2002-11-08'),
    ('ST015', 'Matthew Garcia', 'Male', '963 Cedar Blvd', '1998-06-16'),
    ('ST016', 'Mia Rodriguez', 'Female', '258 Spruce Dr', '2000-04-23'),
    ('ST017', 'Alexander Wilson', 'Male', '753 Birch St', '1999-08-06'),
    ('ST018', 'Charlotte Anderson', 'Female', '456 Walnut Ave', '2001-10-31'),
    ('ST019', 'William Taylor', 'Male', '159 Birch Ln', '2002-03-09'),
    ('ST020', 'Harper Moore', 'Female', '852 Ash Dr', '1998-01-12'),
    ('ST021', 'Daniel Walker', 'Male', '963 Oak St', '2000-09-05'),
    ('ST022', 'Sofia Clark', 'Female', '741 Elm Ave', '1999-12-23'),
    ('ST023', 'Joseph Lewis', 'Male', '369 Pine Ln', '2001-06-07'),
    ('ST024', 'Evelyn Baker', 'Female', '147 Maple Rd', '1998-04-30'),
    ('ST025', 'Samuel Green', 'Male', '852 Cedar Blvd', '2000-02-17');


CREATE TABLE [MsTeacher] (
	TeacherID CHAR(5) PRIMARY KEY CHECK (TeacherID LIKE 'TE[0-9][0-9][0-9]'),
	TeacherName VARCHAR(50) NOT NULL,
	TeacherGender VARCHAR(10) NOT NULL,
	TeacherAddress VARCHAR(50) NOT NULL
);



INSERT INTO [MsTeacher] (TeacherID, TeacherName, TeacherGender, TeacherAddress)
VALUES 
    ('TE001', 'John Smith', 'Male', '123 Main St'),
    ('TE002', 'Jane Johnson', 'Female', '456 Elm St'),
    ('TE003', 'Michael Williams', 'Male', '789 Oak Ave'),
    ('TE004', 'Sarah Davis', 'Female', '321 Pine Rd'),
    ('TE005', 'David Brown', 'Male', '654 Maple Ln'),
    ('TE006', 'Emily Taylor', 'Female', '987 Cedar Blvd'),
    ('TE007', 'Daniel Anderson', 'Male', '159 Spruce Dr'),
    ('TE008', 'Olivia Moore', 'Female', '753 Birch St'),
    ('TE009', 'Andrew Clark', 'Male', '258 Walnut Ave'),
    ('TE010', 'Sophia Green', 'Female', '852 Ash Ln'),
    ('TE011', 'Matthew Martinez', 'Male', '741 Oak St'),
    ('TE012', 'Emma Harris', 'Female', '369 Elm Ave'),
    ('TE013', 'Christopher Baker', 'Male', '852 Pine Ln'),
    ('TE014', 'Ava Lewis', 'Female', '147 Maple Rd'),
    ('TE015', 'William Walker', 'Male', '963 Cedar Blvd'),
    ('TE016', 'Mia Rodriguez', 'Female', '258 Spruce Dr'),
    ('TE017', 'Alexander Wilson', 'Male', '753 Birch St'),
    ('TE018', 'Charlotte Anderson', 'Female', '456 Walnut Ave'),
    ('TE019', 'Daniel Moore', 'Male', '159 Birch Ln'),
    ('TE020', 'Harper Taylor', 'Female', '852 Ash Dr');

CREATE TABLE [MsGrade] (
	GradeID CHAR(5) PRIMARY KEY CHECK (GradeID Like 'Gr[0-9][0-9][0-9]'),
	GradeName VARCHAR(50) NOT NULL
);



INSERT INTO [MsGrade] (GradeID, GradeName)
VALUES 
    ('Gr001', 'Grade 1'),
    ('Gr002', 'Grade 2'),
    ('Gr003', 'Grade 3'),
    ('Gr004', 'Grade 4'),
    ('Gr005', 'Grade 5');


CREATE TABLE [Course] (
    CourseID CHAR(5) PRIMARY KEY CHECK (CourseID LIKE 'CO[0-9][0-9][0-9]'),
    TeacherID CHAR(5) FOREIGN KEY REFERENCES MsTeacher(TeacherID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PackageID CHAR(5) FOREIGN KEY REFERENCES Package(PackageID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    CourseName VARCHAR(50) NOT NULL,
    CourseTime VARCHAR(20) NOT NULL,
    CourseDay VARCHAR(50) NOT NULL
);



	INSERT INTO [Course] (CourseID, TeacherID, PackageID, CourseName, CourseTime, CourseDay)
VALUES
    ('CO001', 'TE001', 'PK001', 'Mathematics', 60, 'Monday'),
    ('CO002', 'TE002', 'PK001', 'English Literature', 90, 'Tuesday'),
    ('CO003', 'TE003', 'PK002', 'Physics', 120, 'Wednesday'),
    ('CO004', 'TE004', 'PK002', 'Chemistry', 90, 'Thursday'),
    ('CO005', 'TE005', 'PK003', 'History', 60, 'Friday');


	


CREATE TABLE [Registration] (
    RegistrationID CHAR(5) PRIMARY KEY CHECK (RegistrationID LIKE 'RT[0-9][0-9][0-9]'),
    ParrentsID CHAR(5) FOREIGN KEY REFERENCES Parrents(ParrentsID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    StudentID CHAR(5) FOREIGN KEY REFERENCES MsStudent(StudentID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    GradeID CHAR(5) FOREIGN KEY REFERENCES MsGrade(GradeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Email VARCHAR (100) CHECK (Email LIKE '%@gmail.com') NOT NULL,
	[Password] VARCHAR (100) CHECK (LEN([Password]) >= 8) NOT NULL,
    PaymentType VARCHAR(50) NOT NULL,
    PaymentDOB DATE NOT NULL

);


INSERT INTO [Registration] 
VALUES
    ('RT001', 'PR001', 'ST011', 'Gr001', 'example1@gmail.com', 'password1', 'Credit Card', '2023-06-01'),
    ('RT002', 'PR002', 'ST012', 'Gr002', 'example2@gmail.com', 'password2', 'Cash', '2023-06-02'),
    ('RT003', 'PR003', 'ST013', 'Gr003', 'example3@gmail.com', 'password3', 'Debit Card', '2023-06-03'),
    ('RT004', 'PR004', 'ST014', 'Gr004', 'example4@gmail.com', 'password4', 'Cash', '2023-06-04'),
    ('RT005', 'PR005', 'ST015', 'Gr005', 'example5@gmail.com', 'password5', 'Credit Card', '2023-06-05');
	


CREATE TABLE [Parrents] (
	ParrentsID CHAR(5) PRIMARY KEY CHECK (ParrentsID LIKE 'PR[0-9][0-9][0-9]'),
	ParrentsPhoneNumber VARCHAR(12) NOT NULL,
	ParrentsName VARCHAR(50)NOT NULL,
	ParrentsAddress VARCHAR (50)NOT NULL,
	ParrentsGender VARCHAR (10) CHECK(ParrentsGender IN ('Female', 'Male')) NOT NULL
);


INSERT INTO [Parrents] (ParrentsID, ParrentsPhoneNumber, ParrentsName, ParrentsAddress, ParrentsGender)
VALUES
    ('PR001', 1234567890, 'John Smith', '123 Main St', 'Male'),
    ('PR002', 9876543210, 'Jane Johnson', '456 Elm St', 'Female'),
    ('PR003', 2345678901, 'Michael Williams', '789 Oak Ave', 'Male'),
    ('PR004', 8765432109, 'Sarah Davis', '321 Pine Rd', 'Female'),
    ('PR005', 3456789012, 'David Brown', '654 Maple Ln', 'Male');

	


CREATE TABLE [RegistrationDetail] (
	ID CHAR(5) PRIMARY KEY CHECK (ID LIKE 'II[0-9][0-9][0-9]'),
	PackageID CHAR(5) FOREIGN KEY REFERENCES Package(PackageID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	RegistrationID CHAR(5) FOREIGN KEY REFERENCES Registration(RegistrationID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Price VARCHAR (16) NOT NULL,
	RegistrationDetailTotal VARCHAR (16) NOT NULL
);

INSERT INTO [RegistrationDetail] (ID, PackageID, RegistrationID, Price, RegistrationDetailTotal)
VALUES
    ('II001', 'PK001', 'RT001', 100, 1000),
    ('II002', 'PK001', 'RT002', 200, 2000),
    ('II003', 'PK002', 'RT003', 150, 1500),
    ('II004', 'PK002', 'RT004', 250, 2500),
    ('II005', 'PK003', 'RT005', 120, 1200);

CREATE TABLE [Package] (
	PackageID CHAR(5) PRIMARY KEY CHECK (PackageID LIKE 'PK[0-9][0-9][0-9]'),
	PackageName VARCHAR(50) NOT NULL,
	PackagePrice VARCHAR (10) NOT NULL
	
);

INSERT INTO [Package] (PackageID, PackageName, PackagePrice)
VALUES
    ('PK001', 'Basic Package', 100),
    ('PK002', 'Standard Package', 200),
    ('PK003', 'Premium Package', 300),
    ('PK004', 'Advanced Package', 400),
    ('PK005', 'Ultimate Package', 500);


CREATE TABLE [Payment] (
	PaymentID CHAR(5) PRIMARY KEY CHECK (PaymentID LIKE 'PA[0-9][0-9][0-9]'),
	RegistrationID CHAR(5) FOREIGN KEY REFERENCES Registration(RegistrationID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentTotal VARCHAR (16) NOT NULL,
	PaymentType VARCHAR (50) NOT NULL,
	PaymentDOB DATE NOT NULL
);

INSERT INTO [Payment] (PaymentID, RegistrationID, PaymentTotal, PaymentType, PaymentDOB)
VALUES
    ('PA001', 'RT001', 100, 'Credit Card', '2023-06-01'),
    ('PA002', 'RT002', 200, 'Cash', '2023-06-02'),
    ('PA003', 'RT003', 150, 'Debit Card', '2023-06-03'),
    ('PA004', 'RT004', 250, 'Cash', '2023-06-04'),
    ('PA005', 'RT005', 120, 'Credit Card', '2023-06-05');

