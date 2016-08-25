//
//  OneViewController.m
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import "OneViewController.h"
#import "EZCellModel.h"
#include "EZTableViewCell.h"

@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<EZCellModel *> *modelArray;


@end

@implementation OneViewController



- (void)viewDidLoad {
   
    [super viewDidLoad];
    NSArray *strings = @[@"郑重提醒：G20期间，各位赴杭州自驾的男同胞，在高速上堵车尿憋不住的时候，千万别用饮料瓶子…因为进杭州以后，你并不知道会有多少个警察要求你喝一口…",
                                              
                                              @"周边产品近期似乎没有预想的效果那么好，首先，希望煎蛋坚持下去，毕竟这么多蛋友支持和喜欢。另外，思路上面提个建议。煎蛋现有的思路是“想个好东西，然后找厂家做出来”。奈何煎蛋的大厨们似乎对外委加工的控制不是太在行，品质和周期似乎和预想的都有很大差距。那么能不能换个思路，先看看熟悉的圈子里（每个大厨一大堆亲戚朋友同学的）有什么比较成熟的产品，本身品质不错、稳定、供货能力够，和他们合作。现有产品做小改动，品质和供货都会容易控制很多。打个比方如果有熟悉的中高端台灯厂家，在台灯上加入超载鸡元素，品质、供货能力都会很好。当然可选的产品几乎无数，别的也一样。\r\n至于利润肯定会低一些，但是，说直白点，自己没有能力生产和品控，又不像小米巨额资金砸进去，那么就不要追求太高的利润了吧。购买量上去了，才好和原厂谈利润分配。随便一说，给sein参考",
                                              
                                              @"闺蜜喜欢一男生，想告白可是性格比较腼腆，于是就侧面给这哥们说 ：我妈对你印象挺好，挺喜欢你的。结果这哥们哈哈哈大笑说：那你还不赶快叫爸爸！",
                                              
                                              @"如果有一天北京人大批外出打工，那时候北京的房价才真的能降下来。同样适用于上广深。",
                                              
                                              @"岛国心理专家在节目中指出，如果你看电视、综艺里的人物出丑尴尬时、自己也会感到尴尬，看别人明显失误犯错时、自己也感觉不舒服不自在，那你可能是“同感羞耻”型人格，不太适合看整人、恶搞类节目，而你的同伴大约占人类的10.4%……原来不是我一个人",
                                              @"在列表中的是兴奋剂，不在列表中的是所谓运动增强剂。孙杨被查的那一次，几个月前那种物质刚被添加到列表中，在一共16大项的最末一项。孙杨被查出来之后，有说法说被从列表中去除了，但是没有看到证据。列表控制在谁手里？我真觉得更多是综合实力的问题。请大家狂喷，只要不带人生攻击就好。",
                                              
                                              @"朋友一堂弟媳怀孕了，家里怕她上班累着就让她辞了工在家休息，她觉着无聊就去麻将馆打麻将，打着就上瘾了。过了两月觉得孕吐啥的实在太影响打麻将了，就一个人偷偷跑去医院做掉小孩了。又过了几个月，家里人觉得奇怪，这么久了咋肚子那么小不见长呀，就想让她去医院检查，她这才说小孩早打掉了。现在家里乱成一锅粥天天闹离婚呢。",
                                              
                                              @"【日本乒协不让福原爱“下嫁”江宏杰】日本《女性自身》杂志爆料，日本乒乓球协会无情地阻止福原爱与中华台北队乒乓球选手江宏杰结婚。日本乒协干部的发言表示，日本乒乓球协会对福原在4年后的东京奥运给予了很大期待，希望她能像过去一样，专注在竞赛上。还有日本乒协干部称，江宏杰比福原低一级，收入的差距也很大，结婚的话会被说成“格差婚”（贫富悬殊）。",
                                              
                                              @"自动取 款 机前 排了好几个人，最前面的小伙子取了钱转身要走，在他后面的大爷“咣”的一声摔倒，老人颤巍巍的死 抱着小伙子大 腿：你干嘛绊倒我，哎~呦！腿好疼不能动了！\r\n小伙子一脸无奈，爸，我可是你儿子！\r\n老人嗖地一声爬起来：额，习惯了！看见这么多钱我就腿 软。。。。",
                                              
                                              @"昨晚又一夜没睡好，一直在想一个问题：菲律宾真搞笑 ，凭什么南海靠近菲律宾就是他们的？我家楼下\r\n中国银行 ；工商银行\r\n酒店；家乐福超市。。。\r\n还有隔壁刚搬来的年轻漂亮媳妇，\r\n我都没敢说是我的，\r\n想不明白，我得找律师仲裁一下，这万一我仲裁胜出了，我该咋办呢？越想越兴奋，于是就睡不着了！\r\n\r\n\r\n【传说中2016年度获奖微小说】《我最近失眠了》",
                                              @"【男主播在长春街头拉“我爱马蓉”横幅被打】近日，一主播在长春重庆路拉出一条“宝宝不哭 我爱马蓉”横幅，并且在镜头前公开表示支持马蓉，自称掌握“王宝强流出的不雅视频”。路边的一位大哥看不下去了，与其发生言语冲突，将他打得满脸血狼狈逃窜，炒作有危险，作死需谨慎。",
                                              @"微软：您可能是盗版软件的受害者。\r\n用户：不，你才是。",
                                              @"一个男人变得成熟的具体表现：\r\n感觉鼻毛好长需要有事没事拔一拔。\r\n从看日本A片发展到看国产自拍精品。\r\n低头看不见丁丁只看到肚子赘肉。",
                                              @"周围的人买了套房，六个月房价的涨幅就相当于赚了十年的工资，于是他开始感叹工作还有什么意义。其实，工作的意义在于，以后房价腰斩时能让人还有活下去的勇气，假如还有工作的话。",
                                              @"我兄弟部队回来没事和女朋友在摆地摊，碰到城管检查打了起来。一人收拾七名城管。第二天就当上了城管。",
                         @"''请问你是某某吗''\r\n''是''\r\n''这里是是招商银行信用卡中心的，我们检测到、、、、、、''\r\n''美女，别说了，我来电显示你是诈骗。''\r\n''哦，那挂了吧。''",
                         
                         @"今天这天最舒服了\r\n不凉不热的风吹着\r\n太阳躲起来远远的\r\n小草大树仍是绿色\r\n作首小诗都还合辙",
                         
                         @"为什么现在装个APP，一打开都会想知道我的地理位置，计算器都想知道，这是什么意思，是要约炮吗？",
                         
                         @"就在刚刚，欧洲南方天文台（ESO）发布了一项声明，确认了此前已经在坊间流传多时的一个消息：科学家们在距离太阳系最近的半人马座比邻星周围发现了一颗岩石系外行星，并且其与比邻星之间的距离适当，因而处于所谓“宜居带”范围内，这就意味着其地表有可能允许水体以液态形式存在，这就意味着这颗行星表面有可能存在适宜生命居住的环境条件。在比邻星周围发现可能存在宜居条件，并让人猜想可能存在生命的系外行星。",
                         
                         @"我这辈子最有毅力的事大概是「持续没有毅力」；我这辈子最干脆的事大概是「说拖到明天立马就瘫倒」；我这辈子最记忆犹新的事大概是「很想忘掉的尴尬瞬间」；我这辈子最常见的人大概是「跟我一样的人」。",
                         
                         @"儿子英语成绩非常的差，跟他商量：实在不行报个英语学习班吧！也花不了多少钱！\r\n儿子沉默了一会儿说：报了学习班，花了钱，在考不好，不是更没法向你交待了……",
                         @"现在看到能捉耗子的猫，就觉得这只猫的生活肯定特别苦，比我还苦",
                         @"看到一个男的精心设计求婚：在女友打电话过来的时候找哥们儿的女友接电话说他在洗澡然后坐等女友来家捉奸的一瞬间向其求婚SURPRISE！结果女友把他联系方式全拉黑了。典型的闷声作大死，平时电视剧看多了。连八点档都信的智商，这辈子还能有什么希望。",
                         @"生活中总会有一些不如意的事情，那么我们该怎样去面对这些不快呢？伊斯兰教有一句老话说得好，叫做，阿拉胡阿克巴",
                         @"微软：迄今为止最好的windows\r\n苹果：重新定义了xxx\r\n安卓：续航更长，体验更顺滑\r\n我：我已阅读并同意以上用户许可协议",
                         @"【女生骑摩托、拿房产证向男生求婚】24日，成都一位姑娘身穿婚纱，骑着哈雷摩托，手捧鲜花拿着房产证，向一位男生当场求婚，并大喊：“我挣到了你最爱的哈雷，娶我吧，房产证上写你的名字！”小伙答应后，姑娘说：求婚不再是男生的特权了…喜欢他，就要用尽所有力气告诉他。"];
    
    _modelArray = [NSMutableArray array];
    for (int i = 0; i < strings.count; i ++) {
        EZCellModel *model = [[EZCellModel alloc]initWithContentString:strings[i]];
        [_modelArray addObject:model];
    }
    [self.view addSubview:self.tableView];

    // Do any additional setup after loading the view.
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667-60) style:UITableViewStylePlain];
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return _tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.modelArray[indexPath.row].cellHeigh;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EZTableViewCell *cell = [EZTableViewCell cellWithTableView:tableView];
    
    cell.model = self.modelArray[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EZTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell clickCell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
