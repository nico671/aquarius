#import "NCColorPicker.h"
@implementation UIColor(HexString)

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}
@end

@implementation NCColorPicker
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.colorPreview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [specifier setTarget:self];
        [specifier setButtonAction:@selector(openColorPickerView)];
        self.colorPreview.layer.borderColor = [UIColor grayColor].CGColor;
        self.colorPreview.layer.borderWidth = 2;
        self.colorPreview.layer.cornerRadius = 10;
        NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	    [settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist"]];
        NSString *tempHexString;
        tempHexString = [settings objectForKey:[specifier propertyForKey:@"key"]];
        NSLog(@"[aquarius] %@",[settings objectForKey:[specifier propertyForKey:@"key"]]);
        self.colorPreview.backgroundColor = [UIColor colorWithHexString:tempHexString];


        [self setAccessoryView:self.colorPreview];
    }
    return self;
}

- (void)openColorPickerView { //libcscolorpicker
    PSViewController *viewController;
    UIViewController *vc;
    UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
	[gen prepare];
	[gen impactOccurred];
     if ([self respondsToSelector:@selector(_viewControllerForAncestor)]) {
        vc = [self performSelector:@selector(_viewControllerForAncestor)];
    }

    if (!vc) {
        if ([self.specifier propertyForKey:@"parent"]) {
            vc = [self.specifier propertyForKey:@"parent"];
        }
    }
if (vc && [vc isKindOfClass:[PSViewController class]]) {
        viewController = (PSViewController *)vc;
    } else {
        return;
    }


    self.colorViewController = [[UIColorPickerViewController alloc]init];
    self.colorViewController.delegate = self;
    self.colorViewController.modalInPresentation = YES;
    [self.colorViewController setModalPresentationStyle:UIModalPresentationPopover];
    self.colorViewController.providesPresentationContextTransitionStyle = YES;
    self.colorViewController.definesPresentationContext = YES;
    self.colorViewController.view.frame = CGRectMake(viewController.view.frame.origin.x,viewController.view.frame.origin.y,viewController.view.frame.size.width,viewController.view.frame.size.height-500);
    [viewController presentViewController:self.colorViewController animated:YES completion:nil];
}
- (void)colorPickerViewControllerDidFinish:(UIColorPickerViewController *)viewController{
self.colorPreview.backgroundColor = self.colorViewController.selectedColor;
NSString *tempHexString;
tempHexString = [self hexStringFromColor: self.colorViewController.selectedColor];

NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile: @"/var/mobile/Library/Preferences/aquariusprefs.plist"];
    [settings setObject:tempHexString forKey:[[self specifier] propertyForKey:@"key"]];
    [settings writeToFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist" atomically:YES];
    NSLog(@"[aquarius] %@",[settings objectForKey:[[self specifier] propertyForKey:@"key"]]);
}
-(NSString*)hexStringFromColor:(UIColor *)color {

    CGFloat r = 0, g = 0, b = 0, a = 1;

    if (color) {
        [color getRed:&r green:&g blue:&b alpha:&a];
    }

    return [NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX",
            lroundf(a * 255.0),
            lroundf(r * 255.0),
            lroundf(g * 255.0),
            lroundf(b * 255.0)
            ];

}
@end

