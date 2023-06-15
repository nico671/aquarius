#import <UIKit/UIKit.h>
@interface BBBulletin : NSObject
@property (nonatomic, copy) NSString* sectionID;
@property (nonatomic, copy) NSString* bulletinID;
@property (nonatomic, copy) NSString* recordID;
@property (nonatomic, copy) NSString* publisherBulletinID;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* message;
@property (nonatomic, retain) NSDate* date;
@property (assign, nonatomic) BOOL clearable;
@property (nonatomic) BOOL showsMessagePreview;
@end

@interface NCNotificationStructuredListViewController
- (void)_resetCellWithRevealedActions;
- (void)modifyNotificationRequest:(id)arg1;
- (void)revealNotificationHistory:(_Bool)arg1 animated:(_Bool)arg2;
- (void)removeNotificationRequest:(id)arg1;
- (void)insertNotificationRequest:(id)arg1;
@end

struct SBIconImageInfo {
   CGFloat width;
   CGFloat height;
   CGFloat field1;
   CGFloat field2;
};

@interface SBIcon : NSObject
-(UIImage *)iconImageWithInfo:(struct SBIconImageInfo)arg0 ;
@end


@interface SBIconModel : NSObject
-(SBIcon *)applicationIconForBundleIdentifier:(id)arg0 ;
@end

@interface SBIconController : UIViewController
+ (SBIconController *) sharedInstance;
@property (retain, nonatomic) SBIconModel *model;
@end

@interface SBIdleTimerGlobalCoordinator : NSObject
+(id)sharedInstance;
-(void)resetIdleTimer;
@end

@interface UIImage (UIApplicationIconPrivate)
/*
 @param format
    0 - 29x29
    1 - 40x40
    2 - 62x62
    3 - 42x42
    4 - 37x48
    5 - 37x48
    6 - 82x82
    7 - 62x62
    8 - 20x20
    9 - 37x48
    10 - 37x48
    11 - 122x122
    12 - 58x58
 */
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
@end