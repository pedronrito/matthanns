import processing.pdf.*;

HDrawablePool pool, pool2, pool3;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#333333);
	smooth();

	colors = new HColorPool(#003366,#663333,#663366,#993333,#006633,#006666,#336699,#666666,#CC6633,#CC6666,#339966,#009999,#669999,#6699CC,#FF6666,#999999,#CC9999,#FF9966,#FF9999,#99CC99,#99CCCC,#CCCCCC,#FFCC66,#FFCCCC,#FFFFCC,#FFFFFF);

	pool3 = new HDrawablePool(200);
	pool3.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(30)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(#111111)
						.stroke(#333333)
						.anchorAt(H.CENTER)
						.size( (int)random(300,800) )
						//.rotate(45)
						//.rotate( (int)random(10,90) )
					;
					//d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(200);
	pool2.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(15)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(#555555)
						.stroke(#333333)
						.anchorAt(H.CENTER)
						.size( (int)random(300,800) )
						//.rotate(45)
						//.rotate( (int)random(10,90) )
					;
					//d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool = new HDrawablePool(200);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(8)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(#999999)
						.stroke(#333333)
						.anchorAt(H.CENTER)
						.size( (int)random(300,800) )
						//.rotate(45)
						//.rotate( (int)random(10,90) )
					;
					//d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	

	H.drawStage();
	noLoop();
}
 
void draw(){ 
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-1-######.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
