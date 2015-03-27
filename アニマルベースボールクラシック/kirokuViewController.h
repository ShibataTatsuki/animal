//
//  kirokuViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2015/03/25.
//  Copyright (c) 2015年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kirokuViewController : UIViewController{

    IBOutlet UILabel*sukoalabel; //scoreLabel
    IBOutlet UILabel*sukoa_worstlabel; //scoreWorstLabel
    IBOutlet UILabel*saikoulabel; //topNameLabel
    IBOutlet UILabel*saiteilabel; //worstNameLabel
    
}

-(IBAction)resetTopScore;
-(IBAction)resetWorstScore;

@end
