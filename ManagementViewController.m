//
//  ManagementViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2016/02/14.
//  Copyright © 2016年 柴田　樹希. All rights reserved.
//

#import "ManagementViewController.h"

@interface ManagementViewController ()

@end

@implementation ManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path5 = [[NSBundle mainBundle] pathForResource:@"timebutton" ofType:@"mp3"];
    NSURL *url5 = [NSURL fileURLWithPath:path5];
    self.timebutton = [[AVAudioPlayer alloc] initWithContentsOfURL:url5 error:NULL];

    NSString *path6 = [[NSBundle mainBundle] pathForResource:@"dater" ofType:@"mp3"];
    NSURL *url6 = [NSURL fileURLWithPath:path6];
    self.dater = [[AVAudioPlayer alloc] initWithContentsOfURL:url6 error:NULL];
    [_dater play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back4{
    [_timebutton play];
    [_dater stop];
    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
