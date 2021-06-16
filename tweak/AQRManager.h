#import "sharedheaders.h"
@interface AQRManager : NSObject
+(instancetype)sharedInstance;
@property (nonatomic, retain) NSMutableDictionary *notificationRequests;
-(void)removeNotificationRequest:(NCNotificationRequest *)req;
-(void)insertNotificationRequest:(NCNotificationRequest *)req; //anything you see to do with this is from axon
@end