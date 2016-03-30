//
//  playViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/23.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface playViewController : UIViewController{

    int hp;
    int hp2;
    int myhp;
    int hozonArray[3];
    int random_number;

    IBOutlet UILabel *hpLabel;
    IBOutlet UILabel* hp2Label;
    IBOutlet UILabel *hanteilabel;
    IBOutlet UILabel *myhpLabel;
    IBOutlet UILabel *label;

    IBOutlet UIImageView*teki1;
    IBOutlet UIImageView*teki2;
    IBOutlet UIImageView*BaseballView;
    IBOutlet UIImageView*BattoView;
    IBOutlet UIImageView*ToumeiView;

    
    IBOutlet UIProgressView *myhpBar;
    IBOutlet UIProgressView *progress1;
    IBOutlet UIProgressView *progress2;
    IBOutlet UILabel *menu;
    
//    IBOutlet UIButton*nageru;
    IBOutlet UIButton *pushbtn;
    IBOutlet UIButton *Nageru;
    IBOutlet UIButton *utu;
    
    float ballMoveX;
    float ballMoveY;
    float gapY;
    
    BOOL swing;
    BOOL hitTiming;

    NSTimer *ballTm;
}

@property(nonatomic,retain)AVAudioPlayer *player;
@property(nonatomic,retain)AVAudioPlayer *boss_sound;
@property AVAudioPlayer *batto_sound;
@property AVAudioPlayer *dageki_sound;
@property AVAudioPlayer *bat_sound;
@property AVAudioPlayer *kuria;
@property AVAudioPlayer *fail;
@property AVAudioPlayer *timebutton;
-(IBAction)nageru;
-(IBAction)push2;


@end
