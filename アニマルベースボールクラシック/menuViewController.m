//
//  menuViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2015/03/25.
//  Copyright (c) 2015年 柴田　樹希. All rights reserved.
//

#import "menuViewController.h"
#import "AppDelegate.h"

@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path5 = [[NSBundle mainBundle] pathForResource:@"timebutton" ofType:@"mp3"];
    NSURL *url5 = [NSURL fileURLWithPath:path5];
    self.timebutton = [[AVAudioPlayer alloc] initWithContentsOfURL:url5 error:NULL];
    
    if ( TRUE ) {
        
        // どちらの画面から来ても隠さないようにする
        questback.hidden = NO;
        
    } else {
        //Appdelegate内のkirikaeの変数を変化させる
        //    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        //    if (appDelegate.kirikae == 1){
        //        questback.hidden = NO;
        //    }else{
        //        questback.hidden = YES;
        //        }
    }
    
    
    
}

-(IBAction)questback{
    [_timebutton play];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)rule{
    [_timebutton play];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
