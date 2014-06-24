//
//  PossessionStore.m
//  Bplan
//
//  Created by 李涛 on 19/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"

static PossessionStore *defaultStore=nil;
@implementation PossessionStore
+(PossessionStore *)defaultStore{
    if (!defaultStore) {
        defaultStore=[[super allocWithZone:NULL]init];
    }
    return defaultStore;
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    return [self defaultStore];
}
-(id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    self=[super init];
    if (self) {
        allPossessions=[[NSMutableArray alloc]init];
    }
    return self;
}
-(id)retain
{
    return self;
}
-(oneway void)release
{
    
}
-(NSUInteger)retainCount
{
    return NSUIntegerMax;
}
-(NSArray *)allPossessions
{
    return allPossessions;
}
-(Possession *)createPossession
{
    Possession *p=[Possession createPossession1];
    [allPossessions addObject:p];
    return p;
}
-(void)removePossession:(Possession *)p
{
    [allPossessions removeObjectIdenticalTo:p];
}
-(void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    if (from==to) {
        return;
    }
    Possession *p=[allPossessions objectAtIndex:from];
    [p retain];
    
    [allPossessions removeObjectAtIndex:from];
                   [allPossessions insertObject:p atIndex:to];
                   [p release];
}
-(void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[PossessionStore defaultStore]movePossessionAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
}
@end
