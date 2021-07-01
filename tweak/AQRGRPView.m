
#import "AQRGRPView.h"
#import "AQRManager.h"
#import "functions.h"
@implementation AQRGRPView

@synthesize selectedAppID;

- (id)init:(BOOL)onLockscreen {
	if (self = [super init]) {
		self.directionalLockEnabled = YES;
		lockscreen = onLockscreen;
 
		//Create the selected view
		selectedView = [MTMaterialView new];
		selectedView.layer.masksToBounds = YES;
		[self addSubview:selectedView];
		self.contentInset = UIEdgeInsetsMake(0,0,0,10);
		self.scrollEnabled = YES;
		//Initialize other instance variables
		appViews = [NSMutableDictionary new];
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)updateView {
	NSMutableDictionary *notificationDict = [AQRManager sharedInstance].notificationRequests;
	self.hidden = NO;
	//Create or update app views from the current notification list
	[appViews removeAllObjects];
	CGSize appViewSizeVar = appViewSize(lockscreen);
	CGFloat totalWidth = [[appViews allKeys] count] * appViewSizeVar.width;
	self.contentSize = CGSizeMake(totalWidth, appViewSizeVar.height);
	[[AQRManager sharedInstance]getRidOfWaste];
	CGFloat	startX = 0;
	CGFloat startY = 0;
	CGRect screenRect = [[UIScreen mainScreen] bounds];
CGFloat screenWidth = screenRect.size.width;
	for (NSString *appID in [notificationDict allKeys]) {
		AQRGRPCell *appView = [[AQRGRPCell alloc] initWithFrame:CGRectMake(0, 0, appViewSize(lockscreen).width, appViewSize(lockscreen).height) icon:[UIImage _applicationIconImageForBundleIdentifier:appID format:0] identifier:appID numberStyle:[defaults integerForKey:@"numberStyle"]];
		appView.frame = CGRectMake(startX, startY, appViewSizeVar.width, appViewSizeVar.height);
		startX += appViewSizeVar.width;
		if (startX > screenWidth-50){
			startY += 50;
			startX = 0;
		}
		[appView setNumNotifications:[[AQRManager sharedInstance].notificationRequests[appID]count]];
		[appView addTarget:self action:@selector(appViewTapped:) forControlEvents:UIControlEventTouchUpInside];
		[appViews setObject:appView forKey:appID];
		[self addSubview:appView];
	}
	
	
		[[AQRManager sharedInstance] getRidOfWaste];
}




- (void)appViewTapped:(AQRGRPCell*)appView {
	UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
	[[AQRManager sharedInstance] showNotificationRequestsForBundleIdentifier:appView.identifier];
	[gen prepare];
	[gen impactOccurred];
	[[AQRManager sharedInstance].clvc revealNotificationHistory:YES];
	[[AQRManager sharedInstance] showNotificationRequestsForBundleIdentifier:appView.identifier];
	[self selectAppID:appView.identifier newNotification:NO];
}

- (void)selectAppID:(NSString*)appID newNotification:(BOOL)newNotif {
	NSTimeInterval animationDuration = 0.15;
	[[AQRManager sharedInstance] showNotificationRequestsForBundleIdentifier:appID];
	//Move the selected view before animating if it's reselecting
	if (!selectedAppID && appID)
		selectedView.frame = ((AQRGRPCell*)[appViews objectForKey:appID]).frame;

	NSString *oldSelectedAppID = selectedAppID;

	if ([selectedAppID isEqualToString:appID] && !newNotif)
		selectedAppID = nil;
	else
		selectedAppID = appID;

	[UIView animateWithDuration:animationDuration animations:^(){
		if ([oldSelectedAppID isEqualToString:appID] && !newNotif) {
			[(AQRGRPCell*)[appViews objectForKey:oldSelectedAppID] animateBadge:NO duration:animationDuration];
			selectedView.alpha = 1;
		}
		else {
			[(AQRGRPCell*)[appViews objectForKey:oldSelectedAppID] animateBadge:NO duration:animationDuration];
			selectedView.alpha = 1;
			AQRGRPCell *appView = (AQRGRPCell*)[appViews objectForKey:selectedAppID];
			selectedView.frame = appView.frame;
			[appView animateBadge:YES duration:animationDuration];
		}
	}];
}

@end