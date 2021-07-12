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

@class _UIBatteryView; @class CSAdjunctItemView; @class MRUNowPlayingLabelView; @class MRUNowPlayingTransportControlsView; @class SBIconListPageControl; @class _UIStatusBarWifiSignalView; @class PLPlatterHeaderContentView; @class NCNotificationShortLookView; @class MRUNowPlayingHeaderView; @class SBIconView; @class MPRouteLabel; @class NCNotificationContentView; @class _UIStatusBar; @class NCNotificationListCell; @class MRUNowPlayingControlsView; @class _UIStatusBarStringView; @class SBMediaController; @class _UIStatusBarSignalView; @class _UIStatusBarVisualProvider_Split54; @class _UIStatusBarCellularSignalView; @class SBIconProgressView; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBMediaController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBMediaController"); } return _klass; }
#line 1 "Tweak.xm"
 #import "headers.h"
static void (*_logos_orig$musicplayer$MPRouteLabel$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MPRouteLabel* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MPRouteLabel$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MPRouteLabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$musicplayer$MRUNowPlayingHeaderView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, CGRect *); static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setFrame$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, CGRect *); static void (*_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingLabelView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingLabelView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic)(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$)(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$musicplayer$SBMediaController$setNowPlayingInfo$(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); 

static void _logos_method$musicplayer$MPRouteLabel$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MPRouteLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
      self.hidden = YES;
}

 
__attribute__((used)) static UIButton * _logos_property$musicplayer$MRUNowPlayingHeaderView$songImageForSmall(MRUNowPlayingHeaderView * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_property$musicplayer$MRUNowPlayingHeaderView$songImageForSmall); UIButton * rawValue; [value getValue:&rawValue]; return rawValue; };
__attribute__((used)) static void _logos_property$musicplayer$MRUNowPlayingHeaderView$setSongImageForSmall(MRUNowPlayingHeaderView * __unused self, SEL __unused _cmd, UIButton * rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(UIButton *)]; objc_setAssociatedObject(self, (void *)_logos_property$musicplayer$MRUNowPlayingHeaderView$songImageForSmall, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
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
	[songImageForSmall.leadingAnchor constraintEqualToAnchor: self.headerView.artworkView.leadingAnchor constant:5].active = YES;
	[songImageForSmall.topAnchor constraintEqualToAnchor: self.headerView.artworkView.topAnchor].active = YES;
	}	
	if (!bottomLabel){
	bottomLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y+15,320,20) duration:8 andFadeLength:10.0f];
	bottomLabel.adjustsFontSizeToFitWidth = YES;
	[self addSubview:bottomLabel];
	}
	if (!topLabel){
	topLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(self.headerView.artworkView.frame.origin.x+songImageForSmall.frame.size.width,self.headerView.artworkView.frame.origin.y-7,320,20) duration:8 andFadeLength:10.0f];
	topLabel.adjustsFontSizeToFitWidth = YES;
	[self addSubview:topLabel];
	}
	if (configurations == 3) {
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame), self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
	}
	else if (configurations == 0){
	[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame),CGRectGetMaxY(bottomLabel.frame)+5, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
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
	self.hidden = YES;
}


 
static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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
        if (configurations == 0) {
          if (isBackgroundColored && !isArtworkBackground) {
            [platterView.backgroundView setAlpha:0];
            self.backgroundColor = fuckingArtworkColor;
          }
          [self.heightAnchor constraintEqualToConstant:115].active =
              true; 
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
          _logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic(self, _cmd);
        }
}


static void _logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  if (haveOutline) {
    self.layer.borderWidth = outlineSize;
    if (!haveOutlineSecondaryColorMusicPlayer) {
      UIColor *customColor =
          [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs"
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
	if (haveNotifs) {
			if ([songLabel isEqualToString:previousTitle]){
			[[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:subtitleLabel message:songLabel bundleID:[[[_logos_static_class_lookup$SBMediaController() sharedInstance] nowPlayingApplication] bundleIdentifier]];
			}
			previousTitle = songLabel; 
	}
}



static void (*_logos_orig$statusbar$_UIBatteryView$setFillColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIBatteryView$setBodyColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static double (*_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBar$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBar$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); 


static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
  UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	_logos_orig$statusbar$_UIBatteryView$setFillColor$(self, _cmd, customColor);
	if(isBatteryHidden) self.hidden = YES;
}

static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
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
	UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$(self, _cmd, customColor);
}

static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
	UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$(self, _cmd, customColor);
}





static void _logos_method$statusbar$_UIStatusBar$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){

	if (modernStatusBar){
	self.visualProviderClass =  @"_UIStatusBarVisualProvider_Split54";
	}
	else _logos_orig$statusbar$_UIStatusBar$setNeedsLayout(self, _cmd);
}






static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow(self, _cmd);
	if (isTimeHidden){
	self.hidden = YES;
	}
}
static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
				UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
	_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$(self, _cmd, customColor);
}




static void (*_logos_orig$notifications$NCNotificationListCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationListCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationShortLookView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$notifications$NCNotificationListCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$notifications$NCNotificationListCell$layoutSubviews(self, _cmd);
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




static void (*_logos_orig$springy$SBIconProgressView$_drawPieWithCenter$)(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$springy$SBIconProgressView$_drawPieWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void (*_logos_orig$springy$SBIconProgressView$_drawPauseUIWithCenter$)(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$springy$SBIconProgressView$_drawPauseUIWithCenter$(_LOGOS_SELF_TYPE_NORMAL SBIconProgressView* _LOGOS_SELF_CONST, SEL, CGPoint); static void (*_logos_orig$springy$SBIconView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBIconView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$springy$SBIconListPageControl$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL SBIconListPageControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$springy$SBIconListPageControl$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL SBIconListPageControl* _LOGOS_SELF_CONST, SEL); 
 

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
	self.hidden = YES;
}



























































































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
	hidePageDots = [file boolForKey:@"hidePageDots"];
	customImageBackgroundBOOL = [file boolForKey:@"customImageBackground?"];

}
static __attribute__((constructor)) void _logosLocalCtor_74987a91(int __unused argc, char __unused **argv, char __unused **envp) {
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
	[file registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];

 	if (isNotificationSectionEnabled) {


		{Class _logos_class$notifications$NCNotificationListCell = objc_getClass("NCNotificationListCell"); { MSHookMessageEx(_logos_class$notifications$NCNotificationListCell, @selector(layoutSubviews), (IMP)&_logos_method$notifications$NCNotificationListCell$layoutSubviews, (IMP*)&_logos_orig$notifications$NCNotificationListCell$layoutSubviews);}Class _logos_class$notifications$NCNotificationContentView = objc_getClass("NCNotificationContentView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationContentView$setNeedsLayout);}Class _logos_class$notifications$PLPlatterHeaderContentView = objc_getClass("PLPlatterHeaderContentView"); { MSHookMessageEx(_logos_class$notifications$PLPlatterHeaderContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout);}Class _logos_class$notifications$NCNotificationShortLookView = objc_getClass("NCNotificationShortLookView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationShortLookView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationShortLookView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout);}} } if (musicPlayerEnabled) {
        {Class _logos_class$musicplayer$MPRouteLabel = objc_getClass("MPRouteLabel"); { MSHookMessageEx(_logos_class$musicplayer$MPRouteLabel, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MPRouteLabel$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MPRouteLabel$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingHeaderView = objc_getClass("MRUNowPlayingHeaderView"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", @encode(UIButton *) }; class_addProperty(_logos_class$musicplayer$MRUNowPlayingHeaderView, "songImageForSmall", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(songImageForSmall), (IMP)&_logos_property$musicplayer$MRUNowPlayingHeaderView$songImageForSmall, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setSongImageForSmall:), (IMP)&_logos_property$musicplayer$MRUNowPlayingHeaderView$setSongImageForSmall, _typeEncoding); } { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setShowRoutingButton:), (IMP)&_logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$);}{ MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setFrame:), (IMP)&_logos_method$musicplayer$MRUNowPlayingHeaderView$setFrame$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingHeaderView$setFrame$);}Class _logos_class$musicplayer$MRUNowPlayingControlsView = objc_getClass("MRUNowPlayingControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingControlsView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingLabelView = objc_getClass("MRUNowPlayingLabelView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingLabelView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingLabelView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingLabelView$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingTransportControlsView = objc_getClass("MRUNowPlayingTransportControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingTransportControlsView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout);}Class _logos_class$musicplayer$CSAdjunctItemView = objc_getClass("CSAdjunctItemView"); { MSHookMessageEx(_logos_class$musicplayer$CSAdjunctItemView, @selector(_updateSizeToMimic), (IMP)&_logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic, (IMP*)&_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$musicplayer$CSAdjunctItemView, @selector(setTheFuckUp), (IMP)&_logos_method$musicplayer$CSAdjunctItemView$setTheFuckUp, _typeEncoding); }Class _logos_class$musicplayer$SBMediaController = objc_getClass("SBMediaController"); { MSHookMessageEx(_logos_class$musicplayer$SBMediaController, @selector(setNowPlayingInfo:), (IMP)&_logos_method$musicplayer$SBMediaController$setNowPlayingInfo$, (IMP*)&_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$);}}
	}
	if (statusBarSectionEnabled){
		{Class _logos_class$statusbar$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setFillColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setFillColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setFillColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setBodyColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setBodyColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setBodyColor$);}Class _logos_class$statusbar$_UIStatusBarVisualProvider_Split54 = objc_getClass("_UIStatusBarVisualProvider_Split54"); Class _logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54 = object_getClass(_logos_class$statusbar$_UIStatusBarVisualProvider_Split54); { MSHookMessageEx(_logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54, @selector(height), (IMP)&_logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height, (IMP*)&_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height);}Class _logos_class$statusbar$_UIStatusBarWifiSignalView = objc_getClass("_UIStatusBarWifiSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarWifiSignalView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow);}Class _logos_class$statusbar$_UIStatusBarCellularSignalView = objc_getClass("_UIStatusBarCellularSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarCellularSignalView, @selector(setNeedsLayout), (IMP)&_logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout, (IMP*)&_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout);}Class _logos_class$statusbar$_UIStatusBarSignalView = objc_getClass("_UIStatusBarSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setActiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setInactiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$);}Class _logos_class$statusbar$_UIStatusBar = objc_getClass("_UIStatusBar"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBar, @selector(setNeedsLayout), (IMP)&_logos_method$statusbar$_UIStatusBar$setNeedsLayout, (IMP*)&_logos_orig$statusbar$_UIStatusBar$setNeedsLayout);}Class _logos_class$statusbar$_UIStatusBarStringView = objc_getClass("_UIStatusBarStringView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(setTextColor:), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$setTextColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$);}}
	}
	if (isSpringySectionEnabled){
		{Class _logos_class$springy$SBIconProgressView = objc_getClass("SBIconProgressView"); { MSHookMessageEx(_logos_class$springy$SBIconProgressView, @selector(_drawPieWithCenter:), (IMP)&_logos_method$springy$SBIconProgressView$_drawPieWithCenter$, (IMP*)&_logos_orig$springy$SBIconProgressView$_drawPieWithCenter$);}{ MSHookMessageEx(_logos_class$springy$SBIconProgressView, @selector(_drawPauseUIWithCenter:), (IMP)&_logos_method$springy$SBIconProgressView$_drawPauseUIWithCenter$, (IMP*)&_logos_orig$springy$SBIconProgressView$_drawPauseUIWithCenter$);}Class _logos_class$springy$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$springy$SBIconView, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBIconView$setNeedsLayout, (IMP*)&_logos_orig$springy$SBIconView$setNeedsLayout);}Class _logos_class$springy$SBIconListPageControl = objc_getClass("SBIconListPageControl"); { MSHookMessageEx(_logos_class$springy$SBIconListPageControl, @selector(setNeedsLayout), (IMP)&_logos_method$springy$SBIconListPageControl$setNeedsLayout, (IMP*)&_logos_orig$springy$SBIconListPageControl$setNeedsLayout);}}
	}

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
