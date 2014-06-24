//
//  Possession.h
//  Bplan
//
//  Created by 李涛 on 18/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
{
    NSString *objectName;
    NSString *objectNumber;
    NSString *content;
    NSString *percentage;
}
+(id)createPossession1;
-(id)initWithobjectName:(NSString *)name
           objectNumber:(NSString *)number
                Content:(NSString *)content1
             percentage:(NSString*) percent;
@property(nonatomic,retain) NSString *objectName;
@property(nonatomic,retain) NSString *objectNumber;
@property(nonatomic,retain) NSString *content;
@property (nonatomic,retain)NSString * percentage;
@end
