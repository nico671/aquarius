#import "NCImagePickerCell.h"
@implementation NCImagePickerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
  if (self) {
      self.previewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
      [specifier setTarget:self];
      [specifier setButtonAction:@selector(openImagePickerView)];
      self.previewImage.layer.borderColor = [UIColor grayColor].CGColor;
      self.previewImage.layer.borderWidth = 2;
      self.previewImage.layer.cornerRadius = 10;
      NSMutableDictionary *settings = [NSMutableDictionary dictionary];
      [settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/aquariusprefs.plist"]];
      self.previewImage.image = [UIImage systemImageNamed:@"questionmark"];


      [self setAccessoryView:self.previewImage];
  }
  return self;
  }
- (void)openImagePickerView { //libcscolorpicker
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
      PHPickerConfiguration * config = [[PHPickerConfiguration alloc]init];
      config.selectionLimit = 2;
      self.imageViewController = [[PHPickerViewController alloc]initWithConfiguration:config];
      self.imageViewController.modalInPresentation = YES;
      [self.imageViewController setModalPresentationStyle:UIModalPresentationPopover];
      self.imageViewController.providesPresentationContextTransitionStyle = YES;
      self.imageViewController.definesPresentationContext = YES;
      self.imageViewController.view.frame = CGRectMake(viewController.view.frame.origin.x,viewController.view.frame.origin.y,viewController.view.frame.size.width,viewController.view.frame.size.height-500);
      [viewController presentViewController:self.imageViewController animated:YES completion:nil];
  }
  -(void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
     [picker dismissViewControllerAnimated:YES completion:nil];

     for (PHPickerResult *result in results)
     {
        // Get UIImage
         [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error)
        {
           if ([object isKindOfClass:[UIImage class]])
           {
              dispatch_async(dispatch_get_main_queue(), ^{
                 self.previewImage.image = object;
              });
           }
        }];
     }
  }
@end
