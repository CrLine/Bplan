//
//  ItemDetailViewController.h
//  Bplan
//
//  Created by 李涛 on 19/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Possession;
@interface ItemDetailViewController : UIViewController
{
    
    IBOutlet UITextField *objectName;
    
    IBOutlet UITextField *objectNumber;
 
    Possession *possession;
    
    IBOutlet UITextField *Percentage;
    IBOutlet UITextField *Content;
}
@property (nonatomic,retain) Possession *possession;
@end
