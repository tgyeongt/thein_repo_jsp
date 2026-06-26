package vote.model;

public class VoteCheckObj {

    //이름 (생년 나이 성별) 후보번호 투표시간 유권자확인
    private String v_name;
    private String v_jumin;
    private String m_no;
    private String v_time;
    private String v_confirm;

    public String getV_name() {
        return v_name;
    }
    public void setV_name(String v_name) {
        this.v_name = v_name;
    }
    public String getV_jumin() {
        return v_jumin;
    }
    public void setV_jumin(String v_jumin) {
        this.v_jumin = v_jumin;
    }
    public String getM_no() {
        return m_no;
    }
    public void setM_no(String m_no) {
        this.m_no = m_no;
    }
    public String getV_time() {
        return v_time;
    }
    public void setV_time(String v_time) {
        this.v_time = v_time;
    }
    public String getV_confirm() {
        return v_confirm;
    }
    public void setV_confirm(String v_confirm) {
        this.v_confirm = v_confirm;
    }
}

