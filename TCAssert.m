//
//  TCAssert.m
//  InteractiveAssert
//
//  Created by Joachim Bengtsson on 2008-12-18.
//  Copyright 2008 Third Cog Software. All rights reserved.
//

#import "TCAssert.h"

static TCAssertionHandler *sharedHandler;

@implementation TCAssertionHandler
+(TCAssertionHandler*)sharedHandler;
{
	if(!sharedHandler)
		sharedHandler = [[TCAssertionHandler alloc] init];
	return sharedHandler;
}
-(id)init;
{
	if(![super init]) return nil;
	
	errorsToIgnore = [[NSMutableArray alloc] init];
	
	return self;
}
- (void)handleFailureInFunction:(NSString *)functionName
						   file:(NSString *)fileName
					 lineNumber:(NSInteger)lineNumber
					description:(NSString *)description;
{
	NSString *assertionID = [NSString stringWithFormat:@"%@ %@ %d", functionName, fileName, lineNumber];
	
	if([errorsToIgnore containsObject:assertionID])
		return;
	
	
	NSString *message = [NSString stringWithFormat:@"In: %@\nFile: %@ line %d\n\n%@", functionName, fileName, lineNumber, description];
	NSLog(@"Assertion failure!\n%@", message);
	
	NSInteger ret = NSRunCriticalAlertPanel(@"An application bug has been triggered", message, @"Quit", @"Ignore once", @"Ignore until quit");
	if(ret == NSAlertDefaultReturn) {
		abort();
	} else if(ret == NSAlertOtherReturn) {
		[errorsToIgnore addObject:assertionID];
		return;
	} else {
		return;
	}
}
@end
