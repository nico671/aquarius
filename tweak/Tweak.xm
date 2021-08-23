#import "headers.h"
%group musicplayer
%hook MRUNowPlayingHeaderView // hides the little routing button
- (void)setShowRoutingButton:(BOOL)arg1 {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		%orig;
	}
	else if ( controller.context == 2) {
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
			[topLabel restartLabel];
		}
		if (!bottomLabel){
			bottomLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y+15,320,20) duration:8 andFadeLength:10.0f];
			bottomLabel.adjustsFontSizeToFitWidth = YES;
			if (musicPlayerColorsEnabled){
				bottomLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor"];
			}
			[self addSubview:bottomLabel];
			[bottomLabel restartLabel];
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
		[[%c(SBMediaController) sharedInstance]setNowPlayingInfo:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTheFuckUp) name:@"com.nico671.updateColors" object:nil];
        [self setTheFuckUp];
        PLPlatterView *platterView = (PLPlatterView *)MSHookIvar<UIView *>(self, "_platterView");
		if (!isArtworkBackground && !isBackgroundColored && !customImageBackgroundBOOL){
        	[platterView.backgroundView setAlpha:musicPlayerAlpha];
		}
        self.layer.cornerRadius = musicPlayerCornerRadius;
        if (musicPlayerLeafLook) {
          	self.layer.maskedCorners =
            kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
        }
        if (configurations == 1 || configurations == 2) {
        	[platterView.heightAnchor constraintEqualToConstant:130].active = true;
        	if (!isArtworkBackground && !isBackgroundColored && customImageBackgroundBOOL) {
            	setUpCustomBackground();
           	 	[self addSubview:customImageBackground];
           		UIImage *img = [GcImagePickerUtils imageFromDefaults:@"aquariusprefs" withKey:@"customBackgroundImage"];
            	[customImageBackground setImage:img forState:UIControlStateNormal];
            	[self sendSubviewToBack:customImageBackground];
            	[platterView.backgroundView setAlpha:0];
            	[customImageBackground setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
          	}
          	if (isArtworkBackground && !isBackgroundColored) {
				setUpTheArtworkBackground();
				[self addSubview:songBackground];
				[self sendSubviewToBack:songBackground];
				[platterView.backgroundView setAlpha:0];
				[songBackground setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
         	 }
        }
        else if (configurations == 3) {
        	if (!isArtworkBackground && !isBackgroundColored && customImageBackgroundBOOL) {
				setUpCustomBackground();
				[self addSubview:customImageBackground];
				UIImage *img = [GcImagePickerUtils imageFromDefaults:@"aquariusprefs" withKey:@"customBackgroundImage"];
				[customImageBackground setImage:img forState:UIControlStateNormal];
				[self sendSubviewToBack:customImageBackground];
				[platterView.backgroundView setAlpha:0];
				[customImageBackground setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,self.frame.size.height)];
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
				[songBackground	setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
			}

        }

        else {
          %orig;
        }
}

%new
-(void) setTheFuckUp{
	PLPlatterView *platterView = (PLPlatterView *)MSHookIvar<UIView *>(self, "_platterView");
	if (haveOutline){
		self.layer.borderWidth = outlineSize;
		if (!haveOutlineSecondaryColorMusicPlayer){
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
			self.layer.borderColor = customColor.CGColor;
		}
		else {
			self.layer.borderColor = fuckingArtworkColor2.CGColor;
		}
		if (isBackgroundColored) {
	  		platterView.backgroundView.hidden = YES;
    		self.backgroundColor = fuckingArtworkColor;
  		}
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


%group notifications
%hook NCNotificationShortLookView
%property (nonatomic,retain) MTMaterialView *modernNotifBackground;
%property (nonatomic,retain) UIView *topOldieNotifView;
%property (nonatomic,retain) UIImageView *modernStyleIconImageView;   
- (void) didMoveToWindow{
	%orig;
	[self createThatMan]; //end of modern notifs
}
%new
-(void)createThatMan{
	if (self.icons[0] && [self.subviews objectAtIndex:0] && [self.subviews objectAtIndex:1] && [self.subviews objectAtIndex:2]) {
	iconImage = self.icons[0];
	notifBackgroundView = [self.subviews objectAtIndex:0];
		if ([self.subviews[1] isKindOfClass:NSClassFromString(@"PLPlatterHeaderContentView")]){
				iconContentView = [self.subviews objectAtIndex:1];
		}
	}
	UIColor *tempNotifColor = [iconImage averageColor];
	self.layer.cornerRadius = notifCornerRadius;
	if (leafCornerNotifs){
		self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
		self.modernNotifBackground.layer.maskedCorners =  kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
	}
	if (notifStyle == 0){
		// original look
		if (ogNotifBackgroundColor == 1){
			notifBackgroundView.hidden = YES;
			self.backgroundColor = tempNotifColor;
		}
		else if (ogNotifBackgroundColor == 2){
			notifBackgroundView.hidden = YES;
			UIColor *customNotifColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customBackgroundOGNotifColor"];
			self.backgroundColor = customNotifColor;
		}
	}
	if (notifStyle == 1 && !self.topOldieNotifView && !CGRectIsEmpty(self.frame) && iconContentView){
		HBLogDebug(@"[aquarius] this should be called 1 time");
		self.topOldieNotifView = [[UIView alloc]init];
		[self.topOldieNotifView setAutoresizingMask: UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
		if (oldieNotifHaveShadow){
		self.topOldieNotifView.layer.shadowColor = [UIColor blackColor].CGColor;
		self.topOldieNotifView.layer.shadowOffset = CGSizeMake(0, 4);
		self.topOldieNotifView.layer.shadowRadius = 10;
		self.topOldieNotifView.layer.shadowOpacity = notifShadowOpacity;
		}
		if (topOldieColor == 0){
			self.topOldieNotifView.backgroundColor = [UIColor grayColor];
		}
		if (topOldieColor == 1){

			self.topOldieNotifView.backgroundColor = tempNotifColor;
		}
		if (topOldieColor == 2){
			UIColor *customNotifColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTopOldieNotifColor"];
			self.topOldieNotifView.backgroundColor = customNotifColor;
		}
		if (retroNotifBackgroundColor == 1 && topOldieColor == 1){
		if( self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ){ 	//is dark
			notifBackgroundView.hidden = YES;
			self.backgroundColor = [self darkerColorForColor:tempNotifColor];

		}else{ // light
			notifBackgroundView.hidden = YES;
			self.backgroundColor = [self lighterColorForColor:tempNotifColor];
			}

		}
		else if (retroNotifBackgroundColor == 1){
			notifBackgroundView.hidden = YES;
			self.backgroundColor = tempNotifColor;
		}
		else if (retroNotifBackgroundColor == 2){
			notifBackgroundView.hidden = YES;
			UIColor *customNotifColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customBackgroundOldieNotifColor"];
			self.backgroundColor = customNotifColor;
		}
		if (customRetroNotifTextColor){
			self.notificationContentView.primaryLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customOldieTextNotifColor"];
			self.notificationContentView.secondaryLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customOldieTextNotifColor"];
		}
		
		self.topOldieNotifView.layer.cornerRadius = notifCornerRadius;
		self.topOldieNotifView.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
		self.topOldieNotifView.frame = CGRectMake(iconContentView.frame.origin.x,iconContentView.frame.origin.y,iconContentView.frame.size.width,iconContentView.frame.size.height-5);
	
		
		if (![[[self _viewControllerForAncestor] delegate] isKindOfClass:%c(SBNotificationBannerDestination)]){
			[self addSubview:self.topOldieNotifView];
			[self bringSubviewToFront:self.topOldieNotifView];
			[self bringSubviewToFront:self.subviews[1]];
		}
		else {
			[self addSubview:self.topOldieNotifView];
			[self bringSubviewToFront:self.topOldieNotifView];
			[self bringSubviewToFront:iconContentView];
			[self bringSubviewToFront:self.subviews[2]];
		}
	
			
	
	// end of retro notifs
	}
	self.topOldieNotifView.frame = CGRectMake(iconContentView.frame.origin.x,iconContentView.frame.origin.y,iconContentView.frame.size.width,iconContentView.frame.size.height-5);
	if (notifStyle == 2){
	
		if (!self.modernNotifBackground && !CGRectIsEmpty(self.frame)){
			self.modernNotifBackground = [NSClassFromString(@"MTMaterialView") materialViewWithRecipeNamed:@"platters" inBundle:nil configuration:1 initialWeighting:1.0 scaleAdjustment:nil];
			self.modernNotifBackground.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
			self.modernNotifBackground.layer.cornerRadius = notifCornerRadius;
			self.modernNotifBackground.translatesAutoresizingMaskIntoConstraints = YES;
			if( self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ){
				[self.modernNotifBackground setRecipeName:@"plattersDark"];
		//is dark
			}else{
				[self.modernNotifBackground setRecipeName:@"platters"];
			}
			if (modernNotifBackgroundColor == 1){
			self.modernNotifBackground.backgroundColor = [iconImage averageColor];
			}
			if (modernNotifBackgroundColor == 2){
			self.modernNotifBackground.backgroundColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customModernNotifBackgroundColor"];
			}
			[self addSubview:self.modernNotifBackground];
			[self bringSubviewToFront:self.modernNotifBackground];
		}
		if (!self.modernStyleIconImageView && notifBackgroundView && !CGRectIsEmpty(self.frame)){
			UIImage *iconImage = iconContentView.icons[0];
			self.modernStyleIconImageView = [[UIImageView alloc]init];
			self.modernStyleIconImageView.frame = CGRectMake(10,self.frame.size.height/4,self.frame.size.height/2,self.frame.size.height/2);
			self.modernStyleIconImageView.image = iconImage;
			[self addSubview:self.modernStyleIconImageView];
			[self bringSubviewToFront:self.modernStyleIconImageView];
		}
		if (self.modernStyleIconImageView){
			self.notificationContentView.frame = CGRectMake(CGRectGetMaxX(self.modernStyleIconImageView.frame)+10,CGRectGetMinY(self.modernStyleIconImageView.frame)-self.frame.size.height/10,self.notificationContentView.frame.size.width-(self.modernStyleIconImageView.frame.size.height+10),self.notificationContentView.frame.size.height);
			[self addSubview:self.notificationContentView];
			[self bringSubviewToFront:self.notificationContentView];
		}
	self.modernStyleIconImageView.frame = CGRectMake(10,self.frame.size.height/4,self.frame.size.height/2,self.frame.size.height/2);
	self.modernNotifBackground.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
	}
	 
}
%new
- (UIColor *)lighterColorForColor:(UIColor *)c {
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a]){
		return [UIColor colorWithRed:MIN(r + 0.2, 1.0) green:MIN(g + 0.2, 1.0) blue:MIN(b + 0.2, 1.0) alpha:a];
	}
    return nil;
}
%new
- (UIColor *)darkerColorForColor:(UIColor *)c{
    CGFloat h, s, b, a;
    if ([c getHue:&h saturation:&s brightness:&b alpha:&a]){
        return [UIColor colorWithHue:h saturation:s brightness:b * 0.75 alpha:a];
	}
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
	[self bringSubviewToFront:progressView];
}
}
%end

%hook SBFolderBackgroundView
-(void)setNeedsLayout{
	if (hideFolderBackground){
		self.hidden = YES;
	}
	else %orig;
}
%end
%hook SBFolderTitleTextField
-(void)setNeedsLayout{
	if (hideFolderLabel){
		self.hidden = YES;
	}
	else %orig;
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
	if (hidePageDots) {
		self.hidden = YES;
	}
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
%hook SBUICallToActionLabel
-(void)setNeedsLayout{
	if (hideSwipeToUnlock){
		self.hidden = YES;
	}
	else %orig;
}
%end
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

%hook SBUIController
- (void)ACPowerChanged { // heartlines s/o littttten

	%orig;

	if ([self isOnAC]) {
        [UIView transitionWithView:timeDateView.dateLabel duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
			[timeDateView.weatherLabel setText:[NSString stringWithFormat:@"%d%% Charged", [self batteryCapacityAsPercentage]]];
			CGFloat weatherLabelWidth = timeDateView.weatherLabel.intrinsicContentSize.width;	
			[timeDateView.weatherLabel.widthAnchor constraintEqualToConstant:weatherLabelWidth].active = YES;
			justPluggedIn = YES;
		} completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [UIView transitionWithView:timeDateView.weatherLabel duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[PDDokdo sharedInstance] refreshWeatherData];
					NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];
					NSString *temperature = [weatherData objectForKey:@"temperature"];
					NSString *conditions = [weatherData objectForKey:@"conditions"];
					NSString *location = [weatherData objectForKey:@"location"];
					NSString *combined;
					if (showCondition == 0){
						combined = [NSString stringWithFormat:@"%@, %@", temperature,conditions];
					}
					else {
						combined = [NSString stringWithFormat:@"%@, %@", temperature,location];
					}
					timeDateView.weatherLabel.text = combined;
					CGFloat weatherLabelWidth = timeDateView.weatherLabel.intrinsicContentSize.width;	
					[timeDateView.weatherLabel.widthAnchor constraintEqualToConstant:weatherLabelWidth].active = YES;
					justPluggedIn = NO;
                } completion:nil];
            });
        }];
    }

}

%end
%hook SBFLockScreenDateViewController
-(void)viewDidLoad{
	%orig;
	[self requestHeartlinesTimeAndDateUpdate];
	if (!timeAndDateTimer){
		timeAndDateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(requestHeartlinesTimeAndDateUpdate) userInfo:nil repeats:YES];
	}
}
%new 
-(void)requestHeartlinesTimeAndDateUpdate{
	if (!justPluggedIn){
		[[PDDokdo sharedInstance] refreshWeatherData];
		NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];
		NSString *temperature = [weatherData objectForKey:@"temperature"];
		NSString *conditions = [weatherData objectForKey:@"conditions"];
		NSString *location = [weatherData objectForKey:@"location"];
		NSString *combined;
		if (showCondition == 0){
			combined = [NSString stringWithFormat:@"%@, %@", temperature,conditions];
		}
		else {
			combined = [NSString stringWithFormat:@"%@, %@", temperature,location];
		}
		timeDateView.weatherLabel.text = combined;
		CGFloat weatherLabelWidth = timeDateView.weatherLabel.intrinsicContentSize.width;	
		[timeDateView.weatherLabel.widthAnchor constraintEqualToConstant:weatherLabelWidth].active = YES;
	}
	if (!isTimerRunning){
		NSDate * date = [NSDate date];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:dateFormat];
		NSString *newDateString = [dateFormatter stringFromDate:date];
		timeDateView.dateLabel.text = newDateString;
		CGFloat dateLabelWidth = timeDateView.dateLabel.intrinsicContentSize.width;
		[timeDateView.dateLabel.widthAnchor constraintEqualToConstant:dateLabelWidth].active = YES;
	}
		NSDate * now = [NSDate date];
		NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
		[timeFormatter setDateFormat:timeFormat];
		NSString *newDateString = [timeFormatter stringFromDate:now];
		timeDateView.timeLabel.text = newDateString;
		CGFloat timeLabelWidth = timeDateView.timeLabel.intrinsicContentSize.width+20;
		[timeDateView.timeLabel.widthAnchor constraintEqualToConstant:timeLabelWidth].active = YES;
}
%end
%hook SBFLockScreenDateSubtitleView

- (void)setString:(NSString *)arg1 { // apply running timer to the date label from heartlines
    %orig;
	self.hidden = YES;
    if ([arg1 containsString:@":"]) {
        isTimerRunning = YES;
        [timeDateView.dateLabel setText:arg1];
		CGFloat dateLabelWidth = timeDateView.dateLabel.intrinsicContentSize.width;	
		[timeDateView.dateLabel.widthAnchor constraintEqualToConstant:dateLabelWidth].active = YES;
    } else {
        isTimerRunning = NO;
    }
	
}
%end
%hook SBFLockScreenDateView
%property (nonatomic, retain) UILabel *timeLabel;
%property (nonatomic, retain) UILabel *dateLabel;
%property (nonatomic, retain) UILabel *weatherLabel;
%property (nonatomic, retain) UILabel *upNextLabel;
%property (nonatomic, retain) UILabel *eventLabel;
%property (nonatomic, retain) UIImageView *weatherIconView;
- (id)initWithFrame:(CGRect)frame { // create the shit man
    timeDateView = self;
    return %orig;
}
-(void)didMoveToWindow{
	%orig;
	
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	// hiding original stuff

	SBUILegibilityLabel* timeLabelToBeReplaced = (SBUILegibilityLabel *)MSHookIvar<UIView *>(self, "_timeLabel");
	SBFLockScreenDateSubtitleDateView* dateLabelToBeHidden = (SBFLockScreenDateSubtitleDateView *)MSHookIvar<UIView *>(self, "_dateSubtitleView");
	dateLabelToBeHidden.hidden = YES;
	timeLabelToBeReplaced.hidden = YES;
	// the time label setup

	if (!self.timeLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
		self.timeLabel = [UILabel new];
		[self.timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
		[timeFormatter setDateFormat:timeFormat];
		[self.timeLabel setText:[timeFormatter stringFromDate:[NSDate date]]];
		if (customFont) {
			[self.timeLabel setFont:[UIFont fontWithName:[file objectForKey:@"lockscreenClockCustomFont"] size:timeLabelHeight]];
		}
		else {
			[self.timeLabel setFont:[UIFont systemFontOfSize:timeLabelHeight]];
		}
		
		CGFloat timeLabelWidth = self.timeLabel.intrinsicContentSize.width+20;	
		[self.timeLabel.widthAnchor constraintEqualToConstant:timeLabelWidth].active = YES;
		[self.timeLabel.heightAnchor constraintEqualToConstant:timeLabelHeight].active = YES;
		[self addSubview:self.timeLabel];
		if (alignment == 0){
			[self.timeLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		}
		else if (alignment == 1){
			[self.timeLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		}
		else if (alignment == 2){
			[self.timeLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5].active = YES;
		}
		[self.timeLabel.bottomAnchor constraintEqualToAnchor:timeLabelToBeReplaced.bottomAnchor].active = YES;
	}
	
	// dateLabel setup
	if (!self.dateLabel && (!CGRectIsEmpty(self.frame))){ // i hate having to do this
		self.dateLabel = [UILabel new];
		[self.dateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		if (!isTimerRunning){
		NSDate * date = [NSDate date];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:dateFormat];
		NSString *newDateString = [dateFormatter stringFromDate:date];
		self.dateLabel.text = newDateString;
		}
		if (customFont) {
			[self.dateLabel setFont:[UIFont fontWithName:[file objectForKey:@"lockscreenClockCustomFont"] size:dateLabelHeight]];
		}
		else {
			[self.dateLabel setFont:[UIFont systemFontOfSize:dateLabelHeight]];
		}

		CGFloat dateLabelWidth = self.dateLabel.intrinsicContentSize.width;	
		[self.dateLabel.widthAnchor constraintEqualToConstant:dateLabelWidth].active = YES;
		[self.dateLabel.heightAnchor constraintEqualToConstant:dateLabelHeight].active = YES;
		[self addSubview:self.dateLabel];
		if (alignment == 0){
			[self.dateLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		}
		else if (alignment == 1){
			[self.dateLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		}
		else if (alignment == 2){
			[self.dateLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5].active = YES;
		}
		[self.dateLabel.topAnchor constraintEqualToAnchor:self.timeLabel.bottomAnchor].active = YES;
	}
	
	if (!self.weatherLabel && (!CGRectIsEmpty(self.frame)) && weatherLabelEnabled){ // i hate having to do this
		self.weatherLabel = [UILabel new];
		[self.weatherLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		if (customFont) {
			[self.weatherLabel setFont:[UIFont fontWithName:[file objectForKey:@"lockscreenClockCustomFont"] size:weatherLabelHeight]];
		}
		else {
			[self.weatherLabel setFont:[UIFont systemFontOfSize:weatherLabelHeight]];
		}
		[[PDDokdo sharedInstance] refreshWeatherData];
		NSDictionary *weatherData = [[PDDokdo sharedInstance] weatherData];
		NSString *temperature = [weatherData objectForKey:@"temperature"];
		NSString *conditions = [weatherData objectForKey:@"conditions"];
		NSString *location = [weatherData objectForKey:@"location"];
		NSString *combined;
		if (showCondition == 0){
			combined = [NSString stringWithFormat:@"%@, %@", temperature,conditions];
		}
		else {
			combined = [NSString stringWithFormat:@"%@, %@", temperature,location];
		}
		self.weatherLabel.text = combined;
		CGFloat weatherLabelWidth = self.dateLabel.intrinsicContentSize.width;	
		[self.weatherLabel.widthAnchor constraintEqualToConstant:weatherLabelWidth].active = YES;
		[self.weatherLabel.heightAnchor constraintEqualToConstant:weatherLabelHeight].active = YES;
		[self addSubview:self.weatherLabel];
		if (alignment == 0){
			[self.weatherLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		}
		else if (alignment == 1){
			[self.weatherLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		}
		else if (alignment == 2){
			[self.weatherLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5].active = YES;
		}
		[self.weatherLabel.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor].active= YES;
	}
	if (!self.weatherIconView && haveWeatherIcon && self.weatherLabel){
		[self.weatherIconView setTranslatesAutoresizingMaskIntoConstraints:NO];
		[[PDDokdo sharedInstance] refreshWeatherData];
		WALockscreenWidgetViewController* weatherWidget = [[PDDokdo sharedInstance] weatherWidget];
		WAForecastModel* currentModel = [weatherWidget currentForecastModel];
		WACurrentForecast* currentCond = [currentModel currentConditions];
		NSInteger currentCode = [currentCond conditionCode];
		int hour = [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]];
		UIImage *tempConditionImage;
			// s/o litten for doing the hard work of figuring out the codes and stuff also my code monket just leveled up so yay
		self.weatherIconView = [[UIImageView alloc]init];
		[self.weatherIconView setTranslatesAutoresizingMaskIntoConstraints:NO];
		if (currentCode <= 2)
			tempConditionImage = [UIImage systemImageNamed:@"tornado"];
		else if (currentCode <= 4)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.bolt.rain"];
		else if (currentCode <= 8)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode == 9)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode == 10)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode <= 12)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode <= 18)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode <= 22)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.fog.fill"];
		else if (currentCode <= 24)
			tempConditionImage = [UIImage systemImageNamed:@"wind"];
		else if (currentCode == 25)
			tempConditionImage = [UIImage systemImageNamed:@"snowflake"];
		else if (currentCode == 26)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.fill"];
		else if (currentCode <= 28)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.sun.fill"];
		else if (currentCode <= 30)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.sun.fill"];
		else if (currentCode <= 32 && (hour >= 18 || hour <= 6))
			tempConditionImage = [UIImage systemImageNamed:@"moon.stars.fill"];
		else if (currentCode <= 32)
			tempConditionImage = [UIImage systemImageNamed:@"snowflake"];
		else if (currentCode <= 34)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.sun.fill"];
		else if (currentCode == 35)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.fog.fill"];
		else if (currentCode == 36)
			tempConditionImage = [UIImage systemImageNamed:@"flame.fill"];
		else if (currentCode <= 38)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.bolt.fill"];
		else if (currentCode == 39)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.sun.rain.fill"];
		else if (currentCode == 40)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else if (currentCode <= 43)
			tempConditionImage = [UIImage systemImageNamed:@"cloud.rain.fill"];
		else
			tempConditionImage = [UIImage systemImageNamed:@"questionmark.circle"];
		self.weatherIconView.image = tempConditionImage;
		[self.weatherIconView.widthAnchor constraintEqualToConstant:weatherLabelHeight].active = YES;
		[self.weatherIconView.heightAnchor constraintEqualToConstant:weatherLabelHeight].active = YES;
		[self addSubview:self.weatherIconView];
		[self.weatherIconView.centerYAnchor constraintEqualToAnchor:self.weatherLabel.centerYAnchor].active = YES;
		if (alignment == 0){
			[self.weatherIconView.leftAnchor constraintEqualToAnchor:self.weatherLabel.rightAnchor constant:5].active = YES;
		}
		else if (alignment == 2){
			[self.weatherIconView.rightAnchor constraintEqualToAnchor:self.weatherLabel.leftAnchor constant:-5].active = YES;
		}
		else {
			[self.weatherIconView.leftAnchor constraintEqualToAnchor:self.weatherLabel.rightAnchor constant:5].active = YES;
		}
	}
	if (!self.upNextLabel && (!CGRectIsEmpty(self.frame)) && upNextLabelEnabled){ // i hate having to do this
		self.upNextLabel = [UILabel new];
		[self.upNextLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		if (customFont) {
			[self.upNextLabel setFont:[UIFont fontWithName:[file objectForKey:@"lockscreenClockCustomFont"] size:upNextLabelHeight]];
		}
		else {
			[self.upNextLabel setFont:[UIFont systemFontOfSize:upNextLabelHeight]];
		}
		self.upNextLabel.text = @"Up Next";
		CGFloat upNextLabelWidth = self.upNextLabel.intrinsicContentSize.width;	
		[self.upNextLabel.widthAnchor constraintEqualToConstant:upNextLabelWidth].active = YES;
		[self.upNextLabel.heightAnchor constraintEqualToConstant:upNextLabelHeight].active = YES;
		[self addSubview:self.upNextLabel];
		if (alignment == 0){
			[self.upNextLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		}
		else if (alignment == 1){
			[self.upNextLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		}
		else if (alignment == 2){
			[self.upNextLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5].active = YES;
		}
		if (!weatherLabelEnabled){
			[self.upNextLabel.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor].active= YES;
		}
		else if (weatherLabelEnabled){
			[self.upNextLabel.topAnchor constraintEqualToAnchor:self.weatherLabel.bottomAnchor].active= YES;
		}
	}
	if (!self.eventLabel && (!CGRectIsEmpty(self.frame)) && upNextLabelEnabled){ // i hate having to do this
		self.eventLabel = [UILabel new];
		[self.eventLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		if (customFont) {
			[self.eventLabel setFont:[UIFont fontWithName:[file objectForKey:@"lockscreenClockCustomFont"] size:upNextLabelHeight]];
		}
		else {
			[self.upNextLabel setFont:[UIFont systemFontOfSize:upNextLabelHeight]];
		}
		[self setUpUpNext];
		CGFloat eventLabelWidth = self.eventLabel.intrinsicContentSize.width;	
		[self.eventLabel.widthAnchor constraintEqualToConstant:eventLabelWidth].active = YES;
		[self.eventLabel.heightAnchor constraintEqualToConstant:eventLabelHeight].active = YES;
		[self addSubview:self.eventLabel];
		if (alignment == 0){
			[self.eventLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		}
		else if (alignment == 1){
			[self.eventLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		}
		else if (alignment == 2){
			[self.eventLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5].active = YES;
		}
		
		
		[self.eventLabel.topAnchor constraintEqualToAnchor:self.upNextLabel.bottomAnchor].active= YES;
		
	}
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	NSArray *tempColorArray = [preferences objectForKey:@"colorArray"];
 	UIColor *wallpaperAverageColor2 = [UIColor colorFromHexString:tempColorArray[lockscreenClockColor]];
	if (!customLockscreenColor){
			if (timeLabelColored){
				self.timeLabel.textColor = wallpaperAverageColor2;
			}
			if (dateLabelColored){
				self.weatherLabel.textColor = wallpaperAverageColor2;
			}
			if (weatherLabelColored){
				self.dateLabel.textColor = wallpaperAverageColor2;
			}
			if (upNextLabelColored){
				self.upNextLabel.textColor = wallpaperAverageColor2;
			}
			if (weatherIconColored){
				self.weatherIconView.image = [self.weatherIconView.image imageWithTintColor:wallpaperAverageColor2 renderingMode:UIImageRenderingModeAlwaysOriginal];
			}
			else {
				self.weatherIconView.image = [self.weatherIconView.image imageWithTintColor:[UIColor blackColor] renderingMode:UIImageRenderingModeAlwaysOriginal];
			}
	}
	else {
		self.timeLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"];
		self.dateLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"];
		self.weatherLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"];
		self.upNextLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"];
		self.eventLabel.textColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"];
		self.weatherIconView.image = [self.weatherIconView.image imageWithTintColor:[GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLockscreenClockColor"] renderingMode:UIImageRenderingModeAlwaysOriginal];
	}	
}
%new 
-(void)setUpUpNext{
	EKEventStore* store = [EKEventStore new];
	NSCalendar* calendar = [NSCalendar currentCalendar];

	NSDateComponents* todayEventsComponents = [NSDateComponents new];
	todayEventsComponents.day = 0;
	NSDate* todayEvents = [calendar dateByAddingComponents:todayEventsComponents toDate:[NSDate date] options:0];

	NSDateComponents* todayRemindersComponents = [NSDateComponents new];
	todayRemindersComponents.day = -7;
	NSDate* todayReminders = [calendar dateByAddingComponents:todayRemindersComponents toDate:[NSDate date] options:0];

	NSDateComponents* daysFromNowComponents = [NSDateComponents new];
	daysFromNowComponents.day = 7;
	NSDate* daysFromNow = [calendar dateByAddingComponents:daysFromNowComponents toDate:[NSDate date] options:0];

	NSPredicate* calendarPredicate = [store predicateForEventsWithStartDate:todayEvents endDate:daysFromNow calendars:nil];

	NSArray* events = [store eventsMatchingPredicate:calendarPredicate];
	NSPredicate* reminderPredicate = [store predicateForIncompleteRemindersWithDueDateStarting:todayReminders ending:daysFromNow calendars:nil];
	__block NSArray* availableReminders;

	[store fetchRemindersMatchingPredicate:reminderPredicate completion:^(NSArray *reminders) {      

	availableReminders = reminders;      
	dispatch_async(dispatch_get_main_queue(), ^{
		if (lockscreenPriority == 0) {
			if ([availableReminders count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"Reminder: %@",[availableReminders[0] title]]];
				return;
			}
			else if ([events count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"Event: %@",[events[0] title]]];
				return;
			}
			else {
				if ([[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm]) {
				dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
					NSDate* fireDate = [[[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm] nextFireDate];
					NSDateComponents* components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:fireDate];
					[self.eventLabel setText:[NSString stringWithFormat:@"Alarm: %02ld:%02ld",[components hour], [components minute]]];
					return;
				});
				}
			}
		}
		else if (lockscreenPriority == 1) {
			if ([[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm]) {
				dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
				NSDate* fireDate = [[[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm] nextFireDate];
				NSDateComponents* components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:fireDate];
				[self.eventLabel setText:[NSString stringWithFormat:@"Alarm: %02ld:%02ld",[components hour], [components minute]]];
				return;
			});
			}
			else if ([availableReminders count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"%@",[availableReminders[0] title]]];
				return;
			}
			else if ([events count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"Event: %@",[events[0] title]]];
				return;
			}
			
		}
		else if (lockscreenPriority == 2) {
			if ([events count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"Event: %@",[events[0] title]]];
				return;
			}
			else if ([[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm]) {
				dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
				NSDate* fireDate = [[[[[%c(SBScheduledAlarmObserver) sharedInstance] valueForKey:@"_alarmManager"] cache] nextAlarm] nextFireDate];
				NSDateComponents* components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:fireDate];
				[self.eventLabel setText:[NSString stringWithFormat:@"Alarm: %02ld:%02ld",[components hour], [components minute]]];
				return;
			});
			}
			else if ([availableReminders count]){
				[self.eventLabel setText:[NSString stringWithFormat:@"%@",[availableReminders[0] title]]];
				return;
			}
		}
	});
}];
}
%end
%hook CSCombinedListViewController
- (double)_minInsetsToPushDateOffScreen {
	double orig = %orig;
	if (weatherLabelEnabled && upNextLabelEnabled){
		return orig + 60;
	}
	return orig;
}
%end
%hook CSPageControl 
-(void)setNeedsLayout{
	if (hideLockscreenDots){
		self.hidden = YES;
	}
	else %orig;
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
%end
%group testnotif
%hook BBServer
-(id)initWithQueue:(id)arg1{
    bbServer = %orig;
    return bbServer;
}

-(void)dealloc{
    if(bbServer == self) bbServer = nil;
    %orig;
}
%end
%end
static void localSBNotif(){
	BBBulletin* bulletin = [[%c(BBBulletin) alloc] init];
	bulletin.title = @"Aquarius";
    bulletin.message = @"Test Banner!";
    bulletin.sectionID = @"com.apple.Preferences";
    bulletin.bulletinID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.recordID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.publisherBulletinID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.date = [NSDate new];
    bulletin.clearable = YES;
    bulletin.showsMessagePreview = YES;

	if(bbServer){
        dispatch_sync(__BBServerQueue, ^{
            [bbServer publishBulletin:bulletin destinations:15];
        });
    } 
}
static void localLSNotif(){
    [[%c(SBLockScreenManager) sharedInstance] lockUIFromSource:1 withOptions:nil];

	BBBulletin* bulletin = [[%c(BBBulletin) alloc] init];
	bulletin.title = @"Aquarius";
	bulletin.message = @"Test Notification!";
    bulletin.sectionID = @"com.apple.MobileSMS";
    bulletin.bulletinID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.recordID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.publisherBulletinID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.date = [NSDate new];
    bulletin.clearable = YES;
    bulletin.showsMessagePreview = YES;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		if(bbServer){
			dispatch_sync(__BBServerQueue, ^{
				[bbServer publishBulletin:bulletin destinations:4];
            });
        }
    });
}

%ctor {
	isTweakEnabled = [file boolForKey:@"isTweakEnabled"];
	modernNotifBackgroundColor = [file integerForKey:@"modernNotifBackgroundColor"];
	howManyDaysInAdvance = [file integerForKey:@"howManyDaysInAdvance"];
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
	hideSwipeToUnlock = [file boolForKey:@"hideSwipeToUnlock"];
	configurations = [file integerForKey:@"configuration"];
	lockscreenClockColor = [file integerForKey:@"lockscreenClockColor"];
	showCondition = [file integerForKey:@"showCondition"];
	notifStyle = [file integerForKey:@"notifStyle"];
	topOldieColor = [file integerForKey:@"topOldieColor"];
	alignment = [file integerForKey:@"alignment"];
	lockscreenPriority = [file integerForKey:@"lockscreenPriority"];
	musicPlayerAlpha = [file doubleForKey:@"musicPlayerAlpha"];
	weatherLabelHeight = [file doubleForKey:@"weatherLabelHeight"];
	rightOffsetForText = [file doubleForKey:@"textOffset"];
	musicPlayerColorsEnabled = [file boolForKey:@"isColorsEnabled"];
	haveNotifs = [file boolForKey:@"notifications?"];
	showPercentage = [file boolForKey:@"showPercentage"];
	isBackgroundColored = [file boolForKey:@"isBackgroundColorEnabled"];
	isArtworkBackground = [file boolForKey:@"isArtworkBackground"];
	isNotificationSectionEnabled = [file boolForKey:@"isNotificationSectionEnabled"];
	haveOutline = [file boolForKey:@"haveOutline?"];
	hideFolderLabel = [file boolForKey:@"hideFolderLabel"];
	outlineSize = [file doubleForKey:@"sizeOfOutline"];
	musicPlayerCornerRadius = [file doubleForKey:@"musicPlayerCornerRadius"];
	notifCornerRadius = [file doubleForKey:@"notifsCornerRadius"];
	dateLabelHeight = [file doubleForKey:@"dateLabelHeight"];
	timeLabelHeight = [file doubleForKey:@"timeLabelHeight"];
	upNextLabelHeight = [file doubleForKey:@"upNextLabelHeight"];
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
	upNextLabelEnabled = [file boolForKey:@"upNextLabelEnabled"];
	hideHomeBar = [file boolForKey:@"hideHomeBar"];
	retroNotifBackgroundColor = [file integerForKey:@"retroNotifBackgroundColor"];
	hideDock = [file boolForKey:@"hideDock"];
	upNextLabelColored = [file boolForKey:@"upNextLabelColored"];
	hideLockscreenDots = [file boolForKey:@"hideLockscreenDots"];
	enableGestures = [file boolForKey:@"enableGestures"];
	haveQuickActions = [file boolForKey:@"haveQuickActions"];
	showsPercentage = [file boolForKey:@"showsPercentage"];
	hideBreadcrumbs = [file boolForKey:@"hideBreadcrumbs"];
	newStatusBar = [file boolForKey:@"newStatusBar"];
	retroNotifVibe = [file boolForKey:@"retroNotif"];
	oldieNotifHaveShadow = [file boolForKey:@"oldieNotifHaveShadow"];
	newKeyboard = [file boolForKey:@"newKeyboard"];
	timeLabelColored = [file boolForKey:@"timeLabelColored"];
	weatherLabelColored = [file boolForKey:@"weatherLabelColored"];
	dateLabelColored = [file boolForKey:@"dateLabelColored"];
	customRetroNotifTextColor = [file boolForKey:@"customRetroNotifTextColor"];
	dateFormat = [file objectForKey:@"dateFormat"];
	hideFolderBackground = [file boolForKey:@"hideFolderBackground"];
	customFont = [file boolForKey:@"customFont"];
	haveWeatherIcon = [file boolForKey:@"haveWeatherIcon"];
	customLockscreenColor = [file boolForKey:@"customLockscreenColor"];
	weatherIconColored = [file boolForKey:@"weatherIconColored"];
	timeFormat = [file objectForKey:@"timeFormat"];
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:NO forKey:@"isMusicSectionEnabled"];
	[file registerBool:&isTweakEnabled default:NO forKey:@"isTweakEnabled"];
	[file registerBool:&upNextLabelEnabled default:NO forKey:@"upNextLabelEnabled"];
	[file registerBool:&hideFolderBackground default:NO forKey:@"hideFolderBackground"];
	[file registerBool:&hideFolderLabel default:NO forKey:@"hideFolderLabel"];
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
	[file registerBool:&weatherIconColored default:NO forKey:@"weatherIconColored"];
	[file registerBool:&upNextLabelColored default:NO forKey:@"upNextLabelColored"];	
	[file registerBool:&modernStatusBar default:NO forKey:@"modernStatusBar"];
	[file registerBool:&newKeyboard default:NO forKey:@"newKeyboard"];
	[file registerBool:&statusBarSectionEnabled default:NO forKey:@"isStatusBarSectionEnabled"];
	[file registerBool:&hideSwipeToUnlock default:NO forKey:@"hideSwipeToUnlock"];
	[file registerBool:&oldieNotifHaveShadow default:1 forKey:@"oldieNotifHaveShadow"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&eventLabelHeight default:1 forKey:@"eventLabelHeight"];
	[file registerDouble:&notifShadowOpacity default:.25 forKey:@"oldieNotifShadowOpacity"];
	[file registerDouble:&timeLabelHeight default:72 forKey:@"timeLabelHeight"];
	[file registerDouble:&dateLabelHeight default:24 forKey:@"dateLabelHeight"];
	[file registerDouble:&weatherLabelHeight default:24 forKey:@"weatherLabelHeight"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&modernNotifBackgroundColor default:0 forKey:@"modernNotifBackgroundColor"];
	[file registerInteger:&howManyDaysInAdvance default:1 forKey:@"howManyDaysInAdvance"];
	[file registerInteger:&configurations default:3 forKey:@"configuration"];
	[file registerInteger:&showCondition default:0 forKey:@"showCondition"];
	
	[file registerInteger:&notifStyle default:0 forKey:@"notifStyle"];
	[file registerInteger:&topOldieColor default:0 forKey:@"topOldieColor"];
	[file registerInteger:&alignment default:0 forKey:@"alignment"];
	[file registerBool:&customRetroNotifTextColor default:NO forKey:@"customRetroNotifTextColor"];
	[file registerBool:&haveWeatherIcon default:NO forKey:@"haveWeatherIcon"];
	[file registerBool:&customLockscreenColor default:NO forKey:@"customLockscreenColor"];
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
	[file registerDouble:&eventLabelHeight default:24 forKey:@"eventLabelHeight"];
	[file registerDouble:&notifCornerRadius default:13 forKey:@"notifsCornerRadius"];
	[file registerDouble:&upNextLabelHeight default:24 forKey:@"upNextLabelHeight"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
	[file registerBool:&isSpringySectionEnabled default:NO forKey:@"isSpringySectionEnabled"];
	[file registerBool:&isLockscreenSectionEnabled default:YES forKey:@"isLockscreenSectionEnabled"];
	[file registerBool:&downloadBarEnabled default:NO forKey:@"downloadBarEnabled"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	[file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
	[file registerBool:&customImageBackgroundBOOL default:NO forKey:@"customImageBackground?"];
	[file registerBool:&hideLockscreenDots default:NO forKey:@"hideLockscreenDots"];
	[file registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];
	[file registerBool:&newStatusBar default:NO forKey:@"newStatusBar"];
	[file registerBool:&showsPercentage default:NO forKey:@"showsPercentage"];
	[file registerBool:&weatherLabelEnabled default:NO forKey:@"weatherLabelEnabled"];
	[file registerBool:&hideBreadcrumbs default:NO forKey:@"hideBreadcrumbs"];
	[file registerBool:&retroNotifVibe default:NO forKey:@"retroNotif"];
	[file registerBool:&customFont default:NO forKey:@"customFont"];
	[file registerBool:&timeLabelColored default:NO forKey:@"timeLabelColored"];
	[file registerBool:&dateLabelColored default:NO forKey:@"dateLabelColored"];
	[file registerBool:&weatherLabelColored default:NO forKey:@"weatherLabelColored"];
	[file registerInteger:&retroNotifBackgroundColor default:0 forKey:@"retroNotifBackgroundColor"];
	[file registerInteger:&lockscreenClockColor default:0 forKey:@"lockscreenClockColor"];
	[file registerInteger:&lockscreenPriority default:0 forKey:@"lockscreenPriority"];
	[file registerInteger:&ogNotifBackgroundColor default:0 forKey:@"ogNotifBackgroundColor"];
	
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
		if (isLockscreenSectionEnabled){
			%init(Lockscreen);
		}
		if (enableGestures){
			%init(gesturesAndModernShit);
		}
		%init(testnotif)
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)localLSNotif, CFSTR("com.nico671.testNotif"), NULL, (CFNotificationSuspensionBehavior)kNilOptions);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)localSBNotif, CFSTR("com.nico671.testBanner"), NULL, (CFNotificationSuspensionBehavior)kNilOptions);
}