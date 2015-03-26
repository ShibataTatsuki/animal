//
//  ViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/22.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



@synthesize n78;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *url3 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"n78"ofType:@"mp3"]];
    NSError *error = nil;
    n78 = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:&error];
    [n78 play];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"hozon"];
    //UIImageView *View;
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
}
-(IBAction)start{
    [n78 stop];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
