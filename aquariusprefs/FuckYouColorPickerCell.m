#import "FuckYouColorPickerCell.h"
@implementation FuckYouColorPickerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.colorPreview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [specifier setTarget:self];
        [specifier setButtonAction:@selector(openColorPickerView)];
        self.colorPreview.layer.borderColor = [UIColor grayColor].CGColor;
        self.colorPreview.layer.borderWidth = 2;
        self.colorPreview.layer.cornerRadius = 10;
        
        
       
        
        
        [self setAccessoryView:self.colorPreview];
    }
    return self;
}

- (void)openColorPickerView {
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
}
@end 