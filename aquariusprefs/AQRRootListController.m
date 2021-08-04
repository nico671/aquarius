#include "AQRRootListController.h"
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>
#include <spawn.h>
#include <UIKit/UIKit.h>
@implementation AQRRootListController

-(void)twitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/nico_carbone1"] options:@{} completionHandler:nil];
}

-(void)resetPreferences {
    HBPreferences* preferences = [[HBPreferences alloc] initWithIdentifier: @"aquariusprefs"];
    [preferences removeAllObjects];
    [self respring];
}

- (void)sourceCode {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/nico671/aquarius"] options:@{} completionHandler:nil];
}
- (void)venmo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/nico671dev"] options:@{} completionHandler:nil];
}
- (void)viewDidLoad {
	[super viewDidLoad];

    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist"]];	
    
	NSNumber *didShowOBWelcomeController = [settings valueForKey:@"didShowOBWelcomeController"] ?: @0;

    if ([didShowOBWelcomeController isEqual:@0]) {
		[self setupWelcomeController];
    }
    
  
}

- (void)dismissWelcomeController {
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist"]];
	[settings setObject:@1 forKey:@"didShowOBWelcomeController"];
	[settings writeToFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist" atomically:YES];
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupWelcomeController {
    welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Welcome to Aquarius" detailText:@"Bring modern gestures and many unique features to your device." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HalFiPadPrefs.bundle/icon.png"]];

    [welcomeController addBulletedListItemWithTitle:@"Music Player" description:@"Redesign the lockscreen music player" image:[UIImage systemImageNamed:@"music.note.list"]];
    [welcomeController addBulletedListItemWithTitle:@"Declutter" description:@"remove annoying things from your homescreen" image:[UIImage systemImageNamed:@"paintpalette.fill"]];
    [welcomeController addBulletedListItemWithTitle:@"Notifications" description:@"Color your notifications and much more" image:[UIImage systemImageNamed:@"app.badge"]];
    [welcomeController addBulletedListItemWithTitle:@"Open Source" description:@"aquarius is open source. feel free to use it!" image:[UIImage systemImageNamed:@"chevron.left.slash.chevron.right"]];
    [welcomeController.buttonTray addCaptionText:@"by nico671"];

    OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
    [continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Ogres are like onions. - shrek" forState:UIControlStateNormal];
    [continueButton setClipsToBounds:YES];
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [continueButton.layer setCornerRadius:15];
    [welcomeController.buttonTray addButton:continueButton];

    welcomeController.modalPresentationStyle = UIModalPresentationPageSheet;
    welcomeController.view.tintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
    [self presentViewController:welcomeController animated:YES completion:nil];
}
// -(void)scrollViewDidScroll:(UIScrollView *)scrollView {
// 	if([self.navigationItem.titleView respondsToSelector:@selector(adjustLabelPositionToScrollOffset:)]) {
// 		//[(AQRAnimatedTitleView *)self.navigationItem.titleView adjustLabelPositionToScrollOffset:scrollView.contentOffset.y];
// }
// }
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (void)respring {
    UIBlurEffect* blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView* blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [blurView setFrame:self.view.bounds];
    [blurView setAlpha:0.0];
    [[self view] addSubview:blurView];

    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [blurView setAlpha:1.0];
    } completion:^(BOOL finished) {
        NSURL *returnURL = [NSURL URLWithString:@"prefs:root=aquariusprefs"];
        SBSRelaunchAction *restartAction;
        restartAction = [NSClassFromString(@"SBSRelaunchAction") actionWithReason:@"RestartRenderServer" options:SBSRelaunchActionOptionsFadeToBlackTransition targetURL:returnURL];
        [[NSClassFromString(@"FBSSystemService") sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
    }];
}

- (instancetype)init {
    self = [super init];


        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor clearColor];
        appearanceSettings.tableViewCellSelectionColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        self.hb_appearanceSettings = appearanceSettings;



    if (self) {

		self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"respring"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(respring)];

			self.navigationItem.rightBarButtonItem = self.respringButton;
}
return self;
}

@end

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;
@end


@interface AquariusTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView *bgView;
    UILabel *packageNameLabel;
    UILabel *developerLabel;
    UILabel *versionLabel;
}
@end

@implementation AquariusTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {
		int width = self.contentView.bounds.size.width;
        int height = self.contentView.bounds.size.width;
        CGRect rect = CGRectMake(0,0,width,height);


    CGRect nameFrame = CGRectMake(CGRectGetMinX(rect), 90, width, 50);
    CGRect developerFrame = CGRectMake(CGRectGetMinX(rect), 50, width, 50);
    CGRect versionFrame = CGRectMake(CGRectGetMinX(rect), 130, width, 50);


    packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
    [packageNameLabel setTextAlignment:NSTextAlignmentCenter];
    packageNameLabel.text = @"Aquarius";


    developerLabel = [[UILabel alloc] initWithFrame:developerFrame];
    [developerLabel setFont:[UIFont systemFontOfSize:25 weight: UIFontWeightMedium] ];
    developerLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
     [developerLabel setTextAlignment:NSTextAlignmentCenter];
    developerLabel.text = @"Nico671";


    versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
    [versionLabel setFont:[UIFont systemFontOfSize:22 weight: UIFontWeightMedium] ];
    versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
     [versionLabel setTextAlignment:NSTextAlignmentCenter];
    versionLabel.text = @"v2.0";

    [self addSubview:packageNameLabel];
    [self addSubview:developerLabel];
    [self addSubview:versionLabel];
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.447 blue:0.58 alpha:1.0];

    }
    	return self;
}

- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WotsitBetaTitleCell" specifier:specifier];
}

- (void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    return 215.0f;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}


@end
