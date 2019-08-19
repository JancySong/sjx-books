/*
Navicat MySQL Data Transfer

Source Server         : MyDataBase
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : booksdb

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-21 22:57:20
*/

DROP DATABASE IF EXISTS `booksdb`;
CREATE DATABASE booksdb;

USE booksdb;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(30) NOT NULL,
  `adminPassWord` varchar(40) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2016-05-01 19:24:32', '2016-05-01 19:24:37');
INSERT INTO `tb_admin` VALUES ('2', 'JancySong', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2016-05-08 20:59:58', '2016-05-08 20:59:58');

-- ----------------------------
-- Table structure for tb_bookbaseinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookbaseinfo`;
CREATE TABLE `tb_bookbaseinfo` (
  `bid` varchar(40) NOT NULL,
  `cid` int(11) NOT NULL,
  `bookName` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` double(10,2) NOT NULL,
  `totalPages` int(11) DEFAULT NULL,
  `publishDate` datetime NOT NULL,
  `press` varchar(100) NOT NULL,
  `coverImage` varchar(100) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `base_cid` (`cid`),
  CONSTRAINT `base_cid` FOREIGN KEY (`cid`) REFERENCES `tb_bookcategory` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookbaseinfo
-- ----------------------------
INSERT INTO `tb_bookbaseinfo` VALUES ('156F6E48327A470CAC739C278BE8E3CC-SJXID', '15', '教育经济学', '高秀叶', '25.00', '197', '2013-03-06 00:00:00', '中国人民大学出版社', '2016/05/11/02/25/1DB633670C3B46E8A13833CD21138DCC-CODE_26693.jpg', '《21世纪高等继续教育精品教材·教育学系列：教育经济学》与其他同类教材相比，主要有以下几个明显的特点：\r\n　　一是理论性强。首先，作为教材，最基本和最重要的功能是为学生提供关于一门学科的规范化的理论知识，包括基本概念、基本理论和一些基本问题等。《21世纪高等继续教育精品教材·教育学系列：教育经济学》在撰写过程中参考了大量的国内外教材与文献，提取了教育经济学最为核心的理论观点和概念，保证了本书观点和内容的充实与完整。\r\n　　二是注重实践。本书不仅注重对理论的概括与提炼，同时还注重理论与实践的互动与联系。将一些基本理论观点在实践中进行运用，使学生对理论的理解更加透彻，能够真正理解不同理论观点的内涵，从而为学生真正领悟教育经济学的基本理论奠定良好的基础。\r\n　　三是时代性强。本书中的知识点反映了教育经济学学科的最新研究成果，所引用的大量数据也是从最近几年的研究中提炼而成的，确保了教材内容体现较强的时代特征。应该说，本书是一本站在时代前沿的教育经济学教材。\r\n　　四是案例互动。案例教学被公认为传播实践和应用知识的最有效的方法，本书每章最后都提供了相应的案例分析，有的是当前教育研究的热点问题、有的是对理论知识的拓展，通过对不同案例的解读，能够加深学生对教育经济学知识的感知与把握。\r\n');
INSERT INTO `tb_bookbaseinfo` VALUES ('3CBB4F734B2440D5ACB5A91601D4888C-SJXID', '20', '三体', '刘慈欣', '17.00', '302', '2008-01-04 00:00:00', '重庆出版社', '2016/05/11/02/00/17866B9349D944FAA240AF9B46925930-CODE_27043.jpg', '文化大革命如火如荼进行的同时，军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。\r\n　　地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\r\n　　四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时，他们接收到了地球发来的信息。\r\n　　在运用超技术锁死地球人的基础科学之后，三体人庞大的宇宙舰队开始向地球进发……人类的末日悄然来临。');
INSERT INTO `tb_bookbaseinfo` VALUES ('40CF80C2D00140C7BFAAA0E9CA29911C-SJXID', '9', '悟空传·完美纪念版', '今何在', '17.00', '228', '2011-02-08 00:00:00', '湖南文艺出版社', '2016/05/08/21/48/2ACAF001CBA143AB9BB831965DD450AE-CODE_11158.jpg', '1）《悟空传》十五年白金典藏：经典畅销书，无数人的青春记忆。\r\n　　《悟空传》诞生至今15年，开创了网络文学的全盛时代，出版至今加印56次，豆瓣网64781次五星推荐，销售达两百万册。15年间，无数人的青春记忆里，都有一本《悟空传》。书中传达的理想与宿命、爱情与自由，让每一个拥有梦想的年轻人为之疯狂感动。\r\n　　2）《悟空传》十五年白金典藏：寻找当年失去的理想。\r\n　　《悟空传》是一个悲壮的故事，一个关于一群人在路上想寻找当年失去的理想的故事。每个人都有一条自己的西游路，所有人都不可避免要奔向那个归宿，没办法选择，没办法回头，只有在这条路上尽量走得精彩一些，走得抬头挺胸一些，多经历一些，多想一些，多看一些，去做好你想做的事。最后，你能说，这个世界我来过，我爱过，我战斗过，我不后悔。\r\n　　3）《悟空传》十五年白金典藏：全新番外，附赠《西游日记》试读本，独家超值赠品。\r\n　　此版本《悟空传》在原《悟空传》内容基础上添加了新番外《杨戬传》《哪吒传》，并独家随书附赠《西游日记》3万字全新内容。独家超值赠送唯美明信片两张、白金典藏大圣海报一张。\r\n　　4）《悟空传》十五年白金典藏——王家卫、刘镇伟携手百位作家感动推荐。\r\n　　《悟空传》获得香港著名电影导演王家卫与刘镇伟的感动推荐，并有蔡骏、潘海天、桐华、蒋胜男、小椴、斩鞍、燕垒生、萧如瑟、沈璎璎、唐缺、天平、水泡、冥灵、楚惜刀等上百位作家亲自撰写文字，诚意推荐这部经典作品。\r\n　　5）《悟空传》十五年白金典藏——猴年大电影即将献映。\r\n　　《悟空传》作为拥有百万读者口碑的经典畅销小说，也陆续被改编为游戏和影视剧，《悟空传》电影由郭子健导演和今何在编剧，彭于晏、 倪妮、余文乐、欧豪、郑爽领衔主演，2016猴年即将献映。');
INSERT INTO `tb_bookbaseinfo` VALUES ('50E10BED1E644F4DA1E6CFE95E329E23-SJXID', '8', '仓央嘉措诗传', '苗欣宇，马辉', '20.00', '240', '2009-08-03 00:00:00', '江苏文艺出版社', '2016/05/08/21/43/18D3B3A99DC542BD844AE410AEDB9697-CODE_15717.jpg', '那一天，闭目在经殿香雾中，蓦然听见，你颂经中的真言；那一月，我摇动所有的转经筒，不为超度，只为触摸你的指尖；那一年，磕长头匍匐在山路，不为觐见，只为贴着你的温暖；那一世，转山转水转佛塔啊，不为修来生，只为途中与你相见。\r\n　　　　　　　　　　　　　　　　　　　　　——《信徒》\r\n　　六世达赖仓央嘉措的传奇人生，藏传佛教***引人注目的上师情歌，住进布达拉宫，他是雪域之王，流浪在拉萨街头，他是世间*美的情郎，因为一首诗爱上一个人，所有的词藻不过是后人臆想中强加于他的枷锁，不想也不能评价，他始终在那里。\r\n　　藏传佛教***被人珍爱的上师，六世达赖喇，仓央嘉措诗歌全集，发现仓央诗歌之美，揭密圣域之王的神奇人生。\r\n');
INSERT INTO `tb_bookbaseinfo` VALUES ('619D61603E5B4FBF828603235074ABF4-SJXID', '7', '于丹：重温最美古诗词（再版）', '于丹', '29.00', '304', '2016-04-01 00:00:00', '北京联合出版公司', '2016/05/08/21/36/A116C7FED16743EA8E542076C12895EA-CODE_00350.jpg', ' 和于丹一起，重温最美古诗词，回归自在大人生。\r\n　　从解读儒家经典《论语》到赏析中国传统文化最源远流长、普及率最高的古诗词，于丹回归古典文学专业，17年大学授课精髓，厚积薄发，让传统文化的精髓进一步走近大众、走近当下中国人的精神世界。\r\n　　诗歌蕴藏着人类文明中最深刻的秘密，于丹老师以最具代表性的中国古诗词为线索，结合当代中国人生存现状及精神世界，以其独特的人文风格对中国古诗词意象、风骨、内涵、感悟进行鉴赏解读。以“明月”、“清风”等古诗词常见意象为线索，导向人生大境界的感悟与情怀。\r\n　　本作品延续于丹老师的独特风格，通俗、易懂、妙语连珠且能激起读者共鸣。让读者重温中国传统文学和古典哲学的精髓所在，找回心灵深处的宁静之美。');
INSERT INTO `tb_bookbaseinfo` VALUES ('793DB9469E08443288242B1E17FD6EF8-SJXID', '16', '考研英语词汇词根+联想记忆法乱序版', '俞敏洪', '33.50', '384', '2015-06-16 00:00:00', '群言出版社', '2016/05/11/02/32/56CDDC895D9440AC88361AF2D3448C56-CODE_60094.jpg', '《考研英语词汇词根+联想记忆法(乱序版)》完整收录考研英语大纲词汇，采取乱序编排，每个单元都会出现不同字母开头的单词。词根记忆法根据英语单词的构成原理，记一当十；联想记忆法利用谐音、形近以及词与词之间的联系辅助记忆，此外许多单词还配有妙趣横生的插图，让你过目难忘！\r\n　　本书将考研词汇按照难度分为核心单词和简单单词（即高中水平单词），并补充超纲单词。核心单词分为50个学习单元，主词条配有音标、释义、例句、记忆法，并收录了与词条有关的常用搭配、派生词、同义词、反义词、相关词、真题长难句、易混词辨析、词源故事等。\r\n　　为了减轻考生的背诵量，提高单词学习的效率，本书精心筛选了单词在历年真题中被考查过的释义，对常考释义进行了下画线标注，同时根据考频为核心单词标注了频度，方便考生了解单词在历年真题中的活跃程度，合理安排记忆顺序。同时，本书根据历年真题的考查特点，补充了易混淆词对、十年真题阅读词汇、常用缩写词以及国家（或地区）、语言、国民、国籍及洲名表，帮助考生最大限度地扫除答题过程中的词汇障碍。\r\n　　本书配有高品质的MP3录音，读者可登录封面标注的网址免费下载，此外，本书还超值附赠180元的新东方在线考研英语体验网课和30元报名代金券，具体使用说明详见内封。');
INSERT INTO `tb_bookbaseinfo` VALUES ('7EF95C38016F4E578B469C3AC9A137CD-SJXID', '7', '草木缘情：中国古典文学中的植物世界', '潘富俊', '70.00', '200', '2016-03-01 00:00:00', '商务印书馆', '2016/05/08/21/29/A48BFEDA2A654BE7A3920991E5BC250F-CODE_79194.jpg', '你相不相信植物会解决文学史上的公案？它们说《红楼梦》不是曹雪芹一个人写的。《红楼梦》前80回平均每回出现植物11种，后40回每回3.8种。\r\n本书为我们描绘了中国古典文学中的植物世界。作者潘富俊先生是一位热爱中国文学的科学家，他业余时间乐于沉浸在诗文歌赋，在书房中遨游于文学世界，在田野中实地探访中国古典文学中的每种植物，将古文中的植物与现代植物学体系中的植物相比对，追根溯源，考订名目，分辨其中虚实，考评植物所在地的自然生态，还原几千年来文人笔下的植物原貌，解析不同时代有着不同名称与寓意的植物面貌，并找出植物引进中国的脉络，以科学印证文学，以文学丰富科学的维度。他左手文学，右手科学，在看似无关的两个领域摸索潜行，编枝结草搭建起一座沟通文学与自然科学的鹊桥，为我们展现了一幅幅精妙细致美好的中国古典场景。让我们跟随作者的脚步，一面亲近古诗词，一面认识大千植物世界。\r\n第二版借鉴、吸收了近年来国内外相关领域最新的研究成果，修订内容达一百余处，置换图片二十余幅。');
INSERT INTO `tb_bookbaseinfo` VALUES ('923BA2E52CE4421195224A8A2689A8E8-SJXID', '16', '张小龙申论80分绝技公务员考试用书', '张小龙 ', '35.50', '271', '2015-01-01 00:00:00', '清华大学出版社', '2016/05/11/02/36/58DE18301EFF4A02BE1D548AA4E36CA6-CODE_16561.jpg', ' 张小龙编著的这本《张小龙申论80分绝技》详细 讲解了申论命题技术、阅卷规则、申论答题标准与方 法，并配有大量实例论证。全书共分为五篇：第一篇 介绍申论命题技术和阅卷规则；第二篇介绍申论客观 题的答题技巧；第三篇介绍申论文章的写作技巧；第 四篇介绍申论阅卷规则高频关键词、句；第五篇介绍 申论高频考点。\r\n     本书把申论理论方法、申论真题练习和答题实例 融为一体，淡化理论，侧重技巧，具有很强的可读性 和实用性，有助于考生找到80分的钥匙。');
INSERT INTO `tb_bookbaseinfo` VALUES ('970E636901894E5E9794FC5014C91087-SJXID', '24', '测试', '测试', '1.00', '1', '2016-05-02 00:00:00', '测试', '2016/05/09/09/43/8FB2AB4AF7FF4D41954A6C7537F616CD-CODE_23570.png', '');
INSERT INTO `tb_bookbaseinfo` VALUES ('A03718C482694AD1A1F67DA5AF0A1853-SJXID', '21', '聊斋志异', '（清）蒲松龄', '15.00', '721', '2013-05-06 00:00:00', '华夏出版社', '2016/05/11/02/13/99ECF24542614AC5A2630CC85AB09178-CODE_13363.jpg', '时盛夏燠热，村外故有周氏园，墙宇尽倾，唯存一亭，村人多寄宿其中，王亦在焉。既晓，睡者尽去。红日三竿，王始起，逡巡欲归。见草际金钗一股，拾视之，镌有细字云：“仪宾府造。”王祖为衡府仪宾，家中故物，多此款式，因把钗踌躇。一妪来寻钗。王虽故贫，然性介，遽出授之。妪喜，极赞盛德，日：“钗直几何，先夫之遗泽也。”问：“夫君伊谁？”答云：“故仪宾王柬之也。”王惊日：“吾祖也。何以相遇？”妪亦惊日：“汝即王柬之之孙耶？我乃狐仙。百年前，与君祖缱绻。君祖殁，老身遂隐。过此遗钗，适入子手，非天数耶！”王亦曾闻祖有狐妻，信其言，便邀临顾。妪从之。\r\n　　王呼妻出见，负败絮，菜色黯焉。妪叹日：“嘻！王柬之孙子，乃一贫至此哉！”又顾败灶无烟。日：“家计若此，何以聊生？”妻因细述贫状，呜咽饮泣。妪以钗授妇，使姑质钱市米，三日外请复相见。王挽留之。妪日：“汝一妻不能自存活，我在，仰屋而居，复何裨益？”遂径去。王为妻言其故，妻大怖。王诵其义，使姑事之，妻诺。逾三日，果至。出数金，籴粟麦各石。夜与妇共短榻。妇初惧之，然察其意殊拳拳，遂不之疑。\r\n　　翌日，谓王日：“孙勿惰，宜操小生业，坐食乌可长也？”王告以无赀。日：“汝祖在时，金帛凭所取。我以世外人，无需是物，故未尝多取。积花粉之金四十两，至今犹存。久贮亦无所用，可将去悉以市葛，刻日赴都，可得微息。”王从之，购五十余端以归。妪命趣装，计六七日可达燕都。嘱日：“宜勤勿懒，宜急勿缓。迟之一日，悔之已晚！”王敬诺。\r\n　　囊货就路，中途遇雨，衣履浸濡。王生平未历风霜，委顿不堪，因暂休旅舍。不意淙淙彻暮，檐雨如绳。过宿，泞益甚。见往来行人，践淖没胫，心畏苦之。待至亭午，始渐燥，而阴云复合，雨又大作。信宿乃行。将近京，传闻葛价翔贵，心窃喜。人都，解装客店，主人深惜其晚。先是，南道初通，葛至绝少。贝勒府购致甚急，价顿昂，较常可三倍。前一日，方购足，后来者，并皆失望。主人以故告王，王郁郁不得志。越日，葛至愈多，价益下。王以无利不肯售。迟十余日，计食耗烦多，倍益忧闷。主人劝令贱鬻，改而他图，从之。亏赀十余两，悉脱去。早起，将作归计，启视囊中，则金亡矣。惊告主人。主人无所为计。或劝鸣官，责主人偿。王叹日：“此我数也，于主人何尤？”主人闻而德之，赠金五两，慰之使归。自念无以见祖母，蹀踱内外，进退维谷。');
INSERT INTO `tb_bookbaseinfo` VALUES ('A33AAF0B16F6405199B21F9963200375-SJXID', '15', '现代管理心理学(第4版)', '程正方', '44.00', '160', '2009-03-05 00:00:00', '北京师范大学', '2016/05/11/02/27/95BEF3FB49414B8A844D7F6E5A9915B7-CODE_73669.jpg', '');
INSERT INTO `tb_bookbaseinfo` VALUES ('B10DD5FBF4C54ABA95B88C42A764908A-SJXID', '21', '封神演义', '（明）许仲琳', '15.00', '670', '2013-07-18 00:00:00', '华夏出版社', '2016/05/11/02/20/F6DD88A29A014A52B98B1D55E7D496EB-CODE_40638.jpg', '纣王七年，春二月，忽报到朝歌，反了北海七十二路诸侯袁福通等。太师闻仲奉敕征北。不题。\r\n　　一日，纣王早朝登殿，设聚文武。但见：\r\n　　瑞霭纷纭，金銮殿上坐君王；祥光缭绕，白玉阶前列文武。沉檀八百喷金炉，则见那珠帘高卷；兰麝氤氲笼宝扇，且看他雉尾低回。\r\n　　天子问当驾官：“有奏章出班，无事朝散。”言未毕，只见右班中一人出班，俯伏金阶，高擎牙笏，山呼称臣：“臣商容待罪宰相，执掌朝纲，有事不敢不奏。明日乃三月十五日，女娲娘娘圣诞之辰，请陛下驾临女娲宫降香。”王曰：“女娲有何功德，朕轻万乘而往降香？”商容奏曰：“女娲娘娘乃上古神女，生有圣德。那时共工氏头触不周山，天倾西北，地陷东南；女娲乃采五色石，炼之以补青天，故有功于百姓。黎庶立禋祀以报之。今朝歌祀此福神，则四时康泰，国祚绵长，风调雨顺，灾害潜消。此福国庇民之正神，陛下当往行香。”王曰：“准卿奏章。”纣王还宫。旨意传出：次日天子乘辇，随带两班文武，往女娲宫进香。——此一回纣王不来还好，只因进香，惹得四海荒荒，生民失业。正所谓：漫江撒下钩和线，从此钓出是非来。怎见得，有诗为证：\r\n　　天子鸾舆出凤城，旌旄瑞色映簪缨。\r\n　　龙光剑吐风云色，赤羽幢摇日月精。\r\n　　堤柳晓分仙掌露；溪花光耀翠裘清。\r\n　　欲知巡幸瞻天表，万国衣冠拜圣明。\r\n　　驾出朝歌南门，家家焚香设火，户户结彩铺氈。三千铁骑，八百御林，武成王黄飞虎保驾，满朝文武随行，前至女娲宫。天子离辇，上大殿，香焚炉中；文武随班拜贺毕。纣王观看殿中华丽。');
INSERT INTO `tb_bookbaseinfo` VALUES ('C1488956688C4DEE8EA3C80DAA6CE062-SJXID', '7', '皮囊', '蔡崇达', '24.00', '280', '2014-12-01 00:00:00', '天津人民出版社', '2016/05/08/21/26/082B9A69444B4F6C8BA2112D0482BECB-CODE_00763.jpg', '《皮囊》是一部有着小说阅读质感的散文集，也是一本“认心又认人”的书。。\r\n　　作者蔡崇达，本着对故乡亲人的情感，用一种客观、细致、冷静的方式，讲述了一系列刻在骨肉间故事。一个福建渔业小镇上的风土人情和时代变迁，在这些温情而又残酷的故事中一一体现。用《皮囊》这个具有指向本质意味的书名，来表达作者对父母、家乡的缅怀，对朋友命运的关切，同时也回答那些我们始终要回答的问题。\r\n　　书中收录有《皮囊》《母亲的房子》《残疾》《重症病房里的圣诞节》《我的神明朋友》《张美丽》《阿小和阿小》《天才文展》《厚朴》《海是藏不住的》《愿每个城市都不被阉割》《我们始终要回答的问题》《回家》《火车伊要开往叨位》等14篇作品。\r\n　　其中《皮囊》一文中的阿太，一位99岁的老太太，没文化，是个神婆。她却教给作者具有启示力量的生活态度：“肉体是拿来用的，不是拿来伺候的。”\r\n　　《母亲的房子》里，母亲想要建一座房子，一座四楼的房子，因为“这附近没有人建到四楼，我们建到了，就真的站起来了”。为了房子，她做苦工，捡菜叶，拒绝所有人的同情，哪怕明知这座房子不久后会被拆毁，只是为了“这一辈子，都有家可归”。\r\n　　而《残疾》里的父亲，他离家、归来，他病了，他挣扎着，全力争取尊严，然后失败，退生为孩童，最后离去。父亲被照亮了。被怀着厌弃、爱、不忍和怜惜和挂念，艰难地照亮。就在这个过程中，作者长大成人。自70后起，在文学书写中，父亲形象就失踪了。而蔡崇达的书里，这个形象重新出现了。\r\n　　这部特别的“新人新作”，由韩寒监制，上市之初即广受好评。莫言、白岩松、阿来、阎连科等评价为当下写作中的一个惊喜。或许《皮囊》真是新生的＂非虚构＂写作林地里，兀自展现的一片完全与众不同、可读可思、独具样貌的林木。');
INSERT INTO `tb_bookbaseinfo` VALUES ('FFD1FEF46D8A41E8BD47EA363E60249C-SJXID', '20', '永恒的终结', '（美）艾萨克·阿西莫夫 (Isaac Asimov)', '23.20', '200', '2014-09-12 00:00:00', '江苏文艺出版社', '2016/05/11/02/10/12B6CF4DFF2F4E0387FC63856F99C479-CODE_17649.jpg', '永恒的终结： \r\n　　第一章 时空技师\r\n安德鲁·哈伦迈步走进时空壶。时空壶壶身呈现出完美的圆形，严丝合缝地嵌在一道垂直竖井里。竖井由一圈排列稀疏的竖杆围拢而成，这些杆子微光闪烁，一直向上方延伸，在哈伦头顶之上6英尺的高度，没入一片雾气之中消失不见。哈伦设定好控制仪，推动手感平滑的操纵杆。\r\n壶没有动。\r\n哈伦也没指望它会动。他知道不会有任何位移，不上不下，不左不右，不会前进也不会后退。不过竖杆围拢的空间却开始融合成一片灰色空虚体，仿佛整片空间凝结成有形的固体，尽管实际上这里的一切并不会有实体的形态。他的确感到胃里有点轻微的搅动，还有一点微微的头晕（难道是心理作用？）。这种感觉提醒他，时空壶里的一切，包括他自己，都正在做急速的时间上移，穿越永恒时空，前往未来。\r\n他在575世纪登上时空壶，那里是两年前上级指派给他的操作基地。此前，575世纪已经是他个人时空上移最远的记录。而现在，他的上移目的地远在2456世纪。\r\n通常而言，在目前情境下他应该会感到有点失落。他自己的故乡世纪还在遥远的下时，确切地说是95世纪。95世纪是个原子能受到严格限制的时代，比较老土，喜欢用原木作建材，与邻近世纪的贸易中只会出口特定类型的蒸馏水，再进口一些苜蓿种子。尽管哈伦自从15岁加入组织，成为“时空新手”后，就再也没回过95世纪，但每次在永恒时空中做出远离“家乡”的位移，他依然会感到怅然若失。在2456世纪，他将距离自己出生时24万年之遥。即使对于一个心如铁石的永恒之人而言，这段距离也相当遥远。\r\n在一般情况下，事情总该如此。');

-- ----------------------------
-- Table structure for tb_bookcategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcategory`;
CREATE TABLE `tb_bookcategory` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(40) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `cate_pid` (`pid`),
  CONSTRAINT `cate_pid` FOREIGN KEY (`pid`) REFERENCES `tb_bookcategory` (`cid`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcategory
-- ----------------------------
INSERT INTO `tb_bookcategory` VALUES ('1', '文艺', null);
INSERT INTO `tb_bookcategory` VALUES ('2', '青春', null);
INSERT INTO `tb_bookcategory` VALUES ('3', '生活', null);
INSERT INTO `tb_bookcategory` VALUES ('4', '教育', null);
INSERT INTO `tb_bookcategory` VALUES ('5', '小说', null);
INSERT INTO `tb_bookcategory` VALUES ('6', '科技', null);
INSERT INTO `tb_bookcategory` VALUES ('7', '文学', '1');
INSERT INTO `tb_bookcategory` VALUES ('8', '传记', '1');
INSERT INTO `tb_bookcategory` VALUES ('9', '青春文学', '2');
INSERT INTO `tb_bookcategory` VALUES ('10', '动漫', '2');
INSERT INTO `tb_bookcategory` VALUES ('11', '幽默', '2');
INSERT INTO `tb_bookcategory` VALUES ('12', '运动', '3');
INSERT INTO `tb_bookcategory` VALUES ('13', '休闲', '3');
INSERT INTO `tb_bookcategory` VALUES ('14', '旅游', '3');
INSERT INTO `tb_bookcategory` VALUES ('15', '教材', '4');
INSERT INTO `tb_bookcategory` VALUES ('16', '考试', '4');
INSERT INTO `tb_bookcategory` VALUES ('17', '计算机', '6');
INSERT INTO `tb_bookcategory` VALUES ('18', '科普', '6');
INSERT INTO `tb_bookcategory` VALUES ('19', '自然科学', '6');
INSERT INTO `tb_bookcategory` VALUES ('20', '科幻小说', '5');
INSERT INTO `tb_bookcategory` VALUES ('21', '中国古典小说', '5');
INSERT INTO `tb_bookcategory` VALUES ('22', '外国小说', '5');
INSERT INTO `tb_bookcategory` VALUES ('23', '其他', null);
INSERT INTO `tb_bookcategory` VALUES ('24', '其他子集', '23');

-- ----------------------------
-- Table structure for tb_bookimg
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookimg`;
CREATE TABLE `tb_bookimg` (
  `imgId` varchar(40) NOT NULL,
  `bid` varchar(40) DEFAULT NULL,
  `imgUrl` varchar(200) DEFAULT NULL,
  `orderBy` int(11) DEFAULT '1',
  PRIMARY KEY (`imgId`),
  KEY `bid_fk` (`bid`),
  CONSTRAINT `bid_fk` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookimg
-- ----------------------------
INSERT INTO `tb_bookimg` VALUES ('015B922D3B3B45BCB9D13C31BB05CAE2-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/FB9BB679599644C899BF4C35611DD42F-CODE_17987.jpg', '5');
INSERT INTO `tb_bookimg` VALUES ('04FE9981117840769961B59C5A36204F-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/2C95A9D86E1141179AB51F4D6F058B76-CODE_50715.png', '5');
INSERT INTO `tb_bookimg` VALUES ('05215614A2BA480EBD6047427429836D-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/C7DB1811A3754F7C9B43EF70FB34D7E5-CODE_51363.png', '10');
INSERT INTO `tb_bookimg` VALUES ('0889AD30D02D448289635B70E2700269-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/29/0B92F542CDE3477CA3578C8D53040815-CODE_60000.png', '4');
INSERT INTO `tb_bookimg` VALUES ('089ABFF5AC1647E080596A603E6DA137-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/AD8DB46EE2BE42AC8B92901C18EC36C8-CODE_53541.png', '23');
INSERT INTO `tb_bookimg` VALUES ('0A2DB991198A45EAAD810F3BBCB2B98C-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/881B5C7564A048F48156F0A1ABADC3CA-CODE_53775.png', '25');
INSERT INTO `tb_bookimg` VALUES ('0EB9AF7A1C444C048AA678049F0E1425-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/02/EE81C2C2174D4C959F38E71E09C68863-CODE_21105.jpg', '10');
INSERT INTO `tb_bookimg` VALUES ('12C14E99BD514076987A077910C63E2E-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/838A0563E48C41FC9AD833DB840F1D73-CODE_16847.jpg', '3');
INSERT INTO `tb_bookimg` VALUES ('140A8D523B88427DA4FA788EE1B0AEC7-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/9B0B6BE162434B079CDED2D42484F95D-CODE_00284.png', '40');
INSERT INTO `tb_bookimg` VALUES ('15E252AC891740F08A16E0434B1A0129-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/175EA919410147A79A83B0064DA0FD93-CODE_98813.png', '28');
INSERT INTO `tb_bookimg` VALUES ('166C1760605141869B7B85BB402BF1DA-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/D02DE9F8CDB74ACAAC614D1632034932-CODE_00988.png', '43');
INSERT INTO `tb_bookimg` VALUES ('19C9E9515889492692517469BDC8FC1A-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/97E2654C7E4348D6AADAE358A461B5B1-CODE_18593.jpg', '6');
INSERT INTO `tb_bookimg` VALUES ('1B201985763B477BB3F34B192455B542-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/02/746F5AFBAA6E4CA98C0ACDE2200BF4AF-CODE_23575.jpg', '12');
INSERT INTO `tb_bookimg` VALUES ('1CD7D6D29DDE4553A68E155F296A6322-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/02/BF1C5B2408484AD484FEF8C6E0393F4C-CODE_20524.jpg', '9');
INSERT INTO `tb_bookimg` VALUES ('239A9E81F9304ADB852EA789BEB03E1A-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/893B259A4CFF45E3AF46120121DB419D-CODE_51474.png', '11');
INSERT INTO `tb_bookimg` VALUES ('2C83A3BD325C4072A219ACCAED00FEE6-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/884EC68975EA4D8F99FE85BBCEA9F0B1-CODE_51928.png', '15');
INSERT INTO `tb_bookimg` VALUES ('2ED1EF43E80F49F3A460872F325FC04C-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/BC536C9B62F14B39B5259883F1981275-CODE_51033.png', '7');
INSERT INTO `tb_bookimg` VALUES ('341C051BE750436C991C8FBAC8233284-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/2C3C75F08C94496090F0502A56719175-CODE_51580.png', '12');
INSERT INTO `tb_bookimg` VALUES ('38CD32932A6F454F9411A2388C3BA9ED-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/716BA64F4D0B4240995DFEE5E35DE2E7-CODE_00416.png', '41');
INSERT INTO `tb_bookimg` VALUES ('396019F19EB04651B08DE86B687A99BA-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/29/863AF4E580964BB6B2752C09293DE0A3-CODE_59756.png', '2');
INSERT INTO `tb_bookimg` VALUES ('3C1DB93F055549D98832AB8D2C34C817-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/C5C283281DFD444E8AFA4FAD7E1DB1B1-CODE_51142.png', '8');
INSERT INTO `tb_bookimg` VALUES ('3E25AC04910544ACBEA599E2374099E1-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/2999B778D08143ABB4C8F34EAE6F5C20-CODE_51807.png', '14');
INSERT INTO `tb_bookimg` VALUES ('41B419C42A1C47A18C32356F0B10B882-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/2F899EDD9C3344F5B1067C8599A7535E-CODE_01228.png', '45');
INSERT INTO `tb_bookimg` VALUES ('4667E4BCCD354437A15F4BF0F975FE3B-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/4B8DF7DC51864D9B81198358914499CD-CODE_53318.png', '22');
INSERT INTO `tb_bookimg` VALUES ('46F6E0362A05445C8E7CF8D9AEE4878C-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/EF2564CE564447349C6A5443ED98317D-CODE_99264.png', '31');
INSERT INTO `tb_bookimg` VALUES ('684551CF3CAE439CBF52FDB998D5D334-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/D7DC345FD6714FCE8ECBD7190A0F57C8-CODE_52059.png', '16');
INSERT INTO `tb_bookimg` VALUES ('69005679C0774DBEA300380DE8500CAF-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/192BFEF1876D438E8E5F6799A72315C7-CODE_01576.png', '48');
INSERT INTO `tb_bookimg` VALUES ('697E888D059149E2A4FD986DA94F15DA-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/1F60C680567E4D509B189F1DB03CC7EB-CODE_17471.jpg', '4');
INSERT INTO `tb_bookimg` VALUES ('709F4BEF1FE24B6E8E209CA646B33507-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/593A509875C448F09B87709ADCAA7B82-CODE_01465.png', '47');
INSERT INTO `tb_bookimg` VALUES ('72526BCE3F9947B58E473CB77D7222E5-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/02/A68C35DB479041B08E59BBD495718552-CODE_20088.jpg', '8');
INSERT INTO `tb_bookimg` VALUES ('7695255C44A943768ADFA7953CDE433D-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/A3BFA007DEA846769C93609DE69D43C2-CODE_53914.png', '26');
INSERT INTO `tb_bookimg` VALUES ('7A1DAA4B5FC54E17AA8CBE8AD6352D0E-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/6D405E6829504142981E2F776F7A5E00-CODE_53655.png', '24');
INSERT INTO `tb_bookimg` VALUES ('7ACC4F3A711B4979B6292E24E93CED8C-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/C36491229CCA4435B9E26242CD4B1FFF-CODE_51693.png', '13');
INSERT INTO `tb_bookimg` VALUES ('7EE19C2351D649ECB8960D9ED0C23F53-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/93C82A9C39494EB7BFD8ECF370AF664E-CODE_01821.png', '49');
INSERT INTO `tb_bookimg` VALUES ('82444831113E499DA75E4CCBE418718E-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/02/1530170CF0DC44A98C28207EE79D8858-CODE_22426.jpg', '11');
INSERT INTO `tb_bookimg` VALUES ('88BC6F67C413495E8BD31ACDBC99F65C-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/847E0B387CB7435D921A73D13AAF837C-CODE_99157.png', '30');
INSERT INTO `tb_bookimg` VALUES ('8D95FD40A4A24E57BE8734495490262F-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/3ED2B7F6CFBC49D28FF238926A63EDCA-CODE_51244.png', '9');
INSERT INTO `tb_bookimg` VALUES ('8E8EBE1D7DE6465AB4218B235F3358C4-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/2E6EA942F25A4AFD86B2456386BDB5B0-CODE_15345.jpg', '1');
INSERT INTO `tb_bookimg` VALUES ('9819140417AC4A088BC2E145E0F5DA14-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/8856E66864774EDD98B592E20CFE1B70-CODE_50900.png', '6');
INSERT INTO `tb_bookimg` VALUES ('982D24DB9E324E16943166B2CBA18418-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/2F7A3E17D3424B30B7C45E221AD00E92-CODE_99372.png', '32');
INSERT INTO `tb_bookimg` VALUES ('A555D39E9E16424EAE4CD20DDC8DC334-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/1C526574E08449F0B80D5265503BCC89-CODE_99486.png', '33');
INSERT INTO `tb_bookimg` VALUES ('A64FFB9A2DF649CF9A6E45BEB51B6C73-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/9B36BCE6546E48EAAE09C9F5B4ABACB5-CODE_99608.png', '34');
INSERT INTO `tb_bookimg` VALUES ('A6F952E465654F53B35AE33F63AB738E-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/AB884B80EE674D34B63CCF5645065093-CODE_16228.jpg', '2');
INSERT INTO `tb_bookimg` VALUES ('AB4A263263414D9CAAD00B8AD02B131F-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/4ECE8EA03EE94361AB57E430F29F329C-CODE_01332.png', '46');
INSERT INTO `tb_bookimg` VALUES ('ACD850592E684C3C88CF05C4D28A3853-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/964A840A0D7044ADB9EB416DE033FB44-CODE_99718.png', '35');
INSERT INTO `tb_bookimg` VALUES ('AEAE322943534D18940CCF723016B9E2-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/E11C7A11F4894CC79F035726F32B124E-CODE_01118.png', '44');
INSERT INTO `tb_bookimg` VALUES ('AFE72094AA1E438688574D2D6169A0C3-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/5E1926A7877643ECBF146D43691E259A-CODE_02090.png', '51');
INSERT INTO `tb_bookimg` VALUES ('B6BE478DDD134EC4965CEBD6CF29D2C1-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/DF6851DFF8304BC19E77A0124EEF8961-CODE_52880.png', '20');
INSERT INTO `tb_bookimg` VALUES ('B8E17CD065A842A79EB14E446DAAD9E1-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/29/8609782786B74DD1BCCBE74F900E2D9A-CODE_59607.png', '1');
INSERT INTO `tb_bookimg` VALUES ('BCAFD48E0098437DB9122ECC84B3A2DF-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/8D445982A7894DF39314AECD13A1F23D-CODE_00074.png', '38');
INSERT INTO `tb_bookimg` VALUES ('C04D31C8051445579FD74859BBDCF00A-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/FF2D8CE2B42043CC8A35253EC2851DE7-CODE_54029.png', '27');
INSERT INTO `tb_bookimg` VALUES ('C96B638BAC0948BCA4EFDF628845FA8E-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/5E12808CF64C4801BA725929B094D692-CODE_00798.png', '42');
INSERT INTO `tb_bookimg` VALUES ('CB63C035C35E43C493CEAAD2F1E35CB1-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/6714BFA1D9C748A59BE3E8880CF74415-CODE_52174.png', '17');
INSERT INTO `tb_bookimg` VALUES ('D568D734917846268B528AD80815C92A-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/521405C9EDB249F78864AA605974265F-CODE_52389.png', '19');
INSERT INTO `tb_bookimg` VALUES ('D6D2E77F0BBC415C94DB8B05074FCB72-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/12A11954533D456EA569CD11619863B3-CODE_99968.png', '37');
INSERT INTO `tb_bookimg` VALUES ('D6D77062642741E6B18A23CB8ED52E27-SJXID', 'A03718C482694AD1A1F67DA5AF0A1853-SJXID', '2016/05/13/11/01/0B59AFEB02054F5591C30795BE5C9779-CODE_19446.jpg', '7');
INSERT INTO `tb_bookimg` VALUES ('E03E7C2AE84648BA97419791DEAEF95D-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/9F7AC842A2B64CBDB177E4ADDDA65B85-CODE_99863.png', '36');
INSERT INTO `tb_bookimg` VALUES ('E64D6ABEB8CE4453BCD8043545F526D1-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/A62D66E92BE04684A87E2C17B6F18C16-CODE_53128.png', '21');
INSERT INTO `tb_bookimg` VALUES ('E96B35BA1CCD42B09B8E14FF373E1A29-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/34/69059FE323874F4D884D002402E11C4C-CODE_98998.png', '29');
INSERT INTO `tb_bookimg` VALUES ('EA34756B58B449E3AB01ED3276D613AE-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/3E87F43DB7844769A3D1368C75C975D1-CODE_00180.png', '39');
INSERT INTO `tb_bookimg` VALUES ('F0930C5F85E848EA8283AF2153653B44-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/29/4459905B8C504E0BA53583A43AEB6635-CODE_59876.png', '3');
INSERT INTO `tb_bookimg` VALUES ('F47A8EE344274671905D636792A18259-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/32/5DB8538577A34C2CAA5AD0152C3D0D85-CODE_52287.png', '18');
INSERT INTO `tb_bookimg` VALUES ('F68CFB3BC6C94CD79DC2D474B80FA16B-SJXID', '970E636901894E5E9794FC5014C91087-SJXID', '2016/05/09/10/35/264BBAD7E26346FCBC4F7357DE581A2C-CODE_01973.png', '50');

-- ----------------------------
-- Table structure for tb_bookorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookorder`;
CREATE TABLE `tb_bookorder` (
  `orderId` varchar(40) NOT NULL,
  `orderTime` datetime NOT NULL,
  `total` double(12,2) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `uid` varchar(40) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_order_uid` (`uid`),
  CONSTRAINT `fk_order_uid` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookorder
-- ----------------------------
INSERT INTO `tb_bookorder` VALUES ('SONO20160508221947149R83879', '2016-05-08 22:19:47', '149.00', '1', '厦门市思明区软件园2期观日路', 'F9C477E572EF436B92095D77526B1F63-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160508230457704R27504', '2016-05-08 23:04:58', '34.00', '8', '福州', 'F9C477E572EF436B92095D77526B1F63-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160511030745665R81535', '2016-05-11 03:07:46', '188.00', '2', '厦门', 'F9C477E572EF436B92095D77526B1F63-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160511031023730R16079', '2016-05-11 03:10:24', '96.00', '16', '天津', 'D2AD864781D04E3D9F91D57EA1A18558-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160511031049185R04069', '2016-05-11 03:10:49', '35.50', '1', '上海', 'D2AD864781D04E3D9F91D57EA1A18558-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160511031136880R14816', '2016-05-11 03:11:37', '51.00', '8', '北京', 'D2AD864781D04E3D9F91D57EA1A18558-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160513131657092R42922', '2016-05-13 13:16:57', '1.00', '1', '测试地址', 'F9C477E572EF436B92095D77526B1F63-SJXID');
INSERT INTO `tb_bookorder` VALUES ('SONO20160514084159217R24224', '2016-05-14 08:41:59', '280.00', '1', 'ddd', 'F9C477E572EF436B92095D77526B1F63-SJXID');

-- ----------------------------
-- Table structure for tb_bookstock
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookstock`;
CREATE TABLE `tb_bookstock` (
  `bid` varchar(40) NOT NULL,
  `bookStock` int(11) NOT NULL DEFAULT '0',
  `applyCount` int(11) NOT NULL DEFAULT '0',
  `applyContent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  CONSTRAINT `stock_bid` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookstock
-- ----------------------------
INSERT INTO `tb_bookstock` VALUES ('156F6E48327A470CAC739C278BE8E3CC-SJXID', '612', '0', null);
INSERT INTO `tb_bookstock` VALUES ('3CBB4F734B2440D5ACB5A91601D4888C-SJXID', '665', '0', null);
INSERT INTO `tb_bookstock` VALUES ('40CF80C2D00140C7BFAAA0E9CA29911C-SJXID', '621', '0', null);
INSERT INTO `tb_bookstock` VALUES ('50E10BED1E644F4DA1E6CFE95E329E23-SJXID', '500', '0', null);
INSERT INTO `tb_bookstock` VALUES ('619D61603E5B4FBF828603235074ABF4-SJXID', '455', '0', null);
INSERT INTO `tb_bookstock` VALUES ('793DB9469E08443288242B1E17FD6EF8-SJXID', '533', '0', null);
INSERT INTO `tb_bookstock` VALUES ('7EF95C38016F4E578B469C3AC9A137CD-SJXID', '121', '0', null);
INSERT INTO `tb_bookstock` VALUES ('923BA2E52CE4421195224A8A2689A8E8-SJXID', '325', '0', null);
INSERT INTO `tb_bookstock` VALUES ('970E636901894E5E9794FC5014C91087-SJXID', '895', '0', null);
INSERT INTO `tb_bookstock` VALUES ('A03718C482694AD1A1F67DA5AF0A1853-SJXID', '321', '0', null);
INSERT INTO `tb_bookstock` VALUES ('A33AAF0B16F6405199B21F9963200375-SJXID', '654', '0', null);
INSERT INTO `tb_bookstock` VALUES ('B10DD5FBF4C54ABA95B88C42A764908A-SJXID', '452', '0', null);
INSERT INTO `tb_bookstock` VALUES ('C1488956688C4DEE8EA3C80DAA6CE062-SJXID', '651', '0', null);
INSERT INTO `tb_bookstock` VALUES ('FFD1FEF46D8A41E8BD47EA363E60249C-SJXID', '556', '0', null);

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `cartId` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bid` varchar(40) NOT NULL,
  `uid` varchar(40) NOT NULL,
  PRIMARY KEY (`cartId`),
  KEY `fk_cart_bid` (`bid`),
  KEY `fk_cart_uid` (`uid`),
  CONSTRAINT `fk_cart_bid` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`),
  CONSTRAINT `fk_cart_uid` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
INSERT INTO `tb_cart` VALUES ('04DF56514F2A4137942B251740152400-SJXID', '1', 'B10DD5FBF4C54ABA95B88C42A764908A-SJXID', '9BA55C40F6694C09ADB76A9F5C0C675E-SJXID');
INSERT INTO `tb_cart` VALUES ('1B877F4808DC45F48BCA36913ACC7F4F-SJXID', '3', 'FFD1FEF46D8A41E8BD47EA363E60249C-SJXID', 'D2AD864781D04E3D9F91D57EA1A18558-SJXID');
INSERT INTO `tb_cart` VALUES ('6F3B1198BC4349B4ACFEAEED31FB917E-SJXID', '1', '3CBB4F734B2440D5ACB5A91601D4888C-SJXID', '9BA55C40F6694C09ADB76A9F5C0C675E-SJXID');
INSERT INTO `tb_cart` VALUES ('808E146EF73F453FBED2A1E194315AC0-SJXID', '5', '40CF80C2D00140C7BFAAA0E9CA29911C-SJXID', 'D2AD864781D04E3D9F91D57EA1A18558-SJXID');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `commentID` varchar(40) NOT NULL,
  `bookID` varchar(40) NOT NULL,
  `userID` varchar(40) NOT NULL,
  `commentContent` varchar(1000) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_comm_bid` (`bookID`),
  KEY `fk_comm_uid` (`userID`),
  CONSTRAINT `fk_comm_bid` FOREIGN KEY (`bookID`) REFERENCES `tb_bookbaseinfo` (`bid`),
  CONSTRAINT `fk_comm_uid` FOREIGN KEY (`userID`) REFERENCES `tb_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('51C2F5BDF82B4B7E8FE6E570781FF152-SJXID', '40CF80C2D00140C7BFAAA0E9CA29911C-SJXID', 'F9C477E572EF436B92095D77526B1F63-SJXID', '好看，很有深度', '2016-05-08 23:08:51');
INSERT INTO `tb_comment` VALUES ('D8B097689D184D70AFB2B4E224208320-SJXID', 'C1488956688C4DEE8EA3C80DAA6CE062-SJXID', 'F9C477E572EF436B92095D77526B1F63-SJXID', '真实', '2016-05-08 22:21:41');

-- ----------------------------
-- Table structure for tb_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `orderItemId` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bid` varchar(40) NOT NULL,
  `oid` varchar(40) NOT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `fk_item_bid` (`bid`),
  KEY `fk_item_oid` (`oid`),
  CONSTRAINT `fk_item_bid` FOREIGN KEY (`bid`) REFERENCES `tb_bookbaseinfo` (`bid`),
  CONSTRAINT `fk_item_oid` FOREIGN KEY (`oid`) REFERENCES `tb_bookorder` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('0F1BF308B8974C6EA0393535A7135AF3-CODE', '2', '40CF80C2D00140C7BFAAA0E9CA29911C-SJXID', 'SONO20160508230457704R27504');
INSERT INTO `tb_orderitem` VALUES ('312D45CBB34E42B0B922F4817EEFC1BA-CODE', '3', '3CBB4F734B2440D5ACB5A91601D4888C-SJXID', 'SONO20160511031136880R14816');
INSERT INTO `tb_orderitem` VALUES ('36F659AE818149CD8007B43B8C1A63A8-CODE', '1', '619D61603E5B4FBF828603235074ABF4-SJXID', 'SONO20160508221947149R83879');
INSERT INTO `tb_orderitem` VALUES ('5FCF1890DC4B4B5383E5807263C506D9-CODE', '4', 'C1488956688C4DEE8EA3C80DAA6CE062-SJXID', 'SONO20160511031023730R16079');
INSERT INTO `tb_orderitem` VALUES ('62AF806341C349DF9CB7EB728F0F825E-CODE', '4', '619D61603E5B4FBF828603235074ABF4-SJXID', 'SONO20160511030745665R81535');
INSERT INTO `tb_orderitem` VALUES ('AA76362494114A00B2A6573ACC377E88-CODE', '5', 'C1488956688C4DEE8EA3C80DAA6CE062-SJXID', 'SONO20160508221947149R83879');
INSERT INTO `tb_orderitem` VALUES ('AE7380F1BA9242E58774E0E019A16B72-CODE', '1', '923BA2E52CE4421195224A8A2689A8E8-SJXID', 'SONO20160511031049185R04069');
INSERT INTO `tb_orderitem` VALUES ('B3E8CDA398B341F99DE719F435B2631F-CODE', '4', '7EF95C38016F4E578B469C3AC9A137CD-SJXID', 'SONO20160514084159217R24224');
INSERT INTO `tb_orderitem` VALUES ('BCE4B9FC8F3C41588F5477A995637D2A-CODE', '3', 'C1488956688C4DEE8EA3C80DAA6CE062-SJXID', 'SONO20160511030745665R81535');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userId` varchar(40) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPassWord` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNum` varchar(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `isActivate` int(1) DEFAULT '0',
  `activationCode` varchar(40) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('25E431AF79E44DCDB25139676B21DD7D-SJXID', 'test', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2515452324@qq.com', null, '0', '1', '7D608644E5DD4E2FBC39823C943598CA-CODE', '2016-05-08 22:15:59');
INSERT INTO `tb_user` VALUES ('9BA55C40F6694C09ADB76A9F5C0C675E-SJXID', 'JancySongTest', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2515452324@qq.com', null, '1', '1', '2BE87A64DE754F4999C2E9E6BBDA93F8-CODE', '2016-05-13 13:45:10');
INSERT INTO `tb_user` VALUES ('D2AD864781D04E3D9F91D57EA1A18558-SJXID', 'JancySong', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2515452324@qq.com', null, '1', '1', '8B624C02E7774FFB938A7BC06492CC25-CODE', '2016-05-08 22:14:24');
INSERT INTO `tb_user` VALUES ('F9C477E572EF436B92095D77526B1F63-SJXID', 'admin', '608BF9DE6817076624C27B3A40111FA7-JANCY', '2515452324@qq.com', null, '1', '1', 'A5BB65C109B24E1C8266A6D08395A190-CODE', '2016-05-08 22:12:33');
