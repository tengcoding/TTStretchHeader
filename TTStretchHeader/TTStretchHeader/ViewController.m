//
//  ViewController.m
//  TTStretchHeader
//
//  Created by 梁腾 on 16/2/29.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "ViewController.h"
#import "TTStretchableTableHeaderView.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong)TTStretchableTableHeaderView *headerView ;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIColor *backColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height+64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    headerImageView.clipsToBounds = YES;
    headerImageView.image = [UIImage imageNamed:@"loginUUUTx"];
    self.headerView = [TTStretchableTableHeaderView new];
    [self.headerView stretchHeaderForTableView:self.tableView tableViewwithView:headerImageView];
    
    
    //添加导航栏渐变效果
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //添加背景view
    CGRect backView_frame = CGRectMake(0, -22, [UIScreen mainScreen].bounds.size.width, 64);
    UIView *backView = [[UIView alloc] initWithFrame:backView_frame];
    UIColor *backColor = [UIColor colorWithRed:0.83 green:0.93 blue:0.96 alpha:0];
    backView.backgroundColor = [backColor colorWithAlphaComponent:0.0];
    [self.navigationController.navigationBar addSubview:backView];
    self.backView = backView;
    self.backColor = backColor;
    //标题
    self.navigationItem.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
 
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"123";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset_Y = scrollView.contentOffset.y;
    CGFloat alpha = (offset_Y + 40)/300.0f;
    self.backView.backgroundColor = [self.backColor colorWithAlphaComponent:alpha];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [[UIColor blackColor] colorWithAlphaComponent:alpha] }];
    
    
    [self.headerView scrollViewDidScroll:scrollView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
