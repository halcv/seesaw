class MyBaseObj {
	public Object setCircle(float radius,color c) {
		return (new Circle(radius,c));
	}

	public Object setRect(float hx,float hy,color c) {
		return (new Rect(hx,hy,c));
	}

	public Object setCircleImage(PImage img,float radius) {
		return (new CircleImage(img,radius));
	}

	public Object setRectImage(PImage img,float hx,float hy) {
		return (new RectImage(img,hx,hy));
	}
	
	class Circle implements Drawable {
		public float radius;
		public color c;
	
		public Circle(float radius,color c) {
			this.radius = radius;
			this.c = c;
		}

		public void drawObject(Body body) {
			pushMatrix();
			noStroke();
			fill(c);
			Vec2 pos = body.getPosition();
			translate(pos.x,pos.y);
			ellipse(0,0,radius * 2,radius * 2);
			popMatrix();
			if (pos.y < 0) {
				myworld.getWorld().destroyBody(body);
				body = null;
			}
		}
	}

	class Rect implements Drawable {
		public float hx;
		public float hy;
		public color c;
	
		public Rect(float hx,float hy,color c) {
			this.hx = hx;
			this.hy = hy;
			this.c  = c;
		}
	
		public void drawObject(Body body) {
			pushMatrix();
			noStroke();
			fill(c);
			Vec2 pos = body.getPosition();
			translate(pos.x,pos.y);
			rotate(body.getAngle());
			rect(-hx,-hy,hx * 2,hy * 2);
			popMatrix();
			if (pos.y < 0) {
				myworld.getWorld().destroyBody(body);
				body = null;
			}
		}
	}

	class CircleImage implements Drawable {
		public float radius;
		PImage img;
	
		public CircleImage(PImage img,float radius) {
			this.radius = radius;
			this.img = img;
		}

		public void drawObject(Body body) {
			pushMatrix();
			Vec2 pos = body.getPosition();
			translate(pos.x,pos.y);
			rotate(body.getAngle());
			image(img,-radius,-radius,radius * 2,radius * 2);
			popMatrix();
			if (pos.y < 0) {
				myworld.getWorld().destroyBody(body);
				body = null;
			}
		}
	};

	class RectImage implements Drawable {
		public PImage img;
		public float hx;
		public float hy;
	
		public RectImage(PImage img,float hx,float hy) {
			this.hx = hx;
			this.hy = hy;
			this.img = img;
		}
	
		public void drawObject(Body body) {
			pushMatrix();
			noStroke();
			Vec2 pos = body.getPosition();
			translate(pos.x,pos.y);
			rotate(body.getAngle());
			image(img,-hx,-hy,hx * 2,hy * 2);
			popMatrix();
			if (pos.y < 0) {
				myworld.getWorld().destroyBody(body);
				body = null;
			}
		}
	}
}
