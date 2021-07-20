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

-(void)setFrame:(CGRect *)arg1 {
	%orig;
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if([controller respondsToSelector:@selector(context)] && controller.context == 2) {
	//artworksetup
	self.artworkView.hidden = YES;
	}

}
%end
%hook MRUNowPlayingControlsView
-(void)setNeedsLayout {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor]; //s/o lightmann for this it allows me to only change the lockscreen player and not the cc player
	if (controller.context == 2) {
	if(!songImageForSmall){
		songImageForSmall = [UIButton new];
		[songImageForSmall setContentMode:UIViewContentModeScaleAspectFill];
		[songImageForSmall setClipsToBounds:YES];
		[songImageForSmall setAdjustsImageWhenHighlighted:NO];
		[songImageForSmall setAlpha:1];
		[songImageForSmall.layer setCornerRadius:8];
		songImageForSmall.frame = CGRectMake(self.headerView.artworkView.frame.origin.x-10,self.headerView.artworkView.frame.origin.y-10,85,85);


	[self insertSubview:songImageForSmall atIndex:0];
	[songImageForSmall.leadingAnchor constraintEqualToAnchor: self.headerView.artworkView.leadingAnchor constant:5].active = YES;
	[songImageForSmall.topAnchor constraintEqualToAnchor: self.headerView.artworkView.topAnchor].active = YES;
	}
	if (!bottomLabel){
	bottomLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y+15,320,20) duration:8 andFadeLength:10.0f];
	bottomLabel.adjustsFontSizeToFitWidth = YES;
	bottomLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor"];
	[self addSubview:bottomLabel];
	}
	if (!topLabel){
	topLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y-7,320,20) duration:8 andFadeLength:10.0f];
  	topLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor"];
	topLabel.adjustsFontSizeToFitWidth = YES;
	[self addSubview:topLabel];
	}
	if (configurations == 3) {
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame), self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
	}
	else if (configurations == 0){
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame)+15, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
	}
	else if (configurations == 1){
	[self.timeControlsView setFrame: CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 50, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame), self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
	}
	else if (configurations == 2){
	[self.volumeControlsView setFrame:CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 55, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
	[self.timeControlsView setHidden:YES];
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame), self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
	[self.headerView.artworkView setHidden:YES];
	}
	}
}
%end
%hook MRUNowPlayingLabelView
//shoutout lightmann
-(void)setNeedsLayout{
	self.hidden = YES;
}
%end

%hook MRUNowPlayingTransportControlsView // coloring for the buttons
- (void)layoutSubviews {
	%orig;
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (musicPlayerColorsEnabled && controller.context == 2) {
		UIColor *leftColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLeftButtonColor"];
		[self.leftButton setStylingProvider:nil];
		self.leftButton.imageView.layer.filters = nil;
		[self.leftButton.imageView setTintColor:leftColor];

		UIColor *middleColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customMiddleButtonColor"];
		[self.middleButton setStylingProvider:nil];
		self.middleButton.imageView.layer.filters = nil;
		[self.middleButton.imageView setTintColor:middleColor];

		UIColor *rightColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customRightButtonColor"];
		[self.rightButton setStylingProvider:nil];
		self.rightButton.imageView.layer.filters = nil;
		[self.rightButton.imageView setTintColor:rightColor];
	}
}

%end

%hook CSAdjunctItemView // sets the height and opacity of the player

-(void)_updateSizeToMimic{
		%orig;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTheFuckUp) name:@"com.nico671.updateColors" object:nil];
        [self setTheFuckUp];
        PLPlatterView *platterView = (PLPlatterView *)MSHookIvar<UIView *>(self, "_platterView");
        [platterView.backgroundView setAlpha:musicPlayerAlpha];
        self.layer.cornerRadius = musicPlayerCornerRadius;
        if (musicPlayerLeafLook) {
          self.layer.maskedCorners =
              kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
        }
        if (configurations == 0) {
          if (isBackgroundColored && !isArtworkBackground) {
            [platterView.backgroundView setAlpha:0];
            self.backgroundColor = fuckingArtworkColor;
          }
          [self.heightAnchor constraintEqualToConstant:115].active =
              true; // height
          if (isArtworkBackground && !isBackgroundColored) {
            setUpTheArtworkBackground();
            [self addSubview:songBackground];
            [self sendSubviewToBack:songBackground];
            [platterView.backgroundView setAlpha:0];
            [songBackground.heightAnchor constraintEqualToAnchor:self.heightAnchor].active = YES;
            [songBackground.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
          }

          if (!isArtworkBackground && !isBackgroundColored &&
              customImageBackgroundBOOL) {
            setUpCustomBackground();
            [self addSubview:customImageBackground];
            UIImage *img =
            [GcImagePickerUtils imageFromDefaults:@"aquariusprefs"
                                              withKey:@"customBackgroundImage"];
            [customImageBackground setImage:img forState:UIControlStateNormal];
            [self sendSubviewToBack:customImageBackground];
            [platterView.backgroundView setAlpha:0];
            [customImageBackground
                setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)];
          }
        } else if (configurations == 1 || configurations == 2) {
          [platterView.heightAnchor constraintEqualToConstant:130].active =
              true;
          if (!isArtworkBackground && !isBackgroundColored &&
              customImageBackgroundBOOL) {
            setUpCustomBackground();
            [self addSubview:customImageBackground];
            UIImage *img =
                [GcImagePickerUtils imageFromDefaults:@"aquariusprefs"
                                              withKey:@"customBackgroundImage"];
            [customImageBackground setImage:img forState:UIControlStateNormal];
            [self sendSubviewToBack:customImageBackground];
            [platterView.backgroundView setAlpha:0];
            [customImageBackground
                setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)];
          }
          if (isBackgroundColored && !isArtworkBackground) {
            [platterView.backgroundView setAlpha:0];
            self.backgroundColor = fuckingArtworkColor;
          }
          if (isArtworkBackground && !isBackgroundColored) {
            setUpTheArtworkBackground();
            [self addSubview:songBackground];
            [self sendSubviewToBack:songBackground];
            [platterView.backgroundView setAlpha:0];
            [songBackground
                setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)];
          }
        }

        else if (configurations == 3) {
          if (!isArtworkBackground && !isBackgroundColored &&
              customImageBackgroundBOOL) {
            setUpCustomBackground();
            [self addSubview:customImageBackground];
            UIImage *img =
                [GcImagePickerUtils imageFromDefaults:@"aquariusprefs"
                                              withKey:@"customBackgroundImage"];
            [customImageBackground setImage:img forState:UIControlStateNormal];
            [self sendSubviewToBack:customImageBackground];
            [platterView.backgroundView setAlpha:0];
            [customImageBackground
                setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)];
          }
          if (isBackgroundColored && !isArtworkBackground) {
            [platterView.backgroundView setAlpha:0];
          }
          [self.heightAnchor constraintEqualToConstant:100].active = true;
          if (isArtworkBackground && !isBackgroundColored) {
            setUpTheArtworkBackground();
            [self addSubview:songBackground];
            [self sendSubviewToBack:songBackground];
            [platterView.backgroundView setAlpha:0];
            [songBackground
                setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)];
          }

        }

        else {
          %orig;
        }
}

%new
-(void) setTheFuckUp{
  if (haveOutline) {
    self.layer.borderWidth = outlineSize;
    if (!haveOutlineSecondaryColorMusicPlayer) {
      UIColor *customColor =
          [GcColorPickerUtils colorFromDefaults:@"aquariusprefs"
                                            withKey:@"outlineColor"];
      self.layer.borderColor = [customColor CGColor];
    } else {
      self.layer.borderColor = [fuckingArtworkColor2 CGColor];
    }
    self.layer.cornerRadius = musicPlayerCornerRadius;
  }
  if (isBackgroundColored) {
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
				lastArtworkData = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
				subtitleLabel = [NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]];
				songLabel = [NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]];
				topLabel.text = songLabel;
				bottomLabel.text = subtitleLabel;
				[songBackground setImage:currentArtwork forState:UIControlStateNormal];
				[songImageForSmall setImage:currentArtwork forState:UIControlStateNormal];
				NSDictionary * tempArtworkColorDict = [NCImageUtils dominantColors:currentArtwork detail:0];
				NSArray *tempArtworkColorArray = [tempArtworkColorDict objectForKey:@"colours"];
				fuckingArtworkColor = tempArtworkColorArray[0];
				fuckingArtworkColor2 = [NCImageUtils averageColor:currentArtwork];
				[shuffleButton setImage:[UIImage systemImageNamed:@"shuffle"] forState: UIControlStateNormal];
				[[NSNotificationCenter defaultCenter] postNotificationName:@"com.nico671.updateColors" object:nil];
			}
		}
  	});
	if (haveNotifs) {
			if ([songLabel isEqualToString:previousTitle]){
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
  UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	%orig(customColor);
	if(isBatteryHidden) self.hidden = YES;
}

-(void)setBodyColor:(UIColor *)color {
UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
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
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	%orig(customColor);
}

-(void)setInactiveColor:(UIColor *)color {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
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
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
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
	self.backgroundColor = [NCImageUtils averageColor:iconImage];
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
if (downloadBarEnabled){
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
}
-(void)_drawPauseUIWithCenter:(CGPoint)arg1{
if (downloadBarEnabled){

}
else {
	%orig;
}
}
%end


%hook SBIconView

-(void)setNeedsLayout{
	%orig;
	if (hideLabels){
		self.labelHidden = 1;
	}


}

%end
%hook SBIconListPageControl
-(void)setNeedsLayout{
	%orig;
	self.hidden = YES;
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

%group Lockscreen
%hook SBFLockScreenDateSubtitleDateView
-(void)setNeedsLayout {
	self.hidden = YES;
}
%end
%hook NCNotificationListSectionRevealHintView
-(void)setNeedsLayout{
	if (hideNoOlderNotifs) self.hidden = YES;
}
%end
%hook SBFStaticWallpaperView
-(void)setNeedsLayout {
	%orig;
	UIImage* tempWallpaperImage = (UIImage *)MSHookIvar<UIView *>(self, "_displayedImage");
	wallpaperAverageColor = [NCImageUtils averageColor:tempWallpaperImage];
	NSString *tempHexString = [UIColor hexStringFromColor:wallpaperAverageColor];
	NSDictionary *userInfo = [NSDictionary dictionaryWithObject:tempHexString forKey:@"hexString"];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationMessageEvent" object:nil userInfo:userInfo];
}
%end

%hook SBFLockScreenDateView
-(void)_updateLabels{
	%orig;
	SBUILegibilityLabel* timeLabelToBeReplaced = (SBUILegibilityLabel *)MSHookIvar<UIView *>(self, "_timeLabel");
	timeLabelToBeReplaced.hidden = YES;
	if (!timeLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
	timeLabel = [UILabel new];
	timeLabel.frame = CGRectMake(0,timeLabelToBeReplaced.frame.origin.y,self.frame.size.width,self.frame.size.height);
	if (alignment == 0){
		timeLabel.textAlignment = NSTextAlignmentLeft;
	}
	else if (alignment == 1){
		timeLabel.textAlignment = NSTextAlignmentCenter;
	}
	else if (alignment == 2){
		timeLabel.textAlignment = NSTextAlignmentRight;
	}
	[timeLabel setFont:[UIFont systemFontOfSize:72]];
	[self addSubview:timeLabel];
	[timeLabel.bottomAnchor constraintEqualToAnchor:timeLabelToBeReplaced.topAnchor].active= YES;
	}
	NSDate * now = [NSDate date];
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"h:mm"];
	NSString *newTimeString = [outputFormatter stringFromDate:now];
	timeLabel.text = newTimeString;

	if (!dateLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
	dateLabel = [UILabel new];
	dateLabel.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
	if (alignment == 0){
		dateLabel.textAlignment = NSTextAlignmentLeft;
	}
	else if (alignment == 1){
		dateLabel.textAlignment = NSTextAlignmentCenter;
	}
	else if (alignment == 2){
		dateLabel.textAlignment = NSTextAlignmentRight;
	}
	[dateLabel setFont:[UIFont systemFontOfSize:24]];
	[self addSubview:dateLabel];
	[dateLabel.topAnchor constraintEqualToAnchor:timeLabel.bottomAnchor constant:-30].active= YES;
	}
	NSDate * date = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"EEEE, MMMM dd"];
	NSString *newDateString = [dateFormatter stringFromDate:date];
	dateLabel.text = newDateString;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
}
%new 
-(void) setTextColorToWallpaperColor:(NSNotification *) notification {
    NSDictionary *dict = notification.userInfo;
    NSString *message = [dict valueForKey:@"hexString"];
    if (message != nil) {
        UIColor *tempColor = [UIColor colorFromHexString:message];
		tempColor = [tempColor colorWithAlphaComponent:1];
		timeLabel.textColor = tempColor;
		dateLabel.textColor = tempColor;
    }
}
%end
%end
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
	alignment = [file integerForKey:@"alignment"];
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
	hidePageDots = [file boolForKey:@"hidePageDots"];
	customImageBackgroundBOOL = [file boolForKey:@"customImageBackground?"];
	isLockscreenSectionEnabled = [file boolForKey:@"isLockscreenSectionEnabled"];
	hideNoOlderNotifs = [file boolForKey:@"hideNoOlderNotifs"];

}
%ctor {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:NO forKey:@"isMusicSectionEnabled"];
	[file registerBool:&hideNoOlderNotifs default:NO forKey:@"hideNoOlderNotifs"];
	[file registerBool:&hideLabels default:NO forKey:@"hideLabels"];
	[file registerBool:&isTimeHidden default:NO forKey:@"isTimeHidden"];
	[file registerBool:&hideSnapImage default:NO forKey:@"hideSnapImage"];
	[file registerBool:&isBatteryHidden default:NO forKey:@"isBatteryHidden"];
	[file registerBool:&isCellularThingyHidden default:NO forKey:@"isCellularHidden"];
	[file registerBool:&isWifiThingyHidden default:NO forKey:@"isWifiHidden"];
	[file registerBool:&modernStatusBar default:NO forKey:@"modernStatusBar"];
	[file registerBool:&statusBarSectionEnabled default:NO forKey:@"isStausBarSectionEnabled"];
	[file registerBool:&isRoutingButtonHidden default:NO forKey:@"isRoutingButtonHidden"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&configurations default:0 forKey:@"configuration"];
	[file registerInteger:&alignment default:0 forKey:@"alignment"];
	[file registerBool:&musicPlayerColorsEnabled default:NO forKey:@"isColorsEnabled"];
	[file registerBool:&haveNotifs default:NO forKey:@"notifications?"];
	[file registerBool:&isBackgroundColored default:NO forKey:@"isBackgroundColorEnabled"];
	[file registerBool:&isArtworkBackground default:NO forKey:@"isArtworkBackground"];
	[file registerBool:&haveOutline default:NO forKey:@"haveOutline?"];
	[file registerBool:&showPercentage default:NO forKey:@"showPercentage"];
	[file registerBool:&isNotificationSectionEnabled default:NO forKey:@"isNotificationSectionEnabled"];
	[file registerDouble:&outlineSize default:5 forKey:@"sizeOfOutline"];
	[file registerDouble:&musicPlayerCornerRadius default:5 forKey:@"musicPlayerCornerRadius"];
	[file registerDouble:&notifCornerRadius default:5 forKey:@"notifsCornerRadius"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
	[file registerBool:&isSpringySectionEnabled default:NO forKey:@"isSpringySectionEnabled"];
	[file registerBool:&isLockscreenSectionEnabled default:NO forKey:@"isLockscreenSectionEnabled"];
	[file registerBool:&downloadBarEnabled default:NO forKey:@"downloadBarEnabled"];
	[file registerBool:&colorNotifs default:NO forKey:@"colorNotifs"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	[file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
	[file registerBool:&customImageBackgroundBOOL default:NO forKey:@"customImageBackground?"];
	[file registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];

 	if (isNotificationSectionEnabled) {
		%init(notifications)
 	}
	if (musicPlayerEnabled) {
        %init(musicplayer);
	}
	
	if (isSpringySectionEnabled){
		%init(springy);
	}
	if (statusBarSectionEnabled){
		%init(statusbar);
	}
	if (isLockscreenSectionEnabled){
		%init(Lockscreen);
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}