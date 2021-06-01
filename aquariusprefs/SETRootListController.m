
#import <Preferences/PSListController.h>
#import <spawn.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <UIKit/UIKit.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>

#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>

#import <CepheiPrefs/HBRootListController.h>
#include <spawn.h>
@interface SETRootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *respringButton;

@end
@implementation SETRootListController


- (void)respring {
    UIBlurEffect* blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView* blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [blurView setFrame:self.view.bounds];
    [blurView setAlpha:0.0];
    [[self view] addSubview:blurView];

    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [blurView setAlpha:1.0];
    } completion:^(BOOL finished) {
        NSURL *returnURL = [NSURL URLWithString:@"prefs:root=orionprefs"];
        SBSRelaunchAction *restartAction;
        restartAction = [NSClassFromString(@"SBSRelaunchAction") actionWithReason:@"RestartRenderServer" options:SBSRelaunchActionOptionsFadeToBlackTransition targetURL:returnURL];
        [[NSClassFromString(@"FBSSystemService") sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
    }];
}

- (instancetype)init {
    self = [super init];


        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];

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

- (id)specifiers {
return _specifiers;
}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {
NSString *sub = [specifier propertyForKey:@"AquariusSub"];

    _specifiers = [self loadSpecifiersFromPlistName:sub target:self] ;
    
}
- (void)setSpecifier:(PSSpecifier *)specifier {
    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];
}
- (bool)shouldReloadSpecifiersOnResume {
return false;
}


@end



