class MyJoint {
	public MouseJoint createMouseJoint(Body body,Vec2 pos) {
		MouseJointDef jointDef = new MouseJointDef();
		jointDef.body1 = myworld.getWorld().getGroundBody();
		jointDef.body2 = body;
		jointDef.target = pos;
		jointDef.maxForce = 10;
		jointDef.dampingRatio = 1.0;
		jointDef.frequencyHz = frameRate;
		//jointDef.timeStep = 1 / frameRate;
		MouseJoint joint = (MouseJoint)(myworld.getWorld().createJoint((JointDef)jointDef));

		return joint;
	}

	public RevoluteJoint createRevoluteJoint(Body body1,Body body2,Vec2 pos,float motorSpeed,float maxMotorTorque,boolean enableMotor) {
		RevoluteJointDef jointDef = new RevoluteJointDef();
		jointDef.initialize(body1,body2,pos);

		// 回転速度の設定(6秒で1回転ぐらい)
		jointDef.motorSpeed = motorSpeed;
		// トルクの設定(大きいほど坂道に強くなる)
		jointDef.maxMotorTorque = maxMotorTorque;
		// 車輪を回すようにする。
		jointDef.enableMotor = enableMotor;

		RevoluteJoint joint = (RevoluteJoint)(myworld.getWorld().createJoint(jointDef));

		return joint;
	}

	public PulleyJoint createPulleyJoint(Body body1,Body body2,Vec2 ga1,Vec2 ga2,Vec2 anchor1,Vec2 anchor2,float r) {
		PulleyJointDef jointDef = new PulleyJointDef();
		jointDef.initialize(body1,body2,ga1,ga2,anchor1,anchor2,r);
		PulleyJoint joint = (PulleyJoint)(myworld.getWorld().createJoint(jointDef));

		return joint;
	}
}