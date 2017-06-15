package db;
//렌트할 차량에 대한정보를 저장하는 자바빈클래스(DTO)

public class CarOrderBean {
	
	private int orderid; //렌트시 주문할 ID
	//렌트할 차번호를 이용해서 join연산을 이용하기위해
	private int carno;//렌트할 차량의 차번호
	private int carqty;//렌트할 차량의 수량
	private int carreserveday; //차량렌트 기간저장
	private String carbegindate; //차량 대여한 날짜
	private int carins; //보험적용여부
	private int carwifi;//와이파이 적용여부
	private int carnavi;//네비게이션 적용여부 (무료이므로 적용1, 미적용0)
	private int carbabyseat;//베이비시트 적용여부
	private String memberphone; //비회원으로 렌트할 사람 폰번호 저장
	private String memberpass;//비회원 주문시 패스워드 저장
	
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getCarno() {
		return carno;
	}
	public void setCarno(int carno) {
		this.carno = carno;
	}
	public int getCarqty() {
		return carqty;
	}
	public void setCarqty(int carqty) {
		this.carqty = carqty;
	}
	public int getCarreserveday() {
		return carreserveday;
	}
	public void setCarreserveday(int carreserveday) {
		this.carreserveday = carreserveday;
	}
	public String getCarbegindate() {
		return carbegindate;
	}
	public void setCarbegindate(String carbegindate) {
		this.carbegindate = carbegindate;
	}
	public int getCarins() {
		return carins;
	}
	public void setCarins(int carins) {
		this.carins = carins;
	}
	public int getCarwifi() {
		return carwifi;
	}
	public void setCarwifi(int carwifi) {
		this.carwifi = carwifi;
	}
	public int getCarnavi() {
		return carnavi;
	}
	public void setCarnavi(int carnavi) {
		this.carnavi = carnavi;
	}
	public int getCarbabyseat() {
		return carbabyseat;
	}
	public void setCarbabyseat(int carbabyseat) {
		this.carbabyseat = carbabyseat;
	}
	public String getMemberphone() {
		return memberphone;
	}
	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}
	public String getMemberpass() {
		return memberpass;
	}
	public void setMemberpass(String memberpass) {
		this.memberpass = memberpass;
	}
	
	
	
	
}
