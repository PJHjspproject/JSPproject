package db;
/* 두개의 테이블을 조인하여 검색하여 나온 에약한 정보를 저장해주는 클래스*/
public class CarConfirmBean {

	/*CarList 테이블에서 예약정보를 받아와서 저장할 변수*/
	private String carname;
	private String carimg;
	private int carprice;
	/*carorder 테이블에서 예약정보를 받아와서 저장할 변수*/
	private int orderid; //렌트시 주문할 ID
	private String carbegindate; //차량 대여한 날짜
	private int carreserveday; //차량렌트 기간저장
	private int carqty;//렌트할 차량의 수량
	private int carins; //보험적용여부
	private int carwifi;//와이파이 적용여부
	private int carnavi;//네비게이션 적용여부 (무료이므로 적용1, 미적용0)
	private int carbabyseat;//베이비시트 적용여부
	
	
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getCarimg() {
		return carimg;
	}
	public void setCarimg(String carimg) {
		this.carimg = carimg;
	}
	public int getCarprice() {
		return carprice;
	}
	public void setCarprice(int carprice) {
		this.carprice = carprice;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getCarbegindate() {
		return carbegindate;
	}
	public void setCarbegindate(String carbegindate) {
		this.carbegindate = carbegindate;
	}
	public int getCarreserveday() {
		return carreserveday;
	}
	public void setCarreserveday(int carreserveday) {
		this.carreserveday = carreserveday;
	}
	public int getCarqty() {
		return carqty;
	}
	public void setCarqty(int carqty) {
		this.carqty = carqty;
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
	
	
}
