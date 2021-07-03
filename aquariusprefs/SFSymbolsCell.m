#import "SFSymbolsCell.h"
@implementation SFSymbolsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    self.ICONBABY = [UIImage new];
    if (self) {
        id properties;
        self.ICONBABY = [UIImage systemImageNamed:[specifier propertyForKey:@"icon"]];
        properties = [specifier valueForKey:@"_properties"];
        properties[@"iconImage"] = self.ICONBABY;
    }

    return self;
}
@end