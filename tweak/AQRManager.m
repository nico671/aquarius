#import "AQRManager.h"
@implementation AQRManager
+(AQRManager*)sharedInstance{
     static AQRManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AQRManager alloc] init];
        sharedInstance.notificationRequests = [NSMutableDictionary new];
    });
    return sharedInstance;
}
-(void)insertNotificationRequest:(NCNotificationRequest *)req {
    NSString *bundleIdentifier = req.bulletin.sectionID;

    if (self.notificationRequests[bundleIdentifier]) {
        BOOL found = NO;
        for (int i = 0; i < [self.notificationRequests[bundleIdentifier] count]; i++) {
            NCNotificationRequest *wrapped = self.notificationRequests[bundleIdentifier][i];
            if (wrapped && [[req notificationIdentifier] isEqualToString:[wrapped notificationIdentifier]]) {
                found = YES;
                break;
            }
        }

        if (!found) [self.notificationRequests[bundleIdentifier] addObject:req];
    } else {
        self.notificationRequests[bundleIdentifier] = [NSMutableArray new];
        [self.notificationRequests[bundleIdentifier] addObject:req];
    }

}

-(void)showNotificationRequest:(NCNotificationRequest *)req {
    if (!req) return;
    self.clvc.axnAllowChanges = YES;
    if ([self.clvc respondsToSelector:@selector(insertNotificationRequest:forCoalescedNotification:)]) [self.clvc insertNotificationRequest:req forCoalescedNotification:[self coalescedNotificationForRequest:req]];
    else [self.clvc insertNotificationRequest:req];
    self.clvc.axnAllowChanges = NO;
}

-(void)hideNotificationRequest:(NCNotificationRequest *)req {
    if (!req) return;
    self.clvc.axnAllowChanges = YES;
    [self insertNotificationRequest:req];
    if ([self.clvc respondsToSelector:@selector(removeNotificationRequest:forCoalescedNotification:)]) [self.clvc removeNotificationRequest:req forCoalescedNotification:[self coalescedNotificationForRequest:req]];
    else [self.clvc removeNotificationRequest:req];
    self.clvc.axnAllowChanges = NO;

}
-(id)coalescedNotificationForRequest:(id)req {
    NCCoalescedNotification *coalesced = nil;
    if ([self.dispatcher respondsToSelector:@selector(notificationStore)] && [self.dispatcher.notificationStore respondsToSelector:@selector(coalescedNotificationForRequest:)]) {
        coalesced = [self.dispatcher.notificationStore coalescedNotificationForRequest:req];
    }
    return coalesced;
}
-(void)showNotificationRequests:(id)reqs {
    if (!reqs) return;
    for (id req in reqs) {
        [self showNotificationRequest:req];
    }
}

-(void)hideNotificationRequests:(id)reqs {
    if (!reqs) return;
    for (id req in reqs) {
        [self hideNotificationRequest:req];
    }
}

-(void)removeNotificationRequest:(NCNotificationRequest *)req {
    NSString *bundleIdentifier = req.bulletin.sectionID;
    if (self.notificationRequests[bundleIdentifier]) {
        NSMutableArray *requests = self.notificationRequests[bundleIdentifier];
        for (int i = [requests count] - 1; i >= 0; i--) {
                [requests removeObjectAtIndex:i];
            
        }
    }
}
-(void)getRidOfWaste {
  for (NSString *bundleIdentifier in [self.notificationRequests allKeys]) {
    __weak NSMutableArray *requests = self.notificationRequests[bundleIdentifier];
    for (int i = [requests count] - 1; i >= 0; i--) {
        NCNotificationRequest *req = requests[i];
      if (!req) [requests removeObjectAtIndex:i];
    }
  }
}
-(void)getRidOfWaste {
  for (NSString *bundleIdentifier in [self.notificationRequests allKeys]) {
    __weak NSMutableArray *requests = self.notificationRequests[bundleIdentifier];
    for (int i = [requests count] - 1; i >= 0; i--) {
      __weak AXNRequestWrapper *wrapped = requests[i];
      if (!wrapped || ![wrapped request]) [requests removeObjectAtIndex:i];
    }
  }
}
-(void)updateQuick: (NSString*) bundleID{
    [self.view removeAppCell:bundleID];
}
-(void)modifyNotificationRequest:(NCNotificationRequest *)req {
    if (!req || ![req notificationIdentifier] || !req.bulletin || !req.bulletin.sectionID) return;
    NSString *bundleIdentifier = req.bulletin.sectionID;

    [self getRidOfWaste];
    if (self.notificationRequests[bundleIdentifier]) {
        NSMutableArray *requests = self.notificationRequests[bundleIdentifier];
        for (int i = [requests count] - 1; i >= 0; i--) {
            NCNotificationRequest *wrapped = requests[i];
            if (wrapped && [wrapped notificationIdentifier] && [[req notificationIdentifier] isEqualToString:[wrapped notificationIdentifier]]) {
                [requests removeObjectAtIndex:i];
                [requests insertObject:req atIndex:i];
                return;
            }
        }
    }
}
-(void)showNotificationRequestsForBundleIdentifier:(NSString *)bundleIdentifier {
    [self showNotificationRequests:[AQRManager sharedInstance].notificationRequests[bundleIdentifier]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
      [self.clvc updateNotifications];
    });
}
-(NSArray *)requestsForBundleIdentifier:(NSString *)bundleIdentifier {
    NSMutableArray *array = [NSMutableArray new];
    if (!self.notificationRequests[bundleIdentifier]) return array;
[self getRidOfWaste];
    for (int i = 0; i < [self.notificationRequests[bundleIdentifier] count]; i++) {
        NCNotificationRequest *wrapped = self.notificationRequests[bundleIdentifier][i];
        if (wrapped) [array addObject:wrapped];
    }

    return array;
}
-(void)revealNotificationHistory:(BOOL)revealed {
    [self.clvc revealNotificationHistory:revealed];
}
@end