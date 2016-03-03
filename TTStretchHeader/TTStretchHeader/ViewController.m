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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    headerImageView.clipsToBounds = YES;
    headerImageView.image = [UIImage imageNamed:@"loginUUUTx"];    
  
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"123";
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
