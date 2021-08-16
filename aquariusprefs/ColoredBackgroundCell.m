#import "NCUtils+UIColor.h"
#import <Cephei/HBPreferences.h>
@interface PSSpecifier
@property (nonatomic,retain) NSArray * values;                                 //@synthesize values=_values - In the implementation block
@property (nonatomic,retain) NSString * name;
@property (nonatomic,retain) NSDictionary * titleDictionary;
@property (nonatomic,retain) NSString * identifier;
@end
@interface PSTableCell : UITableViewCell
-(id)specifier;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;
@end

@interface ColoredBackgroundCell : PSTableCell

@end

@implementation ColoredBackgroundCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
  if (self) {
    // get preferences somehow doesnt have to me hb  but put your idenitfier here
      HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
    int x = 0;
        NSMutableArray *actualColorsArray = [[NSMutableArray alloc]init];
        NSArray *colorsSavedArray = [file objectForKey:@"colorArray"];
        for (NSString *key in colorsSavedArray){
            UIColor *color = [UIColor colorFromHexString:key];
            [actualColorsArray insertObject:color atIndex:x];
            x++;
        }
        NSInteger colorChooser = [file integerForKey:@"lockscreenClockColor"];
      UIView *newBackgroundView = [[UIView alloc]init];
      UIColor *tempColorForBackgroundColor = [actualColorsArray[colorChooser] colorWithAlphaComponent:1];
      newBackgroundView.backgroundColor = tempColorForBackgroundColor;
      self.backgroundView = newBackgroundView;
  }
  return self;
}


@end