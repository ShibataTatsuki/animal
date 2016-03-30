//
//  ViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/22.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property(nonatomic,retain)AVAudioPlayer *n78;
@property AVAudioPlayer *startbutton;
@property AVAudioPlayer *timebutton;
-(IBAction)start;
-(IBAction)explanation;
-(IBAction)savedater;


@end
