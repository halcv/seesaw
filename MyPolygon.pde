class MyPolygon {
	public Body createRect(float x,float y,float w,float h,float angle,float density,float restitution,color c,boolean bStandstill) {
		PolygonDef sd = new PolygonDef();
		sd.setAsBox(w,h);
		sd.density = density;
		sd.restitution = restitution;
		
		BodyDef bd = new BodyDef();
		bd.position.set(x,y);
		MyBaseObj myBaseObj = new MyBaseObj();
		bd.userData = myBaseObj.setRect(w,h,c);
		bd.angle = angle;
		
		Body body = myworld.getWorld().createBody(bd);
		body.createShape(sd);
		if (bStandstill == false) {
			body.setMassFromShapes();
		}

		return body;
	}

	public Body createCircle(float x,float y,float radius,float density,float restitution,color c,boolean bStandstill) {
		CircleDef sd = new CircleDef();
		sd.radius = radius;
		sd.density = density;
		sd.restitution = restitution;

		BodyDef bd = new BodyDef();
		bd.position.set(x,y);
		MyBaseObj myBaseObj = new MyBaseObj();
		bd.userData = myBaseObj.setCircle(sd.radius,c);

		Body body = myworld.getWorld().createBody(bd);
		body.createShape(sd);
		if (bStandstill == false) {
			body.setMassFromShapes();
		}
		
		return body;
	}

	public Body createCircleImage(PImage img,float x,float y,float radius,float density,float restitution,boolean bStandstill) {
		CircleDef sd = new CircleDef();
		sd.radius = radius;
		sd.density = density;
		sd.restitution = restitution;

		BodyDef bd = new BodyDef();
		bd.position.set(x,y);
		MyBaseObj myBaseObj = new MyBaseObj();
		bd.userData = myBaseObj.setCircleImage(img,sd.radius);

		Body body = myworld.getWorld().createBody(bd);
		body.createShape(sd);
		if (bStandstill == false) {
			body.setMassFromShapes();
		}
		
		return body;
	}

	public Body createRectImage(PImage img,float x,float y,float w,float h,float angle,float density,float restitution,boolean bStandstill) {
		PolygonDef sd = new PolygonDef();
		sd.setAsBox(w,h);
		sd.density = density;
		sd.restitution = restitution;
		
		BodyDef bd = new BodyDef();
		bd.position.set(x,y);
		MyBaseObj myBaseObj = new MyBaseObj();
		bd.userData = myBaseObj.setRectImage(img,w,h);
		bd.angle = angle;
		
		Body body = myworld.getWorld().createBody(bd);
		body.createShape(sd);
		if (bStandstill == false) {
			body.setMassFromShapes();
		}

		return body;
	}
}

