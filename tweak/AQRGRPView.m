
#import "AQRGRPView.h"
#import "AQRManager.h"
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

		//Initialize other instance variables
		appViews = [NSMutableDictionary new];
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)updateView {
	NSLog(@"[aquarius] - this was called");
	NSMutableDictionary *notificationDict = [AQRManager sharedInstance].notificationRequests;
	NSLog(@"[aquarius] - %@",notificationDict);
	self.hidden = NO;
	//Create or update app views from the current notification list
	[appViews removeAllObjects];

	for (NSString *appID in [notificationDict allKeys]) {
		AQRGRPCell *appView = [[AQRGRPCell alloc] initWithFrame:CGRectMake(0, 0, appViewSize(lockscreen).width, appViewSize(lockscreen).height) icon:[UIImage _applicationIconImageForBundleIdentifier:appID format:0] identifier:appID numberStyle:[defaults integerForKey:@"numberStyle"]];
		[appView addTarget:self action:@selector(appViewTapped:) forControlEvents:UIControlEventTouchUpInside];
		[appViews setObject:appView forKey:appID];
		[self addSubview:appView];
	}

	//Layout all app views
	CGSize appViewSizeVar = appViewSize(lockscreen);
	CGFloat totalWidth = [[appViews allKeys] count] * appViewSizeVar.width;
	self.contentSize = CGSizeMake(totalWidth, appViewSizeVar.height);
	CGFloat startX = (CGRectGetWidth(self.frame) - totalWidth)/2;
	if (startX < 0)
		startX = 0;

	for (AQRGRPCell *appView in [appViews allValues]) {
		appView.frame = CGRectMake(startX, 0, appViewSizeVar.width, appViewSizeVar.height);
		startX += appViewSizeVar.width;
	}
}



- (void)appViewTapped:(AQRGRPCell*)appView {
		UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
	[gen prepare];
	[gen impactOccurred];
	[self selectAppID:appView.identifier newNotification:NO];
}

- (void)selectAppID:(NSString*)appID newNotification:(BOOL)newNotif {
	NSTimeInterval animationDuration = 0.15;

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