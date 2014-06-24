//
//  ItemsViewController.m
//  Bplan
//
//  Created by 李涛 on 18/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import "ItemsViewController.h"
#import "Possession.h"
#import "PossessionStore.h"
@implementation ItemsViewController
-(id)init{
    self=[super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        UIBarButtonItem *bbi=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
        [[self navigationItem]setRightBarButtonItem:bbi];
        [bbi release];
        [[self navigationItem]setTitle:@"Bplan"];
        [[self navigationItem]setLeftBarButtonItem:[self editButtonItem]];
        }
    
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultStore]allPossessions]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"]autorelease];
    }
    
    Possession *p=[[[PossessionStore defaultStore]allPossessions]objectAtIndex:[indexPath row]];
    
    [[cell textLabel]setText:[p description]];
    return cell;
}

-(IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore]createPossession];
    [[self tableView]reloadData];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        PossessionStore *ps=[PossessionStore defaultStore];
        NSArray *possessions=[ps allPossessions];
        Possession *p=[possessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
}
-(void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *detailViewController=[[[ItemDetailViewController alloc]init]autorelease];
    NSArray *possessions=[[PossessionStore defaultStore]allPossessions];
    [detailViewController setPossession:[possessions objectAtIndex:[indexPath row]]];
    [[self navigationController]pushViewController:detailViewController animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self tableView]reloadData];
}
@end
