//
//  PossessionStore.h
//  Bplan
//
//  Created by 李涛 on 19/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Possession;
@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}
+(PossessionStore *)defaultStore;
-(void)removePossession:(Possession *)p;
-(NSArray *)allPossessions;
-(void)movePossessionAtIndex:(int)from
                     toIndex:(int)to;
-(Possession *)createPossession;
@end
