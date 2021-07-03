#import "NCColorPickerUtilities.h"
@implementation NCColorPickerUtilities
+ (UIColor *)colorFromDefaults: (NSString *)defaults withKey:(NSString *)key{
    NSString *path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", defaults];
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSString *tempHexString = [settings objectForKey:key];
    UIColor *fuckyou = [UIColor colorFromHexString:tempHexString];
    return fuckyou;
}
@end

@implementation UIColor (HexString)
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
