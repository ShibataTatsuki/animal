//
//  menuViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2015/03/25.
//  Copyright (c) 2015年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface menuViewController : UIViewController{
    IBOutlet UIButton *questback;
}
-(IBAction)questback;
-(IBAction)back;
-(IBAction)rule;



@property AVAudioPlayer *timebutton;
@property(nonatomic,retain)AVAudioPlayer *player;
@property(nonatomic,retain)AVAudioPlayer *boss_sound;

@end
