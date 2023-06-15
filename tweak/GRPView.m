#import "GRPView.h"

#import "GRPBackend.h"
#import <objc/runtime.h>
#include "RemoteLog.h"
@implementation GRPView
- (void) updateCount {
    self.managerInfo = [GRPBackend sharedInstance].savedNotifGroups;
   [self.collectionView reloadData];
}

- (GRPView *)initWithFrame: (CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.collectionView.userInteractionEnabled = YES;
        self.collectionView.allowsSelection = YES;
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        self.layout.itemSize = [GRPCell cellSize];
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
        [self.collectionView setDataSource:self];
        self.collectionView.delegate = self;
        [self.collectionView registerClass:NSClassFromString(@"GRPCell") forCellWithReuseIdentifier:@"haha"];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.collectionView];
        self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.collectionView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [self.collectionView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [self.collectionView.widthAnchor constraintEqualToConstant:frame.size.width].active = YES;
        [self.collectionView.heightAnchor constraintEqualToConstant:frame.size.height].active = YES;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    [self updateCount];
    if(section != 0) return 0;
    self.managerInfo = [GRPBackend sharedInstance].savedNotifGroups;
    if (self.managerInfo){
        return self.managerInfo.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GRPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"haha" forIndexPath:indexPath];
    GRPNotifDataGroups *group = self.managerInfo[indexPath.item];
    cell.group = group;
    SBIconController *iconController = [objc_getClass("SBIconController") sharedInstance]; 
    SBIcon *sbIcon = [iconController.model applicationIconForBundleIdentifier:group.bundleID];
    
    cell.iconView.image = [sbIcon iconImageWithInfo:(struct SBIconImageInfo){60,60,2,0}];
    cell.countLabel.backgroundColor = [cell.iconView.image averageColor];
    cell.countLabel.text = [NSString stringWithFormat:@"%lu",group.notificationsForGroup.count];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[GRPBackend sharedInstance].notificationViewController revealNotificationHistory:NO animated:YES];
    GRPNotifDataGroups *group = self.managerInfo[indexPath.item]; 
    [[GRPBackend sharedInstance] removeAllNotificationsWithBundleID:group.bundleID];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectedIndexPath == indexPath){
        [self collectionView:self.collectionView didDeselectItemAtIndexPath:indexPath];
        self.selectedIndexPath = nil;
        return;
    }
    self.selectedIndexPath = indexPath;
    [[objc_getClass("SBIdleTimerGlobalCoordinator") sharedInstance] resetIdleTimer];
    UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
	[gen prepare];
	[gen impactOccurred];
    GRPNotifDataGroups *group = self.managerInfo[indexPath.item]; 
    [[GRPBackend sharedInstance] insertAllNotificationsWithBundleID:group.bundleID];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [GRPCell cellSize];
}
@end