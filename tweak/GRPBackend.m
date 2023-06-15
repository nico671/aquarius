#import "GRPBackend.h"

@implementation GRPBackend
+ (GRPBackend *) sharedInstance {
    static GRPBackend *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GRPBackend alloc] init];
    });
    return sharedInstance;
}

- (NSInteger) indexOfBundleID:(NSString *)bundleID {
    
    [GRPBackend sharedInstance].savedNotifGroups = self.savedNotifGroups;
    for (NSInteger i = [self.savedNotifGroups count] - 1; i >= 0; i--) {
        GRPNotifDataGroups *group = self.savedNotifGroups[i];
        if([group.bundleID isEqualToString:bundleID]) {
            return i;
        }
    }
    return -1;
}
- (void) insertReq:(NCNotificationRequest *)notifReq {
    if(!notifReq.bulletin.sectionID) return;

    NCNotificationRequest *notif = [notifReq copy];
    if (!self.savedNotifGroups){
        self.savedNotifGroups = [[NSMutableArray alloc] init];
    }
    NSInteger indexter = 0;
    indexter = [self indexOfBundleID:notifReq.bulletin.sectionID];
    if (self.savedNotifGroups){
        if(indexter == -1) {
            GRPNotifDataGroups *newGroup = [GRPNotifDataGroups new];
            [newGroup insertNotificationRequestAgain:notif];
            [self.savedNotifGroups addObject:newGroup];
        } else {
            GRPNotifDataGroups *group = self.savedNotifGroups[indexter]; 
            [group insertNotificationRequestAgain:notifReq];
            [self.view updateCount];
        }
    }
    [GRPBackend sharedInstance].savedNotifGroups = self.savedNotifGroups;
}

-(void)removeReq:(NCNotificationRequest *) notifReq{
    
    if (!notifReq.bulletin.sectionID){
        return;
    }
    
    NSInteger indexter = 0;
    if (self.savedNotifGroups){
        indexter = [self indexOfBundleID:notifReq.bulletin.sectionID];
    }
    
    if(indexter == -1) {
        return;
    } 
    else {
        GRPNotifDataGroups *group = self.savedNotifGroups[indexter]; 
        [group removeNotificationRequestAgain:notifReq];
        
    }
    [GRPBackend sharedInstance].savedNotifGroups = self.savedNotifGroups;
    [[GRPBackend sharedInstance].view updateCount];
    
}
- (void) removeAllNotificationsWithBundleID:(NSString *)bundleID{
    int indexter = [self indexOfBundleID:bundleID];
    GRPNotifDataGroups *group = self.savedNotifGroups[indexter];
    for(int i = group.notificationsForGroup.count - 1; i >= 0; i--) [self removeNotificationRequestFromViewController:group.notificationsForGroup[i]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.notificationViewController _resetCellWithRevealedActions];
    });
}
-(void) removeNotificationRequestFromViewController: (NCNotificationRequest *)req {
    [GRPBackend sharedInstance].isBeingCalledByAquarius = YES;
    [self.notificationViewController removeNotificationRequest:req];
    [GRPBackend sharedInstance].isBeingCalledByAquarius = NO;
}
-(void) insertNotificationRequestToViewController: (NCNotificationRequest *)req {
    [GRPBackend sharedInstance].isBeingCalledByAquarius = YES;
    [self.notificationViewController insertNotificationRequest:req];
    [GRPBackend sharedInstance].isBeingCalledByAquarius = NO;
}
- (void) insertAllNotificationsWithBundleID:(NSString *)bundleID {
    NSInteger indexter = 0;
    indexter = [self indexOfBundleID:bundleID];

    GRPNotifDataGroups *group = self.savedNotifGroups[indexter];
    for(int i = group.notificationsForGroup.count - 1; i >= 0; i--) [self insertNotificationRequestToViewController:group.notificationsForGroup[i]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.notificationViewController _resetCellWithRevealedActions];
    });
}

-(void)modifyReq:(NCNotificationRequest *) notifReq{
    [GRPBackend sharedInstance].savedNotifGroups = self.savedNotifGroups;
    if (!self.savedNotifGroups){
        self.savedNotifGroups = [[NSMutableArray alloc] init];
    }
    NSInteger indexter = 0;
    if (self.savedNotifGroups){
        indexter = [self indexOfBundleID:notifReq.bulletin.sectionID];
    }
    if(indexter == -1) {
        return;
    } else {
        GRPNotifDataGroups *group = self.savedNotifGroups[indexter]; 
        [group updateNotificationRequest:notifReq];
    }
    [GRPBackend sharedInstance].savedNotifGroups = self.savedNotifGroups;
}
@end