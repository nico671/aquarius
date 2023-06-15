#import <UIKit/UIKit.h>
#import "GRPCell.h"
#import "GRPNotifDataGroups.h"
@interface GRPView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,retain) NSMutableArray *managerInfo;
@property(nonatomic) CGRect initialFrame;
@property NSIndexPath *selectedIndexPath;
@property(nonatomic) UICollectionViewFlowLayout *layout;
- (void) updateCount ;
@property (nonatomic,retain) UICollectionView *collectionView;
@end