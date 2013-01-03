MyWorld myworld;
Body pin1;
Body seesaw1;
Body pin2;
Body seesaw2;
Body pin3;
Body seesaw3;

final float size = 10;

void createGround()
{
	MyPolygon polygon = new MyPolygon();
	polygon.createRect(0,0.05,5.0,0.05,0,0,0,color(0,200,0),true);
	polygon.createRect(-4.95,7.5,0.05,2.5,0,0,0,color(0,200,0),true);
	polygon.createRect(4.95,7.5,0.05,2.5,0,0,0,color(0,200,0),true);
	polygon.createRect(-4.5,4.95,0.5,0.05,0,0,0,color(0,200,0),true);
	polygon.createRect(4.5,4.95,0.5,0.05,0,0,0,color(0,200,0),true);
}

void createSeesaw()
{
	MyPolygon polygon = new MyPolygon();
	pin1 = polygon.createCircle(-2.5,9.5,0.05,0,0,color(200,0,0),true);
	seesaw1 = polygon.createRect(-2.5,6.5,1.5,0.1,0,1.0,0,color(200,0,0),false);

	pin2 = polygon.createCircle(2.5,9.5,0.05,0,0,color(200,0,0),true);
	seesaw2 = polygon.createRect(2.5,6.5,1.5,0.1,0,1.0,0,color(200,0,0),false);

	pin3 = polygon.createCircle(0,5.5,0.05,0,0,color(200,0,0),true);
	seesaw3 = polygon.createRect(0,2.5,1.5,0.1,0,1.0,0,color(200,0,0),false);
	
	MyJoint myJoint = new MyJoint();
	myJoint.createRevoluteJoint(pin1,seesaw1,pin1.getWorldCenter(),0,0,false);
	myJoint.createRevoluteJoint(pin2,seesaw2,pin2.getWorldCenter(),0,0,false);
	myJoint.createRevoluteJoint(pin3,seesaw3,pin3.getWorldCenter(),0,0,false);
}

void setup()
{
	myworld = new MyWorld();
	size(500,500,P2D);
	createGround();
	createSeesaw();
}

void draw()
{
	smooth();
	background(0);
	translate(width / 2,height);	
	scale(width / size,-height / size);

	if (random(0.5f * frameRate) < 1) {
		spawnObj();
	}

	myworld.getWorld().step(1.0f / frameRate,8);
	
	for (Body body = myworld.getWorld().getBodyList(); body != null;body = body.getNext()) {
		Object ud = body.getUserData();
		if (ud instanceof Drawable) {
			((Drawable)ud).drawObject(body);
		}
	}

	drawLine();
}

void spawnObj()
{
	float x = random(-4.0,4.0);
	float y = 10;
	int r = (int)random(100,255);
	int g = (int)random(100,255);
	int b = (int)random(100,255);

	float size = random(0.1,0.5);
	float angle = random(0,PI);
	float restitution = random(0.5,0.8);
	
	MyPolygon polygon = new MyPolygon();
	if (((int)random(0,100) % 2) == 0) {
		polygon.createRect(x,y,size,size,angle,1.0,restitution,color(r,g,b),false);
	} else {
		polygon.createCircle(x,y,size,1.0,restitution,color(r,g,b),false);
	}
}

void drawLine()
{

	Vec2 pin_pos = pin1.getPosition();
	Vec2 seesaw_pos = seesaw1.getPosition();

	pushMatrix();
	stroke(color(255,255,255));
	translate(pin_pos.x,pin_pos.y);
	rotate(seesaw1.getAngle());
	line(0,0,-1.5,-3.00);
	line(0,0,1.5,-3.0);
	popMatrix();

	pin_pos = pin2.getPosition();
	seesaw_pos = seesaw2.getPosition();

	pushMatrix();
	stroke(color(255,255,255));
	translate(pin_pos.x,pin_pos.y);
	rotate(seesaw2.getAngle());
	line(0,0,-1.5,-3.00);
	line(0,0,1.5,-3.0);
	popMatrix();

	pin_pos = pin3.getPosition();
	seesaw_pos = seesaw3.getPosition();

	pushMatrix();
	stroke(color(255,255,255));
	translate(pin_pos.x,pin_pos.y);
	rotate(seesaw3.getAngle());
	line(0,0,-1.5,-3.00);
	line(0,0,1.5,-3.0);
	popMatrix();
}
