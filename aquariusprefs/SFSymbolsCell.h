#import <UIKit/UIKit.h>
@interface PSSpecifier : NSObject
-(id)propertyForKey:(id)arg1 ;
@end

@interface PSTableCell
-(id)specifier;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;
-(id)iconImageView;
@end

@interface SFSymbolsCell : PSTableCell
@property (nonatomic) UIImage *ICONBABY;
@end