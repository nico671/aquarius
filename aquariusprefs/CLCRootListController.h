#import <Preferences/PSListController.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBRespringController.h>
@interface CLCRootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *respringButton;
@property(nonatomic, retain)UIBlurEffect* blur;
@property(nonatomic, retain)UIVisualEffectView* blurView;
@end
