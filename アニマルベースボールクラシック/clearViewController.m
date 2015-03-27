//
//  clearViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/26.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import "clearViewController.h"

@interface clearViewController ()

@end

@implementation clearViewController

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
    
    NSString *path6 = [[NSBundle mainBundle] pathForResource:@"kuria" ofType:@"mp3"];
    NSURL *url6 = [NSURL fileURLWithPath:path6];
    self.kuria = [[AVAudioPlayer alloc] initWithContentsOfURL:url6 error:NULL];
    
    //データを呼び出す
    df = [NSUserDefaults standardUserDefaults];
    
    if([[df objectForKey:@"myhp_new"] integerValue] >= [[df objectForKey:@"myhp"] integerValue]){
        
        NSLog(@"新記録だドン");
        tourokutextField.hidden = NO;
    } else {
        //HightScoreじゃない
        //worstScoreか確認する
        if([[df objectForKey:@"myhp_new"] integerValue] <= [[df objectForKey:@"myhp_worst"] integerValue]){
            //worstScoreなら
            tourokutextField.hidden =NO;
            //worstScoreをNsuserdefoltsで保存する
            int tmp = [[df objectForKey:@"myhp_new"] integerValue];
            [df setInteger:tmp forKey:@"myhp_worst"];
            [df synchronize];
            
        }
        else{
            //worstScoreじゃないなら何もしない
            tourokutextField.hidden=YES;
        }
    }
    //ボタンを押したとき
    NSLog(@"new = %@ : %@",[df objectForKey:@"myhp_new"], [df objectForKey:@"myhp"] );
    
    sukoalabel.text=[NSString stringWithFormat:@"%@",[df objectForKey:@"myhp"]];
    sukoanewlabel.text=[NSString stringWithFormat:@"%@",[df objectForKey:@"myhp_new"]];
    sukoanewworstLabel.text=[NSString stringWithFormat:@"%@",[df objectForKey:@"myhp_worst"]];
    
    // 枠線のスタイルを設定
    tourokutextField.borderStyle = UITextBorderStyleRoundedRect;
    
    // ラベルのテキストのフォントを設定
    tourokutextField.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    // プレースホルダ
    tourokutextField.placeholder = @"名前を入力してください";
    
    // キーボードの種類を設定
    tourokutextField.keyboardType = UIKeyboardTypeDefault;
    
    // リターンキーの種類を設定
    tourokutextField.returnKeyType = UIReturnKeyDefault;
    
    // 編集中にテキスト消去ボタンを表示
    tourokutextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // デリゲートを設定
    tourokutextField.delegate = self;
    [self.kuria play];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"tourokuName"];
    [defaults removeObjectForKey:@"touroku2Name"];

    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    [df setObject:tourokutextField.text forKey:@"tourokuName"];
    [df setObject:tourokutextField.text forKey:@"touroku2Name"];
    
    return YES;
}

// Do any additional setup after loading the view.


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
