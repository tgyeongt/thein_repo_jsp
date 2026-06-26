package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}

	public BookRepository() {
		Book book1 = new Book();
		book1.setBookId("B001");
		book1.setName("자바 프로그래밍 입문");
		book1.setUnitPrice(25000);
		book1.setAuthor("홍길동");
		book1.setPublisher("한빛미디어");
		book1.setUnitsInStock(150);
		book1.setCategory("IT/컴퓨터");
		book1.setReleaseDate("2026-01-15");
		// description 내용을 3줄 텍스트로 구성
		book1.setDescription("이 책은 자바 프로그래밍의 기초 문법부터 객체 지향 개념까지 초보자의 눈높이에 맞추어 친절하게 설명합니다.\n"
				+ "풍부한 시각 자료와 실무 위주의 예제 코드를 직접 따라 하며 자연스럽게 코딩 감각을 익힐 수 있습니다.\n"
				+ "단원별 연습 문제와 실습 프로젝트를 통해 혼자서도 완벽하게 자바를 마스터할 수 있도록 돕는 입문서입니다.");

		// [객체 2 생성 및 데이터 설정]
		Book book2 = new Book();
		book2.setBookId("B002");
		book2.setName("스프링 부트 실전 가이드");
		book2.setUnitPrice(32000);
		book2.setAuthor("이순신");
		book2.setPublisher("길벗");
		book2.setUnitsInStock(85);
		book2.setCategory("IT/컴퓨터");
		book2.setReleaseDate("2026-03-20");
		book2.setDescription("최신 스프링 부트 프레임워크를 활용하여 안정적이고 확장성 높은 웹 애플리케이션을 구축하는 실전 가이드입니다.\n"
				+ "REST API 설계, 데이터베이스 연동, 그리고 보안 설정까지 백엔드 개발자에게 꼭 필요한 핵심 기술을 다룹니다.\n"
				+ "실제 서비스 배포 프로세스를 처음부터 끝까지 실습해 보며 실무에 바로 투입 가능한 개발자로 성장해 보세요.");

		// [객체 3 생성 및 데이터 설정]
		Book book3 = new Book();
		book3.setBookId("B003");
		book3.setName("데이터 구조와 알고리즘");
		book3.setUnitPrice(28000);
		book3.setAuthor("강감찬");
		book3.setPublisher("인사이트");
		book3.setUnitsInStock(40);
		book3.setCategory("IT/컴퓨터");
		book3.setReleaseDate("2026-05-10");
		book3.setDescription("효율적인 프로그램 작성을 위한 핵심 알고리즘과 기본 구조(스택, 큐, 트리 등)를 깊이 있게 분석합니다.\n"
				+ "단순한 암기가 아니라 문제 해결 능력을 키울 수 있도록 다양한 유형의 코딩 테스트 기출 문제를 수록했습니다.\n"
				+ "시간 복잡도와 공간 복잡도를 최적화하는 방법을 배우며 코드의 성능을 한 단계 끌어올릴 수 있는 지침서입니다.");

		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}

	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}

	public Book getBookById(String bookId) {

		Book bookById = null;

		for (int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
}
