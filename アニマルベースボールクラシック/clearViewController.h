//
//  clearViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2014/08/26.
//  Copyright (c) 2014年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface clearViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UILabel*sukoalabel;
    IBOutlet UILabel*sukoanewlabel;
    IBOutlet UILabel*sukoanewworstLabel;
    IBOutlet UILabel*saikoulabel; //topNameLabel
    IBOutlet UILabel*saiteilabel; //worstNameLabel
    
    IBOutlet UITextField *tourokutextField;
    
    NSUserDefaults *df;
}

@property AVAudioPlayer *kuria;
- (IBAction)modoru;



@end
