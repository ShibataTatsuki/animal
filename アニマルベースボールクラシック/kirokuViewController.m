//
//  kirokuViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2015/03/25.
//  Copyright (c) 2015年 柴田　樹希. All rights reserved.
//

#import "kirokuViewController.h"

@interface kirokuViewController ()

@end

@implementation kirokuViewController{
    NSArray *sukoaArray;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    //データを呼び出す
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    int myhp = [[df objectForKey:@"myhp"] integerValue];
    sukoalabel.text=[NSString stringWithFormat:@"%d",myhp];
    int myhp_worst = [[df objectForKey:@"myhp_worst"] integerValue];
    sukoa_worstlabel.text=[NSString stringWithFormat:@"%d",myhp_worst];
    
    int myhp_new_worst = [[df objectForKey:@"myhp_worst"] integerValue];
    sukoa_worstlabel.text=[NSString stringWithFormat:@"%d",myhp_worst];
    
    if ([df objectForKey:@"tourokuName"]==NULL) {
        saikoulabel.text=@"";
    }else{
        saikoulabel.text = [NSString stringWithFormat:@"%@",[df objectForKey:@"tourokuName"]];
    }
     if ([df objectForKey:@"touroku2Name"]==NULL) {
        saiteilabel.text=@"";

    }
     else{
          saiteilabel.text = [NSString stringWithFormat:@"%@",[df objectForKey:@"touroku2Name"]];
     }
    
}
-(IBAction)resetTopScore{
    sukoalabel.text=@"0";
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];// 取得
    [ud setInteger:0 forKey:@"myhp"];
    [ud synchronize];
    saikoulabel.text=@"";
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];// 取得
    [df removeObjectForKey:@"tourokuName"];
    [df synchronize];
    }

-(IBAction)resetWorstScore{
    sukoa_worstlabel.text=@"0";
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    saiteilabel.text=@"";
    [ud setInteger:0 forKey:@"myhp_worst"];
    [ud synchronize];
    saiteilabel.text=@"";
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];// 取得
    [df removeObjectForKey:@"touroku2Name"];
    [df synchronize];


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
