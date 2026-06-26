package vote.model;

public class MemberObj {
    //후보번호 성명 소속정당 학력 주민번호 지역구 대표전화
    private String m_no;
    private String m_name;
    private String p_code;
    private String p_school;
    private String m_jumin;
    private String m_city;
    private String m_tel;
    
    public String getM_no() {
        return m_no;
    }
    public void setM_no(String m_no) {
        this.m_no = m_no;
    }
    public String getM_name() {
        return m_name;
    }
    public void setM_name(String m_name) {
        this.m_name = m_name;
    }
    public String getP_code() {
        return p_code;
    }
    public void setP_code(String p_code) {
        this.p_code = p_code;
    }
    public String getP_school() {
        return p_school;
    }
    public void setP_school(String p_school) {
        this.p_school = p_school;
    }
    public String getM_jumin() {
        return m_jumin;
    }
    public void setM_jumin(String m_jumin) {
        this.m_jumin = m_jumin;
    }
    public String getM_city() {
        return m_city;
    }
    public void setM_city(String m_city) {
        this.m_city = m_city;
    }
    public String getM_tel() {
        return m_tel;
    }
    public void setM_tel(String m_tel) {
        this.m_tel = m_tel;
    }
}
