//
//  playViewController.m
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/23.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import "playViewController.h"
#import "clearViewController.h"
#import "dieViewController.h"
@interface playViewController ()

@end

@implementation playViewController{
    NSTimer *tm;
    
}

@synthesize player;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"batto_sound" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.batto_sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"dageki_sound" ofType:@"mp3"];
    NSURL *url1 = [NSURL fileURLWithPath:path1];
    self.dageki_sound= [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"bat_sound" ofType:@"mp3"];
    NSURL *url2 = [NSURL fileURLWithPath:path2];
    self.bat_sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:NULL];
    
    NSString *path7 = [[NSBundle mainBundle] pathForResource:@"fail" ofType:@"mp3"];
    NSURL *url7 = [NSURL fileURLWithPath:path7];
    self.fail = [[AVAudioPlayer alloc] initWithContentsOfURL:url7 error:NULL];
    
    NSURL *url4 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"boss_sound"ofType:@"mp3"]];
    NSError *error = nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url4 error:&error];
    [player play];
    
    tm =
    [NSTimer
     scheduledTimerWithTimeInterval:0.1f
     target:self
     selector:@selector(hogeMethod)
     userInfo:nil
     repeats:YES
     ];
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"hozon"];
    memcpy(&hozonArray, data.bytes, data.length);
    if (hozonArray[2]==0) {
        NSLog(@"nil");
       
        myhp=18000;
        hp2=12000;
        hp=12000;
        
        
        
        
    }else{
        NSLog(@"入ってる！！");
        //データを反映させる
        hp = hozonArray[0];
        hp2 = hozonArray[1];
        myhp = hozonArray[2];
    }
    
    hpLabel.text=[NSString stringWithFormat:@"%d",myhp];
    myhpBar.progress=myhp/18000.0;
    
    hp2Label.text=[NSString stringWithFormat:@"%d",hp2];
    progress2.progress=hp2/12000.0;
    
    hpLabel.text=[NSString stringWithFormat:@"%d",hp];
    progress1.progress=hp/12000.0;
    
    [defaults removeObjectForKey:@"hozon"];
    [defaults synchronize];

    ballMoveY = 2;
    swing = NO;
    BaseballView.hidden=NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hogeMethod{
    //敵1とボール
    if (CGRectIntersectsRect(teki1.frame, BaseballView.frame ) && teki1.hidden!=YES){
        //お互いが重なったときの処理をifの中に書きます。
        //&&でかつという意味
        //!=は==の逆
        //この場合は敵が消えてなかったら消す
        BaseballView.hidden = YES;
        
        NSLog(@"敵1hit!");
        NSLog(@"progress1");
        
        [progress1 setProgress:progress1.progress-0.25 animated:true];
        hp=hp-3000;
        hpLabel.text=[NSString stringWithFormat:@"%d",hp];
        [self.dageki_sound play];
        hanteilabel.text=@"ヒット";
        hanteilabel.hidden=NO;
    }
    //敵2とボール
    if (CGRectIntersectsRect(teki2.frame, BaseballView.frame )&& teki2.hidden!=YES){
        //お互いが重なったときの処理をifの中に書きます。
        
        BaseballView.hidden = YES;
        
        NSLog(@"敵2hit!");
        NSLog(@"progress2");
        
        [progress2 setProgress:progress2.progress-0.25 animated:true];
        hp2=hp2-3000;
        hp2Label.text = [NSString stringWithFormat:@"%d", hp2];
        [self.dageki_sound play];
        hanteilabel.text=@"ヒット";
        hanteilabel.hidden=NO;
    }
    //敵と透明ビュー
    if (CGRectIntersectsRect(ToumeiView.frame, BaseballView.frame )){
        //お互いが重なったときの処理をifの中に書きます。
        hitTiming = YES;
        NSLog(@"hitting!!!");
    }else{
        hitTiming = NO;
    }
    if(hp==0){
        //hanteilabel.hidden=YES;
        teki1.hidden=YES;
        hpLabel.hidden=YES;
        progress1.hidden=YES;
    }
    else{
        label.hidden=YES;
    }
    if(hp2==0){
        // hanteilabel.hidden=YES;
        teki2.hidden=YES;
        hp2Label.hidden=YES;
        progress2.hidden=YES;
    }
    else{
        label.hidden=YES;
    }
    //[myhpBar setProgress:(float)myhp/ 1000.0];
    myhpLabel.text = [NSString stringWithFormat:@"%d",myhp];
    if(myhp<=0){
        myhp=0;
        label.text=@"You died";
        myhpLabel.text = [NSString stringWithFormat:@"%d",myhp];
        label.hidden=NO;
        NSLog(@"call die");
        [ballTm invalidate];
        [tm invalidate];
        //        [self performSelector:@selector(dieViewController)withObject:nil afterDelay:3.0f];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"gameover" sender:nil];
            [player stop];
            [self.fail play];
        });
    }

    myhpBar.progress=(float)myhp/ 18000;
    //[myhpBar setProgress:(float)myhp/ 1000.0];
    myhpLabel.text = [NSString stringWithFormat:@"%d",myhp];
    if(hp<=0 && hp2<=0){
        label.text=@"You won";
        label.hidden=NO;
        utu.hidden=YES;
        Nageru.hidden=YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"clear" sender:nil];
        });
        //データを呼び出す
        NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
        int myhp_best = [[df objectForKey:@"myhp"] integerValue];
        int myhp_worst = [[df objectForKey:@"myhp_worst"] integerValue];
        int myhp_new_worst = [[df objectForKey:@"myhp_worst"]integerValue];
        
        //自分のHPを保存する 最高記録だったら保存する
        if (myhp_best < myhp) {
            [df setInteger:myhp forKey:@"myhp"];
        }
            [df setInteger:myhp forKey:@"myhp_new"];
        if (myhp_worst >= myhp) {
            [df setInteger:myhp forKey:@"myhp_worst"];
        }
        else if (myhp_worst==0){
            [df setInteger:myhp forKey:@"myhp_worst"];
        }
        NSLog(@"call clear");
        [player stop];
        [tm invalidate];
        
        
        
    }
}





-(void)ballMove{
    BaseballView.center = CGPointMake(BaseballView.center.x +ballMoveX  ,BaseballView.center.y + ballMoveY);
    if(BaseballView.center.y >= 430 || BaseballView.center.y <= 0){
        BaseballView.hidden = YES;
    }
    if(BaseballView.hidden == YES){
        BaseballView.center = CGPointMake(160,171);
        [ballTm invalidate];
        nageru.hidden=NO;
        ballMoveY = 2;
        ballMoveX = 0;
        swing = NO;
        CGFloat angle = 0;
        BattoView.transform = CGAffineTransformMakeRotation(angle);
        [self damage];
    }
}




/* 0827 13:50 阿部　消す
 // アニメーション
 [UIView animateWithDuration:2.5f //アニメーション速度2.5秒
 delay:0.5f
 options:UIViewAnimationOptionCurveEaseIn
 animations:^{
 BaseballView.transform = CGAffineTransformMakeTranslation(0,300);
 
 
 }completion:^(BOOL finished){
 //アニメーション終了時
 NSLog(@"アニメーション終了");
 }];
 */
-(IBAction)nageru{
    hanteilabel.hidden=YES;
    [self.batto_sound play];
    
    ballTm=
    [NSTimer
     scheduledTimerWithTimeInterval:0.02f
     target:self
     selector:@selector(ballMove)
     userInfo:nil
     repeats:YES
     ];
    
    BaseballView.hidden=NO;
    nageru.hidden=YES;
    pushbtn.hidden=NO;
    BaseballView.center = CGPointMake(160,171);
    [ballTm fire];
}



-(IBAction)push2{
    pushbtn.hidden=YES;
    [self.bat_sound play];
    if(swing == NO){
        // アニメーション
        [UIView animateWithDuration:0.1f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             CGFloat angle = 210.0 * M_PI / 180.0;
                             BattoView.transform = CGAffineTransformMakeRotation(angle);
                             
                         }completion:^(BOOL finished){
                             //アニメーション終了時
                             NSLog(@"battoアニメーション終了");
                         }];
        
        if(hitTiming == YES){
            gapY = ToumeiView.center.y - BaseballView.center.y;
            ballMoveY = -ballMoveY*5;
            ballMoveX = -gapY / 30 *5;
        }
        //振るか振らないか
        swing = YES;
    }
}
-(IBAction)menu{
    hozonArray[0]=hp;
    hozonArray[1]=hp2;
    hozonArray[2]=myhp;
    for (int i = 0; i<3; i++) {
        NSLog(@"hozonarrayの中身は%d",hozonArray[i]);
    }
    //hozonarrayをnsuserdefalutsで保存
    NSUserDefaults  *defaults = [NSUserDefaults standardUserDefaults];
    //http://stackoverflow.com/questions/350848/possible-to-save-an-integer-array-using-nsuserdefaults-on-iphone
    NSData *data = [NSData dataWithBytes:&hozonArray length:sizeof(hozonArray)];
    [defaults setObject:data forKey:@"hozon"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
    [player stop];
}

-(void)damage{
    random_number=arc4random() % 25* 100;
    myhp=myhp-random_number;
    [myhpBar setProgress:myhpBar.progress-random_number/18000 animated:true];
    myhpLabel.text = [NSString stringWithFormat:@"%d", myhp];
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











