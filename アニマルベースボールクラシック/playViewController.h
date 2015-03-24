//
//  playViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/23.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface playViewController : UIViewController
{   
    IBOutlet UIImageView*BaseballView;
    IBOutlet UIImageView*BattoView;
    IBOutlet UIImageView*ToumeiView;
    int myhp;
    IBOutlet UILabel *myhpLabel;
    IBOutlet UIProgressView *myhpBar;
    int random_number;
    IBOutlet UIButton*nageru;
    int power;
    IBOutlet UILabel *powerLabel;
    IBOutlet UIProgressView *progress1;
    IBOutlet UIProgressView *progress2;
    int hp;
    IBOutlet UILabel *hpLabel;
    int hp2;
    IBOutlet UILabel* hp2Label;
    IBOutlet UIImageView*teki1;
    IBOutlet UIImageView*teki2;
    IBOutlet UILabel*label;
    IBOutlet UILabel *menu;
    
    IBOutlet UIButton *pushbtn;
    
    float ballMoveX;
    float ballMoveY;
    BOOL hitTiming;
    BOOL swing;
    float gapY;
    NSTimer *ballTm;
    IBOutlet UILabel *hanteilabel;
}

@property(nonatomic,retain)AVAudioPlayer *player;
@property AVAudioPlayer *batto_sound;
@property AVAudioPlayer *dageki_sound;
@property AVAudioPlayer *bat_sound;
@property AVAudioPlayer *kuria;

-(IBAction)nageru;
-(IBAction)push2;
        




@end
