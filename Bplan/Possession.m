//
//  Possession.m
//  Bplan
//
//  Created by 李涛 on 18/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize objectName;
@synthesize objectNumber;
@synthesize content;
@synthesize percentage;
+(id)createPossession1
{
    Possession *newPossession=[[self alloc]initWithobjectName:@"planName" objectNumber:@"null" Content:@"null" percentage:@"1%"];
    return newPossession;
}
-(NSString *)description
{
    NSString *descriptionString=[[NSString alloc]initWithFormat:@"%@ ,percent %@ ",objectName,
                                  
                                 
                                  percentage];
    return [descriptionString autorelease];
}
-(id)initWithobjectName:(NSString *)name objectNumber:(NSString *)number Content:(NSString *)content1 percentage:(NSString*)percent{
    [super init];
    if (self) {
    [self setObjectName:name];
    [self setObjectNumber:number];
    [self setContent:content1];
    [self setPercentage:percent];
    }
    return self;
}
-(id)init{
    return [self initWithobjectName:@"null" objectNumber:@"null" Content:@"null" percentage:0];
}
-(void)dealloc
{
    [objectName release];
    [objectNumber release];
    [content release];
    
    [super dealloc];
}
@end
