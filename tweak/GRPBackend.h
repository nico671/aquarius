#import "groupednotifheaders.h"
#import "GRPNotifDataGroups.h"
#import "GRPView.h"
#include "RemoteLog.h"
@interface GRPBackend : NSObject
@property (nonatomic, retain) NSMutableArray *savedNotifGroups;
@property (nonatomic, retain) NCNotificationStructuredListViewController *notificationViewController;
@property GRPView *view;
@property BOOL isBeingCalledByAquarius;
@property NCNotificationDispatcher *dispatcher;
-(NSInteger )indexOfBundleID: (NSString *)bundleID ;
+(GRPBackend *) sharedInstance ;
-(void)removeReq:(NCNotificationRequest *) notifReq;
-(void)modifyReq:(NCNotificationRequest *) notifReq;
-(void)insertReq:(NCNotificationRequest *) notifReq;
-(void) insertNotificationRequestToViewController: (NCNotificationRequest *)req;
-(void) removeNotificationRequestFromViewController: (NCNotificationRequest *)req;
- (void) removeAllNotificationsWithBundleID:(NSString *)bundleID;
- (void) insertAllNotificationsWithBundleID:(NSString *)bundleID;
@end