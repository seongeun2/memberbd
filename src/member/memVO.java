package member;

import java.util.Date;

public class memVO {
	private int memnum;			//ȸ����ȣ
	private String memid;		//���̵�
	private String name;		//�̸�
	private String birth;		//����
	private String email;		//�̸���
	private String passwd;		//��й�ȣ
	private Date reg_date;		//������
	private String mem_level;	//ȸ�����
	
	
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getMem_level() {
		return mem_level;
	}
	public void setMem_level(String mem_level) {
		this.mem_level = mem_level;
	}
	
	
}
