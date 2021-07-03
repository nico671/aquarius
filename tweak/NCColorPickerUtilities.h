@interface NCColorPickerUtilities : NSObject
+ (UIColor *)colorFromDefaults: (NSString *)defaults withKey:(NSString *)key;
@end

@interface UIColor (HexString)
+ (UIColor *)colorFromHexString:(NSString *)hexString ;
@end