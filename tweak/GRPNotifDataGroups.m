#import "GRPNotifDataGroups.h"
#import "GRPBackend.h"
@implementation GRPNotifDataGroups
-(void)insertNotificationRequestAgain: (NCNotificationRequest *) request{
    if (!self.notificationsForGroup){
        self.notificationsForGroup = [NSMutableArray new];
    }
    if (self.notificationsForGroup){
        [self.notificationsForGroup addObject:request];
        self.bundleID = request.bulletin.sectionID;
    }
}
-(void)updateNotificationRequest: (NCNotificationRequest *) request{
    for(int i = self.notificationsForGroup.count - 1; i >= 0; i--) {
        NCNotificationRequest *requestToBeRemoved = self.notificationsForGroup[i];
        if([requestToBeRemoved.notificationIdentifier isEqualToString:request.notificationIdentifier]) {
            [self.notificationsForGroup removeObjectAtIndex:i];
            [self.notificationsForGroup insertObject:request atIndex:i];
            break;
        }
    }
}
-(void)removeNotificationRequestAgain: (NCNotificationRequest *) request{
    for (int i = self.notificationsForGroup.count - 1; i >= 0; i--){
        NCNotificationRequest *containedReq = self.notificationsForGroup[i];
        if ([containedReq.notificationIdentifier isEqualToString:request.notificationIdentifier]){
            [self.notificationsForGroup removeObjectAtIndex:i];
            if (0 == [self.notificationsForGroup count]){
                NSLog(@"[aquarius] is this being called, %lu",self.notificationsForGroup.count);
                NSInteger indexter = [[GRPBackend sharedInstance] indexOfBundleID:containedReq.bulletin.sectionID];
                [[GRPBackend sharedInstance].savedNotifGroups removeObjectAtIndex:indexter];
                [[GRPBackend sharedInstance].notificationViewController removeNotificationRequest:request];
            }
            break;
        }
    }
}
@end