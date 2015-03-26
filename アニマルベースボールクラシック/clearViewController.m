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
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    
    // UITextFieldのインスタンスをビューに追加
    [self.view addSubview:tourokutextField];
    if([[df objectForKey:@"myhp_new"] integerValue] > [[df objectForKey:@"myhp"] integerValue]){
        NSLog(@"新記録だドン");
    }
    NSLog(@"new = %d : %d",[[df objectForKey:@"myhp_new"] integerValue], [[df objectForKey:@"myhp"] integerValue] );
    
    int myhp = [[df objectForKey:@"myhp"] integerValue];
    sukoalabel.text=[NSString stringWithFormat:@"%d",myhp];
    
   
    int myhp_new = [[df objectForKey:@"myhp_new"] integerValue];
    sukoanewlabel.text=[NSString stringWithFormat:@"%d",myhp_new];
    
    
    
    
    
    UITextField *tourokuTextField = [[UITextField alloc] init];
    // 枠線のスタイルを設定
    tourokutextField.borderStyle = UITextBorderStyleRoundedRect;
    
    // テキストを左寄せにする
    tourokutextField.textAlignment = UITextAlignmentLeft;
    
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
}


/**
 * キーボードでReturnキーが押されたとき
 * @param textField イベントが発生したテキストフィールド
 */
- (BOOL)textFieldShouldReturn:(UITextField *)tourokutextField
{
    // キーボードを隠す
    [self.view endEditing:YES];
    
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
