# -*- coding: utf-8 -*-
import re
import os
import sys
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtCore import QObject, pyqtSignal


脚本命令 = {
    # 0-9: 获取信息类
    "获取战斗等级": ("null", 0, "获取战斗等级"),
    "获取贸易等级": ("null", 1, "获取贸易等级"),
    "获取技能等级": ("i", 2, "获取技能等级"),
    
    # 3-9: 检查类
    "检查任务可用性": ("i", 3, "检查任务可用性"),
    "检查是否接受任务": ("i", 4, "检查是否接受任务"),
    "检查任务完成": ("i", 5, "检查任务完成"),
    "设置任务步骤": ("ii", 6, "设置任务步骤"),
    "比较任务步骤": ("ii", 7, "比较任务步骤"),
    "发送NPC对话": ("s", 8, "发送NPC对话"),
    "发送是/否问题": ("s", 9, "发送是/否问题"),
    
    # 10-19: 检查类
    "检查地图编号": ("i", 10, "检查地图编号"),
    "生成随机数": ("i", 11, "生成随机数"),
    "检查背包物品": ("i", 12, "检查背包物品"),
    "检查交易栏箱子": ("i", 13, "检查交易栏箱子"),
    "检查快捷栏物品": ("i", 14, "检查快捷栏物品"),
    "检查背包空格": ("i", 15, "检查背包空格"),
    "检查交易栏空格": ("i", 16, "检查交易栏空格"),
    "检查快捷栏空格": ("i", 17, "检查快捷栏空格"),
    "移除背包物品": ("i", 18, "移除背包物品"),
    "检查NPC编号": ("i", 19, "检查NPC编号"),
    
    # 20-29: 检查模式类
    "检查对话模式": ("null", 20, "检查对话模式"),
    "检查战斗模式": ("null", 21, "检查战斗模式"),
    "检查购买模式": ("null", 22, "检查购买模式"),
    "检查出售模式": ("null", 23, "检查出售模式"),
    "检查拾取模式": ("null", 24, "检查拾取模式"),
    "检查丢弃模式": ("null", 25, "检查丢弃模式"),
    "检查NPC类型": ("i", 26, "检查NPC类型"),
    "检查物品ID": ("i", 27, "检查物品ID"),
    "检查玩家提问": ("null", 28, "检查玩家提问"),
    "检查玩家选是": ("null", 29, "检查玩家选是"),
    
    # 30-39: 任务操作类
    "检查玩家选否": ("null", 30, "检查玩家选否"),
    "开始任务": ("iii", 31, "开始任务"),
    "检查任务超时": ("i", 32, "检查任务超时"),
    "给予经验": ("i", 33, "给予经验"),
    "发送事件消息": ("s", 34, "发送事件消息"),
    "完成任务": ("i", 35, "完成任务"),
    "取消任务": ("i", 36, "取消任务"),
    "发送结束对话": ("s", 37, "发送结束对话"),
    "设置下一个NPC": ("iii", 38, "设置下一个NPC"),
    "添加杀怪任务": ("iii", 39, "添加杀怪任务"),
    
    # 40-49: 物品操作类
    "增加杀怪计数": ("i", 40, "增加杀怪计数"),
    "添加背包物品": ("i", 41, "添加背包物品"),
    "添加交易栏箱子": ("i", 42, "添加交易栏箱子"),
    "移除交易栏箱子": ("i", 43, "移除交易栏箱子"),
    "获取执照等级": ("null", 44, "获取执照等级"),
    "检查杀怪数量": ("i", 45, "检查杀怪数量"),
    "输入任务信息": ("iss", 46, "输入任务信息"),
    "打开帮助窗口": ("null", 47, "打开帮助窗口"),
    "关闭帮助窗口": ("null", 48, "关闭帮助窗口"),
    "打开信息窗口": ("null", 49, "打开信息窗口"),
    
    # 50-59: 界面操作类
    "关闭信息窗口": ("null", 50, "关闭信息窗口"),
    "打开任务信息窗口": ("null", 51, "打开任务信息窗口"),
    "关闭任务信息窗口": ("null", 52, "关闭任务信息窗口"),
    "打开装备窗口": ("null", 53, "打开装备窗口"),
    "关闭装备窗口": ("null", 54, "关闭装备窗口"),
    "打开技能窗口": ("null", 55, "打开技能窗口"),
    "关闭技能窗口": ("null", 56, "关闭技能窗口"),
    "打开队伍窗口": ("null", 57, "打开队伍窗口"),
    "关闭队伍窗口": ("null", 58, "关闭队伍窗口"),
    "打开选项窗口": ("null", 59, "打开选项窗口"),
    
    # 60-69: 界面操作类
    "关闭选项窗口": ("null", 60, "关闭选项窗口"),
    "打开背包窗口": ("null", 61, "打开背包窗口"),
    "关闭背包窗口": ("null", 62, "关闭背包窗口"),
    "打开小地图窗口": ("null", 63, "打开小地图窗口"),
    "关闭小地图窗口": ("null", 64, "关闭小地图窗口"),
    "添加金钱": ("i", 65, "添加金钱"),
    "移除金钱": ("i", 66, "移除金钱"),
    "改变执照等级": ("i", 67, "改变执照等级"),
    "检查是否在队伍": ("null", 68, "检查是否在队伍"),
    "检查是否队长": ("null", 69, "检查是否队长"),
    
    # 70-79: 队伍和物品类
    "获取队伍成员数": ("null", 70, "获取队伍成员数"),
    "丢弃物品": ("i", 71, "丢弃物品"),
    "检查登录状态": ("null", 72, "检查登录状态"),
    "获取玩家持有金钱": ("null", 73, "获取玩家持有金钱"),
    "发送玩家特效": ("ii", 74, "玩家特效"),
    "发送地面特效": ("iiii", 75, "地面特效"),
    "设置事件区域": ("siiiiii", 76, "设置事件区域"),
    "发送菜单问题": ("sssss", 77, "发送菜单问题"),
    "检查购买箱子": ("null", 78, "检查购买箱子"),
    "检查出售箱子": ("null", 79, "检查出售箱子"),
    
    # 80-89: 界面和检查类
    "检查NPC菜单": ("null", 80, "检查NPC菜单"),
    "开始闪烁伊甸园按钮": ("null", 81, "开始闪烁伊甸园按钮"),
    "结束闪烁伊甸园按钮": ("null", 82, "结束闪烁伊甸园按钮"),
    "开始闪烁执照按钮": ("null", 83, "开始闪烁执照按钮"),
    "结束闪烁执照按钮": ("null", 84, "结束闪烁执照按钮"),
    "开始闪烁联盟笔记本按钮": ("null", 85, "开始闪烁联盟笔记本按钮"),
    "结束闪烁联盟笔记本按钮": ("null", 86, "结束闪烁联盟笔记本按钮"),
    "检查进入建筑": ("null", 87, "检查进入建筑"),
    "检查离开建筑": ("null", 88, "检查离开建筑"),
    "移动到位置": ("ii", 89, "移动到位置"),
    
    # 90-99: 对话和检查类
    "检查下一段对话": ("null", 90, "检查下一段对话"),
    "检查关闭对话": ("null", 91, "检查关闭对话"),
    "获取事件模式": ("null", 92, "获取事件模式"),
    "获取对话状态": ("null", 93, "获取对话状态"),
    "检查取消任务": ("null", 94, "检查取消任务"),
    "等级提升": ("i", 95, "等级提升"),
    "技能提升": ("ii", 96, "技能提升"),
    "获取主技能": ("null", 97, "获取主技能"),
    "获取角色类型": ("null", 98, "获取角色类型"),
    "检查加入队伍": ("null", 99, "检查加入队伍"),
    
    # 100-109: 高级功能类
    "检查离开队伍": ("null", 100, "检查离开队伍"),
    "发送结束是/否问题": ("s", 101, "发送结束是/否问题"),
    "获取物品数量": ("i", 102, "获取物品数量"),
    "批量添加物品": ("ii", 103, "批量添加物品"),
    "批量移除物品": ("ii", 104, "批量移除物品"),
    "获取菜单选择": ("null", 105, "获取菜单选择"),
    "随机物品判断": ("i", 106, "随机物品判断"),
    "设置英雄升级": ("i", 107, "设置英雄升级"),
    "检查英雄类型": ("null", 108, "检查英雄类型"),
    "随机添加物品": ("iiiii", 109, "随机添加物品"),
    
    # 110-111: 特殊活动函数
    "临时背包活动": ("null", 110, "临时背包活动"),
    "临时发型活动": ("null", 111, "临时发型活动"),

    # 120-125: 流程控制类
    "if条件": ("null", 120, "if条件判断"),
    "else分支": ("null", 121, "else分支"),
    "跳转标签": ("s", 122, "跳转到标签"),
    "定义标签": ("s", 123, "定义标签"),
    "代码块开始": ("null", 124, "开始代码块"),
    "代码块结束": ("null", 125, "结束代码块"),
    "条件判断": ("s", 126, "条件判断(yes==1)"),
}

# 英文命令到中文的映射
英文到中文映射 = {
    # 获取信息类
    "GetBLv": "获取战斗等级", "GetELv": "获取贸易等级", "GetSkillLv": "获取技能等级",
    "GetLicense": "获取执照等级", "GetMoney": "获取玩家持有金钱", "GetBaseSkill": "获取主技能",
    "GetCharNum": "获取角色类型", "GetPartyMemberCount": "获取队伍成员数", "GetEventMode": "获取事件模式",
    "GetPlayerAnser": "获取对话状态", "GetSelectMenu": "获取菜单选择",
    
    # 检查条件类
    "CheckEnableQuest": "检查任务可用性", "CheckHasQuest": "检查是否接受任务", "CheckQuestComplete": "检查任务完成",
    "CheckMapNo": "检查地图编号", "CheckHaveInvItem": "检查背包物品", "CheckHaveTInvBox": "检查交易栏箱子",
    "CheckHasQInvItem": "检查快捷栏物品", "CheckEmptyInv": "检查背包空格", "CheckEmptyTInv": "检查交易栏空格",
    "CheckEmptyQInv": "检查快捷栏空格", "CheckNpcID": "检查NPC编号", "CheckTalkNpc": "检查对话模式",
    "CheckKillNpc": "检查战斗模式", "CheckBuyItem": "检查购买模式", "CheckSellItem": "检查出售模式",
    "CheckHandUpItem": "检查拾取模式", "CheckHandDownItem": "检查丢弃模式", "CheckNpcType": "检查NPC类型",
    "CheckItemID": "检查物品ID", "CheckPlayerAnserQuestion": "检查玩家提问", "CheckPlayerAnserYes": "检查玩家选是",
    "CheckPlayerAnserNo": "检查玩家选否", "CheckTimeOver": "检查任务超时", "CheckKillNpcNum": "检查杀怪数量",
    "CheckInParty": "检查是否在队伍", "CheckPartyReader": "检查是否队长", "CheckLogin": "检查登录状态",
    "CheckHero": "检查英雄类型",
    
    # 互动模式检查
    "CheckBuyBoxItem": "检查购买箱子", "CheckSellBoxItem": "检查出售箱子", "CheckTalkNpcMenu": "检查NPC菜单",
    "CheckEnterBuild": "检查进入建筑", "CheckExitBuild": "检查离开建筑", "CheckAnserNext": "检查下一段对话",
    "CheckAnserClose": "检查关闭对话", "CheckAnserQuestCancel": "检查取消任务", "CheckAccessionParty": "检查加入队伍",
    "CheckSeccessionParty": "检查离开队伍",
    
    # 对话显示类
    "SendTalkNpcToPlayer": "发送NPC对话", "SendNpcQuestionYesNo": "发送是/否问题", "SendEventMsg": "发送事件消息",
    "SendTalkEndNpcToPlayer": "发送结束对话", "SendNpcQuestionEndYesNo": "发送结束是/否问题",
    "SendNpcQuestionMenu": "发送菜单问题",
    
    # 任务操作类
    "SetQuestNumStep": "设置任务步骤", "CmpQuestNumStep": "比较任务步骤", "SendQuestBegin": "开始任务",
    "SendQuestComplete": "完成任务", "SendQuestCancel": "取消任务", "SetNextMeetNpcPropID": "设置下一个NPC",
    "InputQuestInfo": "输入任务信息", "AddKillNpc": "添加杀怪任务", "IncKillNpcNum": "增加杀怪计数",
    
    # 物品操作类
    "PopInvItem": "移除背包物品", "PushInvItem": "添加背包物品", "PushTInvBox": "添加交易栏箱子",
    "PopTInvBox": "移除交易栏箱子", "PushMoney": "添加金钱", "PopMoney": "移除金钱", "DropItem": "丢弃物品",
    "SetRandPushItem": "随机添加物品", "GetInvenItemCount": "获取物品数量", "PushInvenItemPack": "批量添加物品",
    "PoPInvenItemPack": "批量移除物品", "GetBoolRandItem": "随机物品判断",
    
    # 界面操作类
    "SendOpenMenuHelp": "打开帮助窗口", "SendCloseMenuHelp": "关闭帮助窗口", "SendOpenMenuInfo": "打开信息窗口",
    "SendCloseMenuInfo": "关闭信息窗口", "SendOpenMenuQuestInfo": "打开任务信息窗口", "SendCloseMenuQuestInfo": "关闭任务信息窗口",
    "SendOpenMenuWeapon": "打开装备窗口", "SendCloseMenuWeapon": "关闭装备窗口", "SendOpenMenuSkill": "打开技能窗口",
    "SendCloseMenuSkill": "关闭技能窗口", "SendOpenMenuTeam": "打开队伍窗口", "SendCloseMenuTeam": "关闭队伍窗口",
    "SendOpenMenuOption": "打开选项窗口", "SendCloseMenuOption": "关闭选项窗口", "SendOpenMenuInven": "打开背包窗口",
    "SendCloseMenuInven": "关闭背包窗口", "SendOpenMenuMinimap": "打开小地图窗口", "SendCloseMenuMinimap": "关闭小地图窗口",
    "SendStartTwinkleOfficeButton": "开始闪烁伊甸园按钮", "SendEndTwinkleOfficeButton": "结束闪烁伊甸园按钮",
    "SendStartTwinkleLicensButton": "开始闪烁执照按钮", "SendEndTwinkleLicensButton": "结束闪烁执照按钮",
    "SendStartTwinkleNotebookButton": "开始闪烁联盟笔记本按钮", "SendEndTwinkleNotebookButton": "结束闪烁联盟笔记本按钮",
    
    # 其他操作类
    "GiveExp": "给予经验", "ChangeLicense": "改变执照等级", "MoveToPlayer": "移动到位置", "SendLevelUp": "等级提升",
    "SendSkillUp": "技能提升", "SetUpgradeSHero": "设置英雄升级", "Random": "生成随机数", "SendPlayerEffect": "发送玩家特效",
    "SendGroundEffect": "发送地面特效", "SetEventbox": "设置事件区域", "ImsiBagEventPushItem": "临时背包活动",
    "ImsiHairEventPushItem": "临时发型活动",

    # 流程控制
    "if": "if条件",
    "else": "else分支",
    "goto": "跳转标签",
    ":": "定义标签",
    "{": "代码块开始",
    "}": "代码块结束",
}

# 中文到英文的映射（用于插入脚本）
中文到英文映射 = {v: k for k, v in 英文到中文映射.items()}

class 增强脚本转换器:
    """增强的脚本转换器，能够正确解析复杂脚本结构"""
    
    英文到中文映射 = 英文到中文映射  # 使用全局的映射

    @staticmethod
    def 解析英文命令(行):
        """从一行文本中解析出英文命令"""
        行 = 行.strip()
        
        # 移除注释
        if ';' in 行:
            行 = 行.split(';')[0].strip()
        
        if not 行:
            return None
            
        # 处理标签
        if 行.startswith(':'):
            return ":"
            
        # 处理流程控制
        if 行.startswith('if('):
            return "if"
        elif 行 == 'else':
            return "else"
        elif 行.startswith('goto '):
            return "goto"
        elif 行 == '{':
            return "{"
        elif 行 == '}':
            return "}"
        
        # 提取命令名（第一个单词，直到括号）
        if '(' in 行:
            命令名 = 行.split('(')[0].strip()
            return 命令名
        
        return None
    
    @staticmethod
    def 文本到节点(文本):
        """将文本脚本转换为可视化节点列表"""
        print("开始转换文本到节点...")
        
        节点列表 = []
        行列表 = 文本.split('\n')
        
        x, y = 50, 50
        
        for i, 行 in enumerate(行列表):
            行 = 行.strip()
            if not 行 or 行.startswith(';'):  # 跳过空行和注释
                continue
            
            print(f"解析第{i+1}行: {行[:50]}...")
            
            # 解析命令
            命令名 = None
            
            # 1. 检查是否是流程控制
            if 行.startswith('if('):
                命令名 = "if条件"
            elif 行 == 'else':
                命令名 = "else分支"
            elif 行.startswith('goto '):
                命令名 = "跳转标签"
            elif 行.startswith(':'):
                命令名 = "定义标签"
            elif 行 == '{':
                命令名 = "代码块开始"
            elif 行 == '}':
                命令名 = "代码块结束"
            else:
                # 2. 尝试从英文命令映射
                for 英文命令, 中文命令 in 增强脚本转换器.英文到中文映射.items():
                    if 英文命令 in 行 and '(' in 行:
                        命令名 = 中文命令
                        break
            
            if 命令名 and 命令名 in 脚本命令:
                print(f"找到命令: {命令名}")
                
                # 创建节点
                try:
                    节点 = 可视化命令节点(命令名)
                    节点.setPos(x, y)
                    节点.设置原始行(行)
                    
                    节点列表.append(节点)
                    
                    # 更新位置
                    y += 100
                    if y > 600:
                        y = 50
                        x += 250
                        
                except Exception as e:
                    print(f"创建节点失败: {e}")
        
        print(f"转换完成，共创建{len(节点列表)}个节点")
        return 节点列表
    
    @staticmethod
    def 生成完整脚本(任务编号, 任务名称, 任务描述, 节点列表):
        """根据节点生成完整的脚本"""
        脚本行 = []
        
        # 任务信息
        脚本行.append(f";SQuest{任务编号}_Info")
        脚本行.append(f'\tInputQuestInfo( {任务编号}, "{任务名称}", "{任务描述}" )')
        脚本行.append(f";EQuest{任务编号}_Info")
        脚本行.append("")
        
        # 默认NPC脚本（范式模板）
        脚本行.append("@Npc00001  ; 默认NPC，可修改为实际的NPC编号")
        脚本行.append(f";SQuest{任务编号}_Npc00001")
        脚本行.append(f";SCon{任务编号}Npc00001")
        
        # 添加基础检查
        脚本行.append(f"\tCmpQuestNumStep( {任务编号}, 0 )")
        脚本行.append("\tif( yes==1 )")
        脚本行.append("\t{")
        脚本行.append("\t\tCheckTalkNpc()")
        脚本行.append("\t\tif(yes == 1)")
        脚本行.append("\t\t{")
        脚本行.append("\t\t\tSendTalkNpcToPlayer(\"欢迎！\")")
        脚本行.append("\t\t}")
        脚本行.append("\t}")
        脚本行.append(f";ECon{任务编号}Npc00001")
        脚本行.append(":End_QuestNpc00001")
        脚本行.append("end")
        
        return "\n".join(脚本行)


class 任务解析器:
    """解析任务脚本"""
    
    def __init__(self, 文件路径):
        self.文件路径 = 文件路径
        self.任务字典 = {}
        self.NPC脚本字典 = {}
        self.系统脚本字典 = {}
        self.所有脚本内容 = ""  # 存储整个文件内容
        
        if 文件路径 and os.path.exists(文件路径):
            self.解析()
    
    def 解析(self):
        """解析整个脚本文件"""
        try:
            with open(self.文件路径, 'r', encoding='gbk', errors='ignore') as 文件:
                self.所有脚本内容 = 文件.read()
            
            print(f"文件大小: {len(self.所有脚本内容)} 字符")
            
            # 分割不同部分
            部分列表 = self.所有脚本内容.split('@')
            
            for 部分 in 部分列表:
                if not 部分.strip():
                    continue
                
                行列表 = 部分.strip().split('\n')
                if not 行列表:
                    continue
                    
                头部 = 行列表[0].strip()
                主体 = '\n'.join(行列表[1:])
                
                if 头部.startswith('sys'):
                    self.系统脚本字典[头部] = 主体
                    if 头部 == 'sys00':
                        self.解析任务信息(主体)
                elif 头部.startswith('Npc'):
                    self.NPC脚本字典[头部] = 主体
            
            # 深度搜索所有可能任务
            self.深度搜索任务()
            
            print(f"解析完成: 找到{len(self.任务字典)}个任务, {len(self.NPC脚本字典)}个NPC脚本")
            
        except Exception as 异常:
            print(f"解析文件失败: {str(异常)}")
            raise
    
    def 深度搜索任务(self):
        """深度搜索所有可能的任务"""
        # 方法1：从InputQuestInfo查找
        self.从InputQuestInfo查找任务()
        
        # 方法2：从CmpQuestNumStep查找
        self.从CmpQuestNumStep查找任务()
        
        # 方法3：从SendQuestBegin查找
        self.从SendQuestBegin查找任务()
        
        # 方法4：从Quest模式查找
        self.从Quest模式查找任务()
        
        # 打印所有找到的任务
        print(f"深度搜索完成，共找到 {len(self.任务字典)} 个任务:")
        for 任务编号 in sorted(self.任务字典.keys()):
            任务 = self.任务字典[任务编号]
            print(f"  任务{任务编号}: {任务['名称'][:30]}...")
    
    def 从InputQuestInfo查找任务(self):
        """从InputQuestInfo语句查找任务"""
        # 使用正则表达式查找所有InputQuestInfo
        模式 = r'InputQuestInfo\s*\(\s*(\d+)\s*,\s*"((?:[^"]|\\")+)"\s*,\s*"((?:[^"]|\\")+)"\s*\)'
        
        # 在整个文件内容中搜索
        for 匹配 in re.finditer(模式, self.所有脚本内容, re.DOTALL):
            任务编号 = int(匹配.group(1))
            任务名称 = 匹配.group(2).replace('\\"', '"').strip()
            任务描述 = 匹配.group(3).replace('\\"', '"').replace('\\n', '\n').strip()
            
            if 任务编号 not in self.任务字典:
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': 任务名称,
                    '描述': 任务描述,
                    'NPC脚本列表': [],
                    '位置': 匹配.start(),
                    '来源': 'InputQuestInfo'
                }
                print(f"从InputQuestInfo找到任务{任务编号}: {任务名称[:20]}...")
    
    def 从CmpQuestNumStep查找任务(self):
        """从CmpQuestNumStep语句查找任务"""
        模式 = r'CmpQuestNumStep\s*\(\s*(\d+)\s*,\s*\d+\s*\)'
        
        for 匹配 in re.finditer(模式, self.所有脚本内容, re.DOTALL):
            任务编号 = int(匹配.group(1))
            
            if 任务编号 not in self.任务字典:
                # 从上下文尝试获取任务名称
                开始位置 = max(0, 匹配.start() - 200)
                结束位置 = min(len(self.所有脚本内容), 匹配.end() + 100)
                上下文 = self.所有脚本内容[开始位置:结束位置]
                
                # 尝试从注释中获取名称
                任务名称 = f"任务{任务编号}"
                if ';' in 上下文:
                    行列表 = 上下文.split('\n')
                    for 行 in 行列表:
                        if 行.strip().startswith(';'):
                            注释 = 行.strip()[1:].strip()
                            if 'Quest' in 注释 and len(注释) > 5:
                                任务名称 = 注释.split('_')[0] if '_' in 注释 else 注释
                                break
                
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': 任务名称,
                    '描述': f"从CmpQuestNumStep发现的任务{任务编号}",
                    'NPC脚本列表': [],
                    '位置': 匹配.start(),
                    '来源': 'CmpQuestNumStep'
                }
                print(f"从CmpQuestNumStep找到任务{任务编号}")
    
    def 从SendQuestBegin查找任务(self):
        """从SendQuestBegin语句查找任务"""
        模式 = r'SendQuestBegin\s*\(\s*(\d+)\s*,\s*\d+\s*,\s*\d+\s*\)'
        
        for 匹配 in re.finditer(模式, self.所有脚本内容, re.DOTALL):
            任务编号 = int(匹配.group(1))
            
            if 任务编号 not in self.任务字典:
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': f"任务{任务编号}",
                    '描述': f"从SendQuestBegin发现的任务{任务编号}",
                    'NPC脚本列表': [],
                    '位置': 匹配.start(),
                    '来源': 'SendQuestBegin'
                }
                print(f"从SendQuestBegin找到任务{任务编号}")
    
    def 从Quest模式查找任务(self):
        """从Quest_模式查找任务"""
        # 搜索类似 ;SQuest15_Npc00110 的模式
        模式 = r';SQuest(\d+)_'
        
        for 匹配 in re.finditer(模式, self.所有脚本内容):
            任务编号 = int(匹配.group(1))
            
            if 任务编号 not in self.任务字典:
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': f"任务{任务编号}",
                    '描述': f"从Quest模式发现的任务{任务编号}",
                    'NPC脚本列表': [],
                    '位置': 匹配.start(),
                    '来源': 'Quest模式'
                }
                print(f"从Quest模式找到任务{任务编号}")
    
    def 解析任务信息(self, 内容):
        """解析任务信息部分"""
        print(f"开始解析任务信息，内容长度: {len(内容)}")
        
        # 方法1：查找所有InputQuestInfo
        模式 = r'InputQuestInfo\(\s*(\d+)\s*,\s*"([^"]+)"\s*,\s*"([^"]+)"\s*\)'
        匹配结果 = re.findall(模式, 内容, re.DOTALL)
        
        print(f"方法1找到 {len(匹配结果)} 个任务")
        
        for 匹配 in 匹配结果:
            任务编号 = int(匹配[0])
            任务名称 = 匹配[1].strip()
            任务描述 = 匹配[2].replace('\\n', '\n').strip()
            
            if 任务编号 not in self.任务字典:
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': 任务名称,
                    '描述': 任务描述,
                    'NPC脚本列表': []
                }
                print(f"添加任务{任务编号}: {任务名称[:20]}...")
        
        # 方法2：更宽松的匹配模式（处理换行和空格）
        if not 匹配结果:
            模式2 = r'InputQuestInfo\s*\(\s*(\d+)\s*,\s*"((?:[^"]|\\")+)"\s*,\s*"((?:[^"]|\\")+)"\s*\)'
            匹配结果2 = re.findall(模式2, 内容, re.DOTALL)
            
            print(f"方法2找到 {len(匹配结果2)} 个任务")
            
            for 匹配 in 匹配结果2:
                任务编号 = int(匹配[0])
                任务名称 = 匹配[1].strip().replace('\\"', '"')
                任务描述 = 匹配[2].strip().replace('\\"', '"').replace('\\n', '\n')
                
                if 任务编号 not in self.任务字典:
                    self.任务字典[任务编号] = {
                        '编号': 任务编号,
                        '名称': 任务名称,
                        '描述': 任务描述,
                        'NPC脚本列表': []
                    }
                    print(f"添加任务{任务编号}: {任务名称[:20]}...")
        
        # 方法3：逐行解析（处理格式不规则的情况）
        if not 匹配结果 and not 匹配结果2:
            print("使用逐行解析...")
            行列表 = 内容.split('\n')
            i = 0
            while i < len(行列表):
                行 = 行列表[i].strip()
                if 'InputQuestInfo' in 行:
                    # 尝试提取信息
                    try:
                        # 查找括号内的内容
                        start = 行.find('(')
                        end = 行.rfind(')')
                        if start != -1 and end != -1:
                            参数部分 = 行[start+1:end]
                            参数 = []
                            当前参数 = ""
                            引号内 = False
                            转义 = False
                            
                            for char in 参数部分:
                                if 转义:
                                    当前参数 += char
                                    转义 = False
                                elif char == '\\':
                                    转义 = True
                                    当前参数 += char
                                elif char == '"':
                                    引号内 = not 引号内
                                    当前参数 += char
                                elif char == ',' and not 引号内:
                                    参数.append(当前参数.strip())
                                    当前参数 = ""
                                else:
                                    当前参数 += char
                            
                            if 当前参数:
                                参数.append(当前参数.strip())
                            
                            if len(参数) >= 3:
                                任务编号 = int(参数[0])
                                任务名称 = 参数[1].strip('"').replace('\\"', '"')
                                任务描述 = 参数[2].strip('"').replace('\\"', '"').replace('\\n', '\n')
                                
                                if 任务编号 not in self.任务字典:
                                    self.任务字典[任务编号] = {
                                        '编号': 任务编号,
                                        '名称': 任务名称,
                                        '描述': 任务描述,
                                        'NPC脚本列表': []
                                    }
                                    print(f"逐行解析添加任务{任务编号}: {任务名称[:20]}...")
                    except Exception as e:
                        print(f"解析行时出错: {行}, 错误: {e}")
                i += 1
        
        print(f"总共找到 {len(self.任务字典)} 个任务")
        for 任务编号 in sorted(self.任务字典.keys()):
            print(f"任务{任务编号}: {self.任务字典[任务编号]['名称'][:30]}...")
    
    def 获取任务NPC脚本(self, 任务编号):
        """获取任务相关的NPC脚本 - 修复多任务混在的问题"""
        脚本列表 = []
        for NPC编号, 脚本 in self.NPC脚本字典.items():
            # 使用正则表达式更精确地匹配任务
            模式 = rf'CmpQuestNumStep\s*\(\s*{任务编号}\s*,\s*\d+\s*\)'
            匹配结果 = re.findall(模式, 脚本)
            
            # 检查是否有该任务的开始标记
            任务开始标记 = f'SQuest{任务编号}_'
            
            # 只要包含该任务的CmpQuestNumStep或任务标记，就认为是相关脚本
            if 匹配结果 or 任务开始标记 in 脚本:
                # 提取该任务相关的部分（解决多任务混在一起的问题）
                相关部分 = self.提取任务相关部分(脚本, 任务编号)
                
                脚本列表.append({
                    'NPC编号': NPC编号,
                    '脚本': 相关部分 if 相关部分 else 脚本,
                    '完整脚本': 脚本  # 保存完整脚本用于编辑
                })
        return 脚本列表

    def 提取任务相关部分(self, 完整脚本, 任务编号):
        """从包含多个任务的脚本中提取指定任务的部分"""
        行列表 = 完整脚本.split('\n')
        提取行 = []
        当前行号 = 0
        总行数 = len(行列表)
        
        # 查找该任务的开始
        while 当前行号 < 总行数:
            行 = 行列表[当前行号]
            
            # 查找该任务的开始标记或CmpQuestNumStep
            if f'SQuest{任务编号}_' in 行 or f'CmpQuestNumStep( {任务编号}' in 行:
                提取行.append(行)
                
                # 继续读取直到下一个任务开始或脚本结束
                当前行号 += 1
                while 当前行号 < 总行数:
                    下一行 = 行列表[当前行号]
                    
                    # 如果遇到下一个任务的开始，停止提取
                    if (f'SQuest' in 下一行 and f'SQuest{任务编号}_' not in 下一行) or \
                       (f'CmpQuestNumStep(' in 下一行 and f'CmpQuestNumStep( {任务编号}' not in 下一行):
                        break
                        
                    提取行.append(下一行)
                    当前行号 += 1
                break
            else:
                当前行号 += 1
        
        return '\n'.join(提取行) if 提取行 else None

    def 从所有CmpQuestNumStep查找任务(self):
        """从所有CmpQuestNumStep语句查找任务 - 新增方法，修复问题2"""
        模式 = r'CmpQuestNumStep\s*\(\s*(\d+)\s*,\s*\d+\s*\)'
        
        # 在全部脚本内容中搜索
        for 匹配 in re.finditer(模式, self.所有脚本内容, re.DOTALL):
            任务编号 = int(匹配.group(1))
            
            if 任务编号 not in self.任务字典:
                # 尝试从上下文获取任务名称
                开始位置 = max(0, 匹配.start() - 100)
                结束位置 = min(len(self.所有脚本内容), 匹配.end() + 50)
                上下文 = self.所有脚本内容[开始位置:结束位置]
                
                # 尝试从注释中获取名称
                任务名称 = f"任务{任务编号}"
                行列表 = 上下文.split('\n')
                for 行 in 行列表:
                    if 行.strip().startswith(';'):
                        注释 = 行.strip()[1:].strip()
                        if len(注释) > 2 and 'Quest' not in 注释:
                            任务名称 = 注释
                            break
                
                self.任务字典[任务编号] = {
                    '编号': 任务编号,
                    '名称': 任务名称,
                    '描述': f"从CmpQuestNumStep发现的任务{任务编号}",
                    'NPC脚本列表': [],
                    '位置': 匹配.start(),
                    '来源': 'CmpQuestNumStep'
                }
                print(f"从CmpQuestNumStep找到任务{任务编号}: {任务名称[:20]}...")
                
#-----------------------Nage任务编辑器-----------------------------------------------
class Nage任务编辑器(QMainWindow):
    """Nage任务编辑器主窗口"""
    
    def __init__(self):
        super().__init__()
        self.解析器 = None
        self.当前任务 = None
        self.当前脚本 = None
        self.撤销栈 = []
        self.重做栈 = []
        self.编辑模式 = "文本"  # 文本/可视化
        
        # 获取屏幕尺寸
        屏幕 = QApplication.primaryScreen()
        屏幕尺寸 = 屏幕.availableGeometry()
        屏幕宽度 = 屏幕尺寸.width()
        屏幕高度 = 屏幕尺寸.height()
        
        # 设置窗口大小为屏幕的80%
        窗口宽度 = int(屏幕宽度 * 0.8)
        窗口高度 = int(屏幕高度 * 0.8)
        
        # 设置窗口
        self.setWindowTitle('Nage任务脚本编辑器')
        self.setGeometry(100, 100, int(屏幕宽度 * 0.7), int(屏幕高度 * 0.7))  # 改为70%而不是80%
        
        self.初始化界面()
        self.可视化编辑器 = None  # 稍后初始化
    
    def 初始化界面(self):
        """初始化用户界面"""
        self.setWindowTitle('Nage任务脚本编辑器 - 支持可视化编辑')
        self.setGeometry(100, 100, 1400, 900)
        
        # 创建中心窗口
        中心部件 = QWidget()
        self.setCentralWidget(中心部件)
        
        # 主布局
        主布局 = QHBoxLayout(中心部件)
        
        # 左侧面板 - 任务列表和命令
        左侧面板 = QWidget()
        左侧面板.setMaximumWidth(400)
        左侧布局 = QVBoxLayout(左侧面板)
        
        # 文件操作和模式切换
        文件分组 = QGroupBox("文件操作与编辑模式")
        文件布局 = QVBoxLayout()
        
        # 模式切换
        模式布局 = QHBoxLayout()
        模式标签 = QLabel("编辑模式:")
        self.模式选择 = QComboBox()
        self.模式选择.addItems(["文本编辑模式", "可视化编辑模式"])
        self.模式选择.currentIndexChanged.connect(lambda 索引: self.切换编辑模式(索引))
        模式布局.addWidget(模式标签)
        模式布局.addWidget(self.模式选择)
        模式布局.addStretch()
        
        # 文件操作按钮
        按钮布局 = QHBoxLayout()
        self.加载按钮 = QPushButton("加载脚本")
        self.加载按钮.clicked.connect(lambda: self.加载脚本())
        
        self.保存按钮 = QPushButton("保存脚本")
        self.保存按钮.clicked.connect(lambda: self.保存脚本())
        
        按钮布局.addWidget(self.加载按钮)
        按钮布局.addWidget(self.保存按钮)
        
        文件布局.addLayout(模式布局)
        文件布局.addLayout(按钮布局)
        文件分组.setLayout(文件布局)
        
        # 任务列表（保持原样）
        任务分组 = QGroupBox("任务列表")
        任务布局 = QVBoxLayout()
        
        self.任务列表 = QListWidget()
        self.任务列表.itemClicked.connect(lambda 项目: self.选择任务(项目))
        
        # 任务操作按钮
        任务按钮布局 = QHBoxLayout()
        self.新增任务按钮 = QPushButton("新增任务")
        self.新增任务按钮.clicked.connect(lambda: self.新增任务())
        
        self.删除任务按钮 = QPushButton("删除任务")
        self.删除任务按钮.clicked.connect(lambda: self.删除任务())
        
        self.编辑任务按钮 = QPushButton("编辑任务")
        self.编辑任务按钮.clicked.connect(lambda: self.编辑任务信息())
        
        任务按钮布局.addWidget(self.新增任务按钮)
        任务按钮布局.addWidget(self.删除任务按钮)
        任务按钮布局.addWidget(self.编辑任务按钮)
        
        任务布局.addWidget(self.任务列表)
        任务布局.addLayout(任务按钮布局)
        任务分组.setLayout(任务布局)
        
        # 命令面板
        命令分组 = QGroupBox("脚本命令")
        命令布局 = QVBoxLayout()
        
        self.命令标签页 = QTabWidget()
        self.初始化命令标签页()
        
        命令布局.addWidget(self.命令标签页)
        命令分组.setLayout(命令布局)
        
        # 添加到左侧面板
        左侧布局.addWidget(文件分组)
        左侧布局.addWidget(任务分组)
        左侧布局.addWidget(命令分组)
        
        # 右侧面板 - 使用堆叠窗口切换编辑模式
        self.右侧堆叠 = QStackedWidget()
        
        # 文本编辑器页面
        self.文本编辑器页面 = QWidget()
        self.初始化文本编辑器页面()
        
        # 可视化编辑器页面
        self.可视化编辑器页面 = QWidget()
        self.初始化可视化编辑器页面()
        
        # 添加到堆叠窗口
        self.右侧堆叠.addWidget(self.文本编辑器页面)
        self.右侧堆叠.addWidget(self.可视化编辑器页面)
        
        # 添加到主布局
        主布局.addWidget(左侧面板)
        主布局.addWidget(self.右侧堆叠, 1)
        
        # 状态栏
        self.状态栏 = QStatusBar()
        self.setStatusBar(self.状态栏)
        self.状态栏.showMessage("就绪 - 文本编辑模式")
        
        # 初始化
        self.更新行号()
    
    def 初始化文本编辑器页面(self):
        """初始化文本编辑器页面"""
        布局 = QVBoxLayout(self.文本编辑器页面)
        
        # 添加流程控制工具栏
        流程工具栏 = QGroupBox("常用流程控制")
        流程布局 = QHBoxLayout()
    
        # 流程控制按钮
        流程按钮信息 = [
            "if条件", "else分支", "跳转标签", "定义标签",
            "代码块开始", "代码块结束", "条件判断"
        ]
    
        for 按钮名 in 流程按钮信息:
            按钮 = QPushButton(按钮名)
            按钮.setMinimumHeight(35)
        
            # 设置颜色
            颜色 = {
                "if条件": "#FF9800",
                "else分支": "#FF5722", 
                "跳转标签": "#9C27B0",
                "定义标签": "#673AB7",
                "代码块开始": "#2196F3",
                "代码块结束": "#03A9F4",
                "条件判断": "#FF9800"
            }.get(按钮名, "#607D8B")
        
            按钮.setStyleSheet(f"""
                QPushButton {{
                    background-color: {颜色};
                    color: white;
                    border: none;
                    padding: 8px;
                    font-size: 12px;
                    font-weight: bold;
                    border-radius: 5px;
                    margin: 2px;
                }}
                QPushButton:hover {{
                    background-color: {self.调整颜色亮度(颜色, 1.2)};
                }}
            """)
        
            按钮.clicked.connect(lambda 选中=False, 命令=按钮名: self.插入命令(命令))
            流程布局.addWidget(按钮)
    
        流程布局.addStretch()
        流程工具栏.setLayout(流程布局)
        布局.addWidget(流程工具栏)

        # 脚本编辑区域
        编辑器分组 = QGroupBox("脚本编辑器")
        编辑器布局 = QVBoxLayout()
        
        # 工具栏
        工具栏 = QHBoxLayout()
        
        self.查找按钮 = QPushButton("查找")
        self.查找按钮.clicked.connect(lambda: self.查找文本())
        
        self.替换按钮 = QPushButton("替换")
        self.替换按钮.clicked.connect(lambda: self.替换文本())
        
        self.翻译按钮 = QPushButton("中文显示")
        self.翻译按钮.clicked.connect(lambda: self.切换中英文显示())
        
        self.显示中文 = False  # 当前是否显示中文
        
        工具栏.addWidget(self.查找按钮)
        工具栏.addWidget(self.替换按钮)
        工具栏.addWidget(self.翻译按钮)
        工具栏.addStretch()
        
        # 脚本编辑器
        编辑器水平布局 = QHBoxLayout()
        
        # 行号显示
        self.行号显示 = QTextEdit()
        self.行号显示.setReadOnly(True)
        self.行号显示.setMaximumWidth(50)
        self.行号显示.setFont(QFont("Courier New", 10))
        self.行号显示.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOff)
        
        # 主编辑器
        self.脚本编辑器 = QTextEdit()
        self.脚本编辑器.setFont(QFont("Courier New", 10))
        self.脚本编辑器.textChanged.connect(lambda: self.文本改变时)
        
        # 同步滚动条
        self.脚本编辑器.verticalScrollBar().valueChanged.connect(lambda: 
            self.同步滚动条
        )
        
        编辑器水平布局.addWidget(self.行号显示)
        编辑器水平布局.addWidget(self.脚本编辑器)
        
        编辑器布局.addLayout(工具栏)
        编辑器布局.addLayout(编辑器水平布局)
        编辑器分组.setLayout(编辑器布局)
        
        状态分组 = QGroupBox("当前任务信息")
        状态布局 = QVBoxLayout()
        
        self.当前任务标签 = QLabel("未选择任务")
        self.关联NPC数量标签 = QLabel("关联NPC: 0个")
        
        状态布局.addWidget(self.当前任务标签)
        状态布局.addWidget(self.关联NPC数量标签)
        状态分组.setLayout(状态布局)
        
        布局.addWidget(编辑器分组)
        布局.addWidget(状态分组)
    
    def 初始化可视化编辑器页面(self):
        """初始化可视化编辑器页面 - 修改版"""
        布局 = QVBoxLayout(self.可视化编辑器页面)
    
        # 创建可视化编辑器时传入主编辑器引用
        self.可视化编辑器 = 简化可视化编辑器(self)
    
        # 确保可视化编辑器可以访问主编辑器的调整颜色亮度方法
        if hasattr(self, '调整颜色亮度'):
            self.可视化编辑器.调整颜色亮度 = self.调整颜色亮度
    
        布局.addWidget(self.可视化编辑器)
    
    def 切换编辑模式(self, 索引):
        """切换编辑模式 - 实现无缝切换"""
        新模式 = "可视化" if 索引 == 1 else "文本"
    
        # 保存当前编辑内容
        if self.编辑模式 == "文本" and self.当前任务:
            self.保存当前任务修改()

        # 如果切换到可视化模式，自动从当前文本导入
        if 新模式 == "可视化" and self.脚本编辑器.toPlainText().strip():
            print("切换到可视化模式，导入文本...")
            当前文本 = self.脚本编辑器.toPlainText()
            if 当前文本 and hasattr(self, '可视化编辑器') and self.可视化编辑器:
                try:
                    成功 = self.可视化编辑器.从文本导入(当前文本)
                    if 成功:
                        print("文本导入到可视化编辑器成功")
                    else:
                        print("文本导入到可视化编辑器失败")
                except Exception as e:
                    print(f"导入文本时出错: {e}")
    
        # 切换界面
        self.编辑模式 = 新模式
        self.右侧堆叠.setCurrentIndex(索引)
    
        if 索引 == 0:
            self.状态栏.showMessage("文本编辑模式")
        else:
            self.状态栏.showMessage("可视化编辑模式")
    
    def 选择任务(self, 项目):
        """选择任务 - 确保可视化模式也能显示"""
        # 保存当前任务的修改（如果有）
        if hasattr(self, '当前任务') and self.当前任务 and hasattr(self, '解析器') and self.解析器:
            self.保存当前任务修改()
    
        任务编号 = 项目.data(Qt.UserRole)
        self.当前任务 = 任务编号
    
        if self.解析器 and 任务编号 in self.解析器.任务字典:
            任务信息 = self.解析器.任务字典[任务编号]
        
            # 优先使用保存的脚本内容
            if '脚本内容' in 任务信息 and 任务信息['脚本内容']:
                完整脚本 = 任务信息['脚本内容']
            else:
                # 如果没有保存的内容，从原始解析器中获取
                NPC脚本数据 = self.解析器.获取任务NPC脚本(任务编号)
            
                # 构建完整脚本
                信息文本 = f";SQuest{任务编号}_Info\n"
                if '名称' in 任务信息 and '描述' in 任务信息:
                    描述 = 任务信息['描述'].replace('\n', '\\n').replace('\r', '')
                    信息文本 += f'\tInputQuestInfo( {任务编号}, "{任务信息["名称"]}", "{描述}" )\n'
                信息文本 += f";EQuest{任务编号}_Info\n\n"
            
                for 脚本数据 in NPC脚本数据:
                    NPC编号 = 脚本数据['NPC编号']
                    脚本内容 = 脚本数据.get('脚本', 脚本数据.get('完整脚本', ''))
                
                    信息文本 += f"@{NPC编号}\n{脚本内容}\n"
                    if not 脚本内容.strip().endswith('end'):
                        信息文本 += "end\n"
                    信息文本 += "\n"
            
                完整脚本 = 信息文本
                任务信息['脚本内容'] = 完整脚本
        
            # 显示在文本编辑器中
            self.脚本编辑器.setText(完整脚本)
            self.当前脚本 = f"任务{任务编号}_完整脚本"
            self.更新行号()
        
             # 如果当前是可视化模式，也导入到可视化编辑器
            if self.编辑模式 == "可视化" and hasattr(self, '可视化编辑器') and self.可视化编辑器:
                try:
                    self.可视化编辑器.从文本导入(完整脚本)
                    self.状态栏.showMessage(f"任务{任务编号}已加载到可视化编辑器")
                except Exception as e:
                    print(f"加载到可视化编辑器时出错: {e}")
                    self.状态栏.showMessage(f"任务{任务编号}加载失败: {str(e)}")
        
            self.状态栏.showMessage(f"任务{任务编号}: {任务信息.get('名称', '未知')}")
    
    def 保存当前任务修改(self):
        """保存当前任务的修改到解析器"""
        if not hasattr(self, '当前任务') or not self.当前任务:
            return
    
        当前文本 = self.脚本编辑器.toPlainText()
        if not 当前文本:
            return
    
        # 确保解析器存在
        if not hasattr(self, '解析器') or not self.解析器:
            return
    
        # 确保任务在字典中
        if self.当前任务 not in self.解析器.任务字典:
            self.解析器.任务字典[self.当前任务] = {
                '编号': self.当前任务,
                '名称': f"任务{self.当前任务}",
                '描述': "",
                'NPC脚本列表': []
            }
    
        # 保存脚本内容
        self.解析器.任务字典[self.当前任务]['脚本内容'] = 当前文本
    
        # 解析并保存NPC脚本
        部分列表 = 当前文本.split('@')
        for 部分 in 部分列表:
            if not 部分.strip():
                continue
        
            行列表 = 部分.strip().split('\n')
            if not 行列表:
                continue
            
            头部 = 行列表[0].strip()
            主体 = '\n'.join(行列表[1:])
        
            if 头部.startswith('Npc'):
                self.解析器.NPC脚本字典[头部] = 主体
    
        print(f"已保存任务{self.当前任务}的修改")

    def 切换中英文显示(self):
        """切换中英文显示"""
        self.显示中文 = not self.显示中文
        
        if self.显示中文:
            self.翻译按钮.setText("英文显示")
            self.中文显示代码()
        else:
            self.翻译按钮.setText("中文显示")
            self.英文显示代码()
    
    def 初始化命令标签页(self):
        """初始化命令标签页"""
        # 1. 获取信息类
        获取信息标签页 = QWidget()
        获取信息滚动区域 = QScrollArea()
        获取信息滚动区域.setWidgetResizable(True)
        获取信息容器 = QWidget()
        获取信息布局 = QVBoxLayout(获取信息容器)
        self.添加命令到布局([
            "获取战斗等级", "获取贸易等级", "获取技能等级", "获取执照等级", "获取玩家持有金钱",
            "获取主技能", "获取角色类型", "获取队伍成员数", "获取事件模式",
            "获取对话状态", "获取菜单选择"
        ], 获取信息布局)
        获取信息滚动区域.setWidget(获取信息容器)
        
        # 2. 检查条件类
        检查条件标签页 = QWidget()
        检查条件滚动区域 = QScrollArea()
        检查条件滚动区域.setWidgetResizable(True)
        检查条件容器 = QWidget()
        检查条件布局 = QVBoxLayout(检查条件容器)
        self.添加命令到布局([
            "检查任务可用性", "检查是否接受任务", "检查任务完成", "检查地图编号",
            "检查背包物品", "检查交易栏箱子", "检查快捷栏物品", "检查背包空格",
            "检查交易栏空格", "检查快捷栏空格", "检查NPC编号", "检查对话模式",
            "检查战斗模式", "检查购买模式", "检查出售模式", "检查拾取模式",
            "检查丢弃模式", "检查NPC类型", "检查物品ID", "检查玩家提问",
            "检查玩家选是", "检查玩家选否", "检查任务超时", "检查杀怪数量",
            "检查是否在队伍", "检查是否队长", "检查登录状态", "检查英雄类型"
        ], 检查条件布局)
        检查条件滚动区域.setWidget(检查条件容器)
        
        # 3. 对话显示类
        对话显示标签页 = QWidget()
        对话显示滚动区域 = QScrollArea()
        对话显示滚动区域.setWidgetResizable(True)
        对话显示容器 = QWidget()
        对话显示布局 = QVBoxLayout(对话显示容器)
        self.添加命令到布局([
            "发送NPC对话", "发送是/否问题", "发送事件消息",
            "发送结束对话", "发送结束是/否问题", "发送菜单问题"
        ], 对话显示布局)
        对话显示滚动区域.setWidget(对话显示容器)
        
        # 4. 任务操作类
        任务操作标签页 = QWidget()
        任务操作滚动区域 = QScrollArea()
        任务操作滚动区域.setWidgetResizable(True)
        任务操作容器 = QWidget()
        任务操作布局 = QVBoxLayout(任务操作容器)
        self.添加命令到布局([
            "设置任务步骤", "比较任务步骤", "开始任务", "完成任务",
            "取消任务", "设置下一个NPC", "输入任务信息", "添加杀怪任务",
            "增加杀怪计数"
        ], 任务操作布局)
        任务操作滚动区域.setWidget(任务操作容器)
        
        # 5. 物品操作类
        物品操作标签页 = QWidget()
        物品操作滚动区域 = QScrollArea()
        物品操作滚动区域.setWidgetResizable(True)
        物品操作容器 = QWidget()
        物品操作布局 = QVBoxLayout(物品操作容器)
        self.添加命令到布局([
            "移除背包物品", "添加背包物品", "添加交易栏箱子", "移除交易栏箱子", "添加金钱",
            "移除金钱", "丢弃物品", "获取物品数量", "批量添加物品",
            "批量移除物品", "随机物品判断", "随机添加物品"
        ], 物品操作布局)
        物品操作滚动区域.setWidget(物品操作容器)
        
        # 6. 界面操作类
        界面操作标签页 = QWidget()
        界面操作滚动区域 = QScrollArea()
        界面操作滚动区域.setWidgetResizable(True)
        界面操作容器 = QWidget()
        界面操作布局 = QVBoxLayout(界面操作容器)
        self.添加命令到布局([
            "打开帮助窗口", "关闭帮助窗口", "打开信息窗口", "关闭信息窗口",
            "打开任务信息窗口", "关闭任务信息窗口", "打开装备窗口",
            "关闭装备窗口", "打开技能窗口", "关闭技能窗口",
            "打开队伍窗口", "关闭队伍窗口", "打开选项窗口", "关闭选项窗口",
            "打开背包窗口", "关闭背包窗口", "打开小地图窗口", "关闭小地图窗口",
            "开始闪烁伊甸园按钮", "结束闪烁伊甸园按钮",
            "开始闪烁执照按钮", "结束闪烁执照按钮",
            "开始闪烁联盟笔记本按钮", "结束闪烁联盟笔记本按钮"
        ], 界面操作布局)
        界面操作滚动区域.setWidget(界面操作容器)
        
        # 7. 其他功能类
        其他功能标签页 = QWidget()
        其他功能滚动区域 = QScrollArea()
        其他功能滚动区域.setWidgetResizable(True)
        其他功能容器 = QWidget()
        其他功能布局 = QVBoxLayout(其他功能容器)
        self.添加命令到布局([
            "给予经验", "改变执照等级", "移动到位置", "等级提升", "技能提升",
            "设置英雄升级", "生成随机数", "发送玩家特效", "发送地面特效",
            "设置事件区域", "检查购买箱子", "检查出售箱子", "检查NPC菜单",
            "检查进入建筑", "检查离开建筑", "检查下一段对话", "检查关闭对话",
            "检查取消任务", "检查加入队伍", "检查离开队伍",
            "临时背包活动", "临时发型活动"
        ], 其他功能布局)
        其他功能滚动区域.setWidget(其他功能容器)
        
        # 添加到标签页
        self.命令标签页.addTab(获取信息滚动区域, "获取信息")
        self.命令标签页.addTab(检查条件滚动区域, "检查条件")
        self.命令标签页.addTab(对话显示滚动区域, "对话显示")
        self.命令标签页.addTab(任务操作滚动区域, "任务操作")
        self.命令标签页.addTab(物品操作滚动区域, "物品操作")
        self.命令标签页.addTab(界面操作滚动区域, "界面操作")
        self.命令标签页.addTab(其他功能滚动区域, "其他功能")
    
    def 添加命令到布局(self, 命令列表, 布局):
        """将命令列表添加到布局 - 调整高度"""
        # 命令类型颜色映射（与可视化编辑器一致）
        类型颜色 = {
            "获取": "#4CAF50",      # 绿色
            "检查": "#FF9800",      # 橙色
            "发送": "#2196F3",      # 蓝色
            "设置": "#9C27B0",      # 紫色
            "添加": "#009688",      # 青色
            "移除": "#F44336",      # 红色
            "打开": "#673AB7",      # 深紫
            "关闭": "#757575",      # 深灰
            "开始": "#FF5722",      # 深橙
            "结束": "#607D8B",      # 蓝灰
        }
    
        for 命令名 in 命令列表:
            if 命令名 in 脚本命令:
                命令类型, 命令ID, 命令描述 = 脚本命令[命令名]
            
                # 确定按钮颜色
                按钮颜色 = "#607D8B"  # 默认颜色
                for 前缀, 颜色 in 类型颜色.items():
                    if 命令名.startswith(前缀):
                        按钮颜色 = 颜色
                        break
            
                按钮 = QPushButton(f"{命令名}")
            
                # 设置彩色按钮样式（调整高度）
                按钮.setStyleSheet(f"""
                    QPushButton {{
                        background-color: {按钮颜色};
                        color: white;
                        border: none;
                        padding: 6px 8px;
                        font-size: 16px;
                        margin: 2px;
                        border-radius: 5px;
                        font-weight: bold;
                        text-align: center;
                        min-height: 32px;
                        max-height: 32px;
                    }}
                    QPushButton:hover {{
                        background-color: {self.调整颜色亮度(按钮颜色, 1.2)};
                        border: 1px solid #ffffff;
                    }}
                    QPushButton:pressed {{
                        background-color: {self.调整颜色亮度(按钮颜色, 0.8)};
                    }}
                """)
            
                # 设置固定高度
                按钮.setFixedHeight(32)
                按钮.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)
            
                # 设置提示信息
                按钮.setToolTip(f"ID: {命令ID}  参数: {命令类型}\n{命令描述}")
            
                # 连接信号
                按钮.clicked.connect(lambda 选中=False, 命令=命令名: self.插入命令(命令))
                布局.addWidget(按钮)
    
        # 添加拉伸
        布局.addStretch()
    
    def 调整颜色亮度(self, hex_color, factor):
        """调整颜色亮度"""
        颜色 = QColor(hex_color)
        return 颜色.lighter(int(factor * 100)).name()

    def 插入命令(self, 中文命令名):
        """插入命令到编辑器 - 确保可视化模式也能使用"""
        if 中文命令名 in 中文到英文映射:
            英文命令名 = 中文到英文映射[中文命令名]
            命令类型 = 脚本命令[中文命令名][0]
            光标 = self.脚本编辑器.textCursor()
        
            # 根据当前显示模式决定插入中文还是英文
            if hasattr(self, '显示中文') and self.显示中文:
                # 中文显示模式，插入中文命令
                模板 = self.获取命令模板中文(英文命令名, 命令类型)
            else:
                # 英文显示模式，插入英文命令
                模板 = self.获取命令模板(英文命令名, 命令类型)
        
            光标.insertText(模板)
        
            # 移动光标到合适位置
            self.定位光标位置(光标, 命令类型)
            self.脚本编辑器.setTextCursor(光标)
        
            # 确保可视化编辑器也能创建节点
            if self.编辑模式 == "可视化" and hasattr(self, '可视化编辑器') and self.可视化编辑器:
                try:
                    self.可视化编辑器.创建节点(中文命令名)
                except Exception as e:
                    print(f"在可视化编辑器创建节点失败: {e}")
    
    def 获取命令模板中文(self, 英文命令名, 命令类型):
        """获取中文命令模板"""
        # 先找到中文命令名
        中文命令名 = None
        for 英, 中 in 中文到英文映射.items():
            if 中 == 英文命令名:
                中文命令名 = 英
                break
    
        if not 中文命令名:
            中文命令名 = 英文命令名
    
        # 中文模板字典
        模板字典 = {
            "null": f"\t{中文命令名}()",
            "i": f"\t{中文命令名}( )",
            "s": f'\t{中文命令名}("")',
            "ii": f"\t{中文命令名}( , )",
            "iii": f"\t{中文命令名}( , , )",
            "iss": f'\t{中文命令名}( , "", "" )',
            "iiii": f"\t{中文命令名}( , , , )",
            "sssss": f'\t{中文命令名}("", "", "", "", "")',
            "siiiiii": f'\t{中文命令名}("", , , , , )',
            "iiiii": f"\t{中文命令名}( , , , , )",
            "iiiiii": f"\t{中文命令名}( , , , , , )",
        }
        return 模板字典.get(命令类型, f"\t{中文命令名}()")

    def 获取命令模板(self, 英文命令名, 命令类型):
        """根据命令类型生成模板"""
        模板字典 = {
            "null": f"\t{英文命令名}()",
            "i": f"\t{英文命令名}( )",
            "s": f'\t{英文命令名}("")',
            "ii": f"\t{英文命令名}( , )",
            "iii": f"\t{英文命令名}( , , )",
            "iss": f'\t{英文命令名}( , "", "" )',
            "iiii": f"\t{英文命令名}( , , , )",
            "sssss": f'\t{英文命令名}("", "", "", "", "")',
            "siiiiii": f'\t{英文命令名}("", , , , , )',
            "iiiii": f"\t{英文命令名}( , , , , )",
            "iiiiii": f"\t{英文命令名}( , , , , , )",
        }
        return 模板字典.get(命令类型, f"\t{英文命令名}()")
    
    def 定位光标位置(self, 光标, 命令类型):
        """插入命令后定位光标"""
        移动次数 = {
            "null": 0,
            "i": 1,      # 移到括号内
            "s": 2,      # 移到引号内
            "ii": 3,     # 移到第一个参数位置
            "iii": 5,    # 移到第一个参数位置
            "iss": 6,    # 移到ID参数位置
            "iiii": 7,   # 移到第一个参数位置
            "sssss": 10, # 移到第一个引号内
            "siiiiii": 12, # 移到引号内
            "iiiii": 9,  # 移到第一个参数位置
            "iiiiii": 11, # 移到第一个参数位置
        }
        
        次数 = 移动次数.get(命令类型, 0)
        for _ in range(次数):
            光标.movePosition(QTextCursor.Left)
            光标.movePosition(QTextCursor.Left)
    
    def 加载脚本(self):
        """加载脚本文件"""
        print("加载脚本按钮被点击")  # 调试信息
        
        文件路径, _ = QFileDialog.getOpenFileName(
            self, "选择脚本文件", "", "脚本文件 (*.zs *.txt);;所有文件 (*.*)"
        )
        
        print(f"选择的文件路径: {文件路径}")  # 调试信息
        
        if 文件路径:
            try:
                self.解析器 = 任务解析器(文件路径)
                self.更新任务列表()
                消息 = f"已加载: {os.path.basename(文件路径)} - 找到{len(self.解析器.任务字典)}个任务"
                self.状态栏.showMessage(消息)
                #QMessageBox.information(self, "加载成功", 消息)
            except Exception as 异常:
                print(f"加载文件失败: {str(异常)}")  # 调试信息
                QMessageBox.critical(self, "错误", f"加载文件失败:\n{str(异常)}")
        else:
            print("用户取消了文件选择")  # 调试信息
    
    def 更新任务列表(self):
        """更新任务列表"""
        self.任务列表.clear()
        if self.解析器 and hasattr(self.解析器, '任务字典'):
            任务数量 = len(self.解析器.任务字典)
            print(f"更新任务列表: 共有{任务数量}个任务")  # 调试信息
            
            for 任务编号, 任务信息 in sorted(self.解析器.任务字典.items()):
                项目文本 = f"任务{任务编号}: {任务信息['名称']}"
                项目 = QListWidgetItem(项目文本)
                项目.setData(Qt.UserRole, 任务编号)
                
                # 设置提示信息
                项目.setToolTip(f"{任务信息['描述'][:100]}...")
                
                self.任务列表.addItem(项目)
            
            self.状态栏.showMessage(f"共找到 {任务数量} 个任务")
        else:
            print("解析器不存在或没有任务字典")
    
    def 新增任务(self):
        """新增任务 - 生成完整模板"""
        print("新增任务按钮被点击")
    
        对话框 = 任务信息对话框(self)
        if 对话框.exec_():
            任务编号, 任务名称, 任务描述 = 对话框.获取数据()
        
            # 检查任务编号是否已存在
            if hasattr(self, '解析器') and self.解析器 and 任务编号 in self.解析器.任务字典:
                # 查找下一个可用的任务编号
                新编号 = 任务编号
                while 新编号 in self.解析器.任务字典:
                    新编号 += 1
            
                回复 = QMessageBox.information(
                    self, "任务编号已存在",
                    f"任务编号{任务编号}已存在，将使用新编号{新编号}",
                    QMessageBox.Ok
                )
                任务编号 = 新编号
        
            # 生成完整脚本模板
            完整脚本 = 增强脚本转换器.生成完整脚本(任务编号, 任务名称, 任务描述, [])
        
            # 更新解析器
            if not hasattr(self, '解析器') or self.解析器 is None:
                self.解析器 = type('EmptyParser', (), {
                    '任务字典': {},
                    'NPC脚本字典': {},
                    '系统脚本字典': {},
                    '获取任务NPC脚本': lambda task_id: []
                })()
                self.解析器.任务字典 = {}
                self.解析器.NPC脚本字典 = {}
                self.解析器.系统脚本字典 = {}
        
            # 保存到解析器
            self.解析器.任务字典[任务编号] = {
                '编号': 任务编号,
                '名称': 任务名称,
                '描述': 任务描述,
                'NPC脚本列表': [],
                '脚本内容': 完整脚本  # 保存完整脚本
            }
        
            # 添加到NPC脚本字典
            NPC编号 = "Npc00001"
            self.解析器.NPC脚本字典[NPC编号] = f";SQuest{任务编号}_{NPC编号}\n" + \
                                              f";SCon{任务编号}{NPC编号}\n" + \
                                              "CmpQuestNumStep( {任务编号}, 0 )\n" + \
                                              "if( yes==1 )\n" + \
                                              "{\n" + \
                                              "\tCheckTalkNpc()\n" + \
                                              "\tif(yes == 1)\n" + \
                                              "\t{\n" + \
                                              "\t\tSendTalkNpcToPlayer(\"欢迎！\")\n" + \
                                              "\t}\n" + \
                                              "}\n" + \
                                              f";ECon{任务编号}{NPC编号}\n" + \
                                              ":End_QuestNpc00001\n" + \
                                              "end"
        
            # 更新列表
            self.更新任务列表()
        
            # 选中新任务
            for 索引 in range(self.任务列表.count()):
                项目 = self.任务列表.item(索引)
                if 项目.data(Qt.UserRole) == 任务编号:
                    self.任务列表.setCurrentItem(项目)
                    self.选择任务(项目)
                    break
        
            # 显示完整脚本
            self.脚本编辑器.setText(完整脚本)
            self.当前脚本 = f"任务{任务编号}_完整脚本"
            self.更新行号()
    
    def 编辑任务信息(self):
        """编辑任务信息"""
        if not self.当前任务 or not self.解析器:
            QMessageBox.warning(self, "提示", "请先选择一个任务")
            return
        
        任务信息 = self.解析器.任务字典[self.当前任务]
        对话框 = 任务信息对话框(self, 
                                任务信息['编号'],
                                任务信息['名称'],
                                任务信息['描述'])
        
        if 对话框.exec_():
            任务编号, 任务名称, 任务描述 = 对话框.获取数据()
            
            # 如果ID改变，删除旧的
            if 任务编号 != self.当前任务:
                del self.解析器.任务字典[self.当前任务]
                self.当前任务 = 任务编号
            
            # 更新任务信息
            self.解析器.任务字典[任务编号] = {
                '编号': 任务编号,
                '名称': 任务名称,
                '描述': 任务描述,
                'NPC脚本列表': self.解析器.任务字典.get(任务编号, {}).get('NPC脚本列表', [])
            }
            
            self.更新任务列表()
    
    def 删除任务(self):
        """删除任务 - 修复缺少NPC列表属性的问题"""
        if not self.当前任务 or not self.解析器:
            QMessageBox.warning(self, "提示", "请先选择一个任务")
            return
    
        任务名称 = self.解析器.任务字典[self.当前任务].get('名称', f"任务{self.当前任务}")
    
        回复 = QMessageBox.question(
            self, "确认删除",
            f"确定要删除任务{self.当前任务}: {任务名称}吗？\n此操作不可撤销！",
            QMessageBox.Yes | QMessageBox.No
        )
    
        if 回复 == QMessageBox.Yes:
            # 删除任务
            if self.当前任务 in self.解析器.任务字典:
                del self.解析器.任务字典[self.当前任务]
        
            # 清理相关的NPC脚本
            NPC编号列表 = []
            for NPC编号 in list(self.解析器.NPC脚本字典.keys()):
                if f"Quest{self.当前任务}" in self.解析器.NPC脚本字典[NPC编号]:
                    NPC编号列表.append(NPC编号)
        
            for NPC编号 in NPC编号列表:
                del self.解析器.NPC脚本字典[NPC编号]
        
            self.当前任务 = None
            self.更新任务列表()
            self.脚本编辑器.clear()
            self.当前任务标签.setText("未选择任务")
            self.更新行号()
        
            if hasattr(self, '可视化编辑器') and self.可视化编辑器:
                self.可视化编辑器.清除画布()
        
            self.状态栏.showMessage("任务已删除")
    
    def 生成模板(self):
        """生成常用模板"""
        if not self.脚本编辑器.toPlainText().strip():
            模板字典 = {
                "简单对话": """\tSendTalkNpcToPlayer("欢迎来到N-age的世界！")
\tCheckAnserNext()
\tif(yes == 1)
\t{
\t\tSendTalkNpcToPlayer("按Q键查看任务详情。")
\t\tgoto End_Example
\t}
\telse
\t{
\t\tSendEventMsg("详细事项请洽官方网站。")
\t\tgoto End_Example
\t}
:End_Example""",
                
                "条件检查": """\tCheckTalkNpc()
\tif(yes == 1)
\t{
\t\tCheckMapNo(1)
\t\tif(yes == 1)
\t\t{
\t\t\tGetBLv()
\t\t\tif(yes == 1)
\t\t\t{
\t\t\t\tSendTalkNpcToPlayer("符合条件可以接受任务。")
\t\t\t}
\t\t}
\t}""",
                
                "物品奖励": """\tCheckEmptyInv(2)
\tif(yes == 1)
\t{
\t\tGetBaseSkill()
\t\tif(yes == 0)
\t\t{
\t\t\tSendSkillUp(0, 100)
\t\t\tPushInvItem(53171)  ; 武术武器
\t\t\tPushInvItem(47006)  ; 通用奖励
\t\t\tSendEventMsg("获得武术技能和武器奖励！")
\t\t}
\t\telse if(yes == 2)
\t\t{
\t\t\tSendSkillUp(2, 100)
\t\t\tPushInvItem(51574)  ; 持械武器
\t\t\tPushInvItem(47006)  ; 通用奖励
\t\t\tSendEventMsg("获得持械技能和武器奖励！")
\t\t}
\t}""",
                
                "等级奖励": """\tSendLevelUp(1)
\tGetBaseSkill()
\tif(yes < 3)
\t{
\t\tSendSkillUp(1, 20)  ; 格挡技能
\t}
\telse
\t{
\t\tSendSkillUp(3, 20)  ; 命中技能
\t}
\tSendEventMsg("等级提升并获得技能点！")"""
            }
            
            模板名称列表 = list(模板字典.keys())
            模板名称, 确定 = QInputDialog.getItem(
                self, "选择模板", "请选择要插入的模板:", 模板名称列表, 0, False
            )
            
            if 确定 and 模板名称:
                光标 = self.脚本编辑器.textCursor()
                光标.insertText(模板字典[模板名称])
    
    def 保存脚本(self):
        """保存脚本文件"""
        if not self.解析器:
            QMessageBox.warning(self, "提示", "没有加载任何脚本文件")
            return
        
        文件路径, _ = QFileDialog.getSaveFileName(
            self, "保存脚本文件", "ns.zs", "脚本文件 (*.zs);;所有文件 (*.*)"
        )
        
        if 文件路径:
            try:
                self.生成脚本文件(文件路径)
                self.状态栏.showMessage(f"已保存: {os.path.basename(文件路径)}")
            except Exception as 异常:
                QMessageBox.critical(self, "错误", f"保存文件失败:\n{str(异常)}")
    
    def 生成脚本文件(self, 文件路径):
        """生成完整的脚本文件 - 确保保存所有修改"""
        # 首先保存当前任务的修改
        if hasattr(self, '当前任务') and self.当前任务:
            self.保存当前任务修改()

        内容 = ""
    
        # 首先添加所有任务信息到sys00
        内容 += "@sys00\n"
        内容 += "; 任务信息定义\n"
    
        for 任务编号, 任务信息 in sorted(self.解析器.任务字典.items()):
            if '名称' in 任务信息 and '描述' in 任务信息:
                描述 = 任务信息['描述'].replace('\n', '\\n').replace('\r', '')
                内容 += f'\tInputQuestInfo( {任务编号}, "{任务信息["名称"]}", "{描述}" )\n'
    
        内容 += "end\n\n"
    
        # 添加其他系统脚本
        for 系统编号, 系统脚本 in sorted(self.解析器.系统脚本字典.items()):
            if 系统编号 != "sys00":
                内容 += f"@{系统编号}\n{系统脚本}\n"
                if not 系统脚本.strip().endswith('end'):
                    内容 += "end\n"
                内容 += "\n"
    
        # 添加NPC脚本 - 确保保存所有修改
        for NPC编号, NPC脚本 in sorted(self.解析器.NPC脚本字典.items()):
            内容 += f"@{NPC编号}\n{NPC脚本}\n"
            if not NPC脚本.strip().endswith('end'):
                内容 += "end\n"
            内容 += "\n"
    
        # 还要保存当前正在编辑的任务（如果不在字典中）
        if self.当前任务 and self.当前任务 in self.解析器.任务字典:
            # 获取当前编辑器的内容
            当前内容 = self.脚本编辑器.toPlainText()
            if 当前内容:
                # 解析当前内容，更新NPC脚本
                部分列表 = 当前内容.split('@')
                for 部分 in 部分列表:
                    if not 部分.strip():
                        continue
                
                    行列表 = 部分.strip().split('\n')
                    if 行列表:
                        NPC编号 = 行列表[0].strip()
                        if NPC编号.startswith('Npc'):
                            脚本主体 = '\n'.join(行列表[1:])
                            self.解析器.NPC脚本字典[NPC编号] = 脚本主体
    
        print(f"生成脚本文件，共{len(内容)}字节")
    
        # 写入文件
        try:
            with open(文件路径, 'w', encoding='gbk', errors='ignore') as 文件:
                文件.write(内容)
            print(f"文件已保存到: {文件路径}")
            self.状态栏.showMessage(f"已保存到: {os.path.basename(文件路径)}")
        except Exception as e:
            print(f"保存文件时出错: {e}")
            QMessageBox.critical(self, "错误", f"保存文件失败:\n{str(e)}")
    
    def 更新完整任务脚本(self, 文本):
        """更新完整的任务脚本"""
        if not self.当前任务:
            return
        
        try:
            # 分割不同的部分
            部分列表 = 文本.split('@')
            
            for 部分 in 部分列表:
                if not 部分.strip():
                    continue
                
                行列表 = 部分.split('\n')
                if not 行列表:
                    continue
                    
                头部 = 行列表[0].strip()
                主体 = '\n'.join(行列表[1:])
                
                if 头部.startswith('sys'):
                    self.解析器.系统脚本字典[头部] = 主体
                    print(f"更新系统脚本: {头部}")
                elif 头部.startswith('Npc'):
                    self.解析器.NPC脚本字典[头部] = 主体
                    print(f"更新NPC脚本: {头部}")
                elif 头部.startswith(';SQuest'):
                    # 提取任务信息
                    模式 = r'InputQuestInfo\(\s*(\d+)\s*,\s*"([^"]+)"\s*,\s*"([^"]+)"\s*\)'
                    匹配结果 = re.findall(模式, 主体, re.DOTALL)
                    
                    for 匹配 in 匹配结果:
                        任务编号 = int(匹配[0])
                        任务名称 = 匹配[1].strip()
                        任务描述 = 匹配[2].replace('\\n', '\n').strip()
                        
                        if 任务编号 in self.解析器.任务字典:
                            self.解析器.任务字典[任务编号]['名称'] = 任务名称
                            self.解析器.任务字典[任务编号]['描述'] = 任务描述
                            print(f"更新任务信息: {任务编号}")
                            
        except Exception as e:
            print(f"更新任务脚本时出错: {e}")
    
    def 更新行号(self):
        """更新行号显示"""
        行数 = self.脚本编辑器.document().blockCount()
        行号文本 = "\n".join(str(索引 + 1) for 索引 in range(行数))
        self.行号显示.setText(行号文本)
        self.行号显示.verticalScrollBar().setValue(
            self.脚本编辑器.verticalScrollBar().value()
        )
    
    def 同步滚动条(self, 值):
        """同步滚动条"""
        self.行号显示.verticalScrollBar().setValue(值)
    
    def 查找文本(self):
        """查找文本 - 修改为可连续查找"""
        if not hasattr(self, '查找对话框') or not self.查找对话框:
            # 创建查找对话框
            self.查找对话框 = QDialog(self)
            self.查找对话框.setWindowTitle("查找")
            self.查找对话框.setFixedSize(300, 150)
            
            布局 = QVBoxLayout(self.查找对话框)
            
            # 查找输入框
            输入布局 = QHBoxLayout()
            输入标签 = QLabel("查找内容:")
            self.查找输入框 = QLineEdit()
            输入布局.addWidget(输入标签)
            输入布局.addWidget(self.查找输入框)
            布局.addLayout(输入布局)
            
            # 区分大小写复选框
            self.区分大小写复选框 = QCheckBox("区分大小写")
            布局.addWidget(self.区分大小写复选框)
            
            # 按钮
            按钮布局 = QHBoxLayout()
            查找下一个按钮 = QPushButton("查找下一个")
            查找下一个按钮.clicked.connect(self.执行查找)
            关闭按钮 = QPushButton("关闭")
            关闭按钮.clicked.connect(self.查找对话框.close)
            按钮布局.addWidget(查找下一个按钮)
            按钮布局.addWidget(关闭按钮)
            布局.addLayout(按钮布局)
            
            self.查找对话框.show()
            self.查找输入框.setFocus()
        else:
            self.查找对话框.show()
            self.查找输入框.setFocus()
    
    def 替换文本(self):
        """替换文本"""
        查找文本, 确定1 = QInputDialog.getText(self, "替换", "输入要查找的文本:")
        if 确定1 and 查找文本:
            替换文本, 确定2 = QInputDialog.getText(self, "替换", "输入替换文本:")
            if 确定2:
                文本 = self.脚本编辑器.toPlainText()
                新文本 = 文本.replace(查找文本, 替换文本)
                self.脚本编辑器.setPlainText(新文本)

    def 执行查找(self):
        """执行查找操作"""
        if not hasattr(self, '查找输入框'):
            return
        
        查找内容 = self.查找输入框.text().strip()
        if not 查找内容:
            return
        
        # 设置查找选项
        选项 = QTextDocument.FindFlags()
        if self.区分大小写复选框.isChecked():
            选项 |= QTextDocument.FindCaseSensitively
        
        # 执行查找
        找到 = self.脚本编辑器.find(查找内容, 选项)
        
        if not 找到:
            # 没找到，从开头重新查找
            光标 = self.脚本编辑器.textCursor()
            光标.setPosition(0)
            self.脚本编辑器.setTextCursor(光标)
            
            找到 = self.脚本编辑器.find(查找内容, 选项)
            if not 找到:
                QMessageBox.information(self.查找对话框, "查找", "已搜索到文档末尾")

    def 中文显示代码(self):
        """将当前代码显示为中文"""
        if not self.脚本编辑器.toPlainText():
            return
            
        英文代码 = self.脚本编辑器.toPlainText()
        中文代码 = 中英文翻译器.翻译为中文(英文代码)
        
        # 保存原始英文代码
        self.原始英文代码 = 英文代码
        
        # 显示中文代码
        self.脚本编辑器.blockSignals(True)  # 临时阻止信号
        self.脚本编辑器.setPlainText(中文代码)
        self.脚本编辑器.blockSignals(False)
        
        # 更新状态
        self.显示中文 = True
        self.翻译按钮.setText("英文显示")
    
    def 英文显示代码(self):
        """将代码恢复为英文"""
        if not hasattr(self, '原始英文代码'):
            return
            
        # 恢复英文代码
        self.脚本编辑器.blockSignals(True)
        self.脚本编辑器.setPlainText(self.原始英文代码)
        self.脚本编辑器.blockSignals(False)
        
        # 更新状态
        self.显示中文 = False
        self.翻译按钮.setText("中文显示")
    
    def 文本改变时(self):
        """文本改变时更新行号并保存到解析器"""
        self.更新行号()
        
        # 保存当前任务的修改
        if hasattr(self, '当前任务') and self.当前任务:
            self.保存当前任务修改()

        # 更新原始英文代码
        if hasattr(self, '显示中文') and self.显示中文:
            当前中文代码 = self.脚本编辑器.toPlainText()
            try:
                # 翻译为英文保存
                self.原始英文代码 = 中英文翻译器.翻译为英文(当前中文代码)
            except Exception as e:
                print(f"翻译为英文时出错: {e}")
    
    def 获取当前代码(self):
        """获取当前代码（总是返回英文）"""
        if hasattr(self, '显示中文') and self.显示中文 and hasattr(self, '原始英文代码'):
            return self.原始英文代码
        elif hasattr(self, '脚本编辑器'):
            return self.脚本编辑器.toPlainText()
        else:
            return ""

#---------------------------任务信息对话框----------------------------------------------------------------
class 任务信息对话框(QDialog):
    """任务信息对话框"""
    
    def __init__(self, 父窗口=None, 任务编号=0, 任务名称="", 任务描述=""):
        super().__init__(父窗口)
        self.任务编号 = 任务编号
        self.任务名称 = 任务名称
        self.任务描述 = 任务描述
        self.初始化界面()
    
    def 初始化界面(self):
        self.setWindowTitle("任务信息")
        self.setFixedSize(500, 400)
        
        布局 = QVBoxLayout()
        
        # 任务ID
        编号布局 = QHBoxLayout()
        编号标签 = QLabel("任务ID:")
        self.编号输入框 = QSpinBox()
        self.编号输入框.setRange(1, 999)
        self.编号输入框.setValue(self.任务编号 if self.任务编号 > 0 else 1)
        编号布局.addWidget(编号标签)
        编号布局.addWidget(self.编号输入框)
        编号布局.addStretch()
        
        # 任务名称
        名称布局 = QVBoxLayout()
        名称标签 = QLabel("任务名称:")
        self.名称输入框 = QLineEdit()
        self.名称输入框.setText(self.任务名称)
        self.名称输入框.setPlaceholderText("例如：波本市武器店之任务")
        名称布局.addWidget(名称标签)
        名称布局.addWidget(self.名称输入框)
        
        # 任务描述
        描述布局 = QVBoxLayout()
        描述标签 = QLabel("任务描述 (使用\\n换行):")
        self.描述输入框 = QTextEdit()
        self.描述输入框.setPlainText(self.任务描述)
        self.描述输入框.setMaximumHeight(200)
        描述布局.addWidget(描述标签)
        描述布局.addWidget(self.描述输入框)
        
        # 示例文本
        示例标签 = QLabel("示例：1.[坐标500,524]请与服装店主人对话。\\n2.完成任务可获得奖励。")
        示例标签.setStyleSheet("color: #666; font-size: 10pt;")
        
        # 按钮
        按钮布局 = QHBoxLayout()
        确定按钮 = QPushButton("确定")
        确定按钮.clicked.connect(self.accept)
        取消按钮 = QPushButton("取消")
        取消按钮.clicked.connect(self.reject)
        按钮布局.addStretch()
        按钮布局.addWidget(确定按钮)
        按钮布局.addWidget(取消按钮)
        
        布局.addLayout(编号布局)
        布局.addLayout(名称布局)
        布局.addLayout(描述布局)
        布局.addWidget(示例标签)
        布局.addLayout(按钮布局)
        
        self.setLayout(布局)
    
    def 获取数据(self):
        """获取对话框数据"""
        描述 = self.描述输入框.toPlainText().strip().replace('\n', '\\n')
        return (
            self.编号输入框.value(),
            self.名称输入框.text().strip(),
            描述
        )

#---------------------------NPC脚本对话框---------------------------------------------------------------
class NPC脚本对话框(QDialog):
    """NPC脚本对话框"""
    
    def __init__(self, 父窗口=None):
        super().__init__(父窗口)
        self.初始化界面()
    
    def 初始化界面(self):
        self.setWindowTitle("添加NPC脚本")
        self.setFixedSize(400, 200)
        
        布局 = QVBoxLayout()
        
        # NPC ID
        编号布局 = QHBoxLayout()
        编号标签 = QLabel("NPC ID (例如: 00001):")
        self.编号输入框 = QLineEdit()
        self.编号输入框.setPlaceholderText("输入5位数字，如00001")
        编号布局.addWidget(编号标签)
        编号布局.addWidget(self.编号输入框)
        
        # NPC类型
        类型布局 = QHBoxLayout()
        类型标签 = QLabel("NPC类型:")
        self.类型下拉框 = QComboBox()
        self.类型下拉框.addItems(["普通NPC", "武器店", "服装店", "药局", "便利商店", "伊甸园", "特殊NPC"])
        类型布局.addWidget(类型标签)
        类型布局.addWidget(self.类型下拉框)
        
        # 说明
        信息标签 = QLabel("提示：NPC ID为5位数字，会自动转换为Npc00001格式")
        信息标签.setStyleSheet("color: #666; font-size: 9pt;")
        
        # 按钮
        按钮布局 = QHBoxLayout()
        确定按钮 = QPushButton("确定")
        确定按钮.clicked.connect(self.accept)
        取消按钮 = QPushButton("取消")
        取消按钮.clicked.connect(self.reject)
        按钮布局.addStretch()
        按钮布局.addWidget(确定按钮)
        按钮布局.addWidget(取消按钮)
        
        布局.addLayout(编号布局)
        布局.addLayout(类型布局)
        布局.addWidget(信息标签)
        布局.addLayout(按钮布局)
        
        self.setLayout(布局)
    
    def 获取NPC编号(self):
        """获取NPC ID"""
        NPC数字 = self.编号输入框.text().strip().zfill(5)
        return f"Npc{NPC数字}"

class 简化可视化编辑器(QWidget):
    def __init__(self, 父编辑器=None):
        super().__init__()
        self.父编辑器 = 父编辑器
    
        if not hasattr(self, '调整颜色亮度'):
            def 调整颜色亮度(hex_color, factor):
                颜色 = QColor(hex_color)
                if factor > 1:
                    return 颜色.lighter(int(factor * 100)).name()
                else:
                    return 颜色.darker(int((1/factor) * 100)).name()
            self.调整颜色亮度 = 调整颜色亮度

        self.画布场景 = QGraphicsScene()
        self.画布视图 = QGraphicsView(self.画布场景)
        self.画布视图.setRenderHint(QPainter.Antialiasing)
        
        # 存储所有节点
        self.节点列表 = []
        
        # 创建主布局
        主布局 = QVBoxLayout(self)
        
        # 顶部：常用流程控制工具栏
        顶部工具栏 = QGroupBox("常用流程控制")
        工具栏布局 = QHBoxLayout()
        
        # 常用流程控制按钮（使用脚本命令字典中的定义）
        流程按钮信息 = [
            "if条件", "else分支", "跳转标签", "定义标签",
            "代码块开始", "代码块结束", "条件判断"
        ]
        
        for 按钮名 in 流程按钮信息:
            按钮 = self.创建命令按钮(按钮名)
            if 按钮:  # 确保按钮创建成功
                工具栏布局.addWidget(按钮)
        
        工具栏布局.addStretch()
        顶部工具栏.setLayout(工具栏布局)
        
        # 中间区域：重用主编辑器的命令面板
        中间区域 = QWidget()
        中间布局 = QVBoxLayout(中间区域)

        # 右侧：画布
        画布分组 = QGroupBox("脚本流程图 - 点击上方命令按钮创建节点")
        画布布局 = QVBoxLayout()
        
        # 画布工具栏
        画布工具栏 = QHBoxLayout()
        
        self.清除按钮 = QPushButton("🗑️ 清除画布")
        self.清除按钮.clicked.connect(lambda: self.清除画布())
        
        self.布局按钮 = QPushButton("🔧 自动布局")
        self.布局按钮.clicked.connect(lambda: self.自动布局节点())
        
        self.生成代码按钮 = QPushButton("📄 生成代码")
        self.生成代码按钮.clicked.connect(lambda: self.生成代码())
        
        self.缩放放大按钮 = QPushButton("➕ 放大")
        self.缩放放大按钮.clicked.connect(lambda: self.放大画布())
        
        self.缩放缩小按钮 = QPushButton("➖ 缩小")
        self.缩放缩小按钮.clicked.connect(lambda: self.缩小画布())
        
        self.同步按钮 = QPushButton("🔄 从文本同步")
        self.同步按钮.clicked.connect(lambda: self.从文本同步())

        画布工具栏.addWidget(self.清除按钮)
        画布工具栏.addWidget(self.布局按钮)
        画布工具栏.addWidget(self.生成代码按钮)
        画布工具栏.addWidget(self.缩放放大按钮)
        画布工具栏.addWidget(self.缩放缩小按钮)
        画布工具栏.addWidget(self.同步按钮)
        画布工具栏.addStretch()
        
        画布布局.addLayout(画布工具栏)
        画布布局.addWidget(self.画布视图)
        画布分组.setLayout(画布布局)
        
        # 将画布添加到中间区域
        中间布局.addWidget(画布分组)

        # 底部：状态栏
        底部状态栏 = QStatusBar()
        底部状态栏.showMessage("就绪 - 点击命令按钮创建节点")
        
        # 添加到主布局
        主布局.addWidget(顶部工具栏)
        主布局.addWidget(中间区域, 1)
        主布局.addWidget(底部状态栏)
        
        # 设置画布背景
        self.画布场景.setBackgroundBrush(QBrush(QColor(245, 245, 245, 255)))
        
        # 设置初始场景尺寸
        self.画布场景.setSceneRect(0, 0, 2000, 2000)
        
        # 节点计数器
        self.节点计数器 = 0
         
    def 清除画布(self):
        """清除画布上的所有节点"""
        self.画布场景.clear()
        self.节点列表 = []
        self.节点计数器 = 0
        
        # 重新绘制网格
        grid_size = 20
        for x in range(0, 800, grid_size):
            for y in range(0, 600, grid_size):
                if (x // grid_size) % 2 == (y // grid_size) % 2:
                    self.画布场景.addRect(x, y, grid_size, grid_size, 
                                         QPen(Qt.NoPen), 
                                         QBrush(QColor(220, 220, 220)))
        
        self.画布视图.update()
    
    def 自动布局节点(self):
        """自动布局节点 - 考虑当前缩放比例"""
        if not self.节点列表:
            return
    
        # 获取当前缩放比例
        缩放比例 = self.画布视图.transform().m11()
        if 缩放比例 <= 0:
            缩放比例 = 1
    
        import math
        rows = math.ceil(math.sqrt(len(self.节点列表)))
    
        for i, 节点 in enumerate(self.节点列表):
            row = i // rows
            col = i % rows
        
            # 根据缩放调整位置
            base_x = 50 * (1/缩放比例)
            base_y = 50 * (1/缩放比例)
        
            x = base_x + col * (节点.宽度 + 40) * (1/缩放比例)
            y = base_y + row * (节点.高度 + 50) * (1/缩放比例)
        
            节点.setPos(x, y)
    
        self.画布视图.update()
    
    def 放大画布(self):
        """放大画布，同时调整场景大小"""
        self.画布视图.scale(1.2, 1.2)
    
        # 获取当前场景矩形
        当前场景矩形 = self.画布场景.sceneRect()
    
        # 扩大场景范围
        new_width = 当前场景矩形.width() * 1.2
        new_height = 当前场景矩形.height() * 1.2
        self.画布场景.setSceneRect(
            当前场景矩形.x(),
            当前场景矩形.y(),
            new_width,
            new_height
        )
    
    def 缩小画布(self):
        """缩小画布，同时调整场景大小"""
        self.画布视图.scale(0.8, 0.8)
    
        # 获取当前场景矩形
        当前场景矩形 = self.画布场景.sceneRect()
    
        # 缩小场景范围（但不小于初始大小）
        min_size = 1000
        new_width = max(min_size, 当前场景矩形.width() * 0.8)
        new_height = max(min_size, 当前场景矩形.height() * 0.8)
        self.画布场景.setSceneRect(
            当前场景矩形.x(),
            当前场景矩形.y(),
            new_width,
            new_height
        )
    
    def 从文本同步(self):
        """从文本编辑器同步代码到可视化编辑器"""
        if self.父编辑器:
            当前文本 = self.父编辑器.获取当前代码()
            if 当前文本:
                self.从文本导入(当前文本)
                # 显示状态消息
                if hasattr(self.父编辑器, '状态栏'):
                    self.父编辑器.状态栏.showMessage("已从文本编辑器同步到可视化编辑器")

    def 生成代码(self):
        """从可视化节点生成脚本代码"""
        if not self.节点列表:
            QMessageBox.information(self, "提示", "画布中没有节点")
            return
        
        # 按位置排序（从左到右，从上到下）
        排序节点 = sorted(self.节点列表, key=lambda n: (n.pos().y(), n.pos().x()))
        
        代码行 = []
        for 节点 in 排序节点:
            if hasattr(节点, '生成代码'):
                代码 = 节点.生成代码()
                if 代码:
                    代码行.append(代码)
        
        代码文本 = "\n".join(代码行)
        
        # 显示在对话框中
        对话框 = QDialog(self)
        对话框.setWindowTitle("生成的代码")
        对话框.setMinimumSize(600, 400)
        
        布局 = QVBoxLayout(对话框)
        
        代码编辑器 = QTextEdit()
        代码编辑器.setPlainText(代码文本)
        代码编辑器.setFont(QFont("Courier New", 10))
        
        # 按钮
        按钮布局 = QHBoxLayout()
        复制按钮 = QPushButton("复制代码")
        关闭按钮 = QPushButton("关闭")
        
        复制按钮.clicked.connect(lambda: QApplication.clipboard().setText(代码文本))
        关闭按钮.clicked.connect(对话框.accept)
        
        按钮布局.addWidget(复制按钮)
        按钮布局.addStretch()
        按钮布局.addWidget(关闭按钮)
        
        布局.addWidget(代码编辑器)
        布局.addLayout(按钮布局)
        
        对话框.exec_()
    
    def 添加节点(self, 节点类型):
        """添加节点到画布"""
        # 简单的节点添加逻辑
        pass

    def 默认调整颜色亮度(self, hex_color, factor):
        """默认的调整颜色亮度方法"""
        颜色 = QColor(hex_color)
        if factor > 1:
            return 颜色.lighter(int(factor * 100)).name()
        else:
            return 颜色.darker(int((1/factor) * 100)).name()

    def 调整颜色亮度(self, hex_color, factor):
        """调整颜色亮度 - 从主编辑器复制的方法"""
        try:
            颜色 = QColor(hex_color)
            if factor > 1:
                return 颜色.lighter(int(factor * 100)).name()
            else:
                return 颜色.darker(int((1/factor) * 100)).name()
        except:
            return hex_color  # 如果出错，返回原颜色

    def 创建命令按钮(self, 命令名):
        """创建统一格式的命令按钮"""
        # 命令类型颜色映射
        类型颜色 = {
            "获取": "#4CAF50",      # 绿色
            "检查": "#FF9800",      # 橙色
            "发送": "#2196F3",      # 蓝色
            "设置": "#9C27B0",      # 紫色
            "添加": "#009688",      # 青色
            "移除": "#F44336",      # 红色
            "打开": "#673AB7",      # 深紫
            "关闭": "#757575",      # 深灰
            "开始": "#FF5722",      # 深橙
            "结束": "#607D8B",      # 蓝灰
            "给予": "#FF9800",      # 橙色
            "改变": "#9C27B0",      # 紫色
            "移动": "#2196F3",      # 蓝色
            "等级": "#4CAF50",      # 绿色
            "技能": "#4CAF50",      # 绿色
            "生成": "#009688",      # 青色
            "玩家": "#2196F3",      # 蓝色
            "地面": "#009688",      # 青色
            "事件": "#9C27B0",      # 紫色
            "临时": "#FF9800",      # 橙色
            "if条件": "#FF9800",    # 橙色
            "else": "#FF5722",      # 深橙
            "跳转": "#9C27B0",      # 紫色
            "定义": "#673AB7",      # 深紫
            "代码块": "#2196F3",    # 蓝色
            "条件判断": "#FF9800",  # 橙色
        }

        # 确定按钮颜色
        按钮颜色 = "#607D8B"  # 默认颜色
        for 前缀, 颜色 in 类型颜色.items():
            if 命令名.startswith(前缀):
                按钮颜色 = 颜色
                break
    
        # 获取命令信息
        命令类型, 命令ID, 命令描述 = 脚本命令.get(命令名, ("null", 0, "未知命令"))
    
        按钮 = QPushButton(命令名)
        按钮.setMinimumHeight(38)  # 调整高度
        按钮.setMaximumHeight(38)
    
        # 设置字体
        按钮字体 = QFont()
        按钮字体.setPointSize(12)  # 设置字体大小为11
        按钮字体.setBold(True)
        按钮.setFont(按钮字体)

        # 设置样式
        按钮.setStyleSheet(f"""
            QPushButton {{
                background-color: {按钮颜色};
                color: white;
                border: none;
                padding: 6px 8px;
                font-size: 12px;
                font-weight: bold;
                border-radius: 5px;
                margin: 2px;
                text-align: center;
                qproperty-alignment: AlignCenter;
            }}
            QPushButton:hover {{
                background-color: {self.调整颜色亮度(按钮颜色, 1.2)};
                border: 1px solid white;
            }}
            QPushButton:pressed {{
                background-color: {self.调整颜色亮度(按钮颜色, 0.9)};
            }}
        """)
    
        # 设置提示信息
        按钮.setToolTip(f"{命令描述}\n参数类型: {命令类型}\n命令ID: {命令ID}")
    
        # 连接点击事件
        按钮.clicked.connect(lambda 选中=False, 名称=命令名: self.创建节点(名称))
    
        return 按钮

    def 创建节点(self, 节点名称):
        """创建节点"""
        try:
            print(f"尝试创建节点: {节点名称}")
        
            # 检查命令是否存在
            if 节点名称 not in 脚本命令:
                print(f"命令不存在: {节点名称}")
                return
        
            # 创建节点
            节点 = 可视化命令节点(节点名称)
            print(f"节点创建成功: {节点名称}")
        
            # 计算位置
            if len(self.节点列表) > 0:
                最后一个节点 = self.节点列表[-1]
                x = 最后一个节点.pos().x() + 节点.宽度 + 20
                y = 最后一个节点.pos().y()
            else:
                x, y = 50, 50
        
            节点.setPos(x, y)
        
            # 添加到场景和列表
            self.画布场景.addItem(节点)
            self.节点列表.append(节点)
        
            # 更新计数器和视图
            self.节点计数器 += 1
            self.画布视图.update()
        
            print(f"节点已添加到画布，位置: ({x}, {y})")
        
        except Exception as e:
            print(f"创建节点时出错: {e}")
            import traceback
            traceback.print_exc()

    def 从文本导入(self, 文本):
        """从文本导入到可视化编辑器 - 修复版"""
        # 清除当前画布
        self.清除画布()
    
        # 解析文本为节点
        节点列表 = 增强脚本转换器.文本到节点(文本)
    
        # 添加到画布
        for 节点 in 节点列表:
            self.画布场景.addItem(节点)
            self.节点列表.append(节点)
        
            # 如果有原始行，设置参数
            if hasattr(节点, '原始行') and 节点.原始行:
                节点.解析参数(节点.原始行)
    
        # 自动布局
        self.自动布局节点()
    
        self.画布视图.update()
        return True

    def 导出到文本(self):
        """从可视化编辑器导出为文本"""
        return 脚本转换器.节点到文本(self.节点列表)


class 中英文翻译器:
    """中英文命令翻译器"""
    
    # 英文到中文的映射
    英文到中文 = {
        # 基本关键字
        "if": "if条件",
        "else": "else分支", 
        "goto": "跳转标签",
        ":": "定义标签",
        "{": "代码块开始",
        "}": "代码块结束",
        "yes": "是",
        "no": "否",
        "==": "等于",
        ">": "大于",
        "<": "小于",
        ">=": "大于等于",
        "<=": "小于等于",
        "!=": "不等于",
        
        # 常用命令
        "GetBLv": "获取战斗等级",
        "GetELv": "获取贸易等级",
        "GetSkillLv": "获取技能等级",
        "CheckTalkNpc": "检查对话模式",
        "SendQuestCancel": "取消任务",
        "SendTalkEndNpcToPlayer": "发送结束对话",
        "SetQuestNumStep": "设置任务步骤",
        "CheckEnableQuest": "检查任务可用性",
        "CheckHasQuest": "检查是否接受任务",
        "SendEventMsg": "发送事件消息",
        "SendQuestBegin": "开始任务",
        "SendQuestComplete": "完成任务",
        "PushInvItem": "添加背包物品",
        "CheckEmptyInv": "检查背包空格",
        "GetBaseSkill": "获取主技能",
        "SendSkillUp": "技能提升",
        "SendLevelUp": "等级提升",
        "CheckMapNo": "检查地图编号",
        "CheckPlayerAnserQuestion": "检查玩家提问",
        "CheckAnserNext": "检查下一段对话",
        "SendTalkNpcToPlayer": "发送NPC对话",
        "CheckPlayerAnserYes": "检查玩家选是",
        "CheckPlayerAnserNo": "检查玩家选否",
        "PushTInvBox": "添加交易栏箱子",
        "MoveToPlayer": "移动到位置",
        "SendNpcQuestionEndYesNo": "发送结束是/否问题",
        "SendOpenMenuInven": "打开背包窗口",
        "SendCloseMenuInven": "关闭背包窗口",
        "SendOpenMenuInfo": "打开信息窗口",
        "SendCloseMenuInfo": "关闭信息窗口",
        "SendOpenMenuWeapon": "打开装备窗口",
        "SendCloseMenuWeapon": "关闭装备窗口",
        "SendOpenMenuSkill": "打开技能窗口",
        "SendCloseMenuSkill": "关闭技能窗口",
        "SendStartTwinkleOfficeButton": "开始闪烁伊甸园按钮",
        "SendEndTwinkleOfficeButton": "结束闪烁伊甸园按钮",
        "SendStartTwinkleLicensButton": "开始闪烁执照按钮",
        "SendEndTwinkleLicensButton": "结束闪烁执照按钮",
        "SendStartTwinkleNotebookButton": "开始闪烁联盟笔记本按钮",
        "SendEndTwinkleNotebookButton": "结束闪烁联盟笔记本按钮",
        "CheckAccessionParty": "检查加入队伍",
        "CheckSeccessionParty": "检查离开队伍",
    }
    
    # 中文到英文的反向映射
    中文到英文 = {v: k for k, v in 英文到中文.items()}
    
    @classmethod
    def 翻译为中文(cls, 英文代码):
        """将英文代码翻译为中文显示"""
        中文代码 = 英文代码
        
        # 先翻译命令
        for 英文命令, 中文命令 in cls.英文到中文.items():
            中文代码 = 中文代码.replace(英文命令, 中文命令)
        
        # 格式化缩进
        行列表 = 中文代码.split('\n')
        格式化行列表 = []
        缩进级别 = 0
        
        for 行 in 行列表:
            行 = 行.rstrip()
            if not 行:
                continue
                
            # 计算缩进
            if 行.strip().endswith('结束'):
                缩进级别 = max(0, 缩进级别 - 1)
            
            缩进 = '    ' * 缩进级别
            格式化行 = f"{缩进}{行}"
            格式化行列表.append(格式化行)
            
            if 行.strip().startswith('开始'):
                缩进级别 += 1
        
        return '\n'.join(格式化行列表)
    
    @classmethod
    def 翻译为英文(cls, 中文代码):
        """将中文代码翻译回英文"""
        英文代码 = 中文代码
        
        # 先翻译关键字
        关键字映射 = {
            "如果": "if",
            "否则": "else",
            "跳转到": "goto",
            "是": "yes",
            "否": "no",
            "开始": "{",
            "结束": "}",
            "等于": "==",
            "大于": ">",
            "小于": "<",
            "大于等于": ">=",
            "小于等于": "<=",
            "不等于": "!=",
        }
        
        for 中文关键字, 英文关键字 in 关键字映射.items():
            英文代码 = 英文代码.replace(中文关键字, 英文关键字)
        
        # 翻译命令
        for 中文命令, 英文命令 in cls.中文到英文.items():
            英文代码 = 英文代码.replace(中文命令, 英文命令)
        
        return 英文代码

class 可视化命令节点(QGraphicsItem):
    """可视化命令节点"""
    def __init__(self, 命令名):
        super().__init__()
        self.命令名 = 命令名
        self.定义 = 脚本命令.get(命令名, ("null", 0, "未知命令"))
        self.原始行 = ""
        self.参数值 = []
        
        # 调整节点尺寸（增大）
        self.宽度 = 250
        self.高度 = 90
        
        # 设置标志
        self.setFlags(QGraphicsItem.ItemIsMovable | 
                     QGraphicsItem.ItemIsSelectable |
                     QGraphicsItem.ItemSendsGeometryChanges)
        
        # 设置接受悬停事件
        self.setAcceptHoverEvents(True)
    
    def 设置原始行(self, 行):
        """设置原始行并解析参数"""
        self.原始行 = 行.strip()
        self.解析参数(行)
    
    def 解析参数(self, 行):
        """从行中解析参数"""
        行 = 行.strip()
        
        # 提取括号内的参数
        if '(' in 行 and ')' in 行:
            开始位置 = 行.find('(')
            结束位置 = 行.rfind(')')
            参数文本 = 行[开始位置+1:结束位置].strip()
            
            if 参数文本:
                # 简单分割参数
                self.参数值 = []
                当前参数 = ""
                在引号内 = False
                
                for char in 参数文本:
                    if char == '"' and not 在引号内:
                        在引号内 = True
                        当前参数 += char
                    elif char == '"' and 在引号内:
                        在引号内 = False
                        当前参数 += char
                    elif char == ',' and not 在引号内:
                        self.参数值.append(当前参数.strip())
                        当前参数 = ""
                    else:
                        当前参数 += char
                
                if 当前参数:
                    self.参数值.append(当前参数.strip())
    
    def mouseDoubleClickEvent(self, event):
        """双击编辑参数"""
        if self.定义[0] != "null":  # 有参数的命令才可编辑
            self.编辑参数()
        event.accept()
    
    def 编辑参数(self):
        """编辑参数对话框"""
        对话框 = QDialog()
        对话框.setWindowTitle(f"编辑参数 - {self.命令名}")
        对话框.setFixedSize(400, 300)
        
        布局 = QVBoxLayout(对话框)
        
        # 参数类型说明
        类型标签 = QLabel(f"参数类型: {self.定义[0]}")
        布局.addWidget(类型标签)
        
        # 创建参数输入框
        参数布局 = QVBoxLayout()
        命令类型 = self.定义[0]
        参数数量 = len(命令类型) if 命令类型 != "null" else 0
        
        # 根据参数类型创建输入框
        输入框列表 = []
        for i in range(参数数量):
            参数布局.addWidget(QLabel(f"参数 {i+1}:"))
            输入框 = QLineEdit()
            if i < len(self.参数值):
                输入框.setText(str(self.参数值[i]))
            输入框列表.append(输入框)
            参数布局.addWidget(输入框)
        
        布局.addLayout(参数布局)
        
        # 按钮
        按钮布局 = QHBoxLayout()
        确定按钮 = QPushButton("确定")
        取消按钮 = QPushButton("取消")
        
        确定按钮.clicked.connect(lambda: self.保存参数(输入框列表, 对话框))
        取消按钮.clicked.connect(对话框.reject)
        
        按钮布局.addWidget(确定按钮)
        按钮布局.addWidget(取消按钮)
        布局.addLayout(按钮布局)
        
        对话框.exec_()
    
    def 保存参数(self, 输入框列表, 对话框):
        """保存参数"""
        self.参数值 = [输入框.text().strip() for 输入框 in 输入框列表]
        对话框.accept()
        self.update()  # 重绘节点

    def 获取命令颜色(self, 命令名):
        """根据命令类型获取颜色"""
        颜色映射 = {
            "获取": QColor(76, 175, 80),    # 绿色
            "检查": QColor(255, 152, 0),    # 橙色
            "发送": QColor(33, 150, 243),   # 蓝色
            "设置": QColor(156, 39, 176),   # 紫色
            "添加": QColor(0, 150, 136),    # 青色
            "移除": QColor(244, 67, 54),    # 红色
            "打开": QColor(103, 58, 183),   # 深紫
            "关闭": QColor(158, 158, 158),  # 灰色
            "开始": QColor(255, 87, 34),    # 深橙
            "结束": QColor(96, 125, 139),   # 蓝灰
            # 流程控制类型
            "if条件": QColor(255, 152, 0),   # 橙色
            "else分支": QColor(255, 87, 34),  # 深橙
            "跳转标签": QColor(156, 39, 176), # 紫色
            "定义标签": QColor(103, 58, 183), # 深紫
            "代码块开始": QColor(33, 150, 243), # 蓝色
            "代码块结束": QColor(3, 169, 244),  # 浅蓝
            "条件判断": QColor(255, 152, 0),   # 橙色
        }
    
        # 精确匹配优先
        if 命令名 in 颜色映射:
            return 颜色映射[命令名]
    
        # 前缀匹配
        for 前缀, 颜色 in 颜色映射.items():
            if 命令名.startswith(前缀):
                return 颜色
    
        return QColor(158, 158, 158)  # 默认灰色
    
    def boundingRect(self):
        """返回边界矩形"""
        return QRectF(0, 0, self.宽度, self.高度)
    
    def paint(self, painter, option, widget):
        """绘制节点"""
        # 根据命令类型获取颜色
        颜色 = self.获取命令颜色(self.命令名)
        
        # 背景
        painter.setBrush(颜色)
        painter.setPen(QPen(Qt.black, 3 if self.isSelected() else 1.5))
        painter.drawRoundedRect(0, 0, self.宽度, self.高度, 15, 15)
        
        # 命令名 
        painter.setPen(Qt.white)
        节点字体 = QFont(QFont("微软雅黑", 14, QFont.Bold))  # 增大字体
        painter.setFont(节点字体)
        painter.drawText(QRectF(5, 10, self.宽度-10, 40), Qt.AlignCenter, self.命令名)
        
        # 显示参数（如果有）
        if self.参数值:
            painter.setPen(QColor(240, 240, 240))
            参数字体 = QFont("宋体", 10)
            painter.setFont(参数字体)
            
            参数文本 = " ".join(str(p) for p in self.参数值[:3])  # 只显示前3个参数
            if len(self.参数值) > 3:
                参数文本 += "..."
            
            painter.drawText(QRectF(5, 50, self.宽度-10, 30), Qt.AlignCenter, 参数文本)
    
    def 生成代码(self):
        """生成该节点的代码"""
        英文命令名 = 中文到英文映射.get(self.命令名, self.命令名)
        命令类型 = self.定义[0]
        
        # 如果有参数值，使用参数值
        if self.参数值:
            参数文本 = ", ".join(str(p) for p in self.参数值)
            return f"{英文命令名}({参数文本})"
        else:
            # 根据参数类型生成默认模板
            模板字典 = {
                "null": f"{英文命令名}()",
                "i": f"{英文命令名}(0)",
                "s": f'{英文命令名}("文本")',
                "ii": f"{英文命令名}(0, 0)",
                "iii": f"{英文命令名}(0, 0, 0)",
                "iss": f'{英文命令名}(0, "名称", "描述")',
                "iiii": f"{英文命令名}(0, 0, 0, 0)",
                "sssss": f'{英文命令名}("选项1", "选项2", "选项3", "选项4", "选项5")',
                "siiiiii": f'{英文命令名}("事件", 0, 0, 0, 0, 0, 0)',
                "iiiii": f"{英文命令名}(0, 0, 0, 0, 0)",
                "iiiiii": f"{英文命令名}(0, 0, 0, 0, 0, 0)",
            }
            return 模板字典.get(命令类型, f"{英文命令名}()")


def 主函数():
    应用 = QApplication(sys.argv)
    应用.setStyle('Fusion')  # 使用Fusion风格，更现代
    
    # 设置应用程序图标和样式
    应用.setApplicationName("Nage任务编辑器")
    应用.setApplicationVersion("1.0")
    
    编辑器 = Nage任务编辑器()
    编辑器.show()
    #可视化编辑器 = 可视化脚本编辑器()
    #可视化编辑器.show()
    sys.exit(应用.exec_())


if __name__ == "__main__":
    主函数()

