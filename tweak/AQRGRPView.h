#import "AQRGRPCell.h"
#import "sharedheaders.h"
extern CGSize appViewSize(BOOL lockscreen){
	CGFloat width = 0;
	NSInteger iconSize = 1;
	
	switch (iconSize) {
		default:
		case 0:
			width = 40;
			break;
		case 1:
			width = 53;
			break;
		case 2:
			width = 63;
			break;
		case 3:
			width =  84;
			break;
	}
	CGFloat height = width * 1.45 ;
	return CGSizeMake(width, height);
}


@interface AQRGRPView : UIScrollView {
	BOOL lockscreen;
	UIView *selectedView;
	NSUserDefaults *defaults;
	NSMutableDictionary *appViews;
}

@property (nonatomic, copy) NSString* selectedAppID;
@property (nonatomic, copy) void (^updateNotificationView)();
@property (nonatomic, copy) NSMutableDictionary* (^getCurrentNotifications)();

- (id)init:(BOOL)onLockscreen;
- (void)selectAppID:(NSString*)appID newNotification:(BOOL)newNotif;
- (void)updateView;

@end