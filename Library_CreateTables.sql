CREATE DATABASE db_library;

CREATE TABLE tbl_library_branch (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(500) NOT NULL,
	Address VARCHAR(500) NOT NULL
);

INSERT INTO tbl_library_branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '9999 Sharp Street Mason OH'),
	('Central', '1111 Story Rd Hamilton OH'),
	('East', '2244 Library Ln West Chester OH'),
	('West', '5678 Books Dr Trenton OH')
;

CREATE TABLE tbl_publisher (
	Name VARCHAR(500) PRIMARY KEY NOT NULL,
	Address VARCHAR(500) NOT NULL,
	Phone VARCHAR(500) NOT NULL
);

INSERT INTO tbl_publisher
	(Name, Address, Phone)
	VALUES
	('Random House', '457 Madison Ave New York City NY', '(212)-777-1234'),
	('Simon & Schuster', '100 Broadway New York City NY', '(212)-721-9876'),
	('HarperCollins', '57th Street New York City NY', '(212)-759-6633')
;

CREATE TABLE tbl_borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Name VARCHAR(500) NOT NULL,
	Address VARCHAR(500) NOT NULL,
	Phone VARCHAR(500) NOT NULL
);

INSERT INTO tbl_borrower
	(Name, Address, Phone)
	VALUES
	('Joe Smith', '1123 Ash Ln West Chester OH', '(513)-777-7771'),
	('Ryan Smith', '1123 Ash Ln West Chester OH', '(513)-777-7771'),
	('Matt Finn', '9912 Berry Rd Hamilton OH', '(513)-659-2323'),
	('Scott Blue', '5756 Cherry Rd Hamilton OH', '(513)-658-1111'),
	('Kasey Collins', '1357 Pine Ln West Chester OH', '(513)-755-6392'),
	('Emily Tag', '1001 Farm Dr Trenton OH', '(513)-721-0012'),
	('Ann Michaels', '9009 Plum St Mason OH', '(513)-777-5001'),
	('Josh Wood', '9119 Apple St Mason OH', '(513)-777-9009')
;

INSERT INTO tbl_borrower --added person to test if they do not have a book checked out
	(Name, Address, Phone)
	VALUES
	('Mary Moe', '666 Hex Lane Hamilton OH', '(513)-333-666')
;

CREATE TABLE tbl_book (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(500) NOT NULL,
	PublisherName VARCHAR(500) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES tbl_publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_book
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Random House'),
	('The Shining', 'Random House'),
	('Carrie', 'Random House'),
	('The Muse', 'Random House'),
	('The Rising Sea', 'Random House'),
	('Flicka', 'Random House'),
	('Black Beauty', 'Random House'),
	('Origin', 'Random House'),
	('Before We Were Yours', 'Random House'),
	('Circle of Friends', 'Random House'),
	('Educated', 'HarperCollins'),
	('As She Fades', 'HarperCollins'),
	('Harvesting the Heart', 'HarperCollins'),
	('Grey Sister', 'HarperCollins'),
	('Cave of Bones', 'HarperCollins'),
	('Little Fires Everywhere', 'Simon & Schuster'),
	('The Brass Cupcake', 'Simon & Schuster'),
	('Family Tree', 'Simon & Schuster'),
	('Woe Is I', 'Simon & Schuster'),
	('Accidental Heroes', 'Simon & Schuster'),
	('Heart Land', 'Simon & Schuster'),
	('Harry Potter and the Chamber of Secrets', 'Random House'),
	('Harry Potter and the Order of the Phoenix', 'Random House')
;

CREATE TABLE tbl_book_authors (
	BookId INT PRIMARY KEY NOT NULL CONSTRAINT fk_BookId FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(500) NOT NULL
);


INSERT INTO tbl_book_authors
	(BookId, AuthorName)
	VALUES
	(12, 'Mark Lee'),
	(13, 'Stephen King'),
	(14, 'Stephen King'),
	(15, 'Penny Sky'),
	(16, 'Clive Cussler'),
	(17, 'Mary O Hara'),
	(18, 'Anna Sewell'),
	(19, 'Dan Brown'),
	(20, 'Lisa Wingate'),
	(21, 'Maeve Binchy'),
	(22, 'Tara Westover'),
	(23, 'Abbi Glines'),
	(24, 'Jodi Picoult'),
	(25, 'Mark Lawrence'),
	(26, 'Anne Hillerman'),
	(27, 'Celeste Ng'),
	(28, 'Dean Koontz'),
	(29, 'Susan Wiggs'),
	(30, 'Patrica O Conner'),
	(31, 'Danielle Steel'),
	(32, 'Lauren Brooke'),
	(33, 'JK Rowling'),
	(34, 'JK Rowling')
;

CREATE TABLE tbl_book_copies (
	BookId INT NOT NULL CONSTRAINT fk_BookId1 FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId INT NOT NULL CONSTRAINT fk_BranchId FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
	PRIMARY KEY (BookId, BranchId)
);

INSERT INTO tbl_book_copies
	(BookId, BranchId, No_Of_Copies)
	VALUES
	(12, 1, 2),
	(12, 2, 3),
	(12, 3, 2),
	(13, 2, 5),
	(13, 3, 3),
	(14, 2, 3),
	(14, 3, 6),
	(14, 4, 6),
	(15, 1, 4),
	(15, 2, 2),
	(15, 3, 2),
	(15, 4, 4),
	(16, 1, 3),
	(16, 2, 4),
	(16, 3, 2),
	(17, 4, 2),
	(18, 3, 2),
	(18, 2, 6),
	(19, 1, 6),
	(19, 2, 5),
	(20, 3, 6),
	(20, 4, 5),
	(21, 1, 6),
	(21, 2, 2),
	(22, 3, 4),
	(23, 4, 5),
	(23, 3, 5),
	(23, 2, 2),
	(23, 1, 5),
	(24, 1, 2),
	(24, 2, 5),
	(25, 3, 6),
	(25, 4, 2),
	(25, 1, 3),
	(26, 2, 5),
	(27, 3, 5),
	(28, 4, 4),
	(29, 1, 4),
	(30, 2, 5),
	(30, 3, 5),
	(31, 4, 4),
	(31, 1, 3),
	(32, 2, 4),
	(32, 3, 2),
	(32, 4, 6),
	(33, 1, 3),
	(33, 2, 3),
	(33, 3, 5),
	(33, 4, 5),
	(34, 1, 5),
	(34, 2, 6),
	(34, 3, 4),
	(34, 4, 5)
;

CREATE TABLE tbl_book_loans (
	BookId INT NOT NULL CONSTRAINT fk_BookId2 FOREIGN KEY REFERENCES tbl_book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchId INT NOT NULL CONSTRAINT fk_BranchId1 FOREIGN KEY REFERENCES tbl_library_branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

INSERT INTO tbl_book_loans
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	(13, 3, 1000, '2018-03-18', '2018-04-01'),
	(20, 3, 1000, '2018-03-18', '2018-04-01'),
	(25, 3, 1000, '2018-03-18', '2018-04-01'),
	(27, 3, 1000, '2018-03-18', '2018-04-01'),
	(33, 3, 1000, '2018-03-18', '2018-04-01'),
	(34, 3, 1000, '2018-03-18', '2018-04-01'),
	(25, 3, 1001, '2018-03-22', '2018-04-05'),
	(33, 3, 1001, '2018-03-22', '2018-04-05'),
	(34, 3, 1001, '2018-03-22', '2018-04-05'),
	(12, 2, 1002, '2018-04-01', '2018-04-15'),
	(13, 2, 1002, '2018-04-01', '2018-04-15'),
	(14, 2, 1002, '2018-04-01', '2018-04-15'),
	(16, 2, 1002, '2018-04-01', '2018-04-15'),
	(18, 2, 1002, '2018-04-01', '2018-04-15'),
	(24, 2, 1002, '2018-04-01', '2018-04-15'),
	(26, 2, 1002, '2018-04-01', '2018-04-15'),
	(30, 2, 1002, '2018-04-01', '2018-04-15'),
	(33, 2, 1002, '2018-04-01', '2018-04-15'),
	(34, 2, 1002, '2018-04-01', '2018-04-15'),
	(13, 2, 1003, '2018-03-25', '2018-04-08'),
	(18, 2, 1003, '2018-03-25', '2018-04-08'),
	(24, 2, 1003, '2018-03-25', '2018-04-08'),
	(26, 2, 1003, '2018-03-25', '2018-04-08'),
	(30, 2, 1003, '2018-03-25', '2018-04-08'),
	(33, 2, 1003, '2018-03-25', '2018-04-08'),
	(34, 2, 1003, '2018-03-25', '2018-04-08'),
	(13, 3, 1004, '2018-03-31', '2018-04-14'),
	(18, 3, 1004, '2018-03-31', '2018-04-14'),
	(22, 3, 1004, '2018-03-31', '2018-04-14'),
	(27, 3, 1004, '2018-03-31', '2018-04-14'),
	(30, 3, 1004, '2018-03-31', '2018-04-14'),
	(33, 3, 1004, '2018-03-31', '2018-04-14'),
	(34, 3, 1004, '2018-03-31', '2018-04-14'),
	(14, 4, 1005, '2018-04-03', '2018-04-17'),
	(17, 4, 1005, '2018-04-03', '2018-04-17'),
	(25, 4, 1005, '2018-04-03', '2018-04-17'),
	(28, 4, 1005, '2018-04-03', '2018-04-17'),
	(31, 4, 1005, '2018-04-03', '2018-04-17'),
	(33, 4, 1005, '2018-04-03', '2018-04-17'),
	(34, 4, 1005, '2018-04-03', '2018-04-17'),
	(15, 1, 1006, '2018-04-03', '2018-04-17'),
	(16, 1, 1006, '2018-04-03', '2018-04-17'),
	(21, 1, 1006, '2018-04-03', '2018-04-17'),
	(29, 1, 1006, '2018-04-03', '2018-04-17'),
	(33, 1, 1006, '2018-04-03', '2018-04-17'),
	(34, 1, 1006, '2018-04-03', '2018-04-17'),
	(12, 1, 1007, '2018-04-03', '2018-04-17'),
	(15, 1, 1007, '2018-04-03', '2018-04-17'),
	(21, 1, 1007, '2018-04-03', '2018-04-17'),
	(29, 1, 1007, '2018-04-03', '2018-04-17'),
	(33, 1, 1007, '2018-04-03', '2018-04-17'),
	(34, 1, 1007, '2018-04-03', '2018-04-17')
;

INSERT INTO tbl_book_loans --to test if retrieves information when duedate is today.
	VALUES
	(34, 1, 1007, '2018-04-03', '2018-04-4');