package vote;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionManager {
	// DB 연결 정보 (본인의 환경에 맞게 수정)
    private static final String URL = "jdbc:postgresql://localhost:5432/hrd";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    // 드라이버 클래스 이름
    private static final String DRIVER_CLASS = "org.postgresql.Driver";

    // 클래스가 로드될 때 드라이버를 메모리에 로딩
    static {
        try {
            Class.forName(DRIVER_CLASS);
            System.out.println("PostgreSQL JDBC 드라이버 로딩 성공!");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버를 찾을 수 없습니다. 빌드 도구(Maven/Gradle) 설정을 확인하세요.");
            e.printStackTrace();
        }
    }

    // Connection 객체를 반환하는 메서드
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
