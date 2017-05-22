//
//  LightBoxViewController.m
//  Objective C
//
//  Created by Edwin Dario Gutierrez Pech on 5/21/17.
//  Copyright © 2017 Darío Gutiérrez iOS Designer. All rights reserved.
//

#import "LightBoxViewController.h"
LightBoxView *lightBox;

@interface LightBoxViewController ()

@end

@implementation LightBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    lightBox = [[LightBoxView alloc]initWithFrame: CGRectZero];
    [self.view addSubview:lightBox];
    
    //Autolayout
    [lightBox autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    //[lightBox showLightBox];
}


@end
