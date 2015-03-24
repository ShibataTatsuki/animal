//
//  dieViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/26.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import "dieViewController.h"

@interface dieViewController ()

@end

@implementation dieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path7 = [[NSBundle mainBundle] pathForResource:@"fail" ofType:@"mp3"];
    NSURL *url7 = [NSURL fileURLWithPath:path7];
    self.fail = [[AVAudioPlayer alloc] initWithContentsOfURL:url7 error:NULL];
    
    
    [self.fail play];
    NSLog(@"test");



}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
