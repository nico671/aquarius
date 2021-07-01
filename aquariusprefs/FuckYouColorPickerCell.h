#import <UIKit/UIKit.h>
@interface PSSpecifier : NSObject
-(id)propertyForKey:(id)arg1 ;
-(void)setButtonAction:(SEL)arg1 ;
-(void)setTarget:(id)arg1 ;
@end
@interface PSViewController : UIViewController 

@property (nonatomic, retain) PSSpecifier *specifier;
- (void)setParentController:(PSViewController *)controller;
- (PSViewController *)parentController;

@end

@interface PSTableCell : UITableViewCell 
-(id)specifier;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;
-(id)iconImageView;

@end

@interface FuckYouColorPickerCell : PSTableCell <UIColorPickerViewControllerDelegate>
@property (atomic,retain) UIView* colorPreview;
@property (atomic,retain) UIColorPickerViewController* colorViewController;
@end

