#line 1 "Tweak.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBUIController; @class CSAdjunctItemView; @class SBIconListPageControl; @class SBClickGestureRecognizer; @class SBLockHardwareButtonActions; @class SBLockHardwareButton; @class SpringBoard; @class MRUNowPlayingHeaderView; @class CSQuickActionsView; @class SBFLockScreenDateView; @class NCNotificationContentView; @class CSCoverSheetViewController; @class SBPressGestureRecognizer; @class SBIconProgressView; @class MRUNowPlayingControlsView; @class MTLumaDodgePillSettings; @class SBIconView; @class NCNotificationShortLookView; @class _UIBatteryView; @class _UIStatusBarSignalView; @class NCNotificationListCell; @class SBDockView; @class SBHomeHardwareButton; @class _UIStatusBarData; @class _UIStatusBarStringView; @class _UIStatusBarWifiSignalView; @class SBFStaticWallpaperView; @class PLPlatterHeaderContentView; @class BSPlatform; @class MRUNowPlayingTransportControlsView; @class SBBacklightController; @class MRUNowPlayingLabelView; @class _UIStatusBarCellularSignalView; @class _UIStatusBarVisualProvider_iOS; @class SBFloatingDockPlatterView; @class NCNotificationListSectionRevealHintView; @class _UIStatusBarVisualProvider_Split54; @class SBHomeHardwareButtonActions; @class SBMainSwitcherViewController; @class SBMediaController; @class SBHDefaultIconListLayoutProvider; @class SBVolumeHardwareButton; 


#line 1 "Tweak.xm"
#import "headers.h"
static void (*_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$musicplayer$MRUNowPlayingHeaderView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, CGRect *); static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setFrame$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, CGRect *); static void (*_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingLabelView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingLabelView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic)(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$)(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$musicplayer$SBMediaController$setNowPlayingInfo$(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); 
 
static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(self, _cmd, arg1);
	}
	else if ( controller.context == 2 && isRoutingButtonHidden) {
		arg1 = NO;
	}
	_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(self, _cmd, arg1);
}

static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setFrame$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect * arg1) {
	_logos_orig$musicplayer$MRUNowPlayingHeaderView$setFrame$(self, _cmd, arg1);
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if([controller respondsToSelector:@selector(context)] && controller.context == 2) {
	
	self.artworkView.hidden = YES;
	}

}


static void _logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor]; 
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



static void _logos_method$musicplayer$MRUNowPlayingLabelView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		_logos_orig$musicplayer$MRUNowPlayingLabelView$setNeedsLayout(self, _cmd);
	}
	if([controller respondsToSelector:@selector(context)] && controller.context == 2){
	self.hidden = YES;
	}
}


 
static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews(self, _cmd);
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



 

static void _logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic(self, _cmd);
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
          _logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic(self, _cmd);
        }
}


static void _logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
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



static void _logos_method$musicplayer$SBMediaController$setNowPlayingInfo$(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$(self, _cmd, arg1);
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



static void (*_logos_orig$statusbar$_UIBatteryView$setFillColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIBatteryView$setBodyColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static double (*_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); 


static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
  UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	_logos_orig$statusbar$_UIBatteryView$setFillColor$(self, _cmd, customColor);
	if(isBatteryHidden) self.hidden = YES;
}

static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	_logos_orig$statusbar$_UIBatteryView$setBodyColor$(self, _cmd, customColor);
}


static double _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 20;
}



static void _logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(self, _cmd);
	if (isWifiThingyHidden){
	self.hidden = YES;
	}
}


static void _logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(self, _cmd);
	if (isCellularThingyHidden){
	self.hidden = YES;
	}

}



static void _logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$(self, _cmd, customColor);
}

static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$(self, _cmd, customColor);
}





static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow(self, _cmd);
	if (isTimeHidden){
	self.hidden = YES;
	}
}
static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
	_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$(self, _cmd, customColor);
}




static void (*_logos_orig$notifications$NCNotificationListCell$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationListCell$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationShortLookView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$notifications$NCNotificationListCell$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$notifications$NCNotificationListCell$setNeedsLayout(self, _cmd);
	if (isNotificationSectionEnabled){
	self.backgroundColor = [UIColor clearColor];
	}

}



static void _logos_method$notifications$NCNotificationContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$notifications$NCNotificationContentView$setNeedsLayout(self, _cmd);
	if (hideSnapImage){
	UIImageView *replacementSnapImage = (UIImageView*)MSHookIvar<UIImageView*>(self, "_thumbnailImageView");
	replacementSnapImage.hidden = YES;
	}
}



static void _logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout(self, _cmd);
	if (colorNotifs){
	iconImage = [self.icons objectAtIndex:0];
	}
}




static void _logos_method$notifications$NCNotificationShortLookView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout(self, _cmd);
	if (colorNotifs){
	self.backgroundColor = [NCImageUtils averageColor:iconImage];
	self.layer.cornerRadius = notifCornerRadius;
	yesmf = [self.subviews objectAtIndex:0];
	yesmf.hidden = YES;
	}
	if (leafCornerNotifs){
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
	}
}




static void (*_logos_orig$springy$SBIconProgressView$_drawPieWithCenter$)(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$springy$SBIconProgressView$_drawPieWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void (*_logos_orig$springy$SBIconProgressView$_drawPauseUIWithCenter$)(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$springy$SBIconProgressView$_drawPauseUIWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void (*_logos_orig$springy$SBIconView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBIconView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$springy$SBIconListPageControl$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBIconListPageControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBIconListPageControl$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconListPageControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$springy$SBDockView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBDockView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$springy$SBFloatingDockPlatterView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockPlatterView* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBFloatingDockPlatterView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockPlatterView* _LOGOS_SELF_CONST, SEL); 
 

static void _logos_method$springy$SBIconProgressView$_drawPieWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1){
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
static void _logos_method$springy$SBIconProgressView$_drawPauseUIWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1){
if (downloadBarEnabled){

}
else {
	_logos_orig$springy$SBIconProgressView$_drawPauseUIWithCenter$(self, _cmd, arg1);
}
}





static void _logos_method$springy$SBIconView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$springy$SBIconView$setNeedsLayout(self, _cmd);
	if (hideLabels){
		self.labelHidden = 1;
	}


}



static void _logos_method$springy$SBIconListPageControl$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconListPageControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$springy$SBIconListPageControl$setNeedsLayout(self, _cmd);
	if (hidePageDots) self.hidden = YES;
}


static void _logos_method$springy$SBDockView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if (hideDock){
	self.hidden = YES;
	}
}


static void _logos_method$springy$SBFloatingDockPlatterView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFloatingDockPlatterView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if (hideDock){
	self.hidden = YES;
	}
}


static void (*_logos_orig$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL, BOOL); static void _logos_method$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL, BOOL, BOOL); static void (*_logos_orig$Lockscreen$CSCoverSheetViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Lockscreen$CSCoverSheetViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Lockscreen$NCNotificationListSectionRevealHintView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$NCNotificationListSectionRevealHintView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Lockscreen$SBFStaticWallpaperView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBFStaticWallpaperView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$SBFStaticWallpaperView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFStaticWallpaperView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Lockscreen$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$)(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static SBFLockScreenDateView* (*_logos_orig$Lockscreen$SBFLockScreenDateView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT SBFLockScreenDateView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static SBFLockScreenDateView* _logos_method$Lockscreen$SBFLockScreenDateView$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBFLockScreenDateView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Lockscreen$SBFLockScreenDateView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$SBFLockScreenDateView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Lockscreen$SBFLockScreenDateView$_updateLabels)(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$SBFLockScreenDateView$_updateLabels(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Lockscreen$SBFLockScreenDateView$setTextColorToWallpaperColor$(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST, SEL, NSNotification *); 


static void _logos_method$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, BOOL arg2, BOOL arg3) { 

	_logos_orig$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(self, _cmd, NO, NO, NO);

}



static void _logos_method$Lockscreen$NCNotificationListSectionRevealHintView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if (hideNoOlderNotifs) self.hidden = YES;
}


static void _logos_method$Lockscreen$SBFStaticWallpaperView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFStaticWallpaperView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$Lockscreen$SBFStaticWallpaperView$setNeedsLayout(self, _cmd);
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



static void _logos_method$Lockscreen$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	_logos_orig$Lockscreen$SBUIController$ACPowerChanged(self, _cmd);

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




static void _logos_method$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long source) { 
	_logos_orig$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$(self, _cmd, source);
	[[PDDokdo sharedInstance] refreshWeatherData];
}



static void _logos_method$Lockscreen$CSCoverSheetViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) { 
	_logos_orig$Lockscreen$CSCoverSheetViewController$viewWillAppear$(self, _cmd, animated);
	[[PDDokdo sharedInstance] refreshWeatherData];
}



__attribute__((used)) static UILabel * _logos_property$Lockscreen$SBFLockScreenDateView$timeLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$timeLabel); };
__attribute__((used)) static void _logos_property$Lockscreen$SBFLockScreenDateView$setTimeLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$timeLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_property$Lockscreen$SBFLockScreenDateView$dateLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$dateLabel); };
__attribute__((used)) static void _logos_property$Lockscreen$SBFLockScreenDateView$setDateLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$dateLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_property$Lockscreen$SBFLockScreenDateView$weatherLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$weatherLabel); };
__attribute__((used)) static void _logos_property$Lockscreen$SBFLockScreenDateView$setWeatherLabel(SBFLockScreenDateView * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$weatherLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImageView * _logos_property$Lockscreen$SBFLockScreenDateView$weatherImageView(SBFLockScreenDateView * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$weatherImageView); };
__attribute__((used)) static void _logos_property$Lockscreen$SBFLockScreenDateView$setWeatherImageView(SBFLockScreenDateView * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$Lockscreen$SBFLockScreenDateView$weatherImageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static SBFLockScreenDateView* _logos_method$Lockscreen$SBFLockScreenDateView$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBFLockScreenDateView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED { 
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
    id orig = _logos_orig$Lockscreen$SBFLockScreenDateView$initWithFrame$(self, _cmd, frame);
    timeDateView = self;

    return orig;

}
static void _logos_method$Lockscreen$SBFLockScreenDateView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$Lockscreen$SBFLockScreenDateView$setNeedsLayout(self, _cmd);
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTextColorToWallpaperColor:) name:@"NotificationMessageEvent" object:nil];
}
static void _logos_method$Lockscreen$SBFLockScreenDateView$_updateLabels(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$Lockscreen$SBFLockScreenDateView$_updateLabels(self, _cmd);
	
	SBUILegibilityLabel* timeLabelToBeReplaced = (SBUILegibilityLabel *)MSHookIvar<UIView *>(self, "_timeLabel");
	SBFLockScreenDateSubtitleDateView* dateLabelToBeHidden = (SBFLockScreenDateSubtitleDateView *)MSHookIvar<UIView *>(self, "_dateSubtitleView");
	dateLabelToBeHidden.hidden = YES;
	timeLabelToBeReplaced.hidden = YES;
	
	if (!self.timeLabel && (!CGRectIsEmpty(self.frame))){ 
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
	
	if (!self.dateLabel && (!CGRectIsEmpty(self.frame))){ 
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
	if (!self.weatherLabel && (!CGRectIsEmpty(self.frame)) && weatherLabelEnabled){ 
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

static void _logos_method$Lockscreen$SBFLockScreenDateView$setTextColorToWallpaperColor$(_LOGOS_SELF_TYPE_NORMAL SBFLockScreenDateView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
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



static long long (*_logos_orig$gesturesAndModernShit$BSPlatform$homeButtonType)(_LOGOS_SELF_TYPE_NORMAL BSPlatform* _LOGOS_SELF_CONST, SEL); static long long _logos_method$gesturesAndModernShit$BSPlatform$homeButtonType(_LOGOS_SELF_TYPE_NORMAL BSPlatform* _LOGOS_SELF_CONST, SEL); static SBLockHardwareButtonActions* (*_logos_orig$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$)(_LOGOS_SELF_TYPE_INIT SBLockHardwareButtonActions*, SEL, NSInteger, id) _LOGOS_RETURN_RETAINED; static SBLockHardwareButtonActions* _logos_method$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButtonActions*, SEL, NSInteger, id) _LOGOS_RETURN_RETAINED; static SBHomeHardwareButtonActions* (*_logos_orig$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$)(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButtonActions*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static SBHomeHardwareButtonActions* _logos_method$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButtonActions*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$)(_LOGOS_SELF_TYPE_NORMAL SBPressGestureRecognizer* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$(_LOGOS_SELF_TYPE_NORMAL SBPressGestureRecognizer* _LOGOS_SELF_CONST, SEL, NSArray *); static void (*_logos_orig$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$)(_LOGOS_SELF_TYPE_NORMAL SBClickGestureRecognizer* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$(_LOGOS_SELF_TYPE_NORMAL SBClickGestureRecognizer* _LOGOS_SELF_CONST, SEL, id); static SBHomeHardwareButton* (*_logos_orig$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$)(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButton*, SEL, id, NSInteger) _LOGOS_RETURN_RETAINED; static SBHomeHardwareButton* _logos_method$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButton*, SEL, id, NSInteger) _LOGOS_RETURN_RETAINED; static SBLockHardwareButton* (*_logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$)(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton*, SEL, id, id, id, id, id, id, NSInteger, _Bool) _LOGOS_RETURN_RETAINED; static SBLockHardwareButton* _logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton*, SEL, id, id, id, id, id, id, NSInteger, _Bool) _LOGOS_RETURN_RETAINED; static SBLockHardwareButton* (*_logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$)(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton*, SEL, id, id, id, id, id, NSInteger) _LOGOS_RETURN_RETAINED; static SBLockHardwareButton* _logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton*, SEL, id, id, id, id, id, NSInteger) _LOGOS_RETURN_RETAINED; static SBVolumeHardwareButton* (*_logos_orig$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$)(_LOGOS_SELF_TYPE_INIT SBVolumeHardwareButton*, SEL, id, id, NSInteger) _LOGOS_RETURN_RETAINED; static SBVolumeHardwareButton* _logos_method$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBVolumeHardwareButton*, SEL, id, id, NSInteger) _LOGOS_RETURN_RETAINED; static BOOL (*_logos_orig$gesturesAndModernShit$CSQuickActionsView$_prototypingAllowsButtons)(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$gesturesAndModernShit$CSQuickActionsView$_prototypingAllowsButtons(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$gesturesAndModernShit$CSQuickActionsView$_layoutQuickActionButtons)(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$gesturesAndModernShit$CSQuickActionsView$_layoutQuickActionButtons(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$)(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, double); static NSUInteger (*_logos_orig$gesturesAndModernShit$SBHDefaultIconListLayoutProvider$screenType)(_LOGOS_SELF_TYPE_NORMAL SBHDefaultIconListLayoutProvider* _LOGOS_SELF_CONST, SEL); static NSUInteger _logos_method$gesturesAndModernShit$SBHDefaultIconListLayoutProvider$screenType(_LOGOS_SELF_TYPE_NORMAL SBHDefaultIconListLayoutProvider* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarData* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarData* _LOGOS_SELF_CONST, SEL, id); static Class (*_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static Class _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static CGSize (*_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static CGSize _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$height)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$gesturesAndModernShit$SBMainSwitcherViewController$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBMainSwitcherViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$gesturesAndModernShit$SBMainSwitcherViewController$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBMainSwitcherViewController* _LOGOS_SELF_CONST, SEL); 

static long long _logos_method$gesturesAndModernShit$BSPlatform$homeButtonType(_LOGOS_SELF_TYPE_NORMAL BSPlatform* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 2;
}


static SBLockHardwareButtonActions* _logos_method$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButtonActions* __unused self, SEL __unused _cmd, NSInteger arg1, id arg2) _LOGOS_RETURN_RETAINED {
	if (!newButtonCombo) {
    return _logos_orig$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$(self, _cmd, 1, arg2);
	}
	else return _logos_orig$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$(self, _cmd, arg1, arg2);
}



static SBHomeHardwareButtonActions* _logos_method$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButtonActions* __unused self, SEL __unused _cmd, NSInteger arg1) _LOGOS_RETURN_RETAINED {
	if (!newButtonCombo) {
    return _logos_orig$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$(self, _cmd, 1);
	}
	else return _logos_orig$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$(self, _cmd, arg1);
}




static void _logos_method$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
    applicationDidFinishLaunching = 2;
    _logos_orig$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
}



static void _logos_method$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$(_LOGOS_SELF_TYPE_NORMAL SBPressGestureRecognizer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
	if (!newButtonCombo) {
    NSArray * lockHome = @[@104, @101];
    NSArray * lockVol = @[@104, @102, @103];
    if (applicationDidFinishLaunching == 2 && [arg1 isEqual:lockVol]) {
        _logos_orig$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$(self, _cmd, lockHome);
        applicationDidFinishLaunching--;
        return;
    }
    _logos_orig$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$(self, _cmd, arg1);
	}
	else _logos_orig$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$(self, _cmd, arg1);
}



static void _logos_method$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$(_LOGOS_SELF_TYPE_NORMAL SBClickGestureRecognizer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	if (!newButtonCombo) {
    if (applicationDidFinishLaunching == 1) {
        applicationDidFinishLaunching--;
        return;
    }
    _logos_orig$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$(self, _cmd, arg1);
	} 
	else _logos_orig$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$(self, _cmd, arg1);
}



static SBHomeHardwareButton* _logos_method$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBHomeHardwareButton* __unused self, SEL __unused _cmd, id arg1, NSInteger arg2) _LOGOS_RETURN_RETAINED {
	if (!newButtonCombo) {
    return _logos_orig$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$(self, _cmd, arg1, 1);
	}
	else return _logos_orig$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$(self, _cmd, arg1, arg2);
}



static SBLockHardwareButton* _logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton* __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4, id arg5, id arg6, NSInteger arg7, _Bool arg8) _LOGOS_RETURN_RETAINED {
 	if (!newButtonCombo) {
	return _logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$(self, _cmd, arg1,arg2,arg3,arg4,arg5,arg6,1,arg8);
	}
	else return _logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}
static SBLockHardwareButton* _logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBLockHardwareButton* __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4, id arg5, NSInteger arg6) _LOGOS_RETURN_RETAINED {
	if (!newButtonCombo) {
	return _logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$(self, _cmd, arg1,arg2,arg3,arg4,arg5,1);
	}
	else return _logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);
}



static SBVolumeHardwareButton* _logos_method$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$(_LOGOS_SELF_TYPE_INIT SBVolumeHardwareButton* __unused self, SEL __unused _cmd, id arg1, id arg2, NSInteger arg3) _LOGOS_RETURN_RETAINED {
    if (!newButtonCombo) {
	return _logos_orig$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$(self, _cmd, arg1,arg2,1);
	}
	else return _logos_orig$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$(self, _cmd, arg1, arg2, arg3);
}


static BOOL _logos_method$gesturesAndModernShit$CSQuickActionsView$_prototypingAllowsButtons(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return haveQuickActions;
}
static void _logos_method$gesturesAndModernShit$CSQuickActionsView$_layoutQuickActionButtons(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    CGRect const screenBounds = [UIScreen mainScreen].bounds;
    int const y = screenBounds.size.height - 90 - [self _buttonOutsets].top;

    [self flashlightButton].frame = CGRectMake(46, y, 50, 50);
    [self cameraButton].frame = CGRectMake(screenBounds.size.width - 96, y, 50, 50);
}


static void _logos_method$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	if (hideHomeBar){
	_logos_orig$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$(self, _cmd, 0);
	}
	else {
		_logos_orig$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$(self, _cmd, arg1);
	}
}


static NSUInteger _logos_method$gesturesAndModernShit$SBHDefaultIconListLayoutProvider$screenType(_LOGOS_SELF_TYPE_NORMAL SBHDefaultIconListLayoutProvider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return UIScreen.mainScreen.screenSizeCategory - 1;
}


static void _logos_method$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	if (hideBreadcrumbs){
    return;
	}
	else return _logos_orig$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$(self, _cmd, arg1);
}


static Class _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if (newStatusBar == NO){
		return NSClassFromString(@"_UIStatusBarVisualProvider_LegacyPhone");
	}
	else return _logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class(self, _cmd);
}


static CGSize _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    CGSize const orig = _logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize(self, _cmd);
    return CGSizeMake(orig.width, 18);
}
static double _logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 20;
}



 
static BOOL _logos_method$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (showsPercentage){
       return YES;
	}
	else return _logos_orig$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage(self, _cmd);
  
}
static BOOL _logos_method$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (showsPercentage){
		return NO;
	}
	else return _logos_orig$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt(self, _cmd);
}


static void _logos_method$gesturesAndModernShit$SBMainSwitcherViewController$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBMainSwitcherViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	self.hidden = YES;
}


void reloadPrefs() {
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
	weatherLabelEnabled = [file boolForKey:@"weatherLabelEnabled"];
	hideHomeBar = [file boolForKey:@"hideHomeBar"];
	hideDock = [file boolForKey:@"hideDock"];
	enableGestures = [file boolForKey:@"enableGestures"];
	haveQuickActions = [file boolForKey:@"haveQuickActions"];
	showsPercentage = [file boolForKey:@"showsPercentage"];
	hideBreadcrumbs = [file boolForKey:@"hideBreadcrumbs"];
	newStatusBar = [file boolForKey:@"newStatusBar"];
	dateFormat = [file objectForKey:@"dateFormat"];
	timeFormat = [file objectForKey:@"timeFormat"];

}
static __attribute__((constructor)) void _logosLocalCtor_f74e4fd8(int __unused argc, char __unused **argv, char __unused **envp) {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:NO forKey:@"isMusicSectionEnabled"];
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
	[file registerBool:&statusBarSectionEnabled default:NO forKey:@"isStatusBarSectionEnabled"];
	[file registerBool:&isRoutingButtonHidden default:NO forKey:@"isRoutingButtonHidden"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&timeLabelHeight default:72 forKey:@"timeLabelHeight"];
	[file registerDouble:&dateLabelHeight default:24 forKey:@"dateLabelHeight"];
	[file registerDouble:&weatherLabelHeight default:24 forKey:@"weatherLabelHeight"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&configurations default:3 forKey:@"configuration"];
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
	[file registerBool:&colorNotifs default:NO forKey:@"colorNotifs"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	[file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
	[file registerBool:&customImageBackgroundBOOL default:NO forKey:@"customImageBackground?"];
	[file registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];
	[file registerBool:&newStatusBar default:NO forKey:@"newStatusBar"];
	[file registerBool:&showsPercentage default:NO forKey:@"showsPercentage"];
	[file registerBool:&weatherLabelEnabled default:NO forKey:@"weatherLabelEnabled"];
	[file registerBool:&hideBreadcrumbs default:NO forKey:@"hideBreadcrumbs"];

 	if (isNotificationSectionEnabled) {


		{Class _logos_class$notifications$NCNotificationListCell = objc_getClass("NCNotificationListCell"); { MSHookMessageEx(_logos_class$notifications$NCNotificationListCell, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationListCell$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationListCell$setNeedsLayout);}Class _logos_class$notifications$NCNotificationContentView = objc_getClass("NCNotificationContentView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationContentView$setNeedsLayout);}Class _logos_class$notifications$PLPlatterHeaderContentView = objc_getClass("PLPlatterHeaderContentView"); { MSHookMessageEx(_logos_class$notifications$PLPlatterHeaderContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout);}Class _logos_class$notifications$NCNotificationShortLookView = objc_getClass("NCNotificationShortLookView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationShortLookView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationShortLookView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout);}} } if (musicPlayerEnabled) {
        {Class _logos_class$musicplayer$MRUNowPlayingHeaderView = objc_getClass("MRUNowPlayingHeaderView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setShowRoutingButton:), (IMP)&_logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$);}{ MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setFrame:), (IMP)&_logos_method$musicplayer$MRUNowPlayingHeaderView$setFrame$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingHeaderView$setFrame$);}Class _logos_class$musicplayer$MRUNowPlayingControlsView = objc_getClass("MRUNowPlayingControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingControlsView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingLabelView = objc_getClass("MRUNowPlayingLabelView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingLabelView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingLabelView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingLabelView$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingTransportControlsView = objc_getClass("MRUNowPlayingTransportControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingTransportControlsView, @selector(layoutSubviews), (IMP)&_logos_method$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$layoutSubviews);}Class _logos_class$musicplayer$CSAdjunctItemView = objc_getClass("CSAdjunctItemView"); { MSHookMessageEx(_logos_class$musicplayer$CSAdjunctItemView, @selector(_updateSizeToMimic), (IMP)&_logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic, (IMP*)&_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$musicplayer$CSAdjunctItemView, @selector(setTheFuckUp), (IMP)&_logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp, _typeEncoding); }Class _logos_class$musicplayer$SBMediaController = objc_getClass("SBMediaController"); { MSHookMessageEx(_logos_class$musicplayer$SBMediaController, @selector(setNowPlayingInfo:), (IMP)&_logos_method$musicplayer$SBMediaController$setNowPlayingInfo$, (IMP*)&_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$);}}
	}
	if (isSpringySectionEnabled){
		{Class _logos_class$springy$SBIconProgressView = objc_getClass("SBIconProgressView"); { MSHookMessageEx(_logos_class$springy$SBIconProgressView, @selector(_drawPieWithCenter:), (IMP)&_logos_method$springy$SBIconProgressView$_drawPieWithCenter$, (IMP*)&_logos_orig$springy$SBIconProgressView$_drawPieWithCenter$);}{ MSHookMessageEx(_logos_class$springy$SBIconProgressView, @selector(_drawPauseUIWithCenter:), (IMP)&_logos_method$springy$SBIconProgressView$_drawPauseUIWithCenter$, (IMP*)&_logos_orig$springy$SBIconProgressView$_drawPauseUIWithCenter$);}Class _logos_class$springy$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$springy$SBIconView, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBIconView$setNeedsLayout, (IMP*)&_logos_orig$springy$SBIconView$setNeedsLayout);}Class _logos_class$springy$SBIconListPageControl = objc_getClass("SBIconListPageControl"); { MSHookMessageEx(_logos_class$springy$SBIconListPageControl, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBIconListPageControl$setNeedsLayout, (IMP*)&_logos_orig$springy$SBIconListPageControl$setNeedsLayout);}Class _logos_class$springy$SBDockView = objc_getClass("SBDockView"); { MSHookMessageEx(_logos_class$springy$SBDockView, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBDockView$setNeedsLayout, (IMP*)&_logos_orig$springy$SBDockView$setNeedsLayout);}Class _logos_class$springy$SBFloatingDockPlatterView = objc_getClass("SBFloatingDockPlatterView"); { MSHookMessageEx(_logos_class$springy$SBFloatingDockPlatterView, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBFloatingDockPlatterView$setNeedsLayout, (IMP*)&_logos_orig$springy$SBFloatingDockPlatterView$setNeedsLayout);}}
	}
	if (statusBarSectionEnabled){
		{Class _logos_class$statusbar$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setFillColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setFillColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setFillColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setBodyColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setBodyColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setBodyColor$);}Class _logos_class$statusbar$_UIStatusBarVisualProvider_Split54 = objc_getClass("_UIStatusBarVisualProvider_Split54"); Class _logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54 = object_getClass(_logos_class$statusbar$_UIStatusBarVisualProvider_Split54); { MSHookMessageEx(_logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54, @selector(height), (IMP)&_logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height, (IMP*)&_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height);}Class _logos_class$statusbar$_UIStatusBarWifiSignalView = objc_getClass("_UIStatusBarWifiSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarWifiSignalView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow);}Class _logos_class$statusbar$_UIStatusBarCellularSignalView = objc_getClass("_UIStatusBarCellularSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarCellularSignalView, @selector(setNeedsLayout), (IMP)&_logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout, (IMP*)&_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout);}Class _logos_class$statusbar$_UIStatusBarSignalView = objc_getClass("_UIStatusBarSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setActiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setInactiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$);}Class _logos_class$statusbar$_UIStatusBarStringView = objc_getClass("_UIStatusBarStringView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(setTextColor:), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$setTextColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$);}}
	}
	if (isLockscreenSectionEnabled){
		{Class _logos_class$Lockscreen$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); { MSHookMessageEx(_logos_class$Lockscreen$CSCoverSheetViewController, @selector(_transitionChargingViewToVisible:showBattery:animated:), (IMP)&_logos_method$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$, (IMP*)&_logos_orig$Lockscreen$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$);}{ MSHookMessageEx(_logos_class$Lockscreen$CSCoverSheetViewController, @selector(viewWillAppear:), (IMP)&_logos_method$Lockscreen$CSCoverSheetViewController$viewWillAppear$, (IMP*)&_logos_orig$Lockscreen$CSCoverSheetViewController$viewWillAppear$);}Class _logos_class$Lockscreen$NCNotificationListSectionRevealHintView = objc_getClass("NCNotificationListSectionRevealHintView"); { MSHookMessageEx(_logos_class$Lockscreen$NCNotificationListSectionRevealHintView, @selector(setNeedsLayout), (IMP)&_logos_method$Lockscreen$NCNotificationListSectionRevealHintView$setNeedsLayout, (IMP*)&_logos_orig$Lockscreen$NCNotificationListSectionRevealHintView$setNeedsLayout);}Class _logos_class$Lockscreen$SBFStaticWallpaperView = objc_getClass("SBFStaticWallpaperView"); { MSHookMessageEx(_logos_class$Lockscreen$SBFStaticWallpaperView, @selector(setNeedsLayout), (IMP)&_logos_method$Lockscreen$SBFStaticWallpaperView$setNeedsLayout, (IMP*)&_logos_orig$Lockscreen$SBFStaticWallpaperView$setNeedsLayout);}Class _logos_class$Lockscreen$SBUIController = objc_getClass("SBUIController"); { MSHookMessageEx(_logos_class$Lockscreen$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Lockscreen$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Lockscreen$SBUIController$ACPowerChanged);}Class _logos_class$Lockscreen$SBBacklightController = objc_getClass("SBBacklightController"); { MSHookMessageEx(_logos_class$Lockscreen$SBBacklightController, @selector(turnOnScreenFullyWithBacklightSource:), (IMP)&_logos_method$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$, (IMP*)&_logos_orig$Lockscreen$SBBacklightController$turnOnScreenFullyWithBacklightSource$);}Class _logos_class$Lockscreen$SBFLockScreenDateView = objc_getClass("SBFLockScreenDateView"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UILabel\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$Lockscreen$SBFLockScreenDateView, "timeLabel", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(timeLabel), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$timeLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setTimeLabel:), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$setTimeLabel, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UILabel\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$Lockscreen$SBFLockScreenDateView, "dateLabel", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(dateLabel), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$dateLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setDateLabel:), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$setDateLabel, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UILabel\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$Lockscreen$SBFLockScreenDateView, "weatherLabel", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(weatherLabel), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$weatherLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setWeatherLabel:), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$setWeatherLabel, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIImageView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$Lockscreen$SBFLockScreenDateView, "weatherImageView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(weatherImageView), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$weatherImageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setWeatherImageView:), (IMP)&_logos_property$Lockscreen$SBFLockScreenDateView$setWeatherImageView, _typeEncoding); } { MSHookMessageEx(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(initWithFrame:), (IMP)&_logos_method$Lockscreen$SBFLockScreenDateView$initWithFrame$, (IMP*)&_logos_orig$Lockscreen$SBFLockScreenDateView$initWithFrame$);}{ MSHookMessageEx(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setNeedsLayout), (IMP)&_logos_method$Lockscreen$SBFLockScreenDateView$setNeedsLayout, (IMP*)&_logos_orig$Lockscreen$SBFLockScreenDateView$setNeedsLayout);}{ MSHookMessageEx(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(_updateLabels), (IMP)&_logos_method$Lockscreen$SBFLockScreenDateView$_updateLabels, (IMP*)&_logos_orig$Lockscreen$SBFLockScreenDateView$_updateLabels);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Lockscreen$SBFLockScreenDateView, @selector(setTextColorToWallpaperColor:), (IMP)&_logos_method$Lockscreen$SBFLockScreenDateView$setTextColorToWallpaperColor$, _typeEncoding); }}
	}
	if (enableGestures){
		{Class _logos_class$gesturesAndModernShit$BSPlatform = objc_getClass("BSPlatform"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$BSPlatform, @selector(homeButtonType), (IMP)&_logos_method$gesturesAndModernShit$BSPlatform$homeButtonType, (IMP*)&_logos_orig$gesturesAndModernShit$BSPlatform$homeButtonType);}Class _logos_class$gesturesAndModernShit$SBLockHardwareButtonActions = objc_getClass("SBLockHardwareButtonActions"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBLockHardwareButtonActions, @selector(initWithHomeButtonType:proximitySensorManager:), (IMP)&_logos_method$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$, (IMP*)&_logos_orig$gesturesAndModernShit$SBLockHardwareButtonActions$initWithHomeButtonType$proximitySensorManager$);}Class _logos_class$gesturesAndModernShit$SBHomeHardwareButtonActions = objc_getClass("SBHomeHardwareButtonActions"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBHomeHardwareButtonActions, @selector(initWitHomeButtonType:), (IMP)&_logos_method$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$, (IMP*)&_logos_orig$gesturesAndModernShit$SBHomeHardwareButtonActions$initWitHomeButtonType$);}Class _logos_class$gesturesAndModernShit$SpringBoard = objc_getClass("SpringBoard"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$gesturesAndModernShit$SpringBoard$applicationDidFinishLaunching$);}Class _logos_class$gesturesAndModernShit$SBPressGestureRecognizer = objc_getClass("SBPressGestureRecognizer"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBPressGestureRecognizer, @selector(setAllowedPressTypes:), (IMP)&_logos_method$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$, (IMP*)&_logos_orig$gesturesAndModernShit$SBPressGestureRecognizer$setAllowedPressTypes$);}Class _logos_class$gesturesAndModernShit$SBClickGestureRecognizer = objc_getClass("SBClickGestureRecognizer"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBClickGestureRecognizer, @selector(addShortcutWithPressTypes:), (IMP)&_logos_method$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$, (IMP*)&_logos_orig$gesturesAndModernShit$SBClickGestureRecognizer$addShortcutWithPressTypes$);}Class _logos_class$gesturesAndModernShit$SBHomeHardwareButton = objc_getClass("SBHomeHardwareButton"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBHomeHardwareButton, @selector(initWithScreenshotGestureRecognizer:homeButtonType:), (IMP)&_logos_method$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$, (IMP*)&_logos_orig$gesturesAndModernShit$SBHomeHardwareButton$initWithScreenshotGestureRecognizer$homeButtonType$);}Class _logos_class$gesturesAndModernShit$SBLockHardwareButton = objc_getClass("SBLockHardwareButton"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBLockHardwareButton, @selector(initWithScreenshotGestureRecognizer:shutdownGestureRecognizer:proximitySensorManager:homeHardwareButton:volumeHardwareButton:buttonActions:homeButtonType:createGestures:), (IMP)&_logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$, (IMP*)&_logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$buttonActions$homeButtonType$createGestures$);}{ MSHookMessageEx(_logos_class$gesturesAndModernShit$SBLockHardwareButton, @selector(initWithScreenshotGestureRecognizer:shutdownGestureRecognizer:proximitySensorManager:homeHardwareButton:volumeHardwareButton:homeButtonType:), (IMP)&_logos_method$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$, (IMP*)&_logos_orig$gesturesAndModernShit$SBLockHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$proximitySensorManager$homeHardwareButton$volumeHardwareButton$homeButtonType$);}Class _logos_class$gesturesAndModernShit$SBVolumeHardwareButton = objc_getClass("SBVolumeHardwareButton"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBVolumeHardwareButton, @selector(initWithScreenshotGestureRecognizer:shutdownGestureRecognizer:homeButtonType:), (IMP)&_logos_method$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$, (IMP*)&_logos_orig$gesturesAndModernShit$SBVolumeHardwareButton$initWithScreenshotGestureRecognizer$shutdownGestureRecognizer$homeButtonType$);}Class _logos_class$gesturesAndModernShit$CSQuickActionsView = objc_getClass("CSQuickActionsView"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$CSQuickActionsView, @selector(_prototypingAllowsButtons), (IMP)&_logos_method$gesturesAndModernShit$CSQuickActionsView$_prototypingAllowsButtons, (IMP*)&_logos_orig$gesturesAndModernShit$CSQuickActionsView$_prototypingAllowsButtons);}{ MSHookMessageEx(_logos_class$gesturesAndModernShit$CSQuickActionsView, @selector(_layoutQuickActionButtons), (IMP)&_logos_method$gesturesAndModernShit$CSQuickActionsView$_layoutQuickActionButtons, (IMP*)&_logos_orig$gesturesAndModernShit$CSQuickActionsView$_layoutQuickActionButtons);}Class _logos_class$gesturesAndModernShit$MTLumaDodgePillSettings = objc_getClass("MTLumaDodgePillSettings"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$MTLumaDodgePillSettings, @selector(setHeight:), (IMP)&_logos_method$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$, (IMP*)&_logos_orig$gesturesAndModernShit$MTLumaDodgePillSettings$setHeight$);}Class _logos_class$gesturesAndModernShit$SBHDefaultIconListLayoutProvider = objc_getClass("SBHDefaultIconListLayoutProvider"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBHDefaultIconListLayoutProvider, @selector(screenType), (IMP)&_logos_method$gesturesAndModernShit$SBHDefaultIconListLayoutProvider$screenType, (IMP*)&_logos_orig$gesturesAndModernShit$SBHDefaultIconListLayoutProvider$screenType);}Class _logos_class$gesturesAndModernShit$_UIStatusBarData = objc_getClass("_UIStatusBarData"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$_UIStatusBarData, @selector(setBackNavigationEntry:), (IMP)&_logos_method$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$, (IMP*)&_logos_orig$gesturesAndModernShit$_UIStatusBarData$setBackNavigationEntry$);}Class _logos_class$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS = objc_getClass("_UIStatusBarVisualProvider_iOS"); Class _logos_metaclass$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS = object_getClass(_logos_class$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS); { MSHookMessageEx(_logos_metaclass$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS, @selector(class), (IMP)&_logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class, (IMP*)&_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_iOS$class);}Class _logos_class$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54 = objc_getClass("_UIStatusBarVisualProvider_Split54"); Class _logos_metaclass$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54 = object_getClass(_logos_class$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54); { MSHookMessageEx(_logos_metaclass$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54, @selector(notchSize), (IMP)&_logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize, (IMP*)&_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$notchSize);}{ MSHookMessageEx(_logos_metaclass$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54, @selector(height), (IMP)&_logos_meta_method$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$height, (IMP*)&_logos_meta_orig$gesturesAndModernShit$_UIStatusBarVisualProvider_Split54$height);}Class _logos_class$gesturesAndModernShit$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$_UIBatteryView, @selector(_currentlyShowsPercentage), (IMP)&_logos_method$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage, (IMP*)&_logos_orig$gesturesAndModernShit$_UIBatteryView$_currentlyShowsPercentage);}{ MSHookMessageEx(_logos_class$gesturesAndModernShit$_UIBatteryView, @selector(_shouldShowBolt), (IMP)&_logos_method$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt, (IMP*)&_logos_orig$gesturesAndModernShit$_UIBatteryView$_shouldShowBolt);}Class _logos_class$gesturesAndModernShit$SBMainSwitcherViewController = objc_getClass("SBMainSwitcherViewController"); { MSHookMessageEx(_logos_class$gesturesAndModernShit$SBMainSwitcherViewController, @selector(setNeedsLayout), (IMP)&_logos_method$gesturesAndModernShit$SBMainSwitcherViewController$setNeedsLayout, (IMP*)&_logos_orig$gesturesAndModernShit$SBMainSwitcherViewController$setNeedsLayout);}}
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
