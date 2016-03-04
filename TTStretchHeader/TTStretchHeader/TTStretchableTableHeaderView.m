//
//  TTStretchableTableHeaderView.m
//  TTStretchHeader
//
//  Created by 梁腾 on 16/3/1.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "TTStretchableTableHeaderView.h"

@interface TTStretchableTableHeaderView ()

@property (nonatomic,assign) CGRect initialFrame;
@property (nonatomic,assign) CGFloat viewHeight;

@end



@implementation TTStretchableTableHeaderView

- (void)stretchHeaderForTableView:(UITableView *)tableView tableViewwithView:(UIView *)view{
    _tableView = tableView;
    _view = view;
    
    self.initialFrame = view.frame;
    self.viewHeight = self.initialFrame.size.height;
    UIView *emptyHeaderView = [[UIView alloc] initWithFrame:self.initialFrame];
    tableView.tableHeaderView = emptyHeaderView;
    [tableView addSubview:view];

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect  frame = self.view.frame;
    frame.size.width = self.tableView.frame.size.width;
    self.view.frame = frame;
    if(scrollView.contentOffset.y < 0)
    {
        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        
        _initialFrame.origin.y = - offsetY * 1;
        _initialFrame.origin.x = - offsetY / 2;
        
        _initialFrame.size.width  = _tableView.frame.size.width + offsetY;
        _initialFrame.size.height = _viewHeight + offsetY;
        
        _view.frame = _initialFrame;
    }
}



@end
