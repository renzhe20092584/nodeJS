
PhysicsMaterial:
密度、弹力、摩擦力


1.力，循序渐进——ApplyForce
顾名思义，ApplyForce方法会在刚体上施加一个力。学过物理力学的同学都知道，F=ma，有了力F就有了加速度a，有了加速度，物体就会有速度，就会慢慢动起来。(但是不会立马动起来，因为力不会直接影响速度)。

举个简单的例子，小明推一个静止的箱子，箱子不会立马飞出去，而是慢慢的、越来越快的动起来(减速也一样)。

2.速度，叠加——ApplyImpulse
与ApplyForce不同，ApplyImpulse不会产生力，而是直接影响刚体的速度。通过ApplyImpulse方法添加的速度会与刚体原有的速度叠加，产生新的速度。










offset：   重心点
velocity： 速度 
dadamping：阻尼 
rerestitution：弹力 
mamaterial：材质 
mass：质量
moment：力矩，当他碰到另一个刚体时候 ，会产生一股扭转力，做旋转运动
body：刚体，表示物理世界中的抽象实体，附带有物理属性
shape：刚体的形状，同一个body可以附加多个shape 该shape们不会发生碰撞
joint：关节，可以连接>=2个刚体 

1.世界：PhysicsWorld和2dx的scene关联
控制整个世界里的物体，


关联两个物体				addJoint
设重力					setGravity
得到世界里所有刚体			getAllBodies
通过tag确定刚体			getBody(1)
检测射线运动				rayCast
是否显示刚体				setDebugDrawMask
判断是否触摸到刚体			getShapes
振频率					setUpdateRate



刚体的类型大概有三种：静态刚体（static body）、棱柱刚体（Prismatic body）、动态刚体（Dynamic Body）。
其中棱柱刚体没有质量，但是可以有速度，引擎会根据熟读计算并更新它的位置。
2.PhysicsBody和2dx的node及其子类关联，通过形状确定刚体的大小以及碰撞的范围

实体矩形             PhysicsBody::createBox
空体                PhysicsBody::createEdgeBox 		EdgeBox默认不受重力影像(静态刚体)
空体矩形             PhysicsBody::createEdgeSegment
圆                  PhysicsBody::createCircle
多边形               PhysicsBody::createPolygon
。。。

PhysicsBody::create()				可以放多个刚体形状
addShape							绘制刚体形状


静态刚体					setDynamic(false)
不受重力影响				setGravityEnable(false)
质量						setMass
等等						setMoment
加速度					setVelocity
角速度					setAngularVelocity
唯一标示					setTag

setCategoryBitmask(0x01)			设置掩码
setCollisionBitmask
setContactTestBitmask
local2World							坐标转换
getVelocityAtWorldPoint
setPositionOffset					位置
setRotationOffset					角度



DrawNode、PhysicsBody、Node
PhysicsShape





刚体碰撞检测
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

onContactBegin      在接触开始时被调用，仅调用一次，通过放回true或者false来决定两个物体是否有碰撞。同时可以使用PhysicsContact::setData()来设置接触操作的用户数据。当返回false时，onContactPreSolve和onContactPostSolve将不会被调用，但是onContactSeperate将被调用一次。
onContactPreSlove   会在每一次被调用，通过放回true或者false来决定两个物体是否有碰撞，同样可以用ignore()来跳过后续的onContactPreSolve和onContactPostSolve回调函数。(默认返回true)
onContactPostSolve  在两个物体碰撞反应中的每个步骤中被处理调用。可以在里面做一些后续的接触操作。如销毁body
onContactSeperate   在两个物体分开时被调用，在每次接触时只调用一次，和onContactBegin配对使用。


auto contactListener = EventListenerPhysicsContactWithBodies::create(body1, body2);
contactListener->onContactBegin = CC_CALLBACK_1(PhysicsDemoOneWayPlatform::onContactBegin, this);
_eventDispatcher->addEventListenerWithSceneGraphPriority(contactListener, this);
bool PhysicsDemoOneWayPlatform::onContactBegin(PhysicsContact& contact)								//获得刚体的一些信息 contact
{
    return contact.getContactData()->normal.y < 0;
}



auto contactListener = EventListenerPhysicsContact::create();
contactListener->onContactBegin = CC_CALLBACK_1(PhysicsContactTest::onContactBegin, this);
_eventDispatcher->addEventListenerWithSceneGraphPriority(contactListener, this);
bool PhysicsContactTest::onContactBegin(PhysicsContact& contact)
{
    PhysicsBody* a = contact.getShapeA()->getBody();
    PhysicsBody* b = contact.getShapeB()->getBody();
    PhysicsBody* body = (a->getCategoryBitmask() == 0x04 || a->getCategoryBitmask() == 0x08) ? a : b;
    CC_UNUSED_PARAM(body);
    CC_ASSERT(body->getCategoryBitmask() == 0x04 || body->getCategoryBitmask() == 0x08);
    
    return true;
}


工具：
PhysicsEditor：比较麻烦
VertexHelper：代码形式工具
不规则图像碰撞检测，先用工具描刚体边，确定绘制多边形刚体的坐标点，之后在代码里绘制此刚体

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
