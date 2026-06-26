package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();

	public BookRepository() {
//		생성자를 이용한 book1초기화
		Book book1 = new Book("ISBN1234", "C# 프로그래밍", 27000);
		book1.setAuthor("우재남");
		book1.setDescription("C#을 처음 접하는 독자를 대상으로 ....");
		book1.setPublisher("한빛아카데미");
		book1.setCategory("IT모바일");
		book1.setUnitsInStock(1000);
		book1.setReleaseDate("2022/10/06");
//		생성자를 이용한 book2초기화
		Book book2 = new Book("ISBN1235", "자바마스터", 30000);
		book2.setAuthor("송미영");
		book2.setDescription("자바를 처음 배우는 학생을 위해...");
		book2.setPublisher("한빛아카데미");
		book2.setCategory("IT모바일");
		book2.setUnitsInStock(1000);
		book2.setReleaseDate("2023/01/01");
//		생성자를 이용한 book3초기화
		Book book3 = new Book("ISBN1236", "파이썬 프로그래밍", 30000);
		book3.setAuthor("최성철");
		book3.setDescription("파이썬으로 프로그래밍을 시작하는 입문자가...");
		book3.setPublisher("한빛아카데미");
		book3.setCategory("IT모바일");
		book3.setUnitsInStock(1000);
		book2.setReleaseDate("2023/01/01");

		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);

	}
	
	public ArrayList<Book> getAllBooks(){
		// 책 3권이 들어있음.
		return listOfBooks;
	}

}
