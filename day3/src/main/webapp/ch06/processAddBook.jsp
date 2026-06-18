<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<%
    request.setCharacterEncoding("UTF-8");

    String bookId = request.getParameter("bookId");
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String unitPrice = request.getParameter("unitPrice");
    String unitsInStock = request.getParameter("unitsInStock");
    String publisher = request.getParameter("publisher");
    String releaseDate = request.getParameter("releaseDate");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String condition = request.getParameter("condition");
    
    int price;
    if (unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }
    

    long stock;
    if (unitsInStock.isEmpty()) {
        stock = 0;
    } else {
        stock = Long.valueOf(unitsInStock);
    }

    BookRepository dao = BookRepository.getInstance();


    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setAuthor(author);
    newBook.setUnitPrice(price);
    newBook.setUnitsInStock(stock);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setCondition(condition);
 
    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>