//
//  TTStretchableTableHeaderView.h
//  TTStretchHeader
//
//  Created by 梁腾 on 16/3/1.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTStretchableTableHeaderView : NSObject

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *view;



- (void)stretchHeaderForTableView:(UITableView *)tableView tableViewwithView:(UIView *)view;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)resizeView;

@end
