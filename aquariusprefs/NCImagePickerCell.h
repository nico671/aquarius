#import <Photos/Photos.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <PhotosUI/PhotosUI.h>

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

@end


@interface NCImagePickerCell : PSTableCell <PHPickerViewControllerDelegate>
@property (atomic,retain) UIImageView * previewImage;
@property (atomic,retain) PHPickerViewController* imageViewController;
@end
