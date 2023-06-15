#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Foundation/Foundation.h>
#import <CepheiPrefs/HBRootListController.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBRespringController.h>

@interface AQRRootListController : HBRootListController
@property(nonatomic, retain)UIBlurEffect* blur;
@property(nonatomic, retain)UIVisualEffectView* blurView;
@property(nonatomic, retain)HBPreferences* preferences;
@property(nonatomic, retain)UISwitch* enableSwitch;
@property(nonatomic, retain)UIBarButtonItem* item;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic,retain) NSMutableDictionary *savedSpecifiers;
@end



@interface PSListController (WelcomeDisplay)
-(BOOL)containsSpecifier:(id)arg1;
@end

@interface OBButtonTray : UIView
-(void)addButton:(id)arg1;
-(void)addCaptionText:(id)arg1;
@end

@interface OBBoldTrayButton : UIButton
-(void)setTitle:(id)arg1 forState:(unsigned long long)arg2;
+(id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
-(OBButtonTray *)buttonTray;
-(id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
-(void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
@end

OBWelcomeController *welcomeController;
