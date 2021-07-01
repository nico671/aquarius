#import "sharedheaders.h"
#import "AQRGRPView.h"
@interface AQRManager : NSObject
+(instancetype)sharedInstance;
-(void)modifyNotificationRequest:(NCNotificationRequest *)req;
-(void)showNotificationRequestsForBundleIdentifier:(NSString *)bundleIdentifier ;
-(void)showNotificationRequest:(id)req;
-(void)hideNotificationRequest:(id)req;
-(void)revealNotificationHistory:(BOOL)revealed;
-(void)showNotificationRequests:(id)reqs;
-(void)hideNotificationRequests:(id)reqs;
@property AQRGRPView *view;
@property (nonatomic, weak) NCNotificationDispatcher *dispatcher;
@property (nonatomic, weak) id<clvc> clvc;
@property (nonatomic, retain) NSMutableDictionary *notificationRequests;
-(void)removeNotificationRequest:(NCNotificationRequest *)req;
-(void)insertNotificationRequest:(NCNotificationRequest *)req;
-(void)getRidOfWaste;
-(void)updateQuick: (NSString*) bundleID;
@end
