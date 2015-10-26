//
//  BasicView.m
//  BaiTapChuyenDoiSwift
//
//  Created by Do Minh Hai on 10/24/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()
{
    
   
    __weak IBOutlet UIView *myView;
    __weak IBOutlet UISlider *rotateSlider;
    __weak IBOutlet UISlider *scaleSlider;
    __weak IBOutlet UISlider *alphaSlider;
   
    __weak IBOutlet UISegmentedControl *colorChangeSegmentedControl;
       __weak IBOutlet UISwitch *showSwitch;
}
- (IBAction)onShow:(id)sender;
- (IBAction)onAlphaChange:(id)sender;
- (IBAction)onRotate:(id)sender;
- (IBAction)onScaleChange:(id)sender;

- (IBAction)onColorChange:(id)sender;

@end

@implementation BasicView

- (void)viewDidLoad {
    [super viewDidLoad];
    myView.backgroundColor = [UIColor blackColor];
   }



- (IBAction)onShow:(id)sender {
    myView.hidden = !showSwitch.on ;
}

- (IBAction)onAlphaChange:(id)sender {
    myView.alpha = alphaSlider.value;
}
-(void) rotateAndScale
{
       myView.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(scaleSlider.value,scaleSlider.value), CGAffineTransformMakeRotation((rotateSlider.value) * M_PI));}
- (IBAction)onRotate:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onScaleChange:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onColorChange:(id)sender {
    
    switch (colorChangeSegmentedControl.selectedSegmentIndex) {
        case 0:
            myView.backgroundColor =[UIColor blackColor];
            break;
        case 1:
            myView.backgroundColor =[UIColor redColor];
            break;
        case 2:
            myView.backgroundColor =[UIColor greenColor];
            break;
        case 3:
            myView.backgroundColor =[UIColor blueColor];
            break;
        default:
            break;
    }

}


@end
