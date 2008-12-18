//
//  TCAssert.h
//  InteractiveAssert
//
//  Created by Joachim Bengtsson on 2008-12-18.
//  Copyright 2008 Third Cog Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


#define TCAssert(condition, errorDescription) \
  do { \
    if( ! (condition) ) { \
		[[TCAssertionHandler sharedHandler] handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]\
															   file:[NSString stringWithUTF8String:__FILE__] \
													     lineNumber:__LINE__ \
														description:(errorDescription)];\
	} \
  } while(0)


@interface TCAssertionHandler : NSObject {
	NSMutableArray *errorsToIgnore;
}
+(TCAssertionHandler*)sharedHandler;
- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)description;
@end