//
//  AppCtrl.m
//  InteractiveAssert
//
//  Created by Joachim Bengtsson on 2008-12-18.
//  Copyright 2008 Third Cog Software. All rights reserved.
//

#import "AppCtrl.h"
#import "TCAssert.h"

@implementation AppCtrl
-(IBAction)doSomething:(id)sender;
{
	TCAssert(false, @"Something went wrong.");
}
-(IBAction)doSomethingElse:(id)sender;
{
	TCAssert(false, @"Something went wrong.");
}

@end
