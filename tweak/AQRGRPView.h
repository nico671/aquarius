#import "AQRGRPCell.h"
#import "sharedheaders.h"

@interface AQRGRPView : UIScrollView {
	BOOL lockscreen;
	UIView *selectedView;
	NSUserDefaults *defaults;
	NSMutableDictionary *appViews;
}

@property (nonatomic, copy) NSString* selectedAppID;
@property NSMutableArray *availableNotificationArray;
@property (nonatomic, copy) void (^updateNotificationView)();
@property (nonatomic, copy) NSMutableDictionary* (^getCurrentNotifications)();
-(void)removeAppCell: (NSString *) bundleID;
- (id)init:(BOOL)onLockscreen;
- (void)selectAppID:(NSString*)appID newNotification:(BOOL)newNotif;
- (void)updateView;

@end