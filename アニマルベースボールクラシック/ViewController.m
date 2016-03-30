//
//  ViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/22.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize n78;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.kirikae = 0;
    
    NSURL *url3 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"n78"ofType:@"mp3"]];
    NSError *error = nil;
    n78 = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:&error];
    [n78 play];
    
    NSString *path6 = [[NSBundle mainBundle] pathForResource:@"startbutton" ofType:@"mp3"];
    NSURL *url6 = [NSURL fileURLWithPath:path6];
    self.startbutton = [[AVAudioPlayer alloc] initWithContentsOfURL:url6 error:NULL];
    
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"timebutton" ofType:@"mp3"];
    NSURL *url4 = [NSURL fileURLWithPath:path4];
    self.timebutton = [[AVAudioPlayer alloc] initWithContentsOfURL:url4 error:NULL];
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"hozon"];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}
-(IBAction)start{
    [n78 stop];
    [_startbutton play];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.kirikae = 1;
}
-(IBAction)savedater{
    [n78 stop];
    [_timebutton play];
}

-(IBAction)explanation{
    [n78 stop];
    [_timebutton play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
