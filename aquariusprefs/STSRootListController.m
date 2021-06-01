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
@interface PSListController (Private)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;

@end
@interface STSRootListController : PSListController
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;

@property (nonatomic, retain) UIBarButtonItem *respringButton;
@end
@implementation STSRootListController



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
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"StatusBar" target:self];
		NSArray *chosenIDs = @[@"timeHidden",@"batteryHidden",@"wifiHidden",@"cellularHidden"];
		self.savedSpecifiers = (!self.savedSpecifiers) ? [[NSMutableDictionary alloc] init] : self.savedSpecifiers;
		for(PSSpecifier *specifier in _specifiers) {
			if ([chosenIDs containsObject:[specifier propertyForKey:@"id"]]) {
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}

       
		}
	}
	return _specifiers;
    NSLog(@"[aquarius] - %@",self.savedSpecifiers);
}
-(void)reloadSpecifiers {
	[super reloadSpecifiers];
	//This will look the exact same as step 5, where we only check if specifiers need to be removed
	//  NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist"]; {


}
-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
		[super setPreferenceValue:value specifier:specifier];

		[self toggleSpecifiersVisibility:YES];
	}



	-(void)toggleSpecifiersVisibility:(BOOL)animated {
		PSSpecifier *switchSpecifier = [self specifierForID:@"switch"];
		BOOL switchValue = [self readPreferenceValue:switchSpecifier];
				
		if(!switchValue) {
		    [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"timeHidden"]] animated:YES];
		    [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"batteryHidden"]] animated:YES];
		    [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"wifiHidden"]] animated:YES];
		    [self removeContiguousSpecifiers:@[self.savedSpecifiers[@"cellularHidden"]] animated:YES];
		} else if(![self containsSpecifier:self.savedSpecifiers[@"timeHidden"]]) {
			[self insertSpecifier:self.savedSpecifiers[@"timeHidden"] afterSpecifierID:@"switch" animated:animated];
		}
	}

	-(void)viewDidLoad {
		[super viewDidLoad];

		[self toggleSpecifiersVisibility:NO];
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
