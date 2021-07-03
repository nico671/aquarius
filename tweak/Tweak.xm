#import "headers.h"
%group musicplayer
%hook MRUNowPlayingHeaderView // hides the little routing button
- (void)setShowRoutingButton:(BOOL)arg1 {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		%orig;
	}
	else if ( controller.context == 2 && isRoutingButtonHidden) {
		arg1 = NO;
	}
	%orig(arg1);
}
%end
%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 { // reload data after a respring
    %orig;
    [[%c(SBMediaController) sharedInstance] setNowPlayingInfo:0];
}
%end

%hook MRUNowPlayingControlsView
-(void)setNeedsLayout{
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor]; //s/o lightmann for this it allows me to only change the lockscreen player and not the cc player
	if (isArtworkBackground) [self.headerView.artworkView setHidden:YES];
	if (controller.context == 2 && configurations == 0) {
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMidY(self.headerView.frame)-15, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		//resizing controls, almost same for everytime i do this
		[self.headerView.artworkView setHidden:YES];
		if (!songImageForSmall) {
			mostlySetUpTheAlbumArtwork();
			[self addSubview:songImageForSmall];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 100, 100)];
			if (!topLabel) {
			mostlySetUpTopLabel();
			[self addSubview:topLabel];
			[topLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[topLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
		}
		if (!bottomLabel) {
			mostlySetUpBottomLabel();
			[self addSubview:bottomLabel];
			[bottomLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[bottomLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
		if (!shuffleButton){
			setUpShuffleButton();
			[self insertSubview:shuffleButton atIndex:0];
			[shuffleButton.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
			[shuffleButton.bottomAnchor constraintEqualToAnchor:self.topAnchor constant:3].active = YES;
	}//couldnt adjust the size of the player so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
	} else if (configurations == 1 && controller.context == 2) {
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 40, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		[self.timeControlsView setFrame: CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 53, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
		if (!songImageForSmall) {
			mostlySetUpTheAlbumArtwork();
			[self addSubview:songImageForSmall];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 90, 90)];
		}
			if (!topLabel) {
			mostlySetUpTopLabel();
			[self addSubview:topLabel];
			[topLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[topLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
		}
		if (!bottomLabel) {
			mostlySetUpBottomLabel();
			[self addSubview:bottomLabel];
			[bottomLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[bottomLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
			if (!shuffleButton){
			setUpShuffleButton();
			[self insertSubview:shuffleButton atIndex:0];
			[shuffleButton.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
			[shuffleButton.bottomAnchor constraintEqualToAnchor:self.topAnchor constant:3].active = YES;
	}
	} else if (configurations == 2 && controller.context == 2) {
		[self.volumeControlsView setFrame:CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 55, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
		[self.timeControlsView setHidden:YES];
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 40, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		if (!songImageForSmall) {
			mostlySetUpTheAlbumArtwork();
			[self addSubview:songImageForSmall];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 85, 85)];
			//couldnt adjust the size of the artwork so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
		if (!topLabel) {
			mostlySetUpTopLabel();
			[self addSubview:topLabel];
			[topLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
			[topLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
		}
		if (!bottomLabel) {
			mostlySetUpBottomLabel();
			[self addSubview:bottomLabel];
			[bottomLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[bottomLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
			if (!shuffleButton){
			setUpShuffleButton();
			[self insertSubview:shuffleButton atIndex:0];
			[shuffleButton.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
			[shuffleButton.bottomAnchor constraintEqualToAnchor:self.topAnchor constant:3].active = YES;
	}
	} else if (configurations == 3  && controller.context == 2) {
		//small option
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 30, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		if (!songImageForSmall) {
			mostlySetUpTheAlbumArtwork();
			[self addSubview:songImageForSmall];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 85, 85)];
			//couldnt adjust the size of the player so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
		if (!topLabel) {
			mostlySetUpTopLabel();
			[self addSubview:topLabel];
			[topLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[topLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
		}
		if (!bottomLabel) {
			mostlySetUpBottomLabel();
			[self addSubview:bottomLabel];
			[bottomLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[bottomLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
		if (!shuffleButton){
			setUpShuffleButton();
			[self insertSubview:shuffleButton atIndex:0];
			[shuffleButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
			[shuffleButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
			[shuffleButton.widthAnchor constraintEqualToConstant:21].active = YES;
			[shuffleButton.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[shuffleButton addTarget:self action:@selector(shuffle:) forControlEvents:UIControlEventTouchDown];
	}
	}
}
%new
-(void) shuffle:(UIButton*)sender {
	[[%c(SBMediaController) sharedInstance] toggleShuffleForEventSource:0];
	NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
	[userInfo setObject:[NSBundle mainBundle].bundleIdentifier forKey:@"id"];
	[userInfo setObject:@"SpringBoard" forKey:@"type"];
	[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"net.example.tweak/sendToApp" object:nil userInfo:userInfo];
}
%end

%hook MRUNowPlayingLabelView  // hide the original label
- (void)setFrame:(CGRect)arg1{
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (![controller respondsToSelector:@selector(context)] ){
		%orig;
	}
	else if ( controller.context == 2){
		[self setHidden:YES];
	}
	else %orig;
}
%end

%hook MRUNowPlayingTransportControlsView // coloring for the buttons

- (void)setNeedsLayout {

	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (musicPlayerColorsEnabled && controller.context == 2) {
		UIColor *leftColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"customLeftButtonColor"];
		[self.leftButton setStylingProvider:nil];
		self.leftButton.imageView.layer.filters = nil;
		[self.leftButton.imageView setTintColor:leftColor];

		UIColor *middleColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"customMiddleButtonColor"];
		[self.middleButton setStylingProvider:nil];
		self.middleButton.imageView.layer.filters = nil;
		[self.middleButton.imageView setTintColor:middleColor];

		UIColor *rightColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"customRightButtonColor"];
		[self.rightButton setStylingProvider:nil];
		self.rightButton.imageView.layer.filters = nil;
		[self.rightButton.imageView setTintColor:rightColor];
	}
}

%end
// %hook SPTMobileMediaKitAudioPlaybackManager
// - (id)initWithPlaybackController:(id)arg1 connectManager:(id)arg2 collectionController:(id)arg3 logger:(id)arg4 keepAliveHandler:(id)arg5 actionLogger:(id)arg6{
// 	%orig;
// 	[[NSDistributedNotificationCenter defaultCenter] addObserverForName:@"com.nico671.aquarius/sendToSpotify" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
//     NSLog(@"[aquarius] Received NSDistributedNotificationCenter message %@ (%@)", [notification.userInfo objectForKey:@"id"], [notification.userInfo objectForKey:@"type"]);
// 	[self enableShuffleWithMessage:nil];
// 	}];
// 	return %orig;
// }


// - (void)enableShuffleWithMessage:(id)arg1{
// 	%orig;
// 	NSLog(@"[aquarius] - %@",arg1);
// }
// %end


%hook CSAdjunctItemView // sets the height and opacity of the player

-(void)_updateSizeToMimic{
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTheFuckUp) name:@"com.nico671.updateColors" object:nil];
	[self setTheFuckUp];
	PLPlatterView *platterView = (PLPlatterView*)MSHookIvar<UIView*>(self, "_platterView");
	[platterView.backgroundView setAlpha: musicPlayerAlpha];
	self.layer.cornerRadius = musicPlayerCornerRadius;
if (musicPlayerLeafLook){
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
}
if(configurations == 0){
	if (isBackgroundColored && !isArtworkBackground){
 [platterView.backgroundView setAlpha: 0];
    self.backgroundColor = fuckingArtworkColor;
}
[self.heightAnchor constraintEqualToConstant:115].active = true; //height
if (isArtworkBackground && !isBackgroundColored){
setUpTheArtworkBackground();
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[platterView.backgroundView setAlpha: 0];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

if (!isArtworkBackground && !isBackgroundColored && customImageBackgroundBOOL){
setUpCustomBackground() ;
[self addSubview:customImageBackground];
UIImage *img = [GcImagePickerUtils imageFromDefaults:@"aquariusprefs" withKey:@"customBackgroundImage"];
[customImageBackground setImage:img forState:UIControlStateNormal];
[self sendSubviewToBack: customImageBackground];
[platterView.backgroundView setAlpha: 0];
[customImageBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}
}
else if(configurations == 1 || configurations == 2){
[platterView.heightAnchor constraintEqualToConstant:130].active = true;
if (!isArtworkBackground && !isBackgroundColored && customImageBackgroundBOOL){
setUpCustomBackground() ;
[self addSubview:customImageBackground];
UIImage *img = [GcImagePickerUtils imageFromDefaults:@"aquariusprefs" withKey:@"customBackgroundImage"];
[customImageBackground setImage:img forState:UIControlStateNormal];
[self sendSubviewToBack: customImageBackground];
[platterView.backgroundView setAlpha: 0];
[customImageBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}
if (isBackgroundColored && !isArtworkBackground){
 [platterView.backgroundView setAlpha: 0];
    self.backgroundColor = fuckingArtworkColor;
}
if (isArtworkBackground && !isBackgroundColored){
setUpTheArtworkBackground();
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[platterView.backgroundView setAlpha: 0];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}
}



else if(configurations == 3){
	if (!isArtworkBackground && !isBackgroundColored && customImageBackgroundBOOL){
setUpCustomBackground();
[self addSubview:customImageBackground];
UIImage *img = [GcImagePickerUtils imageFromDefaults:@"aquariusprefs" withKey:@"customBackgroundImage"];
[customImageBackground setImage:img forState:UIControlStateNormal];
[self sendSubviewToBack: customImageBackground];
[platterView.backgroundView setAlpha: 0];
[customImageBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}
if (isBackgroundColored && !isArtworkBackground){
 [platterView.backgroundView setAlpha: 0];
}
[self.heightAnchor constraintEqualToConstant:100].active = true;
if (isArtworkBackground && !isBackgroundColored){
setUpTheArtworkBackground();
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[platterView.backgroundView setAlpha: 0];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

}

else {
	%orig;
}

}

%new
-(void) setTheFuckUp{
	  if (haveOutline){
  self.layer.borderWidth = outlineSize;
  if (!haveOutlineSecondaryColorMusicPlayer){
 UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
  self.layer.borderColor = [customColor CGColor];
  }
  else {
	    self.layer.borderColor = [fuckingArtworkColor2 CGColor];
  }
  self.layer.cornerRadius = musicPlayerCornerRadius;
  }
  if (isBackgroundColored){
	    self.backgroundColor = fuckingArtworkColor;
  }
}
%end

%hook SBMediaController
- (void)setNowPlayingInfo:(id)arg1 {
    %orig;
    MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
        if (information) {
			NSDictionary *dict = (__bridge NSDictionary *)information;
			currentArtwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
			if (dict) {
				[bottomLabel setText:[NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]]]; // set song title
				lastArtworkData = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
				[topLabel setText:[NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]]]; // set artist and album name
				subtitleLabel = [NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]];
				songLabel = [NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]];
				[songBackground setImage:currentArtwork forState:UIControlStateNormal];
				[songImageForSmall setImage:currentArtwork forState:UIControlStateNormal];
				NSArray * tempArtworkColorArray = [currentArtwork dominantColors];
				fuckingArtworkColor = tempArtworkColorArray[0];
				fuckingArtworkColor2 = [currentArtwork averageColor];
				[shuffleButton setImage:[UIImage systemImageNamed:@"shuffle"] forState: UIControlStateNormal];
				[[NSNotificationCenter defaultCenter] postNotificationName:@"com.nico671.updateColors" object:nil];
			}
		}
  	});
	if (haveNotifs) {
			if (![songLabel isEqualToString:previousTitle]){
			[[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:subtitleLabel message:songLabel bundleID:[[[%c(SBMediaController) sharedInstance] nowPlayingApplication] bundleIdentifier]];
			}
			previousTitle = songLabel; //notifications
	}
}
%end
%end

%group statusbar
%hook _UIBatteryView

-(void)setFillColor:(UIColor *)color {
  UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	%orig(customColor);
	if(isBatteryHidden) self.hidden = YES;
}

-(void)setBodyColor:(UIColor *)color {
UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	%orig(customColor);
}
%end
%hook _UIStatusBarVisualProvider_Split54
+(double)height {
    return 20;
}
%end

%hook _UIStatusBarWifiSignalView
-(void)didMoveToWindow{
	%orig;
	if (isWifiThingyHidden){
	self.hidden = YES;
	}
}
%end
%hook _UIStatusBarCellularSignalView
-(void)setNeedsLayout{
	%orig;
	if (isCellularThingyHidden){
	self.hidden = YES;
	}

}
%end
%hook _UIStatusBarSignalView

-(void)setActiveColor:(UIColor *)color {
	UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	%orig(customColor);
}

-(void)setInactiveColor:(UIColor *)color {
	UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	%orig(customColor);
}

%end


%hook _UIStatusBar
-(void)setNeedsLayout{

	if (modernStatusBar){
	self.visualProviderClass =  @"_UIStatusBarVisualProvider_Split54";
	}
	else %orig;
}
%end



%hook _UIStatusBarStringView

-(void)didMoveToWindow{
	%orig;
	if (isTimeHidden){
	self.hidden = YES;
	}
}
-(void)setTextColor:(UIColor *)color {
				UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
	%orig(customColor);
}

%end
%end

%group notifications
%hook NCNotificationListCell
-(void)layoutSubviews{
	%orig;
	if (isNotificationSectionEnabled){
	self.backgroundColor = [UIColor clearColor];
	}

}
%end

%hook NCNotificationContentView
-(void)setNeedsLayout{
	%orig;
	if (hideSnapImage){
	UIImageView *replacementSnapImage = (UIImageView*)MSHookIvar<UIImageView*>(self, "_thumbnailImageView");
	replacementSnapImage.hidden = YES;
	}
}
%end

%hook PLPlatterHeaderContentView
-(void)setNeedsLayout {
	%orig;
	if (colorNotifs){
	iconImage = [self.icons objectAtIndex:0];
	}
}
%end

%hook NCNotificationShortLookView

-(void)setNeedsLayout {
	%orig;
	if (colorNotifs){
	//NSArray * tempNotificationsColorArray = [iconImage ];
	self.backgroundColor = [iconImage averageColor];
	self.layer.cornerRadius = notifCornerRadius;
	yesmf = [self.subviews objectAtIndex:0];
	yesmf.hidden = YES;
	}
	if (leafCornerNotifs){
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
	}
}
%end
%end


%group springy
%hook SBIconProgressView //progressbar
// i think this is more efficient than other progress bars out there im not sure tho??
-(void)_drawPieWithCenter:(CGPoint)arg1{

    UIProgressView *progressView;
	progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
	progressView.progressTintColor = [UIColor cyanColor];
	[progressView.layer setFrame:CGRectMake(self.center.x-25, self.center.y+15, 50, 7.5)];
	progressView.trackTintColor = [UIColor systemGrayColor];
	[progressView setProgress:self.displayedFraction animated:NO];
	[[progressView layer]setCornerRadius:5];
	[[progressView layer]setMasksToBounds:TRUE];
	progressView.clipsToBounds = YES;
	[self addSubview:progressView];
	[self bringSubviewToFront: progressView];
	if (self.displayingPaused == YES){
		pauseButton = [[UIButton alloc]init];
		[pauseButton setContentMode:UIViewContentModeScaleAspectFill];
		[pauseButton setClipsToBounds:YES];
		[pauseButton setAdjustsImageWhenHighlighted:NO];
		[pauseButton setTranslatesAutoresizingMaskIntoConstraints:YES];
		[pauseButton setTintColor: [UIColor cyanColor]];
		[pauseButton setImage:[UIImage systemImageNamed:@"pause"] forState:UIControlStateNormal];
	}
}
-(void)_drawPauseUIWithCenter:(CGPoint)arg1{

}
%end


%hook SBIconView

-(void)setNeedsLayout{
	%orig;
	self.labelHidden = 1;

}

%end
%end
// %group groupedNOTI
// %hook CSNotificationAdjunctListViewController
// %property (nonatomic, retain) AQRGRPView *grpView;
// -(void)viewDidLoad {
//     %orig;
// 	NSLog(@"[aquarius] - %@",[AQRManager sharedInstance].notificationRequests);
//         UIStackView *stackView = [self valueForKey:@"_stackView"];
// 		CGRect screenRect = [[UIScreen mainScreen] bounds];
// 		CGFloat screenWidth = screenRect.size.width;
//         self.grpView = [[AQRGRPView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.frame),CGRectGetMinY(self.view.frame),screenWidth-50,500)];
// 		[AQRManager sharedInstance].view = self.grpView;

//         self.grpView.translatesAutoresizingMaskIntoConstraints = NO;
// 		[[AQRManager sharedInstance].view updateView];
//       	 NSMutableArray *constraints = [@[
//         [self.grpView.centerXAnchor constraintEqualToAnchor:stackView.centerXAnchor],
//           [self.grpView.leadingAnchor constraintEqualToAnchor:stackView.leadingAnchor constant:10],
//           [self.grpView.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor constant:-10],
//           [self.grpView.heightAnchor constraintEqualToConstant:90]
//         ] mutableCopy];
//         [stackView addArrangedSubview:self.grpView];
//         [NSLayoutConstraint activateConstraints:constraints];
// 		[self.grpView updateView];
// }
// -(void)_updatePresentingContent {
//   %orig;
//     UIStackView *stackView = [self valueForKey:@"_stackView"];
//     [stackView removeArrangedSubview:self.grpView];
//     [stackView addArrangedSubview:self.grpView];
// }
// -(void)_insertItem:(id)arg1 animated:(BOOL)arg2 {
//     %orig;
//     UIStackView *stackView = [self valueForKey:@"_stackView"];
//     [stackView removeArrangedSubview:self.grpView];
//     [stackView addArrangedSubview:self.grpView];
// }

// -(BOOL)isPresentingContent {
//     return YES;
// }

// %end
// @interface NCNotificationListSectionHeaderView : UIView
// @end

// %hook NCNotificationStructuredListViewController
// -(void)insertNotificationRequest:(id)arg1 {
// 	%orig;
// 	NCNotificationRequest *req = arg1;
//     [[AQRManager sharedInstance] insertNotificationRequest:req];
//     [[AQRManager sharedInstance].view updateView];
// }

// -(void)removeNotificationRequest:(id)arg1 {
// 	NCNotificationRequest *req = arg1;
//     [[AQRManager sharedInstance] removeNotificationRequest:req];
//     [[AQRManager sharedInstance].view updateView];
// 	[[AQRManager sharedInstance] updateQuick:req.bulletin.sectionID];

// }
// -(void)modifyNotificationRequest:(id)arg1 {
// 	NCNotificationRequest *req = arg1;
//     [[AQRManager sharedInstance] modifyNotificationRequest:req];
//     [[AQRManager sharedInstance].view updateView];

// }
// %end
// %hook NCNotificationCombinedListViewController

// -(id)init{
// 	%orig;
// 	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNotifications) name:@"com.nico671.notifAdded/Removed" object:nil];
// 	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(revealNotificationHistory:) name:@"com.nico671.notifAdded/Removed" object:nil];
// 	return %orig;
// }
// -(void)insertNotificationRequest:(NCNotificationRequest *)arg1 forCoalescedNotification:(id)arg2 {
// 	NCNotificationRequest *req = arg1;
//     [[AQRManager sharedInstance] insertNotificationRequest:req];
//     [[AQRManager sharedInstance].view updateView];


// }
// -(void)removeNotificationRequest:(NCNotificationRequest *)arg1 forCoalescedNotification:(id)arg2 {
//     if (self.aqrAllowChanges) return %orig;
// 	NCNotificationRequest *req = arg1;
// 	[[AQRManager sharedInstance] removeNotificationRequest:req] ;
// }
// %end
// %end
void reloadPrefs() {
	musicPlayerEnabled = [file boolForKey:@"isMusicSectionEnabled"];
	statusBarSectionEnabled = [file boolForKey:@"isStausBarSectionEnabled"];
	hideSnapImage = [file boolForKey:@"hideSnapImage"];
	leafCornerNotifs = [file boolForKey:@"leafCornerNotifs"];
	isBatteryHidden = [file boolForKey:@"isBatteryHidden"];
	isWifiThingyHidden = [file boolForKey:@"isWifiHidden"];
	isCellularThingyHidden = [file boolForKey:@"isCellularHidden"];
	isTimeHidden = [file boolForKey:@"isTimeHidden"];
	modernStatusBar = [file boolForKey:@"modernStatusBar"];
	isRoutingButtonHidden = [file boolForKey:@"isRoutingButtonHidden"];
	configurations = [file integerForKey:@"configuration"];
	musicPlayerAlpha = [file doubleForKey:@"musicPlayerAlpha"];
	rightOffsetForText = [file doubleForKey:@"textOffset"];
	musicPlayerColorsEnabled = [file boolForKey:@"isRoutingButtonHidden"];
	haveNotifs = [file boolForKey:@"notifications?"];
	showPercentage = [file boolForKey:@"showPercentage"];
	isBackgroundColored = [file boolForKey:@"isBackgroundColorEnabled"];
	isArtworkBackground = [file boolForKey:@"isArtworkBackground"];
	isNotificationSectionEnabled = [file boolForKey:@"isNotificationSectionEnabled"];
	haveOutline = [file boolForKey:@"haveOutline?"];
	outlineSize = [file doubleForKey:@"sizeOfOutline"];
	musicPlayerCornerRadius = [file doubleForKey:@"musicPlayerCornerRadius"];
	notifCornerRadius = [file doubleForKey:@"notifCornerRadius"];
	haveOutlineSecondaryColorMusicPlayer = [file boolForKey:@"haveOutlineSecondaryColorMusicPlayer"];
	isSpringySectionEnabled = [file boolForKey:@"isSpringySectionEnabled"];
	downloadBarEnabled = [file boolForKey:@"downloadBarEnabled"];
	colorNotifs = [file boolForKey:@"colorNotifs"];
	musicPlayerLeafLook = [file boolForKey:@"musicPlayerLeafLook"];
	hideLabels = [file boolForKey:@"hideLabels"];
	customImageBackgroundBOOL = [file boolForKey:@"customImageBackground?"];
}
%ctor {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:YES forKey:@"isMusicSectionEnabled"];
	[file registerBool:&hideLabels default:NO forKey:@"hideLabels"];
	[file registerBool:&isTimeHidden default:NO forKey:@"isTimeHidden"];
	[file registerBool:&hideSnapImage default:YES forKey:@"hideSnapImage"];
	[file registerBool:&isBatteryHidden default:NO forKey:@"isBatteryHidden"];
	[file registerBool:&isCellularThingyHidden default:NO forKey:@"isCellularHidden"];
	[file registerBool:&isWifiThingyHidden default:NO forKey:@"isWifiHidden"];
	[file registerBool:&modernStatusBar default:YES forKey:@"modernStatusBar"];
	[file registerBool:&statusBarSectionEnabled default:YES forKey:@"isStausBarSectionEnabled"];
	[file registerBool:&isRoutingButtonHidden default:YES forKey:@"isRoutingButtonHidden"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&configurations default:0 forKey:@"configuration"];
	[file registerBool:&musicPlayerColorsEnabled default:NO forKey:@"isColorsEnabled"];
	[file registerBool:&haveNotifs default:YES forKey:@"notifications?"];
	[file registerBool:&isBackgroundColored default:NO forKey:@"isBackgroundColorEnabled"];
	[file registerBool:&isArtworkBackground default:NO forKey:@"isArtworkBackground"];
	[file registerBool:&haveOutline default:NO forKey:@"haveOutline?"];
	[file registerBool:&showPercentage default:NO forKey:@"showPercentage"];
	[file registerBool:&isNotificationSectionEnabled default:NO forKey:@"isNotificationSectionEnabled"];
	[file registerDouble:&outlineSize default:5 forKey:@"sizeOfOutline"];
	[file registerDouble:&musicPlayerCornerRadius default:5 forKey:@"musicPlayerCornerRadius"];
	[file registerDouble:&notifCornerRadius default:5 forKey:@"notifsCornerRadius"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
	[file registerBool:&isSpringySectionEnabled default:YES forKey:@"isSpringySectionEnabled"];
	[file registerBool:&downloadBarEnabled default:NO forKey:@"downloadBarEnabled"];
	[file registerBool:&colorNotifs default:NO forKey:@"colorNotifs"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	[file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
	[file registerBool:&customImageBackgroundBOOL default:NO forKey:@"customImageBackground?"];
 	if (isNotificationSectionEnabled) {
		%init(notifications)
 	}
	if (musicPlayerEnabled) {
        %init(musicplayer);
	}
	if (statusBarSectionEnabled){
		%init(statusbar);
	}
	if (isSpringySectionEnabled){
		%init(springy);
	}
//%init(groupedNOTI);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
