package aula06;

public class TestShape {

	public static void main(String[] args) {
		
		//POINT TEST:
		OriginPoint p1 = new OriginPoint(5,8);
		OriginPoint p2 = new OriginPoint(-40,850);
		System.out.println(p1); 
		System.out.println(p2 + "\n");
		
		//CIRCLES TEST:
		Circle c1 = new Circle(-10,5,10);
		Circle c2 = new Circle(5,10,10);
		System.out.println(c1);
		System.out.println(c2 + "\n");
	
		//RECTANGLE TEST:
		Rectangle r1 = new Rectangle(0,0);
		r1.setLength(0,8); r1.setHeight(0,4);
		System.out.println(r1);
		
		//TRIANGLE TEST:
		Triangle t1 = new Triangle(0,0);
		t1.setBase(4, 8); t1.setSide1(8,16);t1.setSide2(4,16);
		System.out.println(t1);
	}

	

}
