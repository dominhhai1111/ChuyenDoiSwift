//
//  ChessView.m
//  BaiTapChuyenDoiSwift
//
//  Created by Do Minh Hai on 10/24/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()
{
    CGFloat margin ;
    int rowIndex, colIndex ;
    float cellWidth;
    UIView *containerView;
    UISlider *slider;
}
@end

@implementation ChessView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    margin = 10;
     //containerView.frame = CGRectMake(0, 0, self.view.bounds.size.width - margin* 2.0, self.view.bounds.size.width - margin*2.0);->ko hien
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin* 2.0, self.view.bounds.size.width - margin*2.0)];
    containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    containerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:containerView];
    cellWidth = (self.view.bounds.size.width - margin * 2.0) / 8.0;
    for (rowIndex=0; rowIndex<=7; rowIndex++) {
        for (colIndex=0; colIndex<=7; colIndex++) {
            CGRect rect = CGRectMake(colIndex * cellWidth,   rowIndex * cellWidth,  cellWidth,  cellWidth);
            UIView * cell ;
            cell = [[UIView alloc] initWithFrame:rect];
            if (rowIndex % 2 == 0  ) {
                cell.backgroundColor = (colIndex%2 == 0) ? [UIColor blackColor] : [UIColor whiteColor];
            }else
            {
                cell.backgroundColor = (colIndex%2 == 0) ? [UIColor whiteColor] : [UIColor blackColor];
            }
            [containerView addSubview:cell];
        }
    }
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(20 , self.view.bounds.size.height-50, self.view.bounds.size.width - 40, 10)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.value = 0;
    [slider addTarget:self action: @selector(onRotate) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

-(void) onRotate
{
    containerView.transform = CGAffineTransformMakeRotation((slider.value) * M_PI);

}


@end
