预计 20日晚 完成，共20个工作日
编队(4.5天)
强化(3天)
进化(3天)
一览/出售(4天)
SP编队/一览(4天)
整体测试和修改问题(1天)


解决：
1.	该卡牌是可上阵卡牌（个别特殊卡牌无法上阵）
4.	该卡牌没有被装备在另一个卡组中
5.	该卡牌已经装备在当前卡组中
3.	在选择将要上阵卡牌的卡包界面中，已经装备的卡牌需要在卡面上显示“已装备”。
无论该卡牌装备在了当前卡组还是另一个卡组，只要处于上阵状态的卡牌均显示。
显示“已装备”的卡牌时无法选取的

每张母卡可以装备最多拥有3个子卡卡槽（每个卡槽可上阵1张子卡）

子卡上阵条件
3.	该卡牌没有被装备在另一个卡组中
4.	该卡牌已经装备在当前卡组中

子卡为主卡提供的加成比例计算

1.cost值干什么用的怎么提升

编队协议：
1.编队界面
1.2.切换编队(pvp  pve)
2.复制编队
3.替换卡牌
4.强化卡牌
5.统率力租借
6.保存配置

编队里的卡牌都是上阵的卡牌

1.
{
	网络请求：
	byte	1:pvp编队  2:pve编队
	返回:
	int cost上限
	int 借剩余时间(没有租借时间为0)
	卡牌数量
	卡牌列表
	{
		int		卡牌id
		int		卡牌品质 					1~12(1=N、2=N+、3=R、4=R+、5=S、6=S+、7=SS、8=SS+、9=SSS、10=SSS+、11=DRA、12=GOD)
		string	卡牌名
		byte 	属性              	   	1:A卡 2:火卡 3:水卡 4:木卡 
		int		卡牌等级(根据等级判断是否可进化)
		int		卡牌统率力值(cost)
		int		卡牌生命值HP
		int		卡牌攻击值
		int		卡牌防御值
		string	卡牌主卡技能
		byte 	是否又子卡         	   0：没有子卡  1：有子卡(一期是0)


		//二期子卡
		string  子卡技能
		子卡数量
		子卡列表
		{
			byte 	是否开启 			   0：没有开启(下面的字段忽略)  1：开启了
			卡牌id
			int		卡牌品质 					1~12(1=N、2=N+、3=R、4=R+、5=S、6=S+、7=SS、8=SS+、9=SSS、10=SSS+、11=DRA、12=GOD)
			string	卡牌名
			int		卡牌等级
			int		卡牌统率力值
			int		卡牌生命值
			int		卡牌攻击值
			int		卡牌防御值
			string	卡牌主卡技能
		}
	}
}

其他：
替换按钮
强化按钮
子卡按钮

卡牌公共：
进化图片显示图片
等级
品质


2.复制卡组
(1)弹窗提示
(2)请求pvp或pve卡组信息(网络)
(3)出现按钮：保存配置、cost租借


3.替换卡牌(上阵卡替换上阵卡、上阵卡替换没有上阵卡)
前提：
1.可上阵
2.卡牌属性=卡槽属性(子卡没有卡属性)
3.以上阵的卡牌不能再作为子卡上阵了(子卡有效)
替换后：
子卡卡槽是否开启

网络请求：
int		母卡id
网络返回：
子卡数量
子卡列表
{
	byte 	是否开启 			   0：没有开启(下面的字段忽略)  1：开启了
	卡牌id
	int		卡牌品质 					1~12(1=N、2=N+、3=R、4=R+、5=S、6=S+、7=SS、8=SS+、9=SSS、10=SSS+、11=DRA、12=GOD)
	string	卡牌名
	int		卡牌等级
	int		卡牌统率力值
	int		卡牌生命值
	int		卡牌攻击值
	int		卡牌防御值
	string	卡牌主卡技能
}


4.强化卡牌
{}
卡牌数量
卡牌列表
{
	卡牌id
	byte    标志 				0：没有上阵也不是子卡  1：上阵  2：子卡
	string  当前品质 				N R 。。。
	string  技能图标
	string	卡牌名
	byte 	属性                 1:A卡 2:火卡 3:水卡 4:木卡 
	int		卡牌等级
	int		卡牌统率力值
	int		卡牌生命值
	int		卡牌攻击值
	int		卡牌防御值
	string	卡牌主卡技能
	int 	卡牌经验
}


5.统率力租借
{
	网络请求：
	int		统率力点数
	返回：
	int 操作结果(成功、元宝不足)
	int 租借到计时
}


6.保存配置信息（编队里子卡或母卡改变了）
(1)弹窗提示(统率力足够)
(2)弹窗提示去租借cost值(统率力 不足够)
	选择租借那个cost弹窗：租借cost按钮一样弹窗
   (1)cost值租借弹窗(元宝足够)
   (2)cost值租借弹窗(元宝 不足够)
 		前往充值弹窗
{
	网络请求：
	byte 	1:(pvp->pve)  2:(pve->pvp)  3:其他保存
	{替换前卡牌id : 替换后的卡牌id , 。。。}
	返回：
	int 	操作结果(成功、元宝不足、超过cost值上限)
}


7.卡牌列表
{
	int		卡牌id
	int		卡牌品质 					1~12(1=N、2=N+、3=R、4=R+、5=S、6=S+、7=SS、8=SS+、9=SSS、10=SSS+、11=DRA、12=GOD)
	string	卡牌名
	byte 	属性              	   	1:A卡 2:火卡 3:水卡 4:木卡 
	int		卡牌等级(根据等级判断是否可进化)
	int		卡牌统率力值(cost)
	int		卡牌生命值HP
	int		卡牌攻击值
	int		卡牌防御值
	string	卡牌主卡技能
	int		卡牌经验
	byte	0：没有上阵、1：上阵、2：子卡
	string	子卡技能
}


子卡：
按钮：装备/替换、强化、卸除


子卡与母卡：
母卡被替换如果有子卡弹窗提示



















