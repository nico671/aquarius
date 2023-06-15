#import "GRPNotifDataGroups.h"
#import "GcUniversal/GcImageUtils.h"
@interface GRPCell : UICollectionViewCell
@property (nonatomic,retain) UIColor *tintColor;
@property (nonatomic,retain) GRPNotifDataGroups *group;
@property (nonatomic,retain) UIImageView *iconView;
@property (nonatomic,retain) UILabel *countLabel;
+ (CGSize) cellSize ;
@end