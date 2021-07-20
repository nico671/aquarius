#import "NCUtils+UIColor.h"
@implementation UIColor (NCUtils)
+ (UIColor *) colorFromHexString:(NSString *) color { //https://stackoverflow.com/questions/36341358/how-to-convert-uicolor-to-string-and-string-to-uicolor-using-swift
    if([color length] != 6) {
        return nil;
    }

    NSScanner *scanner = [NSScanner scannerWithString:color];
    UInt64 hexNumber = 0;
    if ([scanner scanHexLongLong:&hexNumber]) {
        CGFloat r = ((hexNumber & 0xff000000) >> 24) / 255.0;
        CGFloat g = ((hexNumber & 0x00ff0000) >> 16) / 255.0;
        CGFloat b = ((hexNumber & 0x0000ff00) >> 8) / 255.0;
        CGFloat a = (hexNumber & 0x000000ff) / 255.0;

        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }

    return [UIColor whiteColor];
}
+ (NSString *) hexStringFromColor:(UIColor *) color { // https://stackoverflow.com/questions/36341358/how-to-convert-uicolor-to-string-and-string-to-uicolor-using-swift
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return [NSString stringWithFormat:@"%02x%02x%02x", (int)(red * 255), (int)(green * 255) , (int)(blue * 255)];
}
@end