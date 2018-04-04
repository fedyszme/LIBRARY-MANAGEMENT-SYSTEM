CREATE PROCEDURE dbo.uspQueryTheLibrary
AS

SELECT a1.No_Of_Copies FROM tbl_book_copies a1 --returns the number of copies of The Lost Tribe
	INNER JOIN tbl_book a2 ON a2.BookId = a1.BookId
	INNER JOIN tbl_library_branch a3 ON a3.BranchId = a1.BranchId
	WHERE title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
;

SELECT  BranchName, a1.No_Of_Copies FROM tbl_book_copies a1 --returns the number of copies of The Lost Tribe in each Branch
	INNER JOIN tbl_book a2 ON a2.BookId = a1.BookId
	INNER JOIN tbl_library_branch a3 ON a3.BranchId = a1.BranchId
	WHERE title = 'The Lost Tribe'
	GROUP BY BranchName, No_Of_Copies
;

SELECT Name FROM tbl_borrower a1 --returns the names of people not in tbl_book_loans
	LEFT JOIN tbl_book_loans a2 ON a2.CardNo = a1.CardNo
	WHERE a2.CardNo IS NULL
;

SELECT a1.Title, a2.Name, a2.Address FROM tbl_book_loans a3 --returns the names of people not in tbl_book_loans
	INNER JOIN tbl_book a1 ON a1.BookId = a3.BookId
	INNER JOIN tbl_borrower a2 ON a2.CardNo = a3.CardNo
	INNER JOIN tbl_library_branch a4 ON a4.BranchId = a3.BranchId
	WHERE BranchName = 'Sharpstown' AND DueDate = CONVERT (date, GETDATE())
;

SELECT a2.BranchName, COUNT(a1.BranchId) AS LoanedBooks FROM tbl_book_loans a1
	INNER JOIN tbl_library_branch a2 ON a2.BranchId = a1.BranchId
	GROUP BY BranchName
;

SELECT a1.Name, a1.Address, COUNT(*) AS BooksCheckedOut FROM tbl_book_loans a2
	INNER JOIN tbl_borrower a1 ON a1.CardNo = a2.CardNo
	GROUP BY a1.Name, a1.Address
	HAVING COUNT(*) > 5
;

SELECT a2.title, a1.No_Of_Copies FROM tbl_book_copies a1
	INNER JOIN tbl_book a2 ON a2.BookId = a1.BookId
	INNER JOIN tbl_book_authors a4 ON a4.BookId = a1.BookId
	INNER JOIN tbl_library_branch a3 ON a3.BranchId = a1.BranchId
	WHERE AuthorName LIKE '%Stephen King%' AND BranchName = 'Central'
;

GO