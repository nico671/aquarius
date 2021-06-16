#import "AQRManager.h"
@interface RequestWrapper : NSObject
@property (nonatomic, strong) NSString *notificationIdentifier;
@property (nonatomic, strong) NCNotificationRequest *request;
+(RequestWrapper *)wrapRequest:(NCNotificationRequest *)request;
@end
@implementation RequestWrapper
+(RequestWrapper *)wrapRequest:(NCNotificationRequest *)request {
    if (!request || ![request notificationIdentifier]) return nil;
    RequestWrapper *wrapped = [RequestWrapper alloc];
    wrapped.request = [request copy];
    wrapped.notificationIdentifier = [[wrapped.request notificationIdentifier] copy];
    return wrapped;
}
@end
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
            __weak RequestWrapper *wrapped = self.notificationRequests[bundleIdentifier][i];
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

-(void)removeNotificationRequest:(NCNotificationRequest *)req {
    NSString *bundleIdentifier = req.bulletin.sectionID;
    if (self.notificationRequests[bundleIdentifier]) {
        NSMutableArray *requests = self.notificationRequests[bundleIdentifier];
        for (int i = [requests count] - 1; i >= 0; i--) {
                [requests removeObjectAtIndex:i];
            
        }
    }
}

@end