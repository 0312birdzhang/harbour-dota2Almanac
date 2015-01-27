
/*
 * 注意：本程序中的“随机”都是伪随机概念，以当前的天为种子。
 */
function random(dayseed, indexseed) {
    var n = dayseed % 23333;
    for (var i = 0; i < 100 + indexseed; i++) {
        n = n * n;
        n = n % 23333;   // 233赛高 还是个质数
    }
    return n;
}

var today = new Date();
var iday = today.getFullYear() * 10000 + (today.getMonth() + 1) * 100 + today.getDate();

var weeks = ['日','一','二','三','四','五','六'];
var directions = ['北方','东北方','东方','东南方','南方','西南方','西方','西北方'];
var activities = [
            {name:'用辅助英雄', good:'用辅助英雄可以带领团队走向胜利',bad:'用辅助英雄会死超鬼'},
            {name:'Do前洗澡', good:'你几天没洗澡了？',bad:'会把暴走的机会洗掉', weekend: true},
            {name:'锻炼一下身体',good:'让你反应更加灵活',bad:'能量没消耗多少，打起Dota来都无力了', weekend: true},
            {name:'打前一支烟', good:'抽烟利于提神，增加补刀走位',bad:'除非你活够了，死得早点没关系', weekend: true},
            {name:'白天打Dota2', good:'今天白天打Dota2是明智之选',bad:'可能导致灾难性后果'},
            {name:'组队', good:'组队匹配能得到提高',bad:'你很有会被坑的飞起'},
            {name:'手选%t', good:'这英雄简直就是完克对面',bad:'队友会觉得你在装逼 对面觉得你是sb'},
            {name:'对拆', good:'拆光三路 对面还没能上高地',bad:'还没上对面高地自家基地已经GG'},
            {name:'带线', good:'你轻松带球让对手疲于回防 团战被动',bad:'刚带线出塔就被gank成鬼'},
            {name:'用核心英雄', good:'前期犹如神助 优势到底',bad:'优势路被刚三蹲点各种死成鬼'},
            {name:'用Gank英雄', good:'三路游走直接杀崩盘',bad:'三路游走三路送人头'},
            {name:'单人匹配', good:'对面都是小朋友',bad:'对面辅助都是大神'},
            {name:'晚上打Dota2', good:'晚上是精神最好的时候',bad:'秒睡会导致团灭', weekend: true},
            {name:'在妹子面前吹牛', good:'改善你吊丝的形象',bad:'会被识破', weekend: true},
            {name:'撸管', good:'开启贤者模式',bad:'小撸怡情，大撸伤身，强撸灰飞烟灭', weekend: true},
            {name:'浏览成人网站', good:'重拾补刀的信心',bad:'你会心神不宁', weekend: true},
            {name:'出\'%v\'', good:'关键时刻的逆转道具',bad:'基地爆了都没能出出来'},
            {name:'补%l刀的方法', good:'你的节奏很好，下刀精准',bad:'被对面压制，一个都补不到'},
            {name:'闷头打野', good:'对面无心gank你',bad:'对面开雾五人gank你'},
            {name:'翻盘', good:'坚持住 最后一波带走对面',bad:'前期那么顺利，最后被一波带走'},
            {name:'开黑', good:'轻松碾压对面',bad:'LK李坑爹告诉你什么叫掉线和AFK', weekend: true},
            {name:'通宵打DOTA2', good:'你将有如神助',bad:'你会被虐的很惨'},
            {name:'妹子突然打电话', good:'注意补刀！让你打完这盘早点睡',bad:'听到你在Dota2怒挂电话'},
            {name:'使用奇招', good:'出奇制胜的招数可以利落干掉对面',bad:'全屏消息：xx被Roshan杀死了'},
            {name:'同基友双飞', good:'你们横扫对面',bad:'基友不靠谱'},
            {name:'开五人黑', good:'',bad:''},
            {name:'上微博', good:'今天发生的事不能错过',bad:'今天的微博充满负能量', weekend: true},
            {name:'上AB站', good:'还需要理由吗？',bad:'满屏的兄贵我会说出来？', weekend: true}
        ];

var specials = [
            {date:20130925, type:'good', name:'国服正式测试', description:'小兄弟，看你骨骼清奇，这个拯救国服匹配的任务就靠你了...'}
        ];

var tools = ['火枪', '幻刺', '猴子', '卡尔', '敌法', '水人', '狗头', '一姐', '蜘蛛','斧王'];

var varNames = ['梅肯', '强袭', '林肯法球', '血精石', '羊刀', '西瓦', '紫苑', '大炮', '圣剑', '黯灭', '跳刀', '飞鞋', 'A杖', '刃甲', '挑战','大晕锤'];

var drinks = ['水','茶','红茶','绿茶','咖啡','奶茶','可乐','牛奶','豆奶','果汁','果味汽水','苏打水','运动饮料','酸奶','红酒','啤酒','白酒','翔'];

function getTodayString() {
    return '今天是' + today.getFullYear() + '年' + (today.getMonth() + 1) + '月' + today.getDate() + '日 星期' + weeks[today.getDay()];
}

function star(num) {
    var result = "";
    var i = 0;
    while (i < num) {
        result += '★';
        i++;
    }
    while(i < 5) {
        result += '☆';
        i++;
    }
    return result;
}

// 生成今日运势
function pickTodaysLuck() {
    var _activities = filter(activities);

    var numGood = random(iday, 98) % 3 + 2;
    var numBad = random(iday, 87) % 3 + 2;
    var eventArr = pickRandomActivity(_activities, numGood + numBad);

    var specialSize = pickSpecials();

    for (var i = 0; i < numGood; i++) {
        addToGood(eventArr[i]);
    }

    for (var i = 0; i < numBad; i++) {
        addToBad(eventArr[numGood + i]);
    }
}

// 去掉一些不合今日的事件
function filter(activities) {
    var result = [];

    // 周末的话，只留下 weekend = true 的事件
    if (isWeekend()) {

        for (var i = 0; i < activities.length; i++) {
            if (activities[i].weekend) {
                result.push(activities[i]);
            }
        }

        return result;
    }

    return activities;
}

function isWeekend() {
    return today.getDay() == 0 || today.getDay() == 6;
}

// 添加预定义事件
function pickSpecials() {
    var specialSize = [0,0];

    for (var i = 0; i < specials.length; i++) {
        var special = specials[i];

        if (iday == special.date) {
            if (special.type == 'good') {
                specialSize[0]++;
                addToGood({name: special.name, description: special.description});
            } else {
                specialSize[1]++;
                addToBad({name: special.name, description: special.description});
            }
        }
    }

    return specialSize;
}

// 从 activities 中随机挑选 size 个
function pickRandomActivity(activities, size) {
    var picked_events = pickRandom(activities, size);

    for (var i = 0; i < picked_events.length; i++) {
        picked_events[i] = parse(picked_events[i]);
    }

    return picked_events;
}

// 从数组中随机挑选 size 个
function pickRandom(array, size) {
    var result = [];

    for (var i = 0; i < array.length; i++) {
        result.push(array[i]);
    }

    for (var j = 0; j < array.length - size; j++) {
        var index = random(iday, j) % result.length;
        result.splice(index, 1);
    }

    return result;
}

// 解析占位符并替换成随机内容
function parse(event) {
    var result = {name: event.name, good: event.good, bad: event.bad};  // clone

    if (result.name.indexOf('%v') != -1) {
        result.name = result.name.replace('%v', varNames[random(iday, 12) % varNames.length]);
    }

    if (result.name.indexOf('%t') != -1) {
        result.name = result.name.replace('%t', tools[random(iday, 11) % tools.length]);
    }

    if (result.name.indexOf('%l') != -1) {
        result.name = result.name.replace('%l', (random(iday, 12) % 247 + 30).toString());
    }

    return result;
}

// 添加到“宜”
function addToGood(event) {
    goods.append(
                {"name":event.name,
                    "description":event.good
                });
}

// 添加到“不宜”
function addToBad(event) {
    bads.append(
                {"name":event.name,
                    "description":event.bad
                });

}
//初始化
function initAlmanac(){
    showDate.text=getTodayString();
    direction_value = directions[random(iday, 2) % directions.length];
    drink_value = pickRandom(drinks,2).join('，');
    goddes_value = star(random(iday, 6) % 5 + 1);
    //给cover赋值
    appwindow.direction_value = directions[random(iday, 2) % directions.length];
    appwindow.drink_value = pickRandom(drinks,2).join('，');
    appwindow.goddes_value = star(random(iday, 6) % 5 + 1);
    pickTodaysLuck();
}
