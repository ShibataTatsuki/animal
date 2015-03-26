//
//  kirokuViewController.h
//  アニマルベースボールクラシック
//
//  Created by 柴田　樹希 on 2015/03/25.
//  Copyright (c) 2015年 柴田　樹希. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kirokuViewController : UIViewController{
    int number;
    int number2;
    IBOutlet UITableView*table;
    IBOutlet UILabel*sukoalabel;
    IBOutlet UILabel*sukoa_worstlabel;
    
}
-(IBAction)resseto;
-(IBAction)resseto2;
@end
