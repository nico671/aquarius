#include "CLCRootListController.h"


#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>

#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>

#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>

#import <CepheiPrefs/HBRootListController.h>
#include <spawn.h>

@implementation CLCRootListController



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
    
}
- (void)setSpecifier:(PSSpecifier *)specifier {
    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];
}
- (bool)shouldReloadSpecifiersOnResume {
return false;
}


@end
