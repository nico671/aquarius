#import "groupednotifheaders.h"

#include "RemoteLog.h"
@interface GRPNotifDataGroups : NSObject
@property NSMutableArray *notificationsForGroup;
@property NSString *bundleID;
-(void)removeNotificationRequestAgain: (NCNotificationRequest *) request;
-(void)insertNotificationRequestAgain: (NCNotificationRequest *) request;
-(void)updateNotificationRequest: (NCNotificationRequest *) request;
@end