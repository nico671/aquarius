#import <Foundation/Foundation.h>
#import "GcUniversal/GcImagePickerUtils.h"
#import "GcUniversal/GcColorPickerUtils.h"
#import <UIKit/UIKit.h>
#import <PeterDev/libpddokdo.h>
#import <dlfcn.h>
#import "LocationFetcher.h"
#import <CoreLocation/CoreLocation.h>
#import <Cephei/HBPreferences.h>
#import <MediaRemote/MediaRemote.h>
#import <AudioToolbox/AudioServices.h>
#import "NCUtils/NCColorPickerUtilities.h"
#import "NCUtils/MarqueeLabel.h"
#import "NCUtils/NCImageUtils.h"
#import <QuartzCore/QuartzCore.h>
#import "AQRGRPCell.h"
#import "AQRGRPView.h"
#import "AQRManager.h"
#import "sharedheaders.h"
#import "NCUtils+UIColor.h"


@interface CSQuickActionsView : UIView
- (UIEdgeInsets)_buttonOutsets;
@property (nonatomic, retain) UIControl *flashlightButton;
@property (nonatomic, retain) UIControl *cameraButton;
@end

@interface WFTemperature : NSObject 
@property (assign,nonatomic) double fahrenheit; 
@end

@interface WACurrentForecast : NSObject
@property(assign, nonatomic)long long conditionCode;
- (void)setConditionCode:(long long)arg1;
@property (nonatomic,retain) WFTemperature * temperature;
@end

@interface WAForecastModel : NSObject
@property(nonatomic,retain) WACurrentForecast* currentConditions;
@end

@interface UIStatusBarBreadcrumbItemView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface WALockscreenWidgetViewController : UIViewController
- (WAForecastModel *)currentForecastModel;
@end

@interface PDDokdo (Private)
@property(nonatomic, retain, readonly)WALockscreenWidgetViewController* weatherWidget;
@end



@interface NCNotificationListSectionRevealHintView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end
@interface SBFStaticWallpaperImageView : UIImageView

@end

@interface SBUILegibilityLabel : UIView                       //@synthesize attributedText=_attributedText - In the implementation block
@property (nonatomic,copy) NSString * string;   
@property (nonatomic,retain) _UILegibilitySettings * legibilitySettings;                                      //@synthesize string=_string - In the implementation block
@property (nonatomic,copy) UIColor * textColor;
@end

@interface NCNotificationMasterListView : UIView
@end

@interface NCNotificationGroupList : NSObject
@property (nonatomic,strong,readwrite) NSMutableArray *orderedRequests;
@end
@interface NCNotificationStructuredSectionList : NSObject
@end

@interface NCNotificationMasterList : NSObject
@property (nonatomic,retain) NSMutableArray * notificationSections;
@end

@interface CSCombinedListViewController : UIViewController
@property (nonatomic, retain) AQRGRPView *aqrView;
@end

@interface SBUIController : NSObject
- (BOOL)isOnAC;
- (int)batteryCapacityAsPercentage;
@end



@interface SBDashBoardNotificationAdjunctListViewController : UIViewController
@property (nonatomic, retain) AQRGRPView *grpView;
@end

@interface SBFloatingDockPlatterView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBDockView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CSNotificationAdjunctListViewController : UIViewController
@property (nonatomic, retain) AQRGRPView *grpView;
@property (getter=isPresentingContent,nonatomic,readonly) BOOL presentingContent;
@property (nonatomic,strong,readwrite) UIStackView *stackView;
-(void)adjunctListModel:(id)arg1 didAddItem:(id)arg2 ;
-(void)adjunctListModel:(id)arg1 didRemoveItem:(id)arg2 ;
-(void)_didUpdateDisplay;
-(CGSize)sizeToMimic;
-(void)_insertItem:(id)arg1 animated:(BOOL)arg2 ;
-(void)_removeItem:(id)arg1 animated:(BOOL)arg2 ;
-(BOOL)isPresentingContent;
@end



@interface SPTMobileMediaKitAudioPlaybackManager
- (void)enableShuffleWithMessage:(id)arg1;
- (void)disableShuffleWithMessage:(id)arg1;
@end

@interface NSDistributedNotificationCenter : NSNotificationCenter
@end

@interface SBFStaticWallpaperView
@property (nonatomic,strong,readwrite, getter=_sampleImage, setter=_setSampleImage:) UIImage * sampleImage;
@end

@interface SBFLockScreenDateSubtitleView : UIView
@end

@interface SBFLockScreenDateSubtitleDateView : SBFLockScreenDateSubtitleView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@class _UILegibilitySettings;
@interface SBFLockScreenDateView : UIView
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *weatherLabel;
@property (nonatomic, retain) UIImageView *weatherImageView;
@end

@interface MPUMarqueeView
@end

@interface UIScreen (Private)
@property (atomic, assign, readonly) NSUInteger screenSizeCategory;
@end

@interface SBIconView : UIView
@property (nonatomic, assign, readwrite, getter=isLabelHidden) BOOL labelHidden;
@end
@interface SBIconListView
@end
@interface SBIconProgressView : UIView
@property (nonatomic,assign,readwrite) CGFloat displayedFraction;
@property (nonatomic,assign,readwrite) BOOL displayingPaused;
@end



@interface SBInCallBannerPresentableViewController
+(double)cornerRadius;
@property NSArray *subviews;
@end

@interface NCNotificationListCell : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface NCNotificationShortLookView : UIView {
	BOOL _banner;
}
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@property NSArray *subviews;
@property (assign,setter=_setBanner:,getter=_isBanner,nonatomic) BOOL banner;
@end

@interface UIView (Private)
-(UIViewController *)_viewControllerForAncestor;
-(void)setOverrideUserInterfaceStyle:(NSInteger)style;
@end

@interface SBIconListPageControl
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _UIBatteryView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (assign,nonatomic) BOOL showsPercentage;
@property (assign,nonatomic) BOOL showsInlineChargingIndicator;
@end

@interface _UIStatusBarWifiSignalView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _UIStatusBarIndicatorAirplaneModeItem
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBFolderIconImageView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, strong, readwrite) UIView *backgroundView;
@end

@interface _UIStatusBarStringView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;

@end

@interface _UIStatusBar : UIView
@property UIView *isTweakOnIndicator;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, strong, readwrite) NSMutableDictionary *items;
@property (nonatomic,strong, readwrite, getter=_visualProviderClassName, setter=_setVisualProviderClassName:)NSString *visualProviderClass;
@property (nonatomic,strong, readwrite) UIView * foregroundView;
@property (nonatomic,assign,readwrite)CGPoint center;
@end


@interface _UIInterfaceActionVibrantSeparatorView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _UITableViewCellSeparatorView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;

@end


@interface _UIInterfaceActionBlankSeparatorView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _UIStatusBarCellularSignalView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end
@interface CSAdjunctItemView : UIView{ //player iOS 13 & 14
	UIView* _platterView;
}
-(void) setTheFuckUp;
@end

@interface SBDashBoardMediaControlsViewController : UIViewController // iOS 12
@end

@interface CSMediaControlsViewController : UIViewController // iOS 13
@end
@class MPCPlayerResponseItem, MRUVisualStylingProvider, UIView, UILabel, CAGradientLayer, CADisplayLink, AVTimeFormatter, NSString;
@interface MRUNowPlayingTimeControlsView : UIView // iOS 14

@property (nonatomic,retain) UILabel * elapsedTimeLabel;
@property (nonatomic,retain) UILabel * remainingTimeLabel;
@property (nonatomic,retain) UIView * elapsedTrack;
@property (nonatomic,retain) UIView * knobView;
@property (nonatomic,retain) UIView * remainingTrack;
@property (nonatomic,retain) AVTimeFormatter * elapsedTimeFormatter;
@end



@interface MPVolumeSlider : UISlider
@property (nonatomic,readonly) UIView * thumbView;
@end

@interface MediaControlsVolumeSlider : MPVolumeSlider // iOS 12 & 13
-(void)setVisualStylingProvider:(id)arg1;
@end

@interface MRUNowPlayingVolumeSlider : MPVolumeSlider // iOS 14
-(void)setVisualStylingProvider:(id)arg1;
@property (nonatomic,readonly) UIView * growingThumbView;
@end

@interface MediaControlsVolumeContainerView : UIView // iOS 12 & 13
@property (nonatomic,retain) MediaControlsVolumeSlider * volumeSlider;
@end

@interface MRUNowPlayingVolumeControlsView : UIView // iOS 14
@property (nonatomic,retain) MRUNowPlayingVolumeSlider * slider;
@end

@interface MediaControlsTransportButton : UIButton // iOS 12 & 13
@property (nonatomic,retain) UIImageView *imageView;
@end

@interface MRUTransportButton : UIButton // iOS 14
@property (nonatomic,retain) UIImageView *imageView;
-(void)setStylingProvider:(id)arg1;
@end

@interface MediaControlsTransportStackView : UIView // iOS 12 & 13
@property (nonatomic,retain) MediaControlsTransportButton * tvRemoteButton;
@property (nonatomic,retain) MediaControlsTransportButton * leftButton;
@property (nonatomic,retain) MediaControlsTransportButton * middleButton;
@property (nonatomic,retain) MediaControlsTransportButton * rightButton;
@property (nonatomic,retain) MediaControlsTransportButton * languageOptionsButton;
@end

@interface WFLocation : NSObject
@property (nonatomic,copy) CLLocation * geoLocation; 
@end

@interface MRUNowPlayingTransportControlsView : UIView // iOS 14
@property (nonatomic,retain) MRUTransportButton * tvRemoteButton;
@property (nonatomic,retain) MRUTransportButton * leftButton;
@property (nonatomic,retain) MRUTransportButton * middleButton;
@property (nonatomic,retain) MRUTransportButton * rightButton;
@property (nonatomic,retain) MRUTransportButton * languageOptionsButton;
@end

@interface MediaControlsParentContainerView : UIView
@end

@interface CCUICAPackageView : UIView
@property (assign,nonatomic) double scale; //only avaialble on iOS 13
@end

@interface MediaControlsRoutingButtonView : UIButton // iOS 12 & 13
@property (nonatomic,retain) CCUICAPackageView * packageView;
@end

@interface MRUNowPlayingRoutingButton : UIButton // iOS 14
@property (nonatomic,retain) CCUICAPackageView * packageView;
@end

@interface MPRouteLabel : UILabel
@property (nonatomic,retain) UILabel * titleLabel;
@property (assign,nonatomic) BOOL forcesUppercaseText;
@end

@interface SBMainSwitcherViewController
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface MRUNowPlayingLabelView : UIView
@property (nonatomic,retain) UILabel * titleLabel;
@property (nonatomic,retain) UILabel * subtitleLabel;
@property (nonatomic,retain) MPUMarqueeView * titleMarqueeView;
@property (nonatomic,retain) MPUMarqueeView * subtitleMarqueeView;
@property (nonatomic,retain) MPRouteLabel * routeLabel;
@end

@interface MRUArtworkView : UIView
@property (nonatomic, retain) UIImage *iconImage;
@property (nonatomic, retain) UIImage *plceholderImage;
@property (nonatomic, retain) UIImage *artworkImage;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) UIView *iconShadowView;
@property (nonatomic, retain) UIImageView *artworkImageView;
@property (nonatomic, retain) UIView *artworkShadowView;
@property (nonatomic, retain) UIImageView *placeholderImageView;
@property (nonatomic, retain) UIView *placeholderBackground;
@end

@interface MRUNowPlayingHeaderView : UIView
@property UIButton *songImageForSmall;
@property (nonatomic,retain) MRUArtworkView * artworkView;
@property (nonatomic,retain) MRUNowPlayingLabelView * labelView;
@property (nonatomic,retain) MRUNowPlayingRoutingButton * routingButton;
@property (nonatomic,retain) MRUTransportButton * transportButton;
@end

@interface MRUNowPlayingControlsView : UIView
@property (nonatomic, retain) MRUNowPlayingHeaderView *headerView;
@property (nonatomic, retain) MRUNowPlayingTimeControlsView *timeControlsView;
@property (nonatomic, retain) MRUNowPlayingTransportControlsView *transportControlsView;
@property (nonatomic, retain) MRUNowPlayingVolumeControlsView *volumeControlsView;
@property (nonatomic) MarqueeLabel  *topLabel;
@property (nonatomic) MarqueeLabel  *bottomLabel;
-(void)setTheFuckUp;
@end

@interface MRUNowPlayingView : UIView
@property (nonatomic, retain) MRUNowPlayingControlsView *controlsView;
@end

@interface WFWeatherConditions : NSObject 
@property (nonatomic,retain) NSMutableDictionary * components; 
@property (copy) WFLocation * location; 
@end

@interface MRUNowPlayingViewController : UIViewController
@property (assign,nonatomic) id delegate;
@property (nonatomic,readonly) int context;
@property (nonatomic, retain) MRUNowPlayingView *viewIfLoaded;
@end

@interface SBMediaController : NSObject
+ (id)sharedInstance;
-(BOOL)beginSeek:(int)arg1 eventSource:(long long)arg2;
- (void)setNowPlayingInfo:(id)arg1;
-(void)sendNotif;
@property (nonatomic, weak,readonly) SBApplication * nowPlayingApplication;
-(BOOL)changeTrack:(int)arg1 eventSource:(long long)arg2 ;
-(BOOL)toggleRepeatForEventSource:(long long)arg1 ;
-(BOOL)toggleShuffleForEventSource:(long long)arg1 ;
@end

@interface PLPlatterView : UIView
@property (nonatomic,retain) MTMaterialView * backgroundView;
@end

@interface PLPlatterHeaderContentView
@property (nonatomic,copy,readwrite) NSArray *icons;
@end

@interface CSCoverSheetViewController : UIViewController
@end

@interface NextUpViewController : UIViewController
- (id)initWithControlCenter:(BOOL)controlCenter defaultStyle:(long long)style;
@end

BOOL musicPlayerEnabled, musicPlayerColorsEnabled, isNotificationSectionEnabled, hideSnapImage, haveOutlineSecondaryColorMusicPlayer, isSpringySectionEnabled;
BOOL isTimeHidden,showPercentage, modernStatusBar, isCellularThingyHidden, isWifiThingyHidden, isRoutingButtonHidden, isBackgroundColored, isDarkImage, isArtworkBackground;
BOOL haveNotifs, haveOutline, statusBarSectionEnabled, isBatteryHidden, downloadBarEnabled, colorNotifs, leafCornerNotifs, musicPlayerLeafLook;
BOOL newButtonCombo,customImageBackgroundBOOL, hidePageDots, isLockscreenSectionEnabled, hideNoOlderNotifs, weatherLabelEnabled;
BOOL hideLabels, enableGestures, hideHomeBar, haveQuickActions, showsPercentage, hideDock, hideBreadcrumbs;
id preferences, file, yes;
NSInteger configurations, alignment;
NSString *previousTitle;
NSString *dateFormat;
NSString *timeFormat;
double musicPlayerAlpha, outlineSize, rightOffsetForText, notifCornerRadius, musicPlayerCornerRadius, timeLabelHeight, dateLabelHeight, weatherLabelHeight;
MarqueeLabel* bottomLabel;
MarqueeLabel* topLabel;
SBFLockScreenDateView* timeDateView = nil;
UIButton* songImageForSmall;
LocationFetcher *locationFetcher;
int applicationDidFinishLaunching;
UIButton* songBackground;
UIButton* shuffleButton;
UIButton *customImageBackground;
UIImage *currentArtwork;
UIImage *iconImage;
NSData* lastArtworkData;
NSData* lastArtworkData2;
UIView *coloredBackground;
UIView *test;
UIColor *customColor;
UIColor *wallpaperAverageColor;
NSString *songLabel;
NSString *subtitleLabel;
UIColor *fuckingArtworkColor;
UIColor *fuckingArtworkColor2;
WFWeatherConditions *weatherConditions;
WFLocation *wfLocation;
MTMaterialView *yesmf;
UIButton *pauseButton;
UILabel *timeLabel;
UILabel *dateLabel;
// static void mostlySetUpTheAlbumArtwork() {
  	
// }

// static void mostlySetUpTopLabel() {
// 	topLabel = [MarqueeLabel new];
// 	[topLabel setFont:[UIFont systemFontOfSize:15]];
// 	[topLabel setTextAlignment:NSTextAlignmentLeft];
// 	[topLabel setAlpha:1];
// 	if (musicPlayerColorsEnabled) {
// 		UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor"];
// 		[bottomLabel setTextColor:customColor];
// 	}
// 	[topLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
// 	[topLabel.widthAnchor constraintEqualToConstant:230].active = YES;
//     [topLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
// }

// static void mostlySetUpBottomLabel() {
// 	bottomLabel = [MarqueeLabel new];
// 	[bottomLabel setFont:[UIFont systemFontOfSize:15]];
// 	[bottomLabel setTextAlignment:NSTextAlignmentLeft];
// 	[bottomLabel setAlpha:1];
// 	if (musicPlayerColorsEnabled) {
// 		UIColor *customColor = [NCColorPickerUtilities colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleColor"];
// 		[bottomLabel setTextColor:customColor];
// 	}
// 	[bottomLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
// 	[bottomLabel.widthAnchor constraintEqualToConstant:230].active = YES;
// 	[bottomLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
// }

static void setUpTheArtworkBackground() {
	songBackground = [UIButton new];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:musicPlayerCornerRadius];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
}

static void setUpCustomBackground() {
	customImageBackground = [UIButton new];
[customImageBackground setContentMode:UIViewContentModeScaleAspectFill];
[customImageBackground setClipsToBounds:YES];
[customImageBackground setAdjustsImageWhenHighlighted:NO];
[customImageBackground setAlpha:musicPlayerAlpha];
[customImageBackground.layer setCornerRadius:musicPlayerCornerRadius];
[customImageBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
}

// static void	setUpShuffleButton() {
// shuffleButton = [UIButton new];
// [shuffleButton setContentMode:UIViewContentModeScaleAspectFill];
// [shuffleButton setClipsToBounds:YES];
// [shuffleButton setAdjustsImageWhenHighlighted:NO];
// [shuffleButton setTranslatesAutoresizingMaskIntoConstraints:YES];
// [shuffleButton setTintColor: [UIColor blueColor]];
// [shuffleButton setBackgroundColor:[UIColor redColor]];
// shuffleButton.hidden = NO;
// [shuffleButton setAlpha:1];
// }
