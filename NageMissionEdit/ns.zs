@sys00	
;SQuest6_Info	
	InputQuestInfo( 6, "波本市服装店之任务", "1. [坐标500,524]请与服装店主人对话." )
;EQuest6_Info	
;SQuest12_Info	
	InputQuestInfo( 12, "自由市服装店之任务", "1. [坐标401,319]请与服装店主人对话." )
;EQuest12_Info	
;SQuest4_Info	
	InputQuestInfo( 4, "波本市武器店之任务", "1.[坐标:525,542]请与武器店主人对话." )
;EQuest4_Info	
;SQuest10_Info	
	InputQuestInfo( 10, "自由市武器店之任务", "1.[坐标 :414,319]请与武器店主人对话." )
;EQuest10_Info	
;SQuest1_Info	
	InputQuestInfo( 1, "波本市执照任务", "1.前往大熊峡谷的路中，请点选<M>按键来开启小地图\n2.唯有在大熊峡谷商人购买的苹果一箱才能完成此任务\n3.完成此任务的玩家将会成功取得2级执照\n4.但务必要在一小时内完成任务." )
;EQuest1_Info	
;SQuest5_Info	
	InputQuestInfo( 5, "波本市药局之任务", "1. [坐标500,524]请与药局主人对话." )
;EQuest5_Info	
;SQuest2_Info	
	InputQuestInfo( 2, "波本市界面说明之任务", "1. 住办大楼的小姐将会说明界面的使用方法." )
;EQuest2_Info	
;SQuest13_Info	
	InputQuestInfo( 13, "波本市认识新朋友任务", "1. 认识新朋友喔.\n2. 请找住办大楼的小姐，她将会说明关于组队的详细事项\n3.请与战斗等级5以上的玩家建立组队.\n4.无法向战斗等级5以下的玩家申请组队." )
;EQuest13_Info	
;SQuest3_Info	
	InputQuestInfo( 3, "波本市便利商店之任务", "1.[坐标519,550]请参考便利商店的使用方法.\n2.请与便利商店店员对话." )
;EQuest3_Info	
;SQuest7_Info	
	InputQuestInfo( 7, "自由市执照任务", "1.前往大熊峡谷的路中，请点选<M>按键来开启小地图\n2.唯有在大熊峡谷商人购买的苹果一箱才能完成此任务\n3.完成此任务的玩家将会成功取得2级执照\n4.但务必要在一小时内完成任务." )
;EQuest7_Info	
;SQuest11_Info	
	InputQuestInfo( 11, "自由市药局之任务", "1. [坐标415,302]请与药局主人对话." )
;EQuest11_Info	
;SQuest8_Info	
	InputQuestInfo( 8, "自由市界面说明之任务", "1. 住办大楼的小姐将会说明界面的使用方法." )
;EQuest8_Info	
;SQuest14_Info	
	InputQuestInfo( 14, "自由市认识新朋友任务", "1. 认识新朋友喔.\n2.住办大楼的小姐将会说明关于组队的详细事项.\n3.请与战斗等级5以上的玩家成立组队.\n4.无法与战斗等级5以下的玩家申请组队." )
;EQuest14_Info	
;SQuest9_Info	
	InputQuestInfo( 9, "自由市便利商店之任务", "1. [坐标401,302]请参考便利商店的使用方法.\n2.请与便利商店店员对话." )
;EQuest9_Info	
end	
@sys01	
end	
@sys02	
end	
@sys03
end
@sys04
end
@sys05
end
@sys06
end
@sys07
end
@sys08
end
@sys09
end

@Npc00000
end		
@Npc00001		
end		
@Npc00002		
end		
@Npc00003		
;SQuest4_Npc00003		
;SCon4Npc00003		
CmpQuestNumStep( 4, 0 )		
if( yes==1 )		
{		
	CheckTalkNpc()	
	if(yes == 1)	
	{	
		CheckMapNo(1)
		if(yes == 1)
		{				
			GetBLv()			
			if(yes == 2)			
			{			
				CheckEnableQuest(4)		
				if(yes == 1)		
				{		
					CheckHasQuest(10)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 4, 100 )
						goto End_4Npc00003 
					}	
				}		
			}			
		}				
	}			
}				
;ECon4Npc00003				
:End_4Npc00003 				
CmpQuestNumStep( 4, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过任务限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(4, 0, 0)
				SetQuestNumStep(4, 105)
				goto q4_0
				goto End_QuestNpc00003 
			}	
		}		
	}			
}				

CmpQuestNumStep( 4, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过任务限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q4_0	
				SendTalkNpcToPlayer("最近过的怎样阿..")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4, 110)
					goto q4_1
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过任务限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_1
				SendTalkNpcToPlayer("如按【NEXT】键，将会出现简略的注解；如按【关闭】键，将会暂停进行中的任务。 ")
				goto End_QuestNpc00003 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4, 115)
					goto q4_2
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 4, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_2
				SendTalkNpcToPlayer("请按【Q】热键，将会出现任务视窗，可顺利查询目前所执行任务之相关事项。")
				goto End_QuestNpc00003 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(4, 120)
					goto q4_3
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 120 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q4_3	
				SendTalkNpcToPlayer("如要中断任务，请先按任务视窗【Q】热键，再点选【中断任务】按键。")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4,  125)
					goto q4_4
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 125 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(4)		;End	
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_4
				SendTalkNpcToPlayer("请选择适合角色技能的武器。 ")
				goto End_QuestNpc00003 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4,  130)
					goto q4_5
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 4, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q4_5	
				SendTalkNpcToPlayer("属于武术技能的角色，适合装备拳套类的武器；属于持械技能的角色，适合装备持械类武器。")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4,   135)
					goto q4_6
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 135 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_6
				SendTalkNpcToPlayer("依照各角色的力量与敏捷，玩家能穿戴的武器也会跟着改变，请深思后决定！")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4,  140)
					goto q4_7
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 4, 140 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_7
				SendTalkNpcToPlayer("这里所贩卖的战斗用道具都可进行升级，但只可升级到+3。")
				goto End_QuestNpc00003 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(4,   145)
					goto q4_8
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q4_8	
				SendTalkNpcToPlayer("还有我所贩卖的物品中，苍蝇拍与扫把等种类的武器是属于娱乐用品，请勿用于打怪喔！哈哈哈~因为此类武器无任何的杀伤力。 ")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4, 150)
					goto q4_9
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_9
				SendTalkNpcToPlayer("务必要有奈米宝石，才可进行道具升级。请先点选我，再按升级按键，将会出现更详细的说明喔！")
				goto End_QuestNpc00003 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4, 155)
					goto q4_10
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 4, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_10
				SendTalkNpcToPlayer("打怪、武器店、黑市中可以取得奈米宝石，但要记得从武器店或黑市所购买的奈米宝石，它的升级成功机率比打怪所获取的奈米宝石还要低。")
				goto End_QuestNpc00003 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(4, 160)
					goto q4_11
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 160 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q4_11	
				SendTalkNpcToPlayer("关于武器店的说明就到此为止囉！那我告诉你下一个任务地点，就是药局【493.572】，那你可以出发囉！喔~还有那里又很多的美女喔！如果遇到她们就申请一下拥抱吧！哈哈哈…")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4, 165)
					goto q4_12
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 4, 165 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(4)		;End	
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q4_12
				SendTalkNpcToPlayer("首先，请站在异性角色前，在聊天窗内输入 </抱 角色名称>，就可与其他玩家拥抱囉！\n下一个任务场所为【493,527】。")
				goto End_QuestNpc00003 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(4,  170)
					goto q4_13
					goto End_QuestNpc00003 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00003 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 4, 170 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(4)		;End
		SetQuestNumStep( 4, 9999 )		
		goto End_QuestNpc00003 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q4_13	
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务场所，请按【是】按键；如要走路移动，请按【否】按键。")	
				goto End_QuestNpc00003 	
			}		
			else		
			{		
				CheckPlayerAnserYes()	
				if(yes == 1)	
				{	
					GetBaseSkill()
					if(yes < 0)
					{			
						SendEventMsg("任务执行中产生错误，请稍后再试。")		
						goto End_QuestNpc00003 		
					}			
					else			
					{			
						CheckEmptyInv(2)		
						if(yes == 1)		
						{		
							GetBaseSkill()	
							if(yes == 0)	
							{	
								SendSkillUp(0,  100)
								PushInvItem(53171)
								PushInvItem(47006)
								MoveToPlayer(493, 530)
								SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")
								SendQuestComplete(4)		;End	
								SetQuestNumStep( 4, 9999 )			
								goto End_QuestNpc00003 			
							}				
							else				
							{				
								GetBaseSkill()			
								if(yes == 2)			
								{			
									SendSkillUp(2,   100)	
									PushInvItem(51574)	
									PushInvItem(47006)	
									MoveToPlayer(493, 530)		
									SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
									SendQuestComplete(4)		;End
									SetQuestNumStep( 4, 9999 )		
									goto End_QuestNpc00003 		
								}				
								else				
								{				
									GetBaseSkill()			
									if(yes == 6)			
									{			
										SendSkillUp(6, 100)		
										PushInvItem(12530)
										PushInvItem(47006)		
										MoveToPlayer(493, 530)		
										SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
										SendQuestComplete(4)		;End
										SetQuestNumStep( 4, 9999 )		
										goto End_QuestNpc00003 		
									}			
									else			
									{			
										GetBaseSkill()			
										if(yes == 7)			
										{			
											SendSkillUp(7, 100)		
											PushInvItem(12980)	
											PushInvItem(47006)	
											MoveToPlayer(493, 530)		
											SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
											SendQuestComplete(4)		;End
											SetQuestNumStep( 4, 9999 )		
											goto End_QuestNpc00003 		
										}			
									}				
								}					
							}						
						}							
						else							
						{	
							SendTalkEndNpcToPlayer("请重新整理物品栏后，再来光顾。")
							goto End_QuestNpc00003 
						}	
					}		
				}			
				else			
				{			
					CheckPlayerAnserNo()		
					if(yes == 1)		
					{		
						GetBaseSkill()	
						if(yes < 0)	
						{	
							SendEventMsg("任务执行中产生错误，请稍后再试。")
							goto End_QuestNpc00003 
						}					
						else					
						{					
							CheckEmptyInv(2)				
							if(yes == 1)				
							{				
								GetBaseSkill()			
								if(yes == 0)			
								{			
									SendSkillUp(0,  100)		
									PushInvItem(53171)		
									PushInvItem(47006)	
									SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
									SendQuestComplete(4)		;End
									SetQuestNumStep( 4, 9999 )		
									goto End_QuestNpc00003 		
								}			
								else				
								{				
									GetBaseSkill()			
									if(yes == 2)			
									{			
										SendSkillUp(2,   100)		
										PushInvItem(51574)
										PushInvItem(47006)			
										SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
										SendQuestComplete(4)		;End
										SetQuestNumStep( 4, 9999 )		
										goto End_QuestNpc00003 		
									}			
									else			
									{			
										GetBaseSkill()		
										if(yes == 6)		
										{			
											SendSkillUp(6, 100)		
											PushInvItem(12530)
											PushInvItem(47006)			
											SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
											SendQuestComplete(4)		;End
											SetQuestNumStep( 4, 9999 )		
											goto End_QuestNpc00003 		
										}			
										else			
										{			
											GetBaseSkill()		
											if(yes == 7)		
											{		
												SendSkillUp(7, 100)	
												PushInvItem(12980)	
												PushInvItem(47006)	
												SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")	
												SendQuestComplete(4)		;End
												SetQuestNumStep( 4, 9999 )		
												goto End_QuestNpc00003 		
											}			
										}				
									}					
								}						
							}							
							else							
							{							
								SendTalkEndNpcToPlayer("请重新整理物品栏后，再来光顾。")						
								goto End_QuestNpc00003 						
							}							
						}								
					}									
					else									
					{	
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
						goto End_QuestNpc00003 
					}	
				}		
			}			
		}				
	}					
}						

;EQuest4_Npc00003						
:End_QuestNpc00003						
end						
@Npc00004						
SendTalkNpcToPlayer("此处将您的宠物恢复满活力，请确认您有相应的宠物，并将其放至角色背包！")
CheckAnserNext()
if(yes==1)
{
		CheckEmptyInv(1)
		if(yes==1)
		{
			CheckHaveInvItem(47033)
			if(yes==1)
			{
				PopInvItem(47033)
				PushInvItem(47033)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("您的 石敢当(新人版) 已满血复活，请将游戏小退以保存宠物!")
				goto End_QuestNpc00004
			}
			else
			{
				CheckHaveInvItem(47013)
				if(yes==1)
				{
					PopInvItem(47013)
					PushInvItem(47013)
					SendOpenMenuInven()
						SendTalkEndNpcToPlayer("您的 小恶魔(新人版) 已满血复活，请将游戏小退以保存宠物!")
					goto End_QuestNpc00004
				}
				else
				{
					CheckHaveInvItem(47069)
					if(yes==1)
					{
						PopInvItem(47069)
						PushInvItem(47069)
						SendOpenMenuInven()
							SendTalkEndNpcToPlayer("您的 大巫师(新人版) 已满血复活，请将游戏小退以保存宠物!")
						goto End_QuestNpc00004
					}
					else
					{
						CheckHaveInvItem(47067)
						if(yes==1)
						{
							PopInvItem(47067)
							PushInvItem(47067)
							SendOpenMenuInven()
								SendTalkEndNpcToPlayer("您的 嘟嘟鱼(新人版) 已满血复活，请将游戏小退以保存宠物!")
							goto End_QuestNpc00004
						}
						else
						{
							CheckHaveInvItem(47032)
							if(yes==1)
							{
								PopInvItem(47032)
								PushInvItem(47032)
								SendOpenMenuInven()
									SendTalkEndNpcToPlayer("您的 石敢当(BOSS版) 已满血复活，请将游戏小退以保存宠物!")
								goto End_QuestNpc00004
							}
							else
							{
								CheckHaveInvItem(47012)
								if(yes==1)
								{
									PopInvItem(47012)
									PushInvItem(47012)
									SendOpenMenuInven()
										SendTalkEndNpcToPlayer("您的 小恶魔(BOSS版) 已满血复活，请将游戏小退以保存宠物!")
									goto End_QuestNpc00004
								}
								else
								{
									CheckHaveInvItem(47064)
									if(yes==1)
									{
										PopInvItem(47064)
										PushInvItem(47064)
										SendOpenMenuInven()
											SendTalkEndNpcToPlayer("您的 大巫师(BOSS版) 已满血复活，请将游戏小退以保存宠物!")
										goto End_QuestNpc00004
									}
									else
									{
										CheckHaveInvItem(47062)
										if(yes==1)
										{
											PopInvItem(47062)
											PushInvItem(47062)
											SendOpenMenuInven()
												SendTalkEndNpcToPlayer("您的 嘟嘟鱼(BOSS版) 已满血复活，请将游戏小退以保存宠物!")
											goto End_QuestNpc00004
										}
										else
										{
											CheckHaveInvItem(47034)
											if(yes==1)
											{
												PopInvItem(47034)
												PushInvItem(47034)
												SendOpenMenuInven()
													SendTalkEndNpcToPlayer("您的 蓝精灵(商城版) 已满血复活，请将游戏小退以保存宠物!")
												goto End_QuestNpc00004
											}
											else
											{
												CheckHaveInvItem(47007)
												if(yes==1)
												{
													PopInvItem(47007)
													PushInvItem(47007)
													SendOpenMenuInven()
														SendTalkEndNpcToPlayer("您的 大恶魔(商城版) 已满血复活，请将游戏小退以保存宠物!")
													goto End_QuestNpc00004
												}
												else
												{
													CheckHaveInvItem(47014)
													if(yes==1)
													{
														PopInvItem(47014)
														PushInvItem(47014)
														SendOpenMenuInven()
															SendTalkEndNpcToPlayer("您的 小巫师(商城版) 已满血复活，请将游戏小退以保存宠物!")
														goto End_QuestNpc00004
													}
													else
													{
														CheckHaveInvItem(47001)
														if(yes==1)
														{
															PopInvItem(47001)
															PushInvItem(47001)
															SendOpenMenuInven()
																SendTalkEndNpcToPlayer("您的 水叮当(商城版) 已满血复活，请将游戏小退以保存宠物!")
															goto End_QuestNpc00004
														}
														else
														{
															SendTalkEndNpcToPlayer("您尚未拥有相应的宠物，请确认后重新操作！")
															goto End_QuestNpc00004
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			SendTalkEndNpcToPlayer("请确认背包有空余位置!")
			goto End_QuestNpc00004
		}
}
else
{
	CheckAnserClose()
	if(yes==1)
	{
		goto End_QuestNpc00004
	}
}
;EQuest16_Npc00004
:End_QuestNpc00004
end						
@Npc00005						
end		
@Npc00006		
end		
@Npc00007		
end		
@Npc00008		
;SQuest5_Npc00008		
;SCon5Npc00008		
CmpQuestNumStep( 5, 0 )		
if( yes==1 )		
{		
	CheckTalkNpc()	
	if(yes == 1)	
	{	
		CheckMapNo(1)
		if(yes == 1)
		{				
			GetBLv()			
			if(yes == 2)			
			{			
				CheckEnableQuest(5)		
				if(yes == 1)		
				{		
					CheckHasQuest(11)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 5, 100 )
						goto End_5Npc00008 
					}	
				}		
			}			
		}				
	}			
}				
;ECon5Npc00008				
:End_5Npc00008 				
CmpQuestNumStep( 5, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(5, 0, 0)
				SetQuestNumStep(5, 105)
				goto q5_0
				goto End_QuestNpc00008 
			}	
		}		
	}			
}				

CmpQuestNumStep( 5, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q5_0	
				SendTalkNpcToPlayer("欢迎光临！这里是美女所经营的药局。")	
				goto End_QuestNpc00008 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5, 110)
					goto q5_1
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 5, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q5_1
				SendTalkNpcToPlayer("点选【Next】按键，将会出现本药局的使用方法；点选【关闭】按键，就可暂停执行中的任务。")
				goto End_QuestNpc00008 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5, 115)
					goto q5_2
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 5, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q5_2
				SendTalkNpcToPlayer("请按【Q】热键，就会出现任务视窗，将可查询任务之相关事项。")
				goto End_QuestNpc00008 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(5, 120)
					goto q5_3
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 5, 120 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q5_3	
				SendTalkNpcToPlayer("如要中断任务，请按【Q】热键，再按【中断任务】按键。")	
				goto End_QuestNpc00008 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5,  125)
					goto q5_4
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 5, 125 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(5)		;End	
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q5_4
				SendTalkNpcToPlayer("本药局所贩卖的药水类有补HP的【治伤药Vit】类、与补SP的【SP药】，以及可复活组队员的【意识恢复剂】等。")
				goto End_QuestNpc00008 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5,  130)
					goto q5_5
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 5, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q5_5	
				SendTalkNpcToPlayer("将【治愈药VIT】类与【SP药】存置快捷键后，按快捷键1~4号就可简单使用，并且同时按CTRL+鼠标左键或手动，将这些药水拉到快捷键上既可，快捷键界面位于画面左下角上。")	
				goto End_QuestNpc00008 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5,   135)
					goto q5_6
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 5, 135 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q5_6
				SendTalkNpcToPlayer("为了纪念光顾本药局，我告诉你一个好康好了！请在聊天窗内输入【/跳舞】，就可享受华丽的舞步喔！")	
				goto End_QuestNpc00008 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(5,  140)
					goto q5_7
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 5, 140 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q5_7
				SendTalkNpcToPlayer("关于药局的说明就到此为止囉！下一个任务地点为服装店【511, 524】，请一路小心！")
				goto End_QuestNpc00008 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(5,   145)
					goto q5_8
					goto End_QuestNpc00008 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00008 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 5, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(5)		;End
		SetQuestNumStep( 5, 9999 )		
		goto End_QuestNpc00008 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q5_8	
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务地点，请按【是】按键；如要亲自行走，请选择 【否】按键。")	
				goto End_QuestNpc00008 	
			}		
			else		
			{		
				CheckPlayerAnserYes()	
				if(yes == 1)	
				{	
					GetBaseSkill()
					if(yes<3)
					{
						SendSkillUp(1,   20)
					}
					else
					{
						SendSkillUp(1,   20)
					}
					SendLevelUp(1)
					MoveToPlayer(340,  420)
					SendEventMsg("成功完成任务！任务补赏为角色升一等级，并且还有格党技能点喔！格党技能点数愈高，战斗时的防御率就愈高。")
					SendQuestComplete(5)		;End	
					SetQuestNumStep( 5, 9999 )			
					goto End_QuestNpc00008 			
				}				
				else				
				{				
					CheckPlayerAnserNo()			
					if(yes == 1)			
					{			
						GetBaseSkill()
						if(yes<3)
						{
							SendSkillUp(1,   20)
						}
						else
						{
							SendSkillUp(1,   20)
						}	
						SendLevelUp(1)		
						SendEventMsg("成功完成任务！任务补赏为角色升一等级，并且还有格党技能点喔！格党技能点数愈高，战斗时的防御率就愈高。")		
						SendQuestComplete(5)		;End
						SetQuestNumStep( 5, 9999 )		
						goto End_QuestNpc00008 		
					}			
					else	
					{	
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
						goto End_QuestNpc00008 
					}	
				}		
			}			
		}				
	}					
}						

;EQuest5_Npc00008						
:End_QuestNpc00008						
end						
@Npc00009						
end						
@Npc00010			
end			
@Npc00011			
;SQuest6_Npc00011			
;SCon6Npc00011			
CmpQuestNumStep( 6, 0 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckMapNo(1)	
		if(yes == 1)	
		{	
			CheckEnableQuest(6)
			if(yes == 1)
			{			
				CheckHasQuest(12)		
				if(yes == 0)		
				{		
					GetBLv()	
					if(yes == 3)	
					{	
						SetQuestNumStep( 6, 100 )
						goto End_6Npc00011 
					}	
				}		
			}			
		}				
	}					
}						
;ECon6Npc00011						
:End_6Npc00011 				
CmpQuestNumStep( 6, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(6, 0, 0)
				SetQuestNumStep(6, 105)
				goto q6_0
				goto End_QuestNpc00011 
			}	
		}		
	}			
}				

CmpQuestNumStep( 6, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_0	
				SendTalkNpcToPlayer("哈囉！哈哈哈~这里是服装店。我们将会让你改头换面，让你变成很时髦的人喔！")	
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6, 110)
					goto q6_1
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")			
		SendQuestCancel(6)		;End	
		SetQuestNumStep( 6, 9999 )			
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_1
				SendTalkNpcToPlayer("如按【Next】键，将会出现服装店的说明；如按【关闭】键，则会暂停执行中的任务 。")
				goto End_QuestNpc00011 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6, 115)
					goto q6_2
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q6_2	
				SendTalkNpcToPlayer("请按【Q】热键，将会出现任务视窗，将可查询任务之相关事项。")	
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6, 120)
					goto q6_3
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 120 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_3
				SendTalkNpcToPlayer("如要中断任务，请先按【Q】热键，再按【中断任务】按键。")
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6,  125)
					goto q6_4
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 6, 125 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_4
				SendTalkNpcToPlayer("本都市贩卖着各式各样的时髦道具，与等级20可穿戴的防具。")
				goto End_QuestNpc00011 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(6,  130)
					goto q6_5
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 130 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q6_5	
				SendTalkNpcToPlayer("防具区分为男女两种，因此购买时要留意喔！")	
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6,   135)
					goto q6_6
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 135 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")			
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_6
				SendTalkNpcToPlayer("男生专用防具有【战斗─暴风─数位─数位强化─男用奈米】等系列，女生专用防具为【陶纤─突击─相位─相位强化─女用奈米】等系列 ，请做为参考喔！")
				goto End_QuestNpc00011 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6,  140)
					goto q6_7
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 6, 140 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q6_7	
				SendTalkNpcToPlayer("虽然本服装店贩卖各式各样的款式，但等到你升为更高等级而到乐透市【中上层城市】时，可以购买更多款式的物品喔！")	
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6,   145)
					goto q6_8
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 145 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_8	
				SendTalkNpcToPlayer("祝你成功完成任务！您的战斗等级已达4，以后可以轻松打倒史利克囉！")	
				goto End_QuestNpc00011 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6, 150)
					goto q6_9
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")			
		SendQuestCancel(6)		;End	
		SetQuestNumStep( 6, 9999 )			
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q6_9
				SendTalkNpcToPlayer("适合各等级的怪物明细，请做参考。【等级4─ 史利克，等级6─ 光头佬，等级10─金刚芭比，等级14─打手狂狼，等级18─娜娜女王】")
				goto End_QuestNpc00011 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(6, 155)
					goto q6_10
					goto End_QuestNpc00011 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 6, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务。")		
		SendQuestCancel(6)		;End
		SetQuestNumStep( 6, 9999 )		
		goto End_QuestNpc00011 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{				
			CheckPlayerAnserQuestion()			
			if(yes == 1)			
			{			
				:q6_10		
				CheckEmptyInv(2)		
				if(yes == 1)		
				{		
					SendTalkEndNpcToPlayer("玩家达等级7时，就可穿戴这件皮夹克，以后在战斗时会有很大的帮助。")	
					SendLevelUp(1)	
					GetBaseSkill()	
					if(yes < 3)	
					{	
						PushInvItem(56790)
						GetCharNum()
						if(yes < 2)
						{			
							PushInvItem(56096)		
							SendQuestComplete(6)		;End
							SetQuestNumStep( 6, 9999 )		
							goto End_QuestNpc00011 		
						}			
						else			
						{			
							PushInvItem(56749)		
							SendQuestComplete(6)		;End
							SetQuestNumStep( 6, 9999 )		
							goto End_QuestNpc00011 		
						}			
					}				
					else				
					{				
						GetCharNum()			
						if(yes < 2)			
						{			
							PushInvItem(19335)		
							SendQuestComplete(6)		;End
							SetQuestNumStep( 6, 9999 )		
							goto End_QuestNpc00011 		
						}			
						else			
						{			
							PushInvItem(19365)		
							SendQuestComplete(6)		;End
							SetQuestNumStep( 6, 9999 )		
							goto End_QuestNpc00011 		
						}			
					}				
				}	
				else	
				{	
					SendTalkEndNpcToPlayer("物品栏中需要2格的的空位，请重新整理栏位后，再来找我。")
					goto End_QuestNpc00011 
				}	
			}		
		}			
	}				
}					

;EQuest6_Npc00011					
:End_QuestNpc00011					
end					
@Npc00012					
end					
@Npc00013		
end		
@Npc00014		
end		
@Npc00015		
end		
@Npc00016		
;SQuest3_Npc00016		
;SCon3Npc00016		
CmpQuestNumStep( 3, 0 )		
if( yes==1 )		
{		
	GetBLv()	
	if(yes == 1)	
	{	
		CheckTalkNpc()
		if(yes == 1)				
		{				
			CheckMapNo(1)			
			if(yes == 1)			
			{			
				CheckEnableQuest(3)		
				if(yes == 1)		
				{		
					CheckHasQuest(9)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 3, 100 )
						goto End_3Npc00016 
					}	
				}		
			}			
		}		
	}			
}				
;ECon3Npc00016				
:End_3Npc00016 				
CmpQuestNumStep( 3, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(3, 0, 0)
				SetQuestNumStep(3, 105)
				goto q3_0
				goto End_QuestNpc00016 
			}	
		}		
	}			
}				

CmpQuestNumStep( 3, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q3_0	
				SendTalkNpcToPlayer("欢迎来到N-age的世界！")	
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3, 110)
					goto q3_1
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_1
				SendTalkNpcToPlayer("如按【Next】键时，将会出现便利商店的使用方法<购买食品，工读>\n；如按【关闭】 键，就可暂停进行中的任务。")
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3, 115)
					goto q3_2
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 3, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_2
				SendTalkNpcToPlayer("请按任务视窗【Q】键，就可查询任务之相关资料。")
				goto End_QuestNpc00016 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(3, 120)
					goto q3_3
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 120 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q3_3	
				SendTalkNpcToPlayer("如要中断任务，请按任务视窗【Q】热键后，再点选【中断任务】按键即可。")	
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3,  125)
					goto q3_4
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 125 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_4
				SendTalkNpcToPlayer("购买物品时，可以任意调整购买的数量，并且可直接按起Space bar来购买。")
				goto End_QuestNpc00016 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3,  130)
					goto q3_5
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 3, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q3_5	
				SendTalkNpcToPlayer("如要购买多个物品时，请点选鼠标右键。")	
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3,   135)
					goto q3_6
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 135 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_6	
				SendTalkNpcToPlayer("工读生只要把交代的物品，从办公事务所取回来，便利商店就会支付工读费用之系统。")	
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3,  140)
					goto q3_7
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 140 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(3)		;End	
		SetQuestNumStep( 3, 9999 )			
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_7
				SendTalkNpcToPlayer("小地图上有显示办公事务的所在位置，并且按【H】热键，就可确认大楼的正确坐标。")
				goto End_QuestNpc00016 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3,   145)
					goto q3_8
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q3_8	
				SendTalkNpcToPlayer("在游戏内只要按热键【M】，就会出现小地图，并且从小地图的绿色箭头来确认角色的所在位置。")	
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3, 150)
					goto q3_9
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 3, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_9
				SendTalkNpcToPlayer("便利商店的使用说明就到此为止囉！下一个任务场所为武器店【525,542】。")
				goto End_QuestNpc00016 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(3, 155)
					goto q3_10
					goto End_QuestNpc00016 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00016 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 3, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(3)		;End
		SetQuestNumStep( 3, 9999 )		
		goto End_QuestNpc00016 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q3_10
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务场所，请按【是】键；如要亲自行走，请按【否】键。")
				goto End_QuestNpc00016 
			}	
			else	
			{	
				CheckPlayerAnserYes()
				if(yes == 1)
				{				
					SendLevelUp(1)			
					if(yes == 1)			
					{			
						MoveToPlayer(525, 542)		
						SendEventMsg("任务补赏为角色上升一级喔！如已完成此任务或战斗等级已达3的玩家，就可前往下一个任务场所─便利商店。")		
						SendQuestComplete(3)		;End
						SetQuestNumStep( 3, 9999 )		
						goto End_QuestNpc00016 		
					}			
					else			
					{			
						SendTalkEndNpcToPlayer("任务进行中产生错误，请稍后再试。")		
						goto End_QuestNpc00016 		
					}			
				}				
				else					
				{					
					CheckPlayerAnserNo()				
					if(yes == 1)				
					{				
						SendLevelUp(1)			
						if(yes == 1)			
						{			
							SendEventMsg("任务补赏为角色上升一级喔！如已完成此任务或战斗等级已达3的玩家，就可前往下一个任务场所─便利商店。")		
							SendQuestComplete(3)		;End
							SetQuestNumStep( 3, 9999 )		
							goto End_QuestNpc00016 		
						}			
						else			
						{			
							SendTalkEndNpcToPlayer("任务进行中产生错误，请稍后再试。")		
							goto End_QuestNpc00016 
						}	
					}		
					else		
					{		
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")	
						goto End_QuestNpc00016 	
					}		
				}			
			}				
		}					
	}						
}							

;EQuest3_Npc00016							
:End_QuestNpc00016							
end
@Npc00017
end
@Npc00018
end
@Npc00019
end
@Npc00020
end
@Npc00021
end
@Npc00022
;SQuest1_Npc00022
;SCon1Npc00022
CmpQuestNumStep( 1, 0 )
if( yes==1 )
{					
	CheckEnableQuest(1)				
	if(yes == 1)				
	{				
		GetSkillLv(4)			
		if(yes >= 8)			
		{			
			GetLicense()		
			if(yes == 1)		
			{		
				GetELv()	
				if(yes >= 10)	
				{	
					CheckHasQuest(7)
					if(yes == 0)
					{
						SetQuestNumStep( 1, 100 )
						goto End_1Npc00022 
					}	
				}		
			}			
		}				
	}					
}						
;ECon1Npc00022						
:End_1Npc00022 						
CmpQuestNumStep( 1, 100 )						
if( yes==1 )						
{						
	CheckTalkNpc()					
	if(yes == 1)					
	{					
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			SendQuestBegin(1, 3600, 1)
			SetQuestNumStep(1, 105)
			goto q1_0
			goto End_QuestNpc00022 
		}	
	}		
}			

CmpQuestNumStep( 1, 105 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q1_0	
			SendTalkNpcToPlayer("%s玩家已完全具备二级执照的条件，\n如要继续对话，请按【Next】键。")	
			goto End_QuestNpc00022 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(1, 110)
				goto q1_1
				goto End_QuestNpc00022 
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}		
}			

CmpQuestNumStep( 1, 110 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q1_1
			SendTalkNpcToPlayer("只要通过最终审核就可取得2级执照喔！那最终审核是什么呢？就是传递的任务，只要把一件物品传递给我，这个审核就过关了。-_- 如果不愿意，那就随你囉！")
			goto End_QuestNpc00022 
		}	
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				SetQuestNumStep(1, 115)	
				goto q1_2	
				goto End_QuestNpc00022 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 1, 115 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)				
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q1_2	
			SendTalkNpcToPlayer("%s玩家只要通过2级执照的最终审核，%s玩家就可使用神奇的功能喔！")	
			goto End_QuestNpc00022 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(1, 120)
				goto q1_3
				goto End_QuestNpc00022 
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}		
}			

CmpQuestNumStep( 1, 120 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q1_3
			SendTalkNpcToPlayer("主要审核的内容如下：首先前往大熊峡谷找一位商人，从他那儿买一箱苹果之后，再把那箱苹果拿回我这儿，所有的审核就过关囉！喔~还有不要忘了有限时间喔！一定要在一小时内完成任务。")
			goto End_QuestNpc00022 
		}	
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				SetQuestNumStep(1,  125)	
				goto q1_4	
				goto End_QuestNpc00022 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 1, 125 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)				
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q1_4	
			SendTalkNpcToPlayer("简单介绍大熊峡谷好了！\n大熊峡谷的怪物比自由市凶残的很喔，请务必提高警觉！")	
			goto End_QuestNpc00022 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(1,  130)
				goto q1_5
				goto End_QuestNpc00022 
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}	
}		

CmpQuestNumStep( 1, 130 )		
if( yes==1 )		
{		
	CheckTalkNpc()	
	if(yes == 1)	
	{	
		:q1_5
		SendTalkEndNpcToPlayer("祝你好运喔！哈哈哈~ \n【先点选关闭< X >键之后，再按任务视窗< Q >键】")
		SetNextMeetNpcPropID(7,     4,      1161)
		SetQuestNumStep( 1, 135 )
		goto End_QuestNpc00022 
	}	
}		
CmpQuestNumStep( 1, 140 )				
if( yes==1 )				
{				
	CheckTalkNpc()			
	if(yes == 1)			
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			CheckHaveTInvBox(11021)	
			if(yes == 1)	
			{	
				SendTalkNpcToPlayer("哇~这么快就把<一箱苹果>拿回来囉！真是辛苦你了。")
				goto End_QuestNpc00022 
			}	
			else	
			{		
				SendTalkEndNpcToPlayer("你还没把一箱苹果取回来吗？不要忘了，要在限时间内拿回来喔！")	
				goto End_QuestNpc00022 	
			}		
		}			
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				CheckHaveTInvBox(11021)	
				if(yes == 1)	
				{	
					PopTInvBox(11021)
					SetQuestNumStep(1, 145)
					goto q1_6
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendTalkEndNpcToPlayer("哎呀！你的一箱苹果呢？请尽快拿回来喔！")
					goto End_QuestNpc00022 
				}	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 1, 145 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)				
	{				
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q1_6	
			SendTalkNpcToPlayer("哈哈哈…%s玩家，你终于成功过关囉！现在总算可以松口气囉！ ^^")	
			goto End_QuestNpc00022 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(1, 115)
				goto q1_7
				goto End_QuestNpc00022 
			}	
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(1, 0)
					goto End_QuestNpc00022 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00022 
				}	
			}		
		}			
	}				
}			

CmpQuestNumStep( 1, 150 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q1_7
			SendTalkEndNpcToPlayer("^^%s玩家由于你的努力，终于顺利取得2级执照！并且还可使用新的功能。\n新的功能就是 <可以购买药品箱子，并且变能使用贸易频道─【/贸易频道】 >  ")
			ChangeLicense(2)
			SendQuestComplete(1)
			SetQuestNumStep(1,  0)
			goto End_QuestNpc00022 
		}	
	}		
}			

;EQuest1_Npc00022			
:End_QuestNpc00022			
end			
@Npc00023			
end			
@Npc00024			
end			
@Npc00025			
end			
@Npc00026			
end			
@Npc00027
end
@Npc00028
end
@Npc00029
end
@Npc00030
end
@Npc00031
end
@Npc00032
end
@Npc00033
end
@Npc00034
end
@Npc00035		
end		
@Npc00036		
end		
@Npc00037		
end		
@Npc00038		
;SQuest10_Npc00038		
;SCon10Npc00038		
CmpQuestNumStep( 10, 0 )		
if( yes==1 )		
{		
	CheckTalkNpc()	
	if(yes == 1)	
	{	
		CheckMapNo(3)
		if(yes == 1)				
		{				
			GetBLv()			
			if(yes == 2)			
			{			
				CheckEnableQuest(10)		
				if(yes == 1)		
				{		
					CheckHasQuest(4)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 10, 100 )
						goto End_10Npc00038 
					}	
				}		
			}			
		}		
	}			
}				
;ECon10Npc00038				
:End_10Npc00038 				
CmpQuestNumStep( 10, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(10, 0, 0)
				SetQuestNumStep(10, 105)
				goto q10_0
				goto End_QuestNpc00038 
			}	
		}		
	}			
}				

CmpQuestNumStep( 10, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q10_0	
				SendTalkNpcToPlayer("你好！")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10, 110)
					goto q10_1
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_1
				SendTalkNpcToPlayer("如按【Next】键，将会出现简单的注解；如按【关闭】键，就可暂停目前进行中的任务。 ")
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10, 115)
					goto q10_2
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 10, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_2
				SendTalkNpcToPlayer("如要查询相关任务的事项，请按任务视窗【Q】热键。")
				goto End_QuestNpc00038 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(10, 120)
					goto q10_3
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 120 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q10_3	
				SendTalkNpcToPlayer("如要中断任务，请按任务视窗【Q】热键，再按起【中断任务】按键。")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,  125)
					goto q10_4
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 125 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_4
				SendTalkNpcToPlayer("请选择适合角色技能的武器。")
				goto End_QuestNpc00038 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,  130)
					goto q10_5
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 10, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q10_5	
				SendTalkNpcToPlayer("属于武术技能的角色，适合装备拳套类的武器；属于持械技能的角色，适合装备持械类武器。")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,   135)
					goto q10_6
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 135 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_6	
				SendTalkNpcToPlayer("购买武器时，必须依照力量与敏捷的数值来选择。")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,  140)
					goto q10_7
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 140 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(10)		;End	
		SetQuestNumStep( 10, 9999 )			
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_7
				SendTalkNpcToPlayer("这里所贩卖的战斗用武器都可进行升级，并且只能升级到+3。")
				goto End_QuestNpc00038 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,   145)
					goto q10_8
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q10_8	
				SendTalkNpcToPlayer("还有我所贩卖的物品中，苍蝇拍与扫把等种类的武器是属于娱乐用品，请勿用此类道具打怪喔！哈哈哈~因为这类武器无任何的杀伤力喔！ ")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10, 150)
					goto q10_9
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_9
				SendTalkNpcToPlayer("一定要有奈米宝石才可进行道具升级，请先点选我之后，再按升级按键，将会出现更详细的说明。")
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10, 155)
					goto q10_10
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 10, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_10
				SendTalkNpcToPlayer("透过打怪、武器店、黑市取得奈米宝石，但从武器店或黑市所购买的奈米宝石，它的升级成功率比打怪所获取的奈米宝石较低。")
				goto End_QuestNpc00038 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(10, 160)
					goto q10_11
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 160 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q10_11	
				SendTalkNpcToPlayer("关于武器店的说明就到此为止囉！下一个任务地点为药局【274.428】，药局附近有很多的美女喔！可以的话，跟那些美女申请一下拥抱吧！噗哈哈…")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10, 165)
					goto q10_12
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 10, 165 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q10_12
				SendTalkNpcToPlayer("请先站在异性角色前方，然后在聊天窗内输入  </抱 角色名称>，\n下一个任务地点为【坐标415,302】。")
				goto End_QuestNpc00038 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(10,  170)
					goto q10_13
					goto End_QuestNpc00038 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00038 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 10, 170 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 10, 9999 )		
		goto End_QuestNpc00038 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q10_13	
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务地点，请按【是】；如要亲自行走，请按【否】。")	
				goto End_QuestNpc00038 	
			}		
			else		
			{		
				CheckPlayerAnserYes()	
				if(yes == 1)	
				{	
					GetBaseSkill()
					if(yes < 0)			
					{			
						SendEventMsg("任务执行中产生错误，请稍后再试。")		
						goto End_QuestNpc00038 		
					}			
					else			
					{			
						CheckEmptyInv(2)		
						if(yes == 1)		
						{		
							GetBaseSkill()	
							if(yes == 0)	
							{	
								SendSkillUp(0,  100)
								PushInvItem(53171)
								PushInvItem(47006)
								MoveToPlayer(427, 429)
								SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")			
								SendQuestComplete(10)		;End	
								SetQuestNumStep( 10, 9999 )			
								goto End_QuestNpc00038 			
							}				
							else				
							{				
								GetBaseSkill()			
								if(yes == 2)			
								{			
									SendSkillUp(2, 100)		
									PushInvItem(51574)
									PushInvItem(47006)		
									MoveToPlayer(427, 429)		
									SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
									SendQuestComplete(10)		;End
									SetQuestNumStep( 10, 9999 )		
									goto End_QuestNpc00038 			
								}				
								else				
								{				
									GetBaseSkill()			
									if(yes == 6)			
									{			
										SendSkillUp(6,100)		
										PushInvItem(12530)	
										PushInvItem(47006)	
										MoveToPlayer(427, 429)		
										SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
										SendQuestComplete(10)		;End
										SetQuestNumStep( 10, 9999 )		
										goto End_QuestNpc00038 		
									}			
									else			
									{				
										GetBaseSkill()			
										if(yes == 7)			
										{			
											SendSkillUp(7, 100)		
											PushInvItem(12980)	
											PushInvItem(47006)	
											MoveToPlayer(427, 429)		
											SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
											SendQuestComplete(10)		;End
											SetQuestNumStep( 10, 9999 )		
											goto End_QuestNpc00038 		
										}			
									}				
								}					
							}						
						}							
						else	
						{	
							SendTalkEndNpcToPlayer("请重新整理物品栏后，再来光顾。")
							goto End_QuestNpc00038 
						}	
					}		
				}			
				else			
				{			
					CheckPlayerAnserNo()		
					if(yes == 1)		
					{		
						GetBaseSkill()	
						if(yes < 0)	
						{	
							SendEventMsg("任务执行中产生错误，请稍后再试。")
							goto End_QuestNpc00038 				
						}					
						else					
						{					
							CheckEmptyInv(2)				
							if(yes == 1)				
							{				
								GetBaseSkill()			
								if(yes == 0)			
								{			
									SendSkillUp(0,  100)		
									PushInvItem(53171)		
									PushInvItem(47006)	
									SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
									SendQuestComplete(10)		;End
									SetQuestNumStep( 10, 9999 )		
									goto End_QuestNpc00038 		
								}				
								else				
								{				
									GetBaseSkill()			
									if(yes == 2)			
									{			
										SendSkillUp(2, 100)		
										PushInvItem(51574)	
										PushInvItem(47006)		
										SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
										SendQuestComplete(10)		;End
										SetQuestNumStep( 10, 9999 )		
										goto End_QuestNpc00038 		
									}			
									else			
									{			
										GetBaseSkill()		
										if(yes == 6)			
										{			
											SendSkillUp(6, 100)		
											PushInvItem(12530)	
											PushInvItem(47006)		
											SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
											SendQuestComplete(10)		;End
											SetQuestNumStep( 10, 9999 )		
											goto End_QuestNpc00038 		
										}			
										else			
										{			
											GetBaseSkill()		
											if(yes == 7)		
											{		
												SendSkillUp(7, 100)	
												PushInvItem(12980)	
												PushInvItem(47006)	
												SendEventMsg("成功完成任务！任务补赏为武器，并且还有武术或持械的技能点数两分喔！请依照装备武器能力值来配角色的基本点数。")		
												SendQuestComplete(10)		;End
												SetQuestNumStep( 10, 9999 )		
												goto End_QuestNpc00038 		
											}			
										}				
									}					
								}						
							}							
							else							
							{							
								SendTalkEndNpcToPlayer("请重新整理物品栏后，再来光顾。")						
								goto End_QuestNpc00038 						
							}							
						}								
					}									
					else	
					{	
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
						goto End_QuestNpc00038 
					}	
				}		
			}			
		}				
	}					
}						

;EQuest10_Npc00038						
:End_QuestNpc00038						
end						
@Npc00039						
;SQuest11_Npc00039						
;SCon11Npc00039				
CmpQuestNumStep( 11, 0 )				
if( yes==1 )				
{				
	CheckTalkNpc()			
	if(yes == 1)			
	{			
		GetBLv()		
		if(yes == 2)		
		{		
			CheckEnableQuest(11)	
			if(yes == 1)	
			{	
				CheckHasQuest(5)
				if(yes == 0)
				{
					SetQuestNumStep( 11, 100 )
					goto End_11Npc00039 
				}	
			}		
		}			
	}				
}					
;ECon11Npc00039					
:End_11Npc00039 					
CmpQuestNumStep( 11, 100 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(11, 0, 0)
				SetQuestNumStep(11, 105)
				goto q11_0
				goto End_QuestNpc00039 
			}	
		}		
	}			
}				

CmpQuestNumStep( 11, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_0
				SendTalkNpcToPlayer("欢迎光临！这里是美女所经营的药局。")
				goto End_QuestNpc00039 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(11, 110)
					goto q11_1
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 110 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q11_1	
				SendTalkNpcToPlayer("点选【Next】按键，将会说明本药局的使用方法；点选【关闭】按键，就可暂停执行中的任务。")	
				goto End_QuestNpc00039 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11, 115)
					goto q11_2
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 115 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_2
				SendTalkNpcToPlayer("请按【Q】热键，将会出现任务视窗，可查询任务之相关事项。")
				goto End_QuestNpc00039 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11, 120)
					goto q11_3
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 11, 120 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q11_3	
				SendTalkNpcToPlayer("如要中断任务，请按【Q】热键，再按起【中断任务】按键。")	
				goto End_QuestNpc00039 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11,  125)
					goto q11_4
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 125 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_4	
				SendTalkNpcToPlayer("本药局所贩卖的药水类有补HP的【治伤药Vit】类、与补SP的【SP药】，以及可复活组队员的【意识恢复剂】等。")	
				goto End_QuestNpc00039 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11,  130)
					goto q11_5
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 130 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(11)		;End	
		SetQuestNumStep( 11, 9999 )			
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_5
				SendTalkNpcToPlayer("将【治愈药VIT】类与【SP药】存置快捷键上，就可按起快捷键1~4号来使用，并且同时按CTRL+鼠标左键或用手动把这些药水拉到快捷键上既可─快捷键界面位于画面左下角。")
				goto End_QuestNpc00039 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11,   135)
					goto q11_6
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 135 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q11_6	
				SendTalkNpcToPlayer("为了纪念光顾本药局，我告诉你一个好康喔！请在聊天窗内输入【/跳舞】，就可享受华丽的舞步喔！")	
				goto End_QuestNpc00039 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11,  140)
					goto q11_7
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 11, 140 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 2)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_7
				SendTalkNpcToPlayer("关于药局的说明就到此为止囉！下一个任务的地点为服装店【401,319】，请一路小心！")
				goto End_QuestNpc00039 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(11,   145)
					goto q11_8
					goto End_QuestNpc00039 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00039 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 11, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 2)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(11)		;End
		SetQuestNumStep( 11, 9999 )		
		goto End_QuestNpc00039 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q11_8
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务地点，请点选【是】按键；如要亲自行走，请点选 【否】按键。")
				goto End_QuestNpc00039 
			}	
			else	
			{	
				CheckPlayerAnserYes()
				if(yes == 1)
				{			
					GetBaseSkill()
					if(yes<3)
					{
						SendSkillUp(1,   20)
					}
					else
					{
						SendSkillUp(1,   20)
					}
					SendLevelUp(1)		
					MoveToPlayer(420, 450)		
					SendEventMsg("成功完成任务！任务补赏为角色升一等级，并且还有格党技能点喔！格党技能点数愈高，战斗时的防御率就愈高。")		
					SendQuestComplete(11)		;End
					SetQuestNumStep( 11, 9999 )		
					goto End_QuestNpc00039 		
				}			
				else			
				{			
					CheckPlayerAnserNo()		
					if(yes == 1)		
					{		
						GetBaseSkill()
						if(yes<3)
						{
							SendSkillUp(1,   20)
						}
						else
						{
							SendSkillUp(1,   20)
						}
						SendLevelUp(1)	
						SendEventMsg("成功完成任务！任务补赏为角色升一等级，并且还有格党技能点喔！格党技能点数愈高，战斗时的防御率就愈高。")		
						SendQuestComplete(11)		;End
						SetQuestNumStep( 11, 9999 )		
						goto End_QuestNpc00039 		
					}			
					else			
					{			
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")		
						goto End_QuestNpc00039 		
					}			
				}				
			}					
		}						
	}							
}								

;EQuest11_Npc00039
:End_QuestNpc00039
end
@Npc00040
end
@Npc00041
end
@Npc00042
end
@Npc00043
end
@Npc00044
end
@Npc00045
end
@Npc00046
;SQuest12_Npc00046				
;SCon12Npc00046				
CmpQuestNumStep( 12, 0 )				
if( yes==1 )				
{				
	CheckTalkNpc()			
	if(yes == 1)			
	{			
		CheckEnableQuest(12)		
		if(yes == 1)		
		{		
			CheckHasQuest(6)	
			if(yes == 0)	
			{	
				GetBLv()
				if(yes == 3)
				{	
					SetQuestNumStep( 12, 100 )
					goto End_12Npc00046 
				}	
			}		
		}			
	}				
}					
;ECon12Npc00046					
:End_12Npc00046 					
CmpQuestNumStep( 12, 100 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(12, 0, 0)
				SetQuestNumStep(12, 105)
				goto q12_0
				goto End_QuestNpc00046 
			}	
		}		
	}			
}				

CmpQuestNumStep( 12, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_0
				SendTalkNpcToPlayer("哈囉！嘻嘻…只要光顾本店的客人，都可变成很时髦的人喔！")
				goto End_QuestNpc00046 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(12, 110)
					goto q12_1
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 110 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q12_1	
				SendTalkNpcToPlayer("如点选【Next】键，将会出现服装店的简介；如点选【关闭】，就可暂停目前执行中的任务。")	
				goto End_QuestNpc00046 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12, 115)
					goto q12_2
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 115 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_2
				SendTalkNpcToPlayer("请按【Q】热键，将会出现任务视窗，可查询任务之相关事项。")
				goto End_QuestNpc00046 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12, 120)
					goto q12_3
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 12, 120 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_3
				SendTalkNpcToPlayer("如要中断任务，请按【Q】热键，再按起【中断任务】按键。")
				goto End_QuestNpc00046 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(12,  125)
					goto q12_4
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 125 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q12_4	
				SendTalkNpcToPlayer("本都市贩卖着各式各样的饰品道具与等级20的防具。")	
				goto End_QuestNpc00046 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12,  130)
					goto q12_5
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 130 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")			
		SendQuestCancel(10)		;End	
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_5
				SendTalkNpcToPlayer("防具区分成男女用，在购买防具时，请先行确认。")
				goto End_QuestNpc00046 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12,   135)
					goto q12_6
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 12, 135 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q12_6	
				SendTalkNpcToPlayer("男生专用防具有【战斗─暴风─数位─数位强化─男用奈米】等系列；女生专用防具有【陶纤─突击─相位─相位强化─女用奈米】等系列 ，请做为参考。")	
				goto End_QuestNpc00046 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12,  140)
					goto q12_7
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 140 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_7
				SendTalkNpcToPlayer("虽然本服装店贩卖着各式各样的款式，但等到玩家升为更高等级而到乐透市【中上层城市】时，就能购买更多款式的物品。")	
				goto End_QuestNpc00046 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12,   145)
					goto q12_8
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 12, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_8
				SendTalkNpcToPlayer("恭喜你喔！你已成功完成任务。您的战斗等级已达4，以后可以轻松打倒史利克囉！")
				goto End_QuestNpc00046 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(12, 150)
					goto q12_9
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 150 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 3)			
	{			
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q12_9	
				SendTalkNpcToPlayer("适合各等级的怪物明细如下，请做参考。【等级4─ 史利克，等级6─ 光头佬 ，等级10─金刚芭比， 等级14─打手狂狼，等级18─娜娜女王】")	
				goto End_QuestNpc00046 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(12, 155)
					goto q12_10
					goto End_QuestNpc00046 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00046 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 12, 155 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 3)				
	{				
		SendTalkEndNpcToPlayer("你已超过执行等级，而无法继续执行任务。")		
		SendQuestCancel(10)		;End
		SetQuestNumStep( 12, 9999 )		
		goto End_QuestNpc00046 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q12_10
				CheckEmptyInv(2)
				if(yes == 1)
				{					
					SendTalkEndNpcToPlayer("等级7的玩家才可穿戴这件皮夹克，并且在战斗时会有很大的帮助。")				
					SendLevelUp(1)				
					GetBaseSkill()				
					if(yes < 3)				
					{				
						PushInvItem(56790)			
						GetCharNum()			
						if(yes < 2)			
						{			
							PushInvItem(56096)		
							SendQuestComplete(12)		;End
							SetQuestNumStep( 12, 9999 )		
							goto End_QuestNpc00046 		
						}			
						else			
						{			
							PushInvItem(56749)		
							SendQuestComplete(12)		;End
							SetQuestNumStep( 12, 9999 )		
							goto End_QuestNpc00046 		
						}			
					}				
					else				
					{				
						GetCharNum()			
						if(yes < 2)			
						{			
							PushInvItem(19335)	
							SendQuestComplete(12)		;End
							SetQuestNumStep( 12, 9999 )		
							goto End_QuestNpc00046 		
						}			
						else			
						{			
							PushInvItem(19365)		
							SendQuestComplete(12)		;End
							SetQuestNumStep( 12, 9999 )		
							goto End_QuestNpc00046 		
						}			
					}				
				}					
				else					
				{					
					SendTalkEndNpcToPlayer("物品栏中需要2格的的空位，请重新整理栏位后，再来找我。")				
					goto End_QuestNpc00046 				
				}					
			}						
		}
	}	
}		

;EQuest12_Npc00046		
:End_QuestNpc00046		
end		
@Npc00047		
;SQuest9_Npc00047		
;SCon9Npc00047		
CmpQuestNumStep( 9, 0 )		
if( yes==1 )		
{		
	GetBLv()	
	if(yes == 1)	
	{	
		CheckTalkNpc()				
		if(yes == 1)				
		{				
			CheckMapNo(3)			
			if(yes == 1)			
			{			
				CheckEnableQuest(9)		
				if(yes == 1)		
				{		
					CheckHasQuest(3)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 9, 100 )
						goto End_9Npc00047 
					}	
				}		
			}	
		}		
	}			
}				
;ECon9Npc00047				
:End_9Npc00047 				
CmpQuestNumStep( 9, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(9, 0, 0)
				SetQuestNumStep(9, 105)
				goto q9_0
				goto End_QuestNpc00047 
			}	
		}		
	}			
}				

CmpQuestNumStep( 9, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q9_0	
				SendTalkNpcToPlayer("欢迎来到N-age的世界！")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9, 110)
					goto q9_1
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_1
				SendTalkNpcToPlayer("如按【Next】键，将会出现便利商店的使用方法<购买食品，工读>\n；如按【关闭】 键，将会暂停进行中的任务。")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9, 115)
					goto q9_2
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 9, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_2
				SendTalkNpcToPlayer("请按任务视窗【Q】热键，就可查询任务之相关资料。")
				goto End_QuestNpc00047 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(9, 120)
					goto q9_3
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 120 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q9_3	
				SendTalkNpcToPlayer("如要中断任务，请按任务视窗的【Q】热键后，再点选【中断任务】即可。")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9,  125)
					goto q9_4
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 125 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_4
				SendTalkNpcToPlayer("购买物品时，可以任意调整购买的数量，并且可直接按起Space bar来购买。")
				goto End_QuestNpc00047 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9,  130)
					goto q9_5
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 9, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_5
				SendTalkNpcToPlayer("如要购买多个物品时，请点选鼠标右键。")
				goto End_QuestNpc00047 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(9,   135)
					goto q9_6
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 135 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q9_6	
				SendTalkNpcToPlayer("工读生只要把交代的物品，从办公事务所取回来，便利商店将会支付工读费用之系统。")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9,  140)
					goto q9_7
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 140 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(9)		;End	
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_7
				SendTalkNpcToPlayer("小地图上有显示办公事务的所在位置，并且按【H】热键，就可确认大楼的正确坐标。")
				goto End_QuestNpc00047 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9,   145)
					goto q9_8
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 9, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q9_8	
				SendTalkNpcToPlayer("在游戏内只要按起【M】热键，将会显示小地图，并且可从小地图的绿色箭头来确认角色的所在位置。")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9, 150)
					goto q9_9
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 9, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_9
				SendTalkNpcToPlayer("便利商店的使用说明就到此为止囉！下一个任务场所为武器店【414,319】。")	
				goto End_QuestNpc00047 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(9, 155)
					goto q9_10
					goto End_QuestNpc00047 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00047 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 9, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(9)		;End
		SetQuestNumStep( 9, 9999 )		
		goto End_QuestNpc00047 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q9_10
				SendNpcQuestionEndYesNo("如要快速移动到下一个任务场所，请按 【是】键；如要亲自行走，请按 【否】键。")
				goto End_QuestNpc00047 
			}	
			else	
			{	
				CheckPlayerAnserYes()
				if(yes == 1)				
				{				
					SendLevelUp(1)			
					if(yes == 1)			
					{			
						MoveToPlayer(427, 450)		
						SendEventMsg("任务补赏为角色上升一等级。如已完成此任务或战斗等级已达3时，就可前往下一个任务场所─便利商店。")		
						SendQuestComplete(9)		;End
						SetQuestNumStep( 9, 9999 )		
						goto End_QuestNpc00047 		
					}			
					else			
					{			
						SendTalkEndNpcToPlayer("任务进行中产生错误，请稍后再试。")		
						goto End_QuestNpc00047 		
					}			
				}					
				else					
				{					
					CheckPlayerAnserNo()				
					if(yes == 1)				
					{				
						SendLevelUp(1)			
						if(yes == 1)			
						{			
							SendEventMsg("任务补赏为角色上升一等级。如已完成此任务或战斗等级已达3时，就可前往下一个任务场所─便利商店。")		
							SendQuestComplete(9)		;End
							SetQuestNumStep( 9, 9999 )		
							goto End_QuestNpc00047 		
						}			
						else			
						{			
							SendTalkEndNpcToPlayer("任务进行中产生错误，请稍后再试。")
							goto End_QuestNpc00047 
						}	
					}		
					else		
					{		
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")	
						goto End_QuestNpc00047 	
					}		
				}			
			}				
		}					
	}						
}							

;EQuest9_Npc00047							
:End_QuestNpc00047
end
@Npc00048
end
@Npc00049
end
@Npc00050
end
@Npc00051
end
@Npc00052
end
@Npc00053
;SQuest7_Npc00053
;SCon7Npc00053
CmpQuestNumStep( 7, 0 )
if( yes==1 )					
{					
	CheckEnableQuest(7)				
	if(yes == 1)				
	{				
		GetSkillLv(4)			
		if(yes >= 8)			
		{			
			GetLicense()		
			if(yes == 1)		
			{		
				GetELv()	
				if(yes >= 10)	
				{	
					CheckHasQuest(1)
					if(yes == 0)
					{	
						SetQuestNumStep( 7, 100 )
						goto End_7Npc00053 
					}	
				}		
			}			
		}				
	}					
}						
;ECon7Npc00053						
:End_7Npc00053 						
CmpQuestNumStep( 7, 100 )						
if( yes==1 )						
{						
	CheckTalkNpc()					
	if(yes == 1)					
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			SendQuestBegin(7, 3600, 1)
			SetQuestNumStep(7, 105)
			goto q7_0
			goto End_QuestNpc00053 
		}	
	}		
}			

CmpQuestNumStep( 7, 105 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)			
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q7_0	
			SendTalkNpcToPlayer("%s玩家已成功具备二级执照的条件，\n如要继续对话，请按【Next】键。")	
			goto End_QuestNpc00053 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(7, 110)
				goto q7_1
				goto End_QuestNpc00053 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}	
	}		
}			

CmpQuestNumStep( 7, 110 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q7_1
			SendTalkNpcToPlayer("只要通过最终审核就可取得2级执照喔！最终审核是什么呢？就是传递的任务，只要把一件物品传递给我，这个审核就过关了。-_- 如果不愿意，那就随你囉！")
			goto End_QuestNpc00053 
		}			
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				SetQuestNumStep(7, 115)	
				goto q7_2	
				goto End_QuestNpc00053 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 7, 115 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)			
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q7_2	
			SendTalkNpcToPlayer("%s玩家只要通过最终审核就能取得2级执照喔！并且%s玩家还可使用神奇的能力喔！")	
			goto End_QuestNpc00053 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(7, 120)
				goto q7_3
				goto End_QuestNpc00053 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}	
	}		
}			

CmpQuestNumStep( 7, 120 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q7_3
			SendTalkNpcToPlayer("主要审核内容如下：首先前往大熊峡谷找一位商人，从他那儿买一箱苹果之后，再把那箱苹果拿回我这儿，所有的审核就过关囉！喔~还有不要忘了有限时间喔，一定要在一小时内完成喔！")
			goto End_QuestNpc00053 
		}			
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				SetQuestNumStep(7,  125)	
				goto q7_4	
				goto End_QuestNpc00053 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 7, 125 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)			
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q7_4	
			SendTalkNpcToPlayer("简单说明一下大熊峡谷好了！ \n大熊峡谷比自由市的怪物更为凶悍，并且还有限时间喔！请铭记在心。")	
			goto End_QuestNpc00053 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(7,  130)
				goto q7_5
				goto End_QuestNpc00053 	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}
	}	
}		

CmpQuestNumStep( 7, 130 )		
if( yes==1 )		
{		
	CheckTalkNpc()	
	if(yes == 1)	
	{	
		:q7_5
		SendTalkEndNpcToPlayer("祝你好运！哈哈哈 \n【请先点选关闭< X >按键，再按起任务视窗的 < Q >键，就可参考相关的说明。】")
		SetNextMeetNpcPropID(7,     4,      1161)
		SetQuestNumStep( 7, 135 )
		goto End_QuestNpc00053 
	}	
}				
CmpQuestNumStep( 7, 140 )				
if( yes==1 )				
{				
	CheckTalkNpc()			
	if(yes == 1)			
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			CheckHaveTInvBox(11021)	
			if(yes == 1)	
			{	
				SendTalkNpcToPlayer("嗯不敢相信！这么快把<苹果一箱>取回来，真是辛苦你囉！")
				goto End_QuestNpc00053 
			}	
			else		
			{		
				SendTalkEndNpcToPlayer("你还没拿到苹果箱子吗？务必要在限制时间内，要把苹果一箱拿回来喔！")	
				goto End_QuestNpc00053 	
			}		
		}			
		else			
		{			
			CheckAnserNext()		
			if(yes == 1)		
			{		
				CheckHaveTInvBox(11021)	
				if(yes == 1)	
				{	
					PopTInvBox(11021)
					SetQuestNumStep(7, 145)
					goto q7_6
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendTalkEndNpcToPlayer("喔？你的苹果箱子呢？请尽快取回来喔！")
					goto End_QuestNpc00053 
				}	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 7, 145 )					
if( yes==1 )					
{					
	CheckTalkNpc()				
	if(yes == 1)				
	{			
		CheckPlayerAnserQuestion()		
		if(yes == 1)		
		{		
			:q7_6	
			SendTalkNpcToPlayer("哈哈哈~%s玩家终于顺利过关，现在总算可以松口气了。^^")	
			goto End_QuestNpc00053 	
		}		
		else		
		{		
			CheckAnserNext()	
			if(yes == 1)	
			{	
				SetQuestNumStep(7, 115)
				goto q7_7
				goto End_QuestNpc00053 
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00053 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00053 
				}	
			}		
		}			
	}		
}			

CmpQuestNumStep( 7, 150 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			:q7_7
			SendTalkEndNpcToPlayer("^^%s玩家由于你的努力，终于取得2级执照，并且还可使用新的功能喔！\n新的功能就是 <可以购买药品箱子，并且还能使用贸易频道─【/贸易频道】 >  ")
			ChangeLicense(2)
			SendQuestComplete(7)
			SetQuestNumStep(7,  0)
			goto End_QuestNpc00053 
		}	
	}		
}			

;EQuest7_Npc00053			
:End_QuestNpc00053			
end			
@Npc00054			
end			
@Npc00055			
end			
@Npc00056			
end			
@Npc00057			
end			
@Npc00058			
end			
@Npc00059			
;SQuest1_Npc00059			
;SCon1Npc00059			
CmpQuestNumStep( 1, 0 )			
if( yes==1 )			
{			
	CheckEnableQuest(1)		
	if(yes == 1)		
	{		
		GetSkillLv(4)	
		if(yes >= 8)	
		{	
			GetLicense()
			if(yes == 1)			
			{			
				GetELv()		
				if(yes >= 10)		
				{		
					CheckHasQuest(7)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 1, 100 )
						goto End_1Npc00059 
					}	
				}		
			}			
		}				
	}					
}						
;ECon1Npc00059			
:End_1Npc00059 			
CmpQuestNumStep( 1, 135 )			
if( yes==1 )			
{			
	CheckTalkNpc()		
	if(yes == 1)		
	{		
		CheckPlayerAnserQuestion()	
		if(yes == 1)	
		{	
			SendNpcQuestionYesNo("关于任务的事情来找我的吗？苹果一箱的价钱为2200元，如要购买苹果一箱，请按【是】；不愿购买请按【否】。")
			goto End_QuestNpc00059 
		}	
		else	
		{	
			CheckPlayerAnserYes()			
			if(yes == 1)			
			{			
				CheckEmptyTInv(1)		
				if(yes == 1)		
				{		
					PopMoney(2200)	
					if(yes == 1)	
					{	
						PushTInvBox(11021)
						SendTalkEndNpcToPlayer("谢谢囉！苹果的质量我可以跟你保证。\n只要回头走，应该可以找得到路的，祝你好运！")
						SetQuestNumStep( 1, 140 )
						goto End_QuestNpc00059 
					}	
					else	
					{	
						SendTalkEndNpcToPlayer("请先确认身上持有的金钱后，再来购买苹果一箱。")
						goto End_QuestNpc00059 
					}	
				}		
				else		
				{		
					SendTalkEndNpcToPlayer("请重新整理物品栏后，再来找我。")	
					goto End_QuestNpc00059 	
				}		
			}			
			else			
			{			
				CheckAnserQuestCancel()		
				if(yes == 1)		
				{		
					SetQuestNumStep(1, 0)	
					goto End_QuestNpc00059 
				}	
				else	
				{	
					SendTalkEndNpcToPlayer("什么？不买囉？\n嗯…重新考虑一下嘛！只要你愿意购买苹果一箱，我们两边都有好处的阿！我可以赚钱，你可以完成任务，并且完成任务还可使用新的功能喔！")
					goto End_QuestNpc00059 
				}	
			}		
		}			
	}				
}					

;EQuest1_Npc00059					
;SQuest7_Npc00059					
;SCon7Npc00059					
CmpQuestNumStep( 7, 0 )					
if( yes==1 )					
{					
	CheckEnableQuest(7)				
	if(yes == 1)				
	{				
		GetSkillLv(4)			
		if(yes >= 8)			
		{			
			GetLicense()		
			if(yes == 1)		
			{		
				GetELv()	
				if(yes >= 10)	
				{	
					CheckHasQuest(1)
					if(yes == 0)
					{	
						SetQuestNumStep( 7, 100 )
						goto End_7Npc00059 
					}	
				}		
			}			
		}				
	}					
}						
;ECon7Npc00059						
:End_7Npc00059 						
CmpQuestNumStep( 7, 135 )						
if( yes==1 )						
{						
	CheckTalkNpc()					
	if(yes == 1)					
	{				
		CheckPlayerAnserQuestion()			
		if(yes == 1)			
		{			
			SendNpcQuestionYesNo("关于任务的事情来找我的吗？苹果一箱的价钱为2200元，如要购买苹果一箱，请按【是】；不愿购买请按【否】。")		
			goto End_QuestNpc00059 		
		}			
		else			
		{			
			CheckPlayerAnserYes()		
			if(yes == 1)		
			{		
				CheckEmptyTInv(1)	
				if(yes == 1)	
				{	
					PopMoney(2200)
					if(yes == 1)	
					{	
						PushTInvBox(11021)
						SendTalkEndNpcToPlayer("谢谢囉！苹果的质量我可以跟你保证。\n只要回头走，应该可以找得到路的，祝你好运！")
						SetQuestNumStep( 7, 140 )
						goto End_QuestNpc00059 
					}	
					else	
					{	
						SendTalkEndNpcToPlayer("请先确认身上持有的金钱后，再来购买苹果一箱吧！")
						goto End_QuestNpc00059 
					}	
				}		
				else		
				{		
					SendTalkEndNpcToPlayer("物品栏空间不足，请重新整理物品栏后，再来找我。")	
					goto End_QuestNpc00059 
				}	
			}		
			else		
			{		
				CheckAnserQuestCancel()	
				if(yes == 1)	
				{	
					SetQuestNumStep(7, 0)
					goto End_QuestNpc00059 
				}	
				else	
				{	
					SendTalkEndNpcToPlayer("什么？不买囉？\n嗯…重新考虑一下嘛！只要你愿意购买苹果一箱，我们两边都有好处的阿！我可以赚钱，你可以完成任务，并且完成任务还可使用新的功能喔！")
					goto End_QuestNpc00059 
				}	
			}
		}	
	}		
}			

;EQuest7_Npc00059			
:End_QuestNpc00059			
end			
@Npc00060			
end			
@Npc00061			
end			
@Npc00062			
end			
@Npc00063			
end			
@Npc00064
end
@Npc00065
end
@Npc00066
end
@Npc00067
end
@Npc00068
end
@Npc00069
end
@Npc00070
end
@Npc00071
end
@Npc00072
end
@Npc00073
end
@Npc00074
end
@Npc00075
end
@Npc00076
end
@Npc00077
end
@Npc00078
end
@Npc00079
end
@Npc00080			
end			
@Npc00081			
;SQuest2_Npc00081			
;SCon2Npc00081			
CmpQuestNumStep( 2, 0 )			
if( yes==1 )			
{			
	GetBLv()		
	if(yes == 1)		
	{		
		CheckTalkNpc()	
		if(yes == 1)	
		{	
			CheckEnableQuest(2)
			if(yes == 1)
			{			
				CheckMapNo(1)		
				if(yes == 1)		
				{		
					CheckHasQuest(8)	
					if(yes == 0)	
					{	
						SetQuestNumStep( 2, 100 )
						goto End_2Npc00081 
					}	
				}		
			}			
		}				
	}					
}						
;ECon2Npc00081						
:End_2Npc00081 				
CmpQuestNumStep( 2, 100 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(2, 0, 0)
				SetQuestNumStep(2, 105)
				goto q2_0
				goto End_QuestNpc00081 
			}	
		}		
	}			
}				

CmpQuestNumStep( 2, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_0	
				SendTalkNpcToPlayer("欢迎来到N-age的世界！")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 110)
					goto q2_1
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 110 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(2)		;End	
		SetQuestNumStep( 2, 9999 )			
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_1
				SendTalkNpcToPlayer("如按【NEXT】键，将会有简略的界面说明；如按 [关闭]键 ，任务将会被中断。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 115)
					goto q2_2
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 115 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q2_2	
				SendTalkNpcToPlayer("请按任务视窗【Q】热键，就可查询任务之相关资料。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 120)
					goto q2_3
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 120 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_3
				SendTalkNpcToPlayer("如要中断任务，请按任务视窗的【Q】热键后，再点选【中断任务】即可。")
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,  125)
					goto q2_4
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 2, 125 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_4
				SendTalkNpcToPlayer("界面可分为角色资料视窗、物品栏、装备栏三种。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(2,  130)
					goto q2_5
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 130 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q2_5	
				SendOpenMenuInven()	
				SendTalkNpcToPlayer("这个视窗为储存道具的空间，\n可以存放多种类的物品，如以整箱来保管物品，便能节省空间，可以储存更多的物品，并且整箱的物品将会另外分类而储存，请参考【热键=>i】。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,   135)
					goto q2_6
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 135 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_6
				SendCloseMenuInven()
				SendOpenMenuInfo()
				SendTalkNpcToPlayer("【热键=>c】可确认角色的战斗、经济等级、经验值、升等级时所获得的点数等。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,  140)
					goto q2_7
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}
			}	
		}		
	}			
}				

CmpQuestNumStep( 2, 140 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_7
				SendCloseMenuInfo()
				SendOpenMenuWeapon()
				SendTalkNpcToPlayer("这个栏位是穿戴各种衣服与饰品的空间，每个道具都有设定力量与敏捷的限制，因此在配点时，请先做好确认的动作。")
				goto End_QuestNpc00081 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,   145)
					goto q2_8
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 2, 145 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q2_8	
				SendTalkNpcToPlayer("摩托车与滑板的安装，要在位于最左端的装备栏位进行安装─【热键=>T】。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 150)
					goto q2_9
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_9
				SendCloseMenuWeapon()	
				SendOpenMenuSkill()	
				SendTalkNpcToPlayer("如要查询角色技能，请注意一下此视窗喔！玩家透过打怪，可以提升个人技能【武术，持械】的技能点数，并且这些技能点数可以自行分配喔！")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 155)
					goto q2_10
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 155 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(2)		;End	
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_10
				SendTalkNpcToPlayer("依照不同的点数，所能学习到的特殊技能与攻击力也会出现差别，请务必要参考喔！【热键=>S】")
				goto End_QuestNpc00081 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 160)
					goto q2_11
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 2, 160 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_11
				SendCloseMenuSkill()
				SendStartTwinkleOfficeButton()
				SendTalkNpcToPlayer("位于画面右侧的界面按钮中，可以看到一些空按键，我来简略说明这些按键好了。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(2, 165)
					goto q2_12
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 165 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q2_12	
				SendTalkNpcToPlayer("第一个空按键为住办大楼的位置，角色等级10以上时，可从银行购买住办大楼。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,  170)
					goto q2_13
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 170 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(2)		;End	
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_13
				SendTalkNpcToPlayer("住办大楼有着仓库的功能，玩家可以将物品储存于住办大楼。")
				goto End_QuestNpc00081 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,   175)
					goto q2_14
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 2, 175 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_14
				SendEndTwinkleOfficeButton()
				SendStartTwinkleLicensButton()
				SendTalkNpcToPlayer("第二空按键为玩家获得执照时，所产生的部分。执照的定义是什么呢？获得执照的玩家可以购买整箱物品，并且所持有的执照越高，玩家可以进行多种类物品的杀价。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(2, 180)
					goto q2_15
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 180 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q2_15	
				SendTalkNpcToPlayer("在办公事务所可取得一级执照。\n【请先取得一级执照，才可购买食品箱子。】")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 185)
					goto q2_16
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 185 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(2)		;End	
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_16
				SendEndTwinkleLicensButton()
				SendStartTwinkleNotebookButton()
				SendTalkNpcToPlayer("最后一个空按键为联盟笔记型计算机的位置，是加入联盟或创立新联盟时所产生的系统。")
				goto End_QuestNpc00081 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 190)
					goto q2_17
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 2, 190 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_17
				SendTalkNpcToPlayer("联盟与其他军团系统相似，但它的规模极为庞大。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(2, 195)
					goto q2_18
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 195 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q2_18	
				SendTalkNpcToPlayer("联盟的笔记型计算机可在办公事务所购买。如要加入联盟，请在聊天窗内输入【/加入会员 联盟名称 】即可。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 200)
					goto q2_19
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 200 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(2)		;End	
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_19
				SendTalkNpcToPlayer("按起快捷键【H】时，将会显示大楼的正确坐标，请做为参考。")
				goto End_QuestNpc00081 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2, 205)
					goto q2_20
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 2, 205 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q2_20	
				SendEndTwinkleNotebookButton()	
				SendTalkNpcToPlayer("关于界面的简介已经说完了！下一个任务场所为便利商店【254,420】。")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(2,  210)
					goto q2_21
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 2, 210 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(2)		;End
		SetQuestNumStep( 2, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q2_21		
				SendNpcQuestionEndYesNo("辛苦了\n如要快速移动到下一个任务场所，请点选【是】按键，如要独自行走，请点选【否】按键。")		
				goto End_QuestNpc00081 		
			}			
			else			
			{			
				CheckPlayerAnserYes()		
				if(yes == 1)		
				{		
					CheckEmptyTInv(2)	
					if(yes == 1)	
					{	
						PushTInvBox(11002)
						PushTInvBox(11001)
						MoveToPlayer(519, 550)
						SendEventMsg("您获得的任务补赏为焙果与三明治，这些物品可以提升微量的HP与ST，其使用方法为用鼠标右键点选，它的箱子就会自动开启且会产生物品。")
						SendQuestComplete(2)		;End
						SetQuestNumStep( 2, 9999 )		
						goto End_QuestNpc00081 		
					}			
					else			
					{			
						SendTalkEndNpcToPlayer("物品栏中必须要有两格的空位，请整理物品栏后，再来找我。")		
						goto End_QuestNpc00081 		
					}			
				}				
				else				
				{				
					CheckPlayerAnserNo()			
					if(yes == 1)			
					{			
						CheckEmptyTInv(2)		
						if(yes == 1)			
						{			
							PushTInvBox(11002)		
							PushTInvBox(11001)		
							SendEventMsg("您获得的任务补赏为焙果与三明治，这些物品可以提升微量的HP与ST，其使用方法为用鼠标右键点选，它的箱子就会自动开启且会产生物品。")		
							SendQuestComplete(2)		;End
							SetQuestNumStep( 2, 9999 )		
							goto End_QuestNpc00081 		
						}			
						else			
						{			
							SendTalkEndNpcToPlayer("物品栏中必须要有两格的空位，请整理物品栏后，再来找我。")		
							goto End_QuestNpc00081 		
						}			
					}				
					else				
					{	
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
						goto End_QuestNpc00081 
					}	
				}		
			}			
		}				
	}					
}						

;EQuest2_Npc00081						
;SQuest13_Npc00081						
;SCon13Npc00081						
CmpQuestNumStep( 13, 0 )						
if( yes==1 )						
{						
	GetBLv()					
	if(yes > 4)					
	{					
		CheckTalkNpc()				
		if(yes == 1)				
		{				
			CheckMapNo(1)			
			if(yes == 1)			
			{			
				CheckEnableQuest(13)		
				if(yes == 1)		
				{		
					CheckHasQuest(14)	
					if(yes == 0)	
					{	
						GetBLv()
						if(yes < 10)	
						{	
							SetQuestNumStep( 13, 100 )
							goto End_13Npc00081 
						}	
					}		
				}			
			}				
		}					
	}						
}							
;ECon13Npc00081							
:End_13Npc00081 							
CmpQuestNumStep( 13, 100 )							
if( yes==1 )							
{							
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(13)		;End
		SetQuestNumStep( 13, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(13, 0, 0)
				SetQuestNumStep(13, 105)
				goto q13_0
				goto End_QuestNpc00081 
			}	
		}		
	}			
}				

CmpQuestNumStep( 13, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(13)		;End
		SetQuestNumStep( 13, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q13_0
				SendTalkNpcToPlayer("你好！目前正在执行认识新朋友任务。")
				goto End_QuestNpc00081 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(13, 110)
					goto q13_1
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 13, 110 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(13)		;End
		SetQuestNumStep( 13, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()			
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q13_1	
				SendTalkNpcToPlayer("不要孤单一个人练等级喔！可以认识一些同等级的朋友，或交一位漂亮的女朋友也不错喔！")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(13, 115)
					goto q13_2
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 13, 115 )					
if( yes==1 )					
{					
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(13)		;End
		SetQuestNumStep( 13, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q13_2	
				SendTalkNpcToPlayer("按热键【 P】后，鼠标游标形状将会改变，再点选要组队的玩家，就成功建立组队关系。【需要对方的许可，才能顺利组队】")	
				goto End_QuestNpc00081 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(13, 120)
					goto q13_3
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 13, 120 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 9)				
	{				
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")			
		SendQuestCancel(13)		;End	
		SetQuestNumStep( 13, 9999 )			
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q13_3
				SendTalkNpcToPlayer("凡成立组队的玩家就能享受以下的优惠喔！可使用组队频道，并且组队员昏倒时，其它组队员使用【意识恢复剂】来恢复已昏倒的成员，以及经验值量增加。")
				goto End_QuestNpc00081 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(13,  125)
					goto q13_4
					goto End_QuestNpc00081 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00081 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 13, 125 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(13)		;End
		SetQuestNumStep( 13, 9999 )		
		goto End_QuestNpc00081 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q13_4
				SendTalkEndNpcToPlayer("在Nage的世界里认识一些新朋友喔！战斗等级10以下的玩家建立组队时，才能得到此任务的补赏。\n【注意】无法向等级5以下的玩家申请组队。")
				SetQuestNumStep( 13, 130 )
				goto End_QuestNpc00081 
			}	
		}		
	}			
}				

CmpQuestNumStep( 13, 130 )				
if( yes==1 )				
{				
	GetBLv()				
	if(yes > 9)				
	{				
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")			
		SendQuestCancel(13)		;End	
		SetQuestNumStep( 13, 9999 )			
		goto End_QuestNpc00081 			
	}				
	else				
	{				
		CheckAccessionParty()			
		if(yes == 1)			
		{			
			SendEventMsg("你已获得命中技能！命中技能对于攻击的准确度有很大的影响。")		
			GetBaseSkill()
			if(yes<3)
			{
				SendSkillUp(3,   20)
			}
			else
			{
				SendSkillUp(3,   20)
			}
			SendQuestComplete(13)		;End
			SetQuestNumStep( 13, 9999 )
			goto End_QuestNpc00081 
		}	
	}		
}			

;EQuest13_Npc00081			
:End_QuestNpc00081			
end			
@Npc00082			
end			
@Npc00083			
end			
@Npc00084			
end			
@Npc00085			
;SQuest8_Npc00085				
;SCon8Npc00085				
CmpQuestNumStep( 8, 0 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes == 1)			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckEnableQuest(8)	
			if(yes == 1)	
			{	
				CheckHasQuest(2)
				if(yes == 0)
				{		
					CheckMapNo(3)	
					if(yes == 1)	
					{	
						SetQuestNumStep( 8, 100 )
						goto End_8Npc00085 
					}	
				}		
			}			
		}				
	}					
}						
;ECon8Npc00085						
:End_8Npc00085 						
CmpQuestNumStep( 8, 100 )						
if( yes==1 )						
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(8,    0,    0)
				SetQuestNumStep(8,  105)
				goto q8_0
				goto End_QuestNpc00085 
			}	
		}		
	}			
}				

CmpQuestNumStep( 8, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_0
				SendTalkNpcToPlayer("欢迎来到N-age。")
				goto End_QuestNpc00085 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,  110)
					goto q8_1
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 8, 110 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_1
				SendTalkNpcToPlayer("如按【Next】键，将会出现界面的简略说明；如按【关闭】键，任务将会停止执行。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(8,  115)
					goto q8_2
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 115 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{		
				:q8_2	
				SendTalkNpcToPlayer("请按任务视窗【Q】，就可查询任务之相关资料。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,  120)
					goto q8_3
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 120 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(8)		;End	
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_3
				SendTalkNpcToPlayer("如要中断任务，请按任务视窗的【Q】热键，再点选【中断任务】按键。")
				goto End_QuestNpc00085 
			}	
			else	
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,   125)
					goto q8_4
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}				

CmpQuestNumStep( 8, 125 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)			
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q8_4	
				SendTalkNpcToPlayer("界面可分为角色资料视窗、物品栏、装备栏三种。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,   130)
					goto q8_5
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 130 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_5
				SendOpenMenuInven()	
				SendTalkNpcToPlayer("这个视窗为储存道具的空间，\n可以存放多种类的物品，如以整箱来保管物品，便能节省空间，可以储存更多的物品，并且整箱的物品将会另外分类而储存，请参考【热键=>i】。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,    135)
					goto q8_6
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 135 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(8)		;End	
		SetQuestNumStep( 8, 9999 )			
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_6
				SendCloseMenuInven()
				SendOpenMenuInfo()
				SendTalkNpcToPlayer("【热键=>c】可确认角色的战斗、经济等级、经验值、升等级时所获得的点数等。")
				goto End_QuestNpc00085 
			}	
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,   140)
					goto q8_7
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}			
}				

CmpQuestNumStep( 8, 140 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_7
				SendCloseMenuInfo()
				SendOpenMenuWeapon()
				SendTalkNpcToPlayer("这个栏位是穿戴各种衣服与饰品的空间，每个道具都有设定力量与敏捷的限制，因此在配点时，请先做好确认的动作。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(8,    145)
					goto q8_8
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 145 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q8_8	
				SendTalkNpcToPlayer("摩托车与滑板的安装，要在位于最左端的装备栏位进行安装─【热键=>T】。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,  150)
					goto q8_9
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 150 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")			
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_9
				SendCloseMenuWeapon()
				SendOpenMenuSkill()
				SendTalkNpcToPlayer("如要查询角色技能，请注意一下此视窗喔！玩家透过打怪，可以提升个人技能【武术，持械】的技能点数，并且这些技能点数可以自行分配喔！")
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 155)
					goto q8_10
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 8, 155 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_10
				SendTalkNpcToPlayer("依照不同的点数，所能学习到的特殊技能与攻击力也会出现差别，请务必要参考喔！【热键=>S】")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(8, 160)
					goto q8_11
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 160 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q8_11	
				SendCloseMenuSkill()	
				SendStartTwinkleOfficeButton()	
				SendTalkNpcToPlayer("位于画面右侧的界面按钮中，可以看到一些空按键，我来简略说明这些按键好了。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 165)
					goto q8_12
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 165 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_12
				SendTalkNpcToPlayer("第一个空按键为住办大楼的位置，角色等级10以上时，可从银行购买住办大楼。")
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,  170)
					goto q8_13
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 8, 170 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_13
				SendTalkNpcToPlayer("住办大楼有着仓库的功能，玩家可以将物品储存于住办大楼。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(8,   175)
					goto q8_14
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 175 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q8_14	
				SendEndTwinkleOfficeButton()	
				SendStartTwinkleLicensButton()	
				SendTalkNpcToPlayer("第二空按键为玩家获得执照时，所产生的部分。执照的定义是什么呢？获得执照的玩家可以购买整箱物品，并且所持有的执照越高，玩家可以进行多种类物品的杀价。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 180)
					goto q8_15
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 180 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_15
				SendTalkNpcToPlayer("在办公事务所可取得一级执照。\n【请先取得一级执照，才可购买食品箱子。】")
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 185)
					goto q8_16
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 8, 185 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_16
				SendEndTwinkleLicensButton()
				SendStartTwinkleNotebookButton()
				SendTalkNpcToPlayer("最后一格为联盟笔记型计算机的栏位，加入联盟或有创立新联盟时所产生的系统。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 190)
					goto q8_17
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 190 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{			
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q8_17	
				SendTalkNpcToPlayer("联盟与其他军团系统相似，但它的规模极为庞大。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 195)
					goto q8_18
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 195 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_18
				SendTalkNpcToPlayer("联盟的笔记型计算机可在办公事务所购买。如要加入联盟，请在聊天窗内输入【/加入会员 联盟名称 】即可。")
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8, 200)
					goto q8_19
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}	
		}		
	}			
}				

CmpQuestNumStep( 8, 200 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_19
				SendTalkNpcToPlayer("按起快捷键【H】时，将会显示大楼的正确坐标，请做为参考。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{	
					SetQuestNumStep(8, 205)
					goto q8_20
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 205 )					
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 1)			
	{			
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)		
			{		
				:q8_20	
				SendEndTwinkleNotebookButton()	
				SendTalkNpcToPlayer("关于界面的简介已经说完了！下一个任务场所为便利商店【401,302】。")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(8,  210)
					goto q8_21
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 8, 210 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 1)				
	{				
		SendTalkEndNpcToPlayer("您已超过限制等级而无法继续执行任务，系统将自动终止任务。")		
		SendQuestCancel(8)		;End
		SetQuestNumStep( 8, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q8_21
				SendNpcQuestionEndYesNo("辛苦了\n如要快速移动到下一个任务场所，请点选【是】按键，如要独自行走，请点选【否】按键。")
				goto End_QuestNpc00085 
			}					
			else					
			{					
				CheckPlayerAnserYes()				
				if(yes == 1)				
				{				
					CheckEmptyTInv(2)			
					if(yes == 1)			
					{			
						MoveToPlayer(420, 429)		
						PushTInvBox(11002)		
						PushTInvBox(11001)		
						SendEventMsg("您获得的任务补赏为焙果与三明治，这些物品可以提升微量的HP与ST，其使用方法为用鼠标右键点选，它的箱子就会自动开启且会产生物品。")		
						SendQuestComplete(8)		;End
						SetQuestNumStep( 8, 9999 )		
						goto End_QuestNpc00085 		
					}		
					else		
					{		
						SendTalkEndNpcToPlayer("物品栏中必须要有两格的空位，请整理物品栏后，再来找我。")	
						goto End_QuestNpc00085 	
					}		
				}			
				else			
				{			
					CheckPlayerAnserNo()		
					if(yes == 1)		
					{		
						CheckEmptyTInv(2)	
						if(yes == 1)	
						{	
							PushTInvBox(11002)
							PushTInvBox(11001)		
							SendEventMsg("您获得的任务补赏为焙果与三明治，这些物品可以提升微量的HP与ST，其使用方法为用鼠标右键点选，它的箱子就会自动开启且会产生物品。")		
							SendQuestComplete(8)		;End
							SetQuestNumStep( 8, 9999 )		
							goto End_QuestNpc00085 		
						}			
						else			
						{			
							SendTalkEndNpcToPlayer("物品栏中必须要有两格的空位，请整理物品栏后，再来找我。")		
							goto End_QuestNpc00085 		
						}			
					}				
					else				
					{				
						SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")			
						goto End_QuestNpc00085 			
					}
				}	
			}		
		}			
	}				
}					

;EQuest8_Npc00085					
;SQuest14_Npc00085					
;SCon14Npc00085					
CmpQuestNumStep( 14, 0 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 4)				
	{				
		CheckTalkNpc()					
		if(yes == 1)					
		{					
			CheckMapNo(3)				
			if(yes == 1)				
			{				
				CheckEnableQuest(14)			
				if(yes == 1)			
				{			
					CheckHasQuest(13)		
					if(yes == 0)		
					{		
						GetBLv()	
						if(yes < 10)	
						{	
							SetQuestNumStep( 14, 100 )
							goto End_14Npc00085 
						}	
					}		
				}			
			}				
		}					
	}						
}							
;ECon14Npc00085							
:End_14Npc00085 							
CmpQuestNumStep( 14, 100 )							
if( yes==1 )							
{							
	GetBLv()						
	if(yes > 9)						
	{						
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				SendQuestBegin(14, 0, 0)
				SetQuestNumStep(14, 105)
				goto q14_0
				goto End_QuestNpc00085 
			}	
		}		
	}			
}				

CmpQuestNumStep( 14, 105 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q14_0
				SendTalkNpcToPlayer("你好！目前正在执行认识新朋友任务。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)	
				{	
					SetQuestNumStep(14, 110)
					goto q14_1
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 14, 110 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()		
			if(yes == 1)		
			{		
				:q14_1	
				SendTalkNpcToPlayer("不要孤单一个人练等级喔！可以认识一些同等级的朋友，或交一位漂亮的女朋友也不错喔！")	
				goto End_QuestNpc00085 	
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(14, 115)
					goto q14_2
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 14, 115 )					
if( yes==1 )					
{					
	GetBLv()				
	if(yes > 9)				
	{				
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q14_2
				SendTalkNpcToPlayer("按热键【 P】后，鼠标游标形状将会改变，再点选要组队的玩家，就成功建立组队关系。【需要对方的许可，才能顺利组队】")
				goto End_QuestNpc00085 
			}		
			else		
			{		
				CheckAnserNext()	
				if(yes == 1)	
				{	
					SetQuestNumStep(14, 120)
					goto q14_3
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}		
	}			
}				

CmpQuestNumStep( 14, 120 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q14_3
				SendTalkNpcToPlayer("凡成立组队的玩家就能享受以下的优惠喔！可使用组队频道，并且组队员昏倒时，其它组队员使用【意识恢复剂】来恢复已昏倒的成员，以及经验值量增加。")
				goto End_QuestNpc00085 
			}	
			else	
			{	
				CheckAnserNext()
				if(yes == 1)
				{
					SetQuestNumStep(14,  125)
					goto q14_4
					goto End_QuestNpc00085 
				}	
				else	
				{	
					SendEventMsg("详细事项，请洽WWW.NAGE.COM官方网站。")
					goto End_QuestNpc00085 
				}	
			}		
		}			
	}				
}					

CmpQuestNumStep( 14, 125 )					
if( yes==1 )					
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")		
		SendQuestCancel(14)		;End
		SetQuestNumStep( 14, 9999 )		
		goto End_QuestNpc00085 		
	}			
	else			
	{			
		CheckTalkNpc()		
		if(yes == 1)		
		{		
			CheckPlayerAnserQuestion()	
			if(yes == 1)	
			{	
				:q14_4
				SendTalkEndNpcToPlayer("+E7048")
				SetQuestNumStep( 14, 130 )
				goto End_QuestNpc00085 
			}	
		}		
	}			
}				

CmpQuestNumStep( 14, 130 )				
if( yes==1 )				
{				
	GetBLv()			
	if(yes > 9)			
	{			
		SendEventMsg("任务已终止！已执行过的任务，无法再次执行。")			
		SendQuestCancel(14)		;End	
		SetQuestNumStep( 14, 9999 )			
		goto End_QuestNpc00085 			
	}				
	else				
	{				
		CheckAccessionParty()			
		if(yes == 1)			
		{			
			SendEventMsg("你已获得格党技能2！格党技能对于回避、攻击的准确度、防御率等都有很大的影响。")		
			GetBaseSkill()
			if(yes<3)
			{
				SendSkillUp(3,   20)
			}
			else
			{
				SendSkillUp(3,   20)
			}	
			SendQuestComplete(14)		;End
			SetQuestNumStep( 14, 9999 )		
			goto End_QuestNpc00085 		
		}			
	}
}	

;EQuest14_Npc00085	
:End_QuestNpc00085	
end	
@Npc00086	
end	
@Npc00087	
end	
@Npc00088	
end	
@Npc00089	
end	
@Npc00090	
end	
@Npc00091
end
@Npc00092
end
@Npc00093
end
@Npc00094
end
@Npc00095
end
@Npc00096
end
@Npc00097
end
@Npc00098
end
@Npc00099
end
@Npc00100
end
@Npc00101
end
@Npc00102
end
@Npc00103
end
@Npc00104
end
@Npc00105
end
@Npc00106
end
@Npc00107
end
@Npc00108
end
@Npc00109
end
@Npc00110
;SQuest15_Npc00110	
CmpQuestNumStep( 15, 0 )	
if( yes==1 )	
{	
	CheckHero()
	if(yes<2)
	{
		SendTalkNpcToPlayer("您想简单测试一下，你是否符号成为N-age的S-Hero的条件么?")
		SetQuestNumStep( 15, 11 )
		goto End_QuestNpc00110	
	}
}	

CmpQuestNumStep( 15, 11 )				
if( yes==1 )				
{				
	SendTalkNpcToPlayer("想要成为S-Hero,你必须在N-age的世界中提升自己至169级!")
	SetQuestNumStep( 15, 12 )
	goto End_QuestNpc00110	
}

CmpQuestNumStep( 15, 12 )				
if( yes==1 )				
{
	GetBLv()
	if(yes >= 169)
	{
		CheckHero()
		if(yes==1)
		{
			CheckEmptyInv(1)
			if(yes==1)
			{
				SendTalkNpcToPlayer("恭喜您，已经提升到S-hero!")
				SetUpgradeSHero(2)
				ChangeLicense(6)
				SetQuestNumStep( 15, 13 )
				goto End_QuestNpc00110
			}
			else
			{
				SendTalkEndNpcToPlayer("请重新整理物品栏后,再来申请!")
				goto End_QuestNpc00110
			}
		}
		else
		{
			SendTalkEndNpcToPlayer("您已经是N-age的S-Hero了!")
			goto End_QuestNpc00110
		}
	}
	else
	{
		SendTalkEndNpcToPlayer("请继续在N-age的世界中历练！")
		goto End_QuestNpc00110
	}
}

CmpQuestNumStep( 15, 13 )				
if( yes==1 )				
{
	SendTalkNpcToPlayer("同时,您将获得一部分随机装备的奖励!")	
	GetBaseSkill()	
	if(yes < 3)	
	{	
		GetCharNum()
		if(yes < 2)	
		{	
			SetRandPushItem(32526,32527,35509,36095,36097)
			SetQuestNumStep( 15, 14 )
			goto End_QuestNpc00110
		}	
		else
		{	
			SetRandPushItem(34515,34516,35510,36096,36098)
			SetQuestNumStep( 15, 14 )
			goto End_QuestNpc00110
		}	
						
	}		
	else
	{		
		GetCharNum()	
		if(yes < 2)	
		{	
			SetRandPushItem(31044,31043,35551,36132,36130)
			SetQuestNumStep( 15, 14 )
			goto End_QuestNpc00110
		}	
		else	
		{	
			SetRandPushItem(35552,31045,31046,36133,36131)
			SetQuestNumStep( 15, 14 )
			goto End_QuestNpc00110
		}	
	}	
}

CmpQuestNumStep( 15, 14 )				
if(yes==1)				
{
	SendQuestComplete(15)
	SetQuestNumStep( 15, 9999 )
	SendTalkEndNpcToPlayer("而且你的最大技能得到一定提升，请尽你最大努力来维护N-age的和平!")
	goto End_QuestNpc00110	
}		

;EQuest15_Npc00110						
:End_QuestNpc00110
end
@Npc00111
end
@Npc00112
end
@Npc00113
end
@Npc00114
CheckHaveInvItem(43565)
if(yes==1)
{
	GetLicense()
	if(yes <6)
	{
		SendTalkNpcToPlayer("将进行取得6级执照过程，是否继续?")
		CheckAnserNext()
		if(yes==1)
		{
			PopInvItem(43565)
			ChangeLicense(6)
			SendTalkEndNpcToPlayer("恭喜您顺利取得6级执照!")
			End_QuestNpc00114
		}
		else
		{
			goto End_QuestNpc00114
		}
	}
}
else
{
SendTalkNpcToPlayer("祝大家多多中奖，大大中奖！")
CheckAnserNext()
if(yes==1)
{
	CheckHaveInvItem(43505)
	if(yes==1)
		{
			PopInvItem(43505)
			Random(13)
			if(yes==0)
			{
				PushMoney(10000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 10000 N币!")
				End_QuestNpc00114
			}
			if(yes==1)
			{
				PushMoney(20000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 20000 N币!")
				End_QuestNpc00114
			}
			if(yes==2)
			{
				PushMoney(50000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 50000 N币!")
				End_QuestNpc00114
			}
			if(yes==3)
			{
				PushMoney(100000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 100000 N币!")
				End_QuestNpc00114
			}
			if(yes==4)
			{
				PushMoney(200000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 200000 N币!")
				End_QuestNpc00114
			}
			if(yes==5)
			{
				PushMoney(500000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 500000 N币!")
				End_QuestNpc00114
			}
			if(yes==6)
			{
				PushMoney(1000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 1000000 N币!")
				End_QuestNpc00114
			}
			if(yes==7)
			{
				PushMoney(2000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 2000000 N币!")
				End_QuestNpc00114
			}
			if(yes==8)
			{
				PushMoney(2000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 2000000 N币!")
				End_QuestNpc00114
			}
			if(yes==9)
			{
				PushMoney(5000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 5000000 N币!")
				End_QuestNpc00114
			}
			if(yes==10)
			{
				PushMoney(10000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 10000000 N币!")
				End_QuestNpc00114
			}
			if(yes==11)
			{
				PushMoney(20000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 20000000 N币!")
				End_QuestNpc00114
			}
			if(yes==12)
			{
				PushMoney(50000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 50000000 N币!")
				End_QuestNpc00114
			}
			if(yes==13)
			{
				PushMoney(100000000)
				SendOpenMenuInven()
				SendTalkEndNpcToPlayer("恭喜您获得 100000000 N币!")
				End_QuestNpc00114
			}
		}
		else
		{
			SendTalkEndNpcToPlayer("您暂时无法参加抽奖！")
			goto End_QuestNpc00114
		}
}
else
{
	goto End_QuestNpc00114
}			
}
;EQuest16_Npc00114							
:End_QuestNpc00114
end
@Npc00115
end
@Npc00116
end
@Npc00117
end
@Npc00118
end
@Npc00119
end
@Npc00120
end
@Npc00121
end
@Npc00122
end
@Npc00123
end
@Npc00124
end
@Npc00125
end
@Npc00126
end
@Npc00127
end
@Npc00128
end
@Npc00129
end
@Npc00130
end
@Npc00131
end
@Npc00132
end
@Npc00133
end
@Npc00134
end
@Npc00135
end
@Npc00136
end
@Npc00137
end
@Npc00138
end
@Npc00139
end
@Npc00140
end
@Npc00141
end
@Npc00142
end
@Npc00143
end
@Npc00144
end
@Npc00145
end
@Npc00146
end
@Npc00147
end
@Npc00148
end
@Npc00149
end
@Npc00150
end
@Npc00151
end
@Npc00152
end
@Npc00153
end
@Npc00154
end
@Npc00155
end
@Npc00156
end
@Npc00157
end
@Npc00158
end
@Npc00159
end
@Npc00160
end
@Npc00161
end
@Npc00162
end
@Npc00163
end
@Npc00164
end
@Npc00165
end
@Npc00166
end
@Npc00167
end
@Npc00168
end
@Npc00169
end
@Npc00170
end
@Npc00171
end
@Npc00172
end
@Npc00173
end
@Npc00174
end
@Npc00175
end
@Npc00176
end
@Npc00177
end
@Npc00178
end
@Npc00179
end
@Npc00180
end
@Npc00181
end
@Npc00182
end
@Npc00183
end
@Npc00184
end
@Npc00185
end
@Npc00186
end
@Npc00187
end
@Npc00188
end
@Npc00189
end
@Npc00190
end
@Npc00191
end
@Npc00192
end
@Npc00193
end
@Npc00194
end
@Npc00195
end
@Npc00196
end
@Npc00197
end
@Npc00198
end
@Npc00199
end
@Npc00200
end
