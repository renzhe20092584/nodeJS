
1.世界：PhysicsWorld
控制整个世界里的物体，

和scene可以相互得到 getPhysicsWorld ，一个scene对应一个PhysicsWorld


关联两个物体				addJoint
设重力					setGravity
得到世界里所有刚体			getAllBodies
通过tag确定刚体			getBody(1)
检测射线运动				rayCast
是否显示刚体				setDebugDrawMask
判断是否触摸到刚体			getShapes
振频率					setUpdateRate


2.PhysicsBody getPhysicsBody 和 node 及其子类
实体矩形					PhysicsBody::createBox
空体box					PhysicsBody::createEdgeBox 			EdgeBox默认不受重力影像(静态刚体)
空体矩形					PhysicsBody::createEdgeSegment
圆						PhysicsBody::createCircle
多边形					PhysicsBody::createPolygon
静态刚体					setDynamic(false)
不受重力影响				setGravityEnable(false)
质量						setMass
等等						setMoment
加速度					setVelocity
角速度					setAngularVelocity
唯一标示					setTag


PhysicsBody::create()				可以放多个刚体形状
addShape							绘制刚体形状
setCategoryBitmask(0x01)			设置掩码
setCollisionBitmask
setContactTestBitmask
local2World							坐标转换
getVelocityAtWorldPoint
setPositionOffset					位置
setRotationOffset					角度



DrawNode、PhysicsBody、Node


set/get方法来设置和获取
CategoryBitmask：	碰撞掩码 					category   (0xFFFFFFFF)
ContactTestBitmask：	触发碰撞事件掩码			contact    (0x00000000)
CollisionBitmask：	是否发生碰撞掩码			collision  (0xFFFFFFFF)


body1 和 body2
触发碰撞事件(默认不触发)
(category1 & contact2)!=0 并且 (category2 & contact1)!=0
发生碰撞(默认)
(category1 & collision2)!=0 并且 (category2 & collision1)!=0


碰撞事件
EventListenerPhysicsContact 				多个刚体碰撞
EventListenerPhysicsContactWithBodies		两个刚体碰撞
EventListenerPhysicsContactWithShapes
EventListenerPhysicsContactWithGroup

1.onContactBegin      在接触开始时被调用，仅调用一次，通过放回true或者false来决定两个物体是否有碰撞。同时可以使用PhysicsContact::setData()来设置接触操作的用户数据。当返回false时，onContactPreSolve和onContactPostSolve将不会被调用，但是onContactSeperate将被调用一次。
2.onContactPreSlove   会在每一次被调用，通过放回true或者false来决定两个物体是否有碰撞，同样可以用ignore()来跳过后续的onContactPreSolve和onContactPostSolve回调函数。(默认返回true)
3.onContactPostSolve  在两个物体碰撞反应中的每个步骤中被处理调用。可以在里面做一些后续的接触操作。如销毁body
4.onContactSeperate   在两个物体分开时被调用，在每次接触时只调用一次，和onContactBegin配对使用。


http://cn.cocos2d-x.org/tutorial/show?id=1246


工具：
PhysicsEditor：比较麻烦
VertexHelper：代码形式工具

Android
projects/youPorjecyName/proj.android/jni/Application.mk
DCC_ENABLE_CHIPMUNK_INTEGRATION=1
DCC_ENABLE_BOX2D_INTEGRATION=1

ios
CC_ENABLE_CHIPMUNK_INTEGRATION=1
CC_ENABLE_BOX2D_INTEGRATION=1




其他
mac开启php server
http://blog.csdn.net/u012945598/article/details/17162039

NSLog(@"UniqueId: %@", [UIDevice currentDevice].identifierForVendor);
