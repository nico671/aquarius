
#import <Preferences/PSListController.h>
#import <spawn.h>
#import "NCUtils+UIColor.h"
#import <Foundation/Foundation.h>
#import "DBColorNames.h"
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <UIKit/UIKit.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBRootListController.h>
@interface PSSpecifier (PrivateMethods)
-(void)performSetterWithValue:(id)value;
-(id)performGetter;
@end
@interface NSTask : NSObject
-(void)setLaunchPath:(id)arg1;
-(void)setArguments:(id)arg1;
-(void)launch;
@end
@interface LKSRootListController : PSListController <UIFontPickerViewControllerDelegate>
@property (nonatomic, retain) UIBarButtonItem *respringButton;
@property(nonatomic, retain) UIBlurEffect* blur;
@property(nonatomic, retain) UIVisualEffectView* blurView;
@property(nonatomic, retain) UIFontPickerViewController* fontPicker;
@property HBPreferences *preferences;
@property (nonatomic, retain) NSArray *actions;
-(NSArray*)loadValues; 
-(NSArray*)loadTitles; 
@property (strong, nonatomic) DBColorNames *colorNames;
@end

@implementation LKSRootListController

- (void)respring {

   NSTask *respring = [[NSTask alloc] init];
[respring setLaunchPath:@"/usr/bin/killall"];
[respring setArguments:[NSArray arrayWithObjects:@"-9", @"SpringBoard", nil]];
[respring launch];

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

- (id)specifiers {
    
return _specifiers;
}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {
    NSString *colorName = @"";
        NSString *sub = [specifier propertyForKey:@"AquariusSub"];
        self.preferences = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
 _specifiers = [self loadSpecifiersFromPlistName:sub target:self] ;
  

           NSArray *colorsSavedArray = [self.preferences objectForKey:@"colorArray"];
           PSSpecifier *switchSpecifier = [self specifierForID:@"colorPickerID"];
	int switchValue = [[self readPreferenceValue:switchSpecifier] intValue];
         if (switchValue > [colorsSavedArray count]-1){
        [switchSpecifier performSetterWithValue:[NSNumber numberWithFloat:[colorsSavedArray count]-1]];
    }
     int x = 0;
     int i = 0;
    self.colorNames = [DBColorNames new];
    NSMutableArray *colorsNamesArray = [[NSMutableArray alloc]init];
    NSMutableArray *actualColorsArray = [[NSMutableArray alloc]init];
    [actualColorsArray removeAllObjects];
    [colorsNamesArray removeAllObjects];

    for (NSString *key in colorsSavedArray){
        UIColor *color = [UIColor colorFromHexString:key];
        [actualColorsArray insertObject:color atIndex:x];
        x++;
    }

        for (UIColor *color in actualColorsArray){
            colorName = [self.colorNames nameForColor:color];
            [colorsNamesArray insertObject:colorName atIndex:i];
            i++;
        }

    self.actions = [[NSArray alloc]initWithArray:colorsNamesArray];
    
}
- (void)setSpecifier:(PSSpecifier *)specifier {
    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];
}
- (bool)shouldReloadSpecifiersOnResume {
return false;
}
-(NSArray*)loadValues {
    int i;
     NSMutableArray *values = [[NSMutableArray alloc] init];
        for (i = 0; i < [self.actions count]; i++)
            [values addObject:[NSString stringWithFormat:@"%d", i]];
        return values; 
}
-(NSArray*)loadTitles {
    
    return self.actions; 
}
-(void)showFontPicker{
    self.fontPicker = [[UIFontPickerViewController alloc]init];
    self.fontPicker.delegate = self;
    [self presentViewController:self.fontPicker animated:YES completion:nil];
}
- (void)fontPickerViewControllerDidPickFont:(UIFontPickerViewController *)viewController{
    UIFontDescriptor* descriptor = [viewController selectedFontDescriptor];
    UIFont* font = [UIFont fontWithDescriptor:descriptor size:17];

    [self.preferences setObject:font.familyName forKey:@"lockscreenClockCustomFont"];
}
@end



