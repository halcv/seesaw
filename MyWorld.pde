class MyWorld {
	private World world;

	public MyWorld() {
		Vec2 gravity = new Vec2(0,-10); // 重力加速度
		AABB worldAABB = new AABB();
		worldAABB.lowerBound.set(-size,-size);
		worldAABB.upperBound.set(size,size);
		world = new World(worldAABB,gravity,true);
	}

	public World getWorld() {
		return world;
	}
}
