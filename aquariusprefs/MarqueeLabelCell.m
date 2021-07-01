#import "MarqueeLabelCell.h"
@implementation MarqueeLabelCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.marqueeLabel = [[MarqueeLabel alloc]initWithFrame:CGRectMake(0,0,250,44)];
        self.marqueeLabel.text = [specifier propertyForKey:@"label"];
        [self.marqueeLabel setClipsToBounds:YES];
        [self.marqueeLabel setFont:[UIFont systemFontOfSize:15]];
    	[self.marqueeLabel setTextAlignment:NSTextAlignmentLeft];
        [self.marqueeLabel setTranslatesAutoresizingMaskIntoConstraints:YES];
        [self.marqueeLabel.heightAnchor constraintEqualToConstant:44].active = true;
        [self.marqueeLabel.widthAnchor constraintEqualToConstant:300].active = true;
        [self insertSubview:self.marqueeLabel atIndex:1];
        [self.marqueeLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [self.marqueeLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        self.textLabel.hidden = YES;
        
    }
    return self;
}
@end