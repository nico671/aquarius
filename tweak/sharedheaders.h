#import <objc/runtime.h>
@interface UIImage (UIApplicationIconPrivate)
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
@end
@interface MTMaterialView : UIView
@end
@interface BBBulletin
@property (nonatomic,copy) NSString * sectionID;
@end
@interface NCNotificationRequest : NSObject
@property (nonatomic,readonly) BBBulletin * bulletin; 
-(NSString *)sectionIdentifier;
-(NSString *)notificationIdentifier;
@end
