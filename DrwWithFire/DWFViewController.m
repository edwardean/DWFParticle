//
//  DWFViewController.m
//  DrwWithFire
//
//  Created by Edward on 13-6-9.
//  Copyright (c) 2013年 Lihang. All rights reserved.
//

#import "DWFViewController.h"

@interface DWFViewController ()

@end

@implementation DWFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setEmitterPositionFromTouch:[touches anyObject]];
    [fireView setIsEmitting:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setEmitterPositionFromTouch:[touches anyObject]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setIsEmitting:NO];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setIsEmitting:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
