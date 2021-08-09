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
	[songImageForSmall.leftAnchor constraintEqualToAnchor: self.headerView.artworkView.leftAnchor constant:-5].active = YES;
	[songImageForSmall.topAnchor constraintEqualToAnchor: self.headerView.artworkView.topAnchor constant:-5].active = YES;
	}
	if (!topLabel){
	topLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y-7,320,20) duration:8 andFadeLength:10.0f];
	if (musicPlayerColorsEnabled){
  		topLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor"];
	}
	topLabel.adjustsFontSizeToFitWidth = YES;
	[self addSubview:topLabel];  
	}
	if (!bottomLabel){
	bottomLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y+15,320,20) duration:8 andFadeLength:10.0f];
	bottomLabel.adjustsFontSizeToFitWidth = YES;
	if (musicPlayerColorsEnabled){
		bottomLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor"];
	}
	[self addSubview:bottomLabel];
	}
	if (configurations == 3) {
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame), self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
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
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		%orig;
	}
	if([controller respondsToSelector:@selector(context)] && controller.context == 2){
	self.hidden = YES;
	}
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
        if (configurations == 1 || configurations == 2) {
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
          if (isBackgroundColored) {
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
	 PLPlatterView *platterView = (PLPlatterView *)MSHookIvar<UIView *>(self, "_platterView");
	 platterView.backgroundView.hidden = YES;
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
-(void)setNeedsLayout{
	%orig;
	if (isNotificationSectionEnabled){
	self.backgroundColor = [UIColor clearColor];
	}

}
%end

%hook NCNotificationShortLookView
%property (nonatomic,retain) UIView *topOldieNotifView;
- (void)didMoveToWindow {
	%orig;
	// iconImage = self.icons[0];
	// notifBackgroundView = [self.subviews objectAtIndex:0];
	// PLPlatterHeaderContentView *anchorView = self.subviews[1];
	
	self.layer.cornerRadius = notifCornerRadius;
	if (leafCornerNotifs){
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
	}
	NSLog(@"[aquarius] %@",NSStringFromCGRect(self.notificationContentView.frame));

}
%new 
-(void)setUpRetroLook {
	// retro look
	iconImage = self.icons[0];
	notifBackgroundView = [self.subviews objectAtIndex:0];
	PLPlatterHeaderContentView *anchorView = self.subviews[1];
	if (!self.topOldieNotifView && !CGRectIsEmpty(self.frame) && notifStyle == 1){
	self.topOldieNotifView = [[UIView alloc]init];
	[self.topOldieNotifView setAutoresizingMask: UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
	if (topOldieColor == 0){
		self.topOldieNotifView.backgroundColor = [UIColor grayColor];
	}
	if (topOldieColor == 1){
		UIColor *tempColor = [iconImage averageColor];
		self.topOldieNotifView.backgroundColor = tempColor;
	}
	if (topOldieColor == 2){
		UIColor *tempColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTopOldieNotifColor"];
		self.topOldieNotifView.backgroundColor = tempColor;
	}
	if (retroNotifBackgroundColor == 1 && topOldieColor == 1){
		notifBackgroundView.hidden = YES;
		UIColor *tempColor = [iconImage averageColor];
		self.backgroundColor = [self lighterColorForColor:tempColor];
	}
	else if (retroNotifBackgroundColor == 1){
		notifBackgroundView.hidden = YES;
		UIColor *tempColor = [iconImage averageColor];
		self.backgroundColor = tempColor;
	}
	else if (retroNotifBackgroundColor == 2){
		notifBackgroundView.hidden = YES;
		UIColor *tempColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customBackgroundOldieNotifColor"];
		self.topOldieNotifView.backgroundColor = tempColor;
	}
	self.topOldieNotifView.layer.cornerRadius = notifCornerRadius;
	
	[self.topOldieNotifView setTranslatesAutoresizingMaskIntoConstraints:NO];
	if (!self.banner){
	[self insertSubview:self.topOldieNotifView atIndex:1];
	}
	else {
		[self addSubview:self.topOldieNotifView];
		[self bringSubviewToFront:self.topOldieNotifView];
	}
	[self.topOldieNotifView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
	[self.topOldieNotifView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
	[self.topOldieNotifView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
	[self.topOldieNotifView.bottomAnchor constraintEqualToAnchor:anchorView.bottomAnchor constant:-5].active = YES;
	self.topOldieNotifView.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
	if (oldieNotifHaveShadow){
	self.topOldieNotifView.layer.shadowColor = [UIColor blackColor].CGColor;
	self.topOldieNotifView.layer.shadowOffset = CGSizeMake(0, 4);
	self.topOldieNotifView.layer.shadowRadius = 10;
	self.topOldieNotifView.layer.shadowOpacity = notifShadowOpacity;
	}
	}
}
%new 
- (UIColor *)lighterColorForColor:(UIColor *)c {
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.2, 1.0)
                               green:MIN(g + 0.2, 1.0)
                                blue:MIN(b + 0.2, 1.0)
                               alpha:a];
    return nil;
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
	if (hidePageDots) self.hidden = YES;
}
%end
%hook SBDockView
-(void)setNeedsLayout{
	if (hideDock){
	self.hidden = YES;
	}
}
%end
%hook SBFloatingDockPlatterView
-(void)setNeedsLayout{
	if (hideDock){
	self.hidden = YES;
	}
}
%end
%end
%group Lockscreen
%hook CSCoverSheetViewController

- (void)_transitionChargingViewToVisible:(BOOL)arg1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 { // hide charging view

	%orig(NO, NO, NO);

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
	NSArray *colorArray = [tempWallpaperImage dominantColors];
	if ([colorArray count] > 0){
		wallpaperAverageColor = colorArray[0];
	}
	else {
		wallpaperAverageColor = [tempWallpaperImage averageColor];
	}
	NSString *tempHexString = [UIColor hexStringFromColor:wallpaperAverageColor];
	NSDictionary *userInfo = [NSDictionary dictionaryWithObject:tempHexString forKey:@"hexString"];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationMessageEvent" object:nil userInfo:userInfo];
}
%end
%hook SBUIController

- (void)ACPowerChanged { // heartlines

	%orig;

	if ([self isOnAC]) {
        [UIView transitionWithView:timeDateView.dateLabel duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
			[timeDateView.dateLabel setText:[NSString stringWithFormat:@"%d%%", [self batteryCapacityAsPercentage]]];
		} completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [UIView transitionWithView:timeDateView.dateLabel duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    NSDateFormatter* timeFormat = [NSDateFormatter new];
                    [timeFormat setDateFormat:dateFormat];
                    [timeDateView.dateLabel setText:[timeFormat stringFromDate:[NSDate date]]];
                } completion:nil];
            });
        }];
    }

}

%end
%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)source { // update data when screen was turned on
	%orig;
	[[PDDokdo sharedInstance] refreshWeatherData];
}

%end
%hook CSCoverSheetViewController
- (void)viewWillAppear:(BOOL)animated { // update data when lockscreen appears
	%orig;
	[[PDDokdo sharedInstance] refreshWeatherData];
}
%end

%hook SBFLockScreenDateView
%property (nonatomic, retain) UILabel *timeLabel;
%property (nonatomic, retain) UILabel *dateLabel;
%property (nonatomic, retain) UILabel *weatherLabel;
%property (nonatomic, retain) UIImageView *weatherImageView;
- (id)initWithFrame:(CGRect)frame { // add notification observer
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
    id orig = %orig;
    timeDateView = self;

    return orig;

}
-(void)setNeedsLayout{
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
}
-(void)_updateLabels{
	%orig;
	// hiding original stuff
	SBUILegibilityLabel* timeLabelToBeReplaced = (SBUILegibilityLabel *)MSHookIvar<UIView *>(self, "_timeLabel");
	SBFLockScreenDateSubtitleDateView* dateLabelToBeHidden = (SBFLockScreenDateSubtitleDateView *)MSHookIvar<UIView *>(self, "_dateSubtitleView");
	dateLabelToBeHidden.hidden = YES;
	timeLabelToBeReplaced.hidden = YES;
	// the time label setup
	if (!self.timeLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
	self.timeLabel = [UILabel new];
	self.timeLabel.frame = CGRectMake(0,timeLabelToBeReplaced.frame.origin.y,self.frame.size.width,timeLabelHeight);
	if (alignment == 0){
		self.timeLabel.textAlignment = NSTextAlignmentLeft;
	}
	else if (alignment == 1){
		self.timeLabel.textAlignment = NSTextAlignmentCenter;
	}
	else if (alignment == 2){
		self.timeLabel.textAlignment = NSTextAlignmentRight;
	}
	[self.timeLabel setFont:[UIFont systemFontOfSize:timeLabelHeight]];
	[self addSubview:self.timeLabel];
	[self.timeLabel.bottomAnchor constraintEqualToAnchor:timeLabelToBeReplaced.topAnchor].active= YES;
	}
	NSDate * now = [NSDate date];
	NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
	[timeFormatter setDateFormat:timeFormat];
	NSString *newTimeString = [timeFormatter stringFromDate:now];
	self.timeLabel.text = newTimeString;
	// dateLabel setup
	if (!self.dateLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
	self.dateLabel = [UILabel new];

	if (alignment == 0){
		self.dateLabel.textAlignment = NSTextAlignmentLeft;
	}
	else if (alignment == 1){
		self.dateLabel.textAlignment = NSTextAlignmentCenter;
	}
	else if (alignment == 2){
		self.dateLabel.textAlignment = NSTextAlignmentRight;
	}
	[self.dateLabel setFont:[UIFont systemFontOfSize:dateLabelHeight]];
	self.dateLabel.frame = CGRectMake(CGRectGetMinX(self.timeLabel.frame),CGRectGetMaxY(self.timeLabel.frame),self.frame.size.width,dateLabelHeight);
	[self addSubview:self.dateLabel];
	[self.dateLabel.topAnchor constraintEqualToAnchor:self.timeLabel.bottomAnchor].active= YES;
	}
	NSDate * date = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:dateFormat];
	NSString *newDateString = [dateFormatter stringFromDate:date];
	self.dateLabel.text = newDateString;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
	if (!self.weatherLabel && (!CGRectIsEmpty(self.frame)) && weatherLabelEnabled){ // i hate having to do this
	self.weatherLabel = [UILabel new];
	if (alignment == 0){
		self.weatherLabel.textAlignment = NSTextAlignmentLeft;
	}
	else if (alignment == 1){
		self.weatherLabel.textAlignment = NSTextAlignmentCenter;
	}
	else if (alignment == 2){
		self.weatherLabel.textAlignment = NSTextAlignmentRight;
	}
	[self.weatherLabel setFont:[UIFont systemFontOfSize:weatherLabelHeight]];
	self.weatherLabel.frame = CGRectMake(CGRectGetMinX(self.dateLabel.frame),CGRectGetMaxY(self.dateLabel.frame),self.frame.size.width,weatherLabelHeight);
	[[PDDokdo sharedInstance] refreshWeatherData];
	NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];
	NSString *temperature = [weatherData objectForKey:@"temperature"];
	NSString *conditions = [weatherData objectForKey:@"conditions"];
	NSString *combined = [NSString stringWithFormat:@"%@, %@", temperature,conditions];
	self.weatherLabel.text = combined;
	[self addSubview:self.weatherLabel];
	[self.weatherLabel.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor].active= YES;
	}
}
%new
-(void) setTextColorToWallpaperColor:(NSNotification *) notification {
    NSDictionary *dict = notification.userInfo;
    NSString *message = [dict valueForKey:@"hexString"];
    if (message != nil) {
        UIColor *tempColor = [UIColor colorFromHexString:message];
		tempColor = [tempColor colorWithAlphaComponent:1];
		self.timeLabel.textColor = tempColor;
		self.weatherLabel.textColor = tempColor;
		self.dateLabel.textColor = tempColor;
    }
}
%end
%end

%group gesturesAndModernShit
%hook BSPlatform
-(long long)homeButtonType {
	return 2;
}
%end
%hook SBLockHardwareButtonActions
-(id)initWithHomeButtonType:(NSInteger)arg1 proximitySensorManager:(id)arg2 {
	if (!newButtonCombo) {
    return %orig(1, arg2);
	}
	else return %orig;
}
%end

%hook SBHomeHardwareButtonActions
-(id)initWitHomeButtonType:(NSInteger)arg1 {
	if (!newButtonCombo) {
    return %orig(1);
	}
	else return %orig;
}
%end


%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application {
    applicationDidFinishLaunching = 2;
    %orig;
}
%end

%hook SBPressGestureRecognizer
- (void)setAllowedPressTypes:(NSArray *)arg1 {
	if (!newButtonCombo) {
    NSArray * lockHome = @[@104, @101];
    NSArray * lockVol = @[@104, @102, @103];
    if (applicationDidFinishLaunching == 2 && [arg1 isEqual:lockVol]) {
        %orig(lockHome);
        applicationDidFinishLaunching--;
        return;
    }
    %orig;
	}
	else %orig;
}
%end
%hook UIWindow
- (UIEdgeInsets)safeAreaInsets {
    UIEdgeInsets orig = %orig;
    orig.bottom = 0;
    return orig;
}
%end

%hook SBClickGestureRecognizer
- (void)addShortcutWithPressTypes:(id)arg1 {
	if (!newButtonCombo) {
    if (applicationDidFinishLaunching == 1) {
        applicationDidFinishLaunching--;
        return;
    }
    %orig;
	} 
	else %orig;
}
%end

%hook SBHomeHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 homeButtonType:(NSInteger)arg2 {
	if (!newButtonCombo) {
    return %orig(arg1, 1);
	}
	else return %orig;
}
%end

%hook SBLockHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 proximitySensorManager:(id)arg3 homeHardwareButton:(id)arg4 volumeHardwareButton:(id)arg5 buttonActions:(id)arg6 homeButtonType:(NSInteger)arg7 createGestures:(_Bool)arg8 {
 	if (!newButtonCombo) {
	return %orig(arg1,arg2,arg3,arg4,arg5,arg6,1,arg8);
	}
	else return %orig;
}
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 proximitySensorManager:(id)arg3 homeHardwareButton:(id)arg4 volumeHardwareButton:(id)arg5 homeButtonType:(NSInteger)arg6 {
	if (!newButtonCombo) {
	return %orig(arg1,arg2,arg3,arg4,arg5,1);
	}
	else return %orig;
}
%end

%hook SBVolumeHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 homeButtonType:(NSInteger)arg3 {
    if (!newButtonCombo) {
	return %orig(arg1,arg2,1);
	}
	else return %orig;
}
%end
%hook CSQuickActionsView
- (BOOL)_prototypingAllowsButtons {
	return haveQuickActions;
}
- (void)_layoutQuickActionButtons {
    CGRect const screenBounds = [UIScreen mainScreen].bounds;
    int const y = screenBounds.size.height - 90 - [self _buttonOutsets].top;

    [self flashlightButton].frame = CGRectMake(46, y, 50, 50);
    [self cameraButton].frame = CGRectMake(screenBounds.size.width - 96, y, 50, 50);
}
%end
%hook MTLumaDodgePillSettings
- (void)setHeight:(double)arg1 {
	if (hideHomeBar){
	%orig(0);
	}
	else {
		%orig;
	}
}
%end
%hook UIKeyboardImpl
+(UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(NSInteger)orientation inputMode:(id)mode {
	if (newKeyboard == NO){
	UIEdgeInsets orig = %orig;
	orig.left =  0;
	orig.right = 0;
    orig.bottom = 0;
	return orig;
	}
	else {
		return %orig;
	}
}
%end
%hook SBHDefaultIconListLayoutProvider
-(NSUInteger)screenType {
    return UIScreen.mainScreen.screenSizeCategory - 1;
}
%end
%hook _UIStatusBarData
-(void)setBackNavigationEntry:(id)arg1 {
	if (hideBreadcrumbs){
    return;
	}
	else return %orig;
}
%end
%hook _UIStatusBarVisualProvider_iOS
+(Class) class{
	if (newStatusBar == NO){
		return NSClassFromString(@"_UIStatusBarVisualProvider_LegacyPhone");
	}
	else return %orig;
}
%end
%hook _UIStatusBarVisualProvider_Split54
+(CGSize)notchSize {
    CGSize const orig = %orig;
    return CGSizeMake(orig.width, 18);
}
+(double)height {
	return 20;
}
%end

%hook _UIBatteryView 
-(BOOL)_currentlyShowsPercentage {
	if (showsPercentage){
       return YES;
	}
	else return %orig;
  
}
-(BOOL)_shouldShowBolt {
	if (showsPercentage){
		return NO;
	}
	else return %orig;
}
%end
%hook UITabBar

-(void)setNeedsLayout{
	%orig;
	NSLog(@"[aquarius] is this method called");
	self._tabBarSizing = 20;
}

%end
%end
void reloadPrefs() {
	isTweakEnabled = [file boolForKey:@"isTweakEnabled"];
	musicPlayerEnabled = [file boolForKey:@"isMusicSectionEnabled"];
	newButtonCombo = [file boolForKey:@"notchedDeviceButtonCombo"];
	statusBarSectionEnabled = [file boolForKey:@"isStatusBarSectionEnabled"];
	hideSnapImage = [file boolForKey:@"hideSnapImage"];
	leafCornerNotifs = [file boolForKey:@"leafCornerNotifs"];
	isBatteryHidden = [file boolForKey:@"isBatteryHidden"];
	isWifiThingyHidden = [file boolForKey:@"isWifiHidden"];
	isCellularThingyHidden = [file boolForKey:@"isCellularHidden"];
	isTimeHidden = [file boolForKey:@"isTimeHidden"];
	modernStatusBar = [file boolForKey:@"modernStatusBar"];
	isRoutingButtonHidden = [file boolForKey:@"isRoutingButtonHidden"];
	configurations = [file integerForKey:@"configuration"];
	notifStyle = [file integerForKey:@"notifStyle"];
	topOldieColor = [file integerForKey:@"topOldieColor"];
	alignment = [file integerForKey:@"alignment"];
	musicPlayerAlpha = [file doubleForKey:@"musicPlayerAlpha"];
	weatherLabelHeight = [file doubleForKey:@"weatherLabelHeight"];
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
	notifCornerRadius = [file doubleForKey:@"notifsCornerRadius"];
	dateLabelHeight = [file doubleForKey:@"dateLabelHeight"];
	timeLabelHeight = [file doubleForKey:@"timeLabelHeight"];
	notifShadowOpacity = [file doubleForKey:@"oldieNotifShadowOpacity"];
	haveOutlineSecondaryColorMusicPlayer = [file boolForKey:@"haveOutlineSecondaryColorMusicPlayer"];
	isSpringySectionEnabled = [file boolForKey:@"isSpringySectionEnabled"];
	downloadBarEnabled = [file boolForKey:@"downloadBarEnabled"];
	musicPlayerLeafLook = [file boolForKey:@"musicPlayerLeafLook"];
	hideLabels = [file boolForKey:@"hideLabels"];
	hidePageDots = [file boolForKey:@"hidePageDots"];
	customImageBackgroundBOOL = [file boolForKey:@"customImageBackground?"];
	isLockscreenSectionEnabled = [file boolForKey:@"isLockscreenSectionEnabled"];
	hideNoOlderNotifs = [file boolForKey:@"hideNoOlderNotifs"];
	weatherLabelEnabled = [file boolForKey:@"weatherLabelEnabled"];
	hideHomeBar = [file boolForKey:@"hideHomeBar"];
	retroNotifBackgroundColor = [file integerForKey:@"retroNotifBackgroundColor"];
	
	hideDock = [file boolForKey:@"hideDock"];
	enableGestures = [file boolForKey:@"enableGestures"];
	haveQuickActions = [file boolForKey:@"haveQuickActions"];
	showsPercentage = [file boolForKey:@"showsPercentage"];
	hideBreadcrumbs = [file boolForKey:@"hideBreadcrumbs"];
	newStatusBar = [file boolForKey:@"newStatusBar"];
	retroNotifVibe = [file boolForKey:@"retroNotif"];
	oldieNotifHaveShadow = [file boolForKey:@"oldieNotifHaveShadow"];
	newKeyboard = [file boolForKey:@"newKeyboard"];
	dateFormat = [file objectForKey:@"dateFormat"];
	timeFormat = [file objectForKey:@"timeFormat"];

}
%ctor {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:NO forKey:@"isMusicSectionEnabled"];
	[file registerBool:&isTweakEnabled default:NO forKey:@"isTweakEnabled"];
	[file registerBool:&hideHomeBar default:NO forKey:@"hideHomeBar"];
	[file registerBool:&haveQuickActions default:NO forKey:@"haveQuickActions"];
	[file registerBool:&enableGestures default:NO forKey:@"enableGestures"];
	[file registerBool:&newButtonCombo default:NO forKey:@"notchedDeviceButtonCombo"];
	[file registerObject:&dateFormat default:@"EEEE, MMMM dd" forKey:@"dateFormat"];
	[file registerObject:&timeFormat default:@"h:mm" forKey:@"timeFormat"];
	[file registerBool:&hideNoOlderNotifs default:NO forKey:@"hideNoOlderNotifs"];
	[file registerBool:&hideLabels default:NO forKey:@"hideLabels"];
	[file registerBool:&isTimeHidden default:NO forKey:@"isTimeHidden"];
	[file registerBool:&hideSnapImage default:NO forKey:@"hideSnapImage"];
	[file registerBool:&isBatteryHidden default:NO forKey:@"isBatteryHidden"];
	[file registerBool:&isCellularThingyHidden default:NO forKey:@"isCellularHidden"];
	[file registerBool:&isWifiThingyHidden default:NO forKey:@"isWifiHidden"];
	[file registerBool:&modernStatusBar default:NO forKey:@"modernStatusBar"];
	[file registerBool:&newKeyboard default:NO forKey:@"newKeyboard"];
	[file registerBool:&statusBarSectionEnabled default:NO forKey:@"isStatusBarSectionEnabled"];
	[file registerBool:&isRoutingButtonHidden default:NO forKey:@"isRoutingButtonHidden"];
	[file registerBool:&oldieNotifHaveShadow default:1 forKey:@"oldieNotifHaveShadow"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&notifShadowOpacity default:.25 forKey:@"oldieNotifShadowOpacity"];
	[file registerDouble:&timeLabelHeight default:72 forKey:@"timeLabelHeight"];
	[file registerDouble:&dateLabelHeight default:24 forKey:@"dateLabelHeight"];
	[file registerDouble:&weatherLabelHeight default:24 forKey:@"weatherLabelHeight"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&configurations default:3 forKey:@"configuration"];
	[file registerInteger:&notifStyle default:0 forKey:@"notifStyle"];
	[file registerInteger:&topOldieColor default:0 forKey:@"topOldieColor"];
	[file registerInteger:&alignment default:0 forKey:@"alignment"];
	[file registerBool:&musicPlayerColorsEnabled default:NO forKey:@"isColorsEnabled"];
	[file registerBool:&haveNotifs default:NO forKey:@"notifications?"];
	[file registerBool:&isBackgroundColored default:NO forKey:@"isBackgroundColorEnabled"];
	[file registerBool:&isArtworkBackground default:NO forKey:@"isArtworkBackground"];
	[file registerBool:&haveOutline default:NO forKey:@"haveOutline?"];
	[file registerBool:&hideDock default:NO forKey:@"hideDock"];
	[file registerBool:&showPercentage default:NO forKey:@"showPercentage"];
	[file registerBool:&isNotificationSectionEnabled default:NO forKey:@"isNotificationSectionEnabled"];
	[file registerDouble:&outlineSize default:5 forKey:@"sizeOfOutline"];
	[file registerDouble:&musicPlayerCornerRadius default:5 forKey:@"musicPlayerCornerRadius"];
	[file registerDouble:&notifCornerRadius default:5 forKey:@"notifsCornerRadius"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
	[file registerBool:&isSpringySectionEnabled default:NO forKey:@"isSpringySectionEnabled"];
	[file registerBool:&isLockscreenSectionEnabled default:NO forKey:@"isLockscreenSectionEnabled"];
	[file registerBool:&downloadBarEnabled default:NO forKey:@"downloadBarEnabled"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	[file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
	[file registerBool:&customImageBackgroundBOOL default:NO forKey:@"customImageBackground?"];
	[file registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];
	[file registerBool:&newStatusBar default:NO forKey:@"newStatusBar"];
	[file registerBool:&showsPercentage default:NO forKey:@"showsPercentage"];
	[file registerBool:&weatherLabelEnabled default:NO forKey:@"weatherLabelEnabled"];
	[file registerBool:&hideBreadcrumbs default:NO forKey:@"hideBreadcrumbs"];
	[file registerBool:&retroNotifVibe default:NO forKey:@"retroNotif"];
	[file registerInteger:&retroNotifBackgroundColor default:0 forKey:@"retroNotifBackgroundColor"];
	
	if (isTweakEnabled){
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
		if (enableGestures){
			%init(gesturesAndModernShit);
		}
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}