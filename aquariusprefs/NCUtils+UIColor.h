#import <UIKit/UIKit.h>
@interface UIColor (NCUtils)
+ (UIColor *) colorFromHexString:(NSString *) color;
+ (NSString *) hexStringFromColor:(UIColor *) color;
@end

