//
//  ViewController.m
//  DMCircleButtonExample
//
//  Created by Daniel McCarthy on 12/31/14.
//  Copyright (c) 2014 Daniel McCarthy. All rights reserved.
//

#import "ViewController.h"
#import "DMCircleButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTheCircleButton];
}

- (void)setupTheCircleButton {
    DMCircleButton *blinkButton = [DMCircleButton buttonWithLabel:@"Blink"
                                                  backgroundColor:[UIColor greenColor]
                                                        textColor:[UIColor whiteColor]
                                                             font:[UIFont systemFontOfSize:17.0f]
                                                             size:80.0f
                                                    animationType:DMCircleButtonAnimationTypeBlink];
    
    DMCircleButton *pulseButton = [DMCircleButton buttonWithLabel:@"Pulse"
                                                  backgroundColor:[UIColor redColor]
                                                        textColor:[UIColor whiteColor]
                                                             font:[UIFont systemFontOfSize:17.0f]
                                                             size:80.0f
                                                    animationType:DMCircleButtonAnimationTypePulse];
    
    blinkButton.center = CGPointMake((self.view.frame.size.width/2)/2, self.view.center.y);
    pulseButton.center = CGPointMake(self.view.frame.size.width-((self.view.frame.size.width/2)/2), self.view.center.y);
    
    [self.view addSubview:blinkButton];
    [self.view addSubview:pulseButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
