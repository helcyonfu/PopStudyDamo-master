//
//  NavChangeController.m
//  PopStudy
//
//  Created by tao on 16/8/30.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "NavChangeController.h"

@interface NavChangeController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIView *navBackView;
@property (nonatomic,assign) CGFloat headerHigh;
@end

@implementation NavChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource =self;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleSingleLineEtched;
    self.navBackView=[self.navigationController.navigationBar.subviews firstObject];
    self.headerHigh =200.0;
    UIView *headIV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, self.headerHigh)];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:headIV.bounds];
    iv.image =[UIImage imageNamed:@"4"];
    [headIV addSubview:iv];
    self.tableView.tableHeaderView =headIV;
    self.view.backgroundColor =[UIColor greenColor];
    
    self.automaticallyAdjustsScrollViewInsets =NO;
    self.navBackView.alpha = 0;
    self.navigationController.navigationBar.translucent=YES;
    //滑动的时候是否隐藏
    self.navigationController.hidesBarsOnSwipe =NO;
    
    //去除黑线
//    self.navigationController.navigationBar.shadowImage =[UIImage new];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.delegate =self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tableView.delegate =nil;
    self.navBackView.alpha =1.0;
    self.navigationController.navigationBar.barTintColor =nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.imageView.image =[UIImage imageNamed:@"ws_leimu_pink"];
    cell.textLabel.text =@"这是测试标题";
    cell.detailTextLabel.text =@"这是测试副标题";
    return cell;
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY>(self.headerHigh-self.navigationController.navigationBar.bounds.size.height)) {
        //只隐藏navBar背景，item依然显示
        self.navBackView.alpha = (offsetY-(self.headerHigh-self.navigationController.navigationBar.bounds.size.height))/64.0;
    }else{
        self.navBackView.alpha = 0;
    }
}



@end
