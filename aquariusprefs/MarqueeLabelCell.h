#import "MarqueeLabel.h"
@interface PSSpecifier : NSObject
-(id)propertyForKey:(id)arg1 ;
@end

@interface PSTableCell : UITableViewCell
-(id)specifier;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;
-(id)iconImageView;
@end

@interface MarqueeLabelCell : PSTableCell
@property MarqueeLabel *marqueeLabel;
@end