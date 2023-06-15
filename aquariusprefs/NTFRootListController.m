
#import <spawn.h>
#import <Cephei/HBRespringController.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <CepheiPrefs/HBRootListController.h>
#include <spawn.h>
#import <Preferences/PSListController.h>
@interface PSListController (Private)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
-(id)readPreferenceValue:(PSSpecifier *)arg1;
@end
@interface NTFRootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *respringButton;
@property(nonatomic, retain)UIBlurEffect* blur;
@property (nonatomic,retain) NSMutableDictionary *savedSpecifiers;
@property(nonatomic, retain)HBPreferences* preferences;
@property(nonatomic, retain)UIVisualEffectView* blurView;
-(void)respring;
@end

@implementation NTFRootListController
-(void)testBanner{
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.nico671.testBanner", nil, nil, true);
}

-(void)lsNotif{
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.nico671.testNotif", nil, nil, true);
}
- (instancetype)init {
    self = [super init];


        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.60 green:0.75 blue:0.85 alpha:1.0];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];

        self.hb_appearanceSettings = appearanceSettings;



    if (self) {

		self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(respring)];

			self.navigationItem.rightBarButtonItem = self.respringButton;
}
return self;
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

- (id)specifiers {
return _specifiers;
}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {
NSString *sub = [specifier propertyForKey:@"AquariusSub"];

    _specifiers = [self loadSpecifiersFromPlistName:sub target:self] ;
    NSArray *chosenIDs = @[@"hidden1",@"hidden2",@"hidden3"];
		self.savedSpecifiers = (self.savedSpecifiers) ?: [[NSMutableDictionary alloc] init];
		for(PSSpecifier *specifier in [self specifiersForIDs:chosenIDs]) {
			[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
		}
    
}
- (void)setSpecifier:(PSSpecifier *)specifier {
    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];
}
- (bool)shouldReloadSpecifiersOnResume {
return false;
}
-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
	[super setPreferenceValue:value specifier:specifier];

	[self updateSpecifierVisibility:YES];
}
-(void)viewDidLoad {
	[super viewDidLoad];

	[self updateSpecifierVisibility:NO];
}
-(void)updateSpecifierVisibility:(BOOL)animated {
	//Get value of switch specifier
	PSSpecifier *switchSpecifier = [self specifierForID:@"SWITCH_ID"];
	int switchValue = [[self readPreferenceValue:switchSpecifier] intValue];

	if(switchValue == 0) {
            [self removeSpecifier:self.savedSpecifiers[@"hidden2"] animated:animated];
            [self removeSpecifier:self.savedSpecifiers[@"hidden3"] animated:animated];   
            [self insertSpecifier:self.savedSpecifiers[@"hidden1"] afterSpecifierID:@"SWITCH_ID" animated:animated];
            [self removeSpecifier:self.savedSpecifiers[@"hidden3"] animated:animated];   
	} else if(switchValue == 1) {
            [self removeSpecifier:self.savedSpecifiers[@"hidden3"] animated:animated];
             [self removeSpecifier:self.savedSpecifiers[@"hidden2"] animated:animated];   
            [self insertSpecifier:self.savedSpecifiers[@"hidden2"] afterSpecifierID:@"SWITCH_ID" animated:animated];
            [self removeSpecifier:self.savedSpecifiers[@"hidden1"] animated:animated];
	}
    else if(switchValue == 2) {
            [self removeSpecifier:self.savedSpecifiers[@"hidden1"] animated:animated];
            [self removeSpecifier:self.savedSpecifiers[@"hidden2"] animated:animated];   
            [self removeSpecifier:self.savedSpecifiers[@"hidden3"] animated:animated];   
            [self insertSpecifier:self.savedSpecifiers[@"hidden3"] afterSpecifierID:@"SWITCH_ID" animated:animated];   
    }
}
@end
