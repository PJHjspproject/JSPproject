package mybean;

public class Person {

	private String name;//견주
	//강아지 객체를 담을 변수
	private Dog dog;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Dog getDog() {
		return dog;
	}
	public void setDog(Dog dog) {
		this.dog = dog;
	}
	
}
