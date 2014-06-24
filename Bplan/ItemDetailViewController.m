//
//  ItemDetailViewController.m
//  Bplan
//
//  Created by 李涛 on 19/11/13.
//  Copyright (c) 2013年 李涛. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possession.h"
@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize possession;
-(void)viewDidLoad
{
    [super viewDidLoad];
    [[self view]setBackgroundColor:[UIColor groupTableViewBackgroundColor]];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [objectName setText:[possession objectName]];
    [objectNumber setText:[possession objectNumber]];
    [Content setText:[possession content]];
    [Percentage setText:[possession percentage]];
    
    [[self navigationItem]setTitle:@"possession"];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[self view]endEditing:YES];
    
    [possession setObjectName:[objectName text]];
    [possession setObjectNumber:[objectNumber text]];
    [possession setContent:[Content text]];
    [possession setPercentage:[Percentage text]];
}

- (void)dealloc {
    [objectName release];
    [objectNumber release];
    [Content release];
    [Percentage release];
    [possession release];
    [super dealloc];
}
- (void)viewDidUnload {
    
    [objectName release];
    objectName = nil;
    [objectNumber release];
    objectNumber = nil;
    [Content release];
    Content = nil;
    [Percentage release];
    Percentage = nil;
    [super viewDidUnload];
}
@end
