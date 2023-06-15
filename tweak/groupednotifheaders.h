#import <Foundation/Foundation.h>
#import "sharedheaders.h"
@interface NCNotificationDispatcher : NSObject
-(void)postNotificationWithRequest:(id)arg1 ;
-(void)modifyNotificationWithRequest:(id)arg1 ;
-(void)destination:(id)arg1 requestsClearingNotificationRequests:(id)arg2 ;
-(void)withdrawNotificationWithRequest:(id)arg1 ;
@end

@interface NCNotificationRequest : NSObject
@property (nonatomic,readonly) BBBulletin * bulletin; 
@property (nonatomic,copy,readonly) NSString* notificationIdentifier;
@end