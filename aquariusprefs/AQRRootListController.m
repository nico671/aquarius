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
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void) setupNavigationTitleView {
    self.navigationItem.titleView = [UIView new];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"2.0";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.alpha = 0;
    [self.navigationItem.titleView addSubview:self.titleLabel];

    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/aquariusprefs.bundle/icon.png"];
    self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.navigationItem.titleView addSubview:self.iconView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
        [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        [self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
        [self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
        [self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
        [self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
    ]];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 70) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
            self.titleLabel.alpha = 1.0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
            self.titleLabel.alpha = 0.0;
        }];
    }
    
    if (offsetY > -40/2) offsetY = -40/2; //have incidence on "padding bottom" under image while scrolling down
    self.headerImageView.frame = CGRectMake(10, offsetY + 64 + 40, self.headerView.frame.size.width - 10*2, 200 - offsetY - 64 - 40*2);
}


-(void)twitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/nico_carbone1"] options:@{} completionHandler:nil];
}
-(void)discord {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/DUmXqPCh"] options:@{} completionHandler:nil];
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
    [self setEnabledState];
    [self setupNavigationTitleView];
    self.preferences = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];

    self.enableSwitch = [UISwitch new];
    [self.enableSwitch setOnTintColor:[UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0]];
    [self.enableSwitch addTarget:self action:@selector(setEnabled) forControlEvents:UIControlEventTouchUpInside];


    self.item = [[UIBarButtonItem alloc] initWithCustomView:self.enableSwitch];
    self.navigationItem.rightBarButtonItem = self.item;
    [self.navigationItem setRightBarButtonItem:self.item];
	

    
	long long didShowOBWelcomeController = [self.preferences integerForKey:@"didShowOBWelcomeController"] ?: 0;

    if (didShowOBWelcomeController == 0) {
		[self setupWelcomeController];
    }

  
}
- (void)setEnabled {
        
    if ([[self.preferences objectForKey:@"isTweakEnabled"] isEqual:@(YES)])
        [self.preferences setBool:NO forKey:@"isTweakEnabled"];
    else
        [self.preferences setBool:YES forKey:@"isTweakEnabled"];

    [self respring];

}
- (void)dismissWelcomeController {
	[self.preferences setInteger:1 forKey:@"didShowOBWelcomeController"];
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupWelcomeController {
    welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Welcome to Aquarius" detailText:@"Bring modern gestures and many unique features to your device." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HalFiPadPrefs.bundle/icon.png"]];

    [welcomeController addBulletedListItemWithTitle:@"Music Player" description:@"Redesign the lockscreen music player" image:[UIImage systemImageNamed:@"music.note.list"]];
    [welcomeController addBulletedListItemWithTitle:@"Declutter" description:@"Remove annoying things from your homescreen" image:[UIImage systemImageNamed:@"paintpalette.fill"]];
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
- (BOOL)hideShitOrNah {
        
    if ([[self.preferences objectForKey:@"isNotificationSectionEnabled"] isEqual:@(YES)])
        return YES;
    else
        return NO;

}



- (void)respring {

    [[self blurView] setFrame:[[self view] bounds]];
    [[self blurView] setAlpha:0];
    [[self view] addSubview:[self blurView]];

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[self blurView] setAlpha:1];
    } completion:^(BOOL finished) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/shuffle.dylib"])
            [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Aquarius"]];
        else
            [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Tweaks&path=Aquarius"]];
    }];

}
- (double)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}
- (void)setEnabledState {

    if ([[self.preferences objectForKey:@"isTweakEnabled"] isEqual:@(YES)])
        [self.enableSwitch setOn:YES animated:YES];
    else
        [self.enableSwitch setOn:NO animated:YES];

}
- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    [self setEnabledState];
    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

}
- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setEnabledState];
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed:0.25 green:0.447 blue:0.58 alpha:1.0];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor clearColor];
        appearanceSettings.navigationBarTitleColor = [UIColor whiteColor];
        appearanceSettings.translucentNavigationBar = YES;
        appearanceSettings.navigationBarTintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        appearanceSettings.tableViewCellSelectionColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        self.hb_appearanceSettings = appearanceSettings;
    }

    return self;
}

@end

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;
@end

