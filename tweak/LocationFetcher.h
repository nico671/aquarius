#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
@interface LocationFetcher : NSObject <CLLocationManagerDelegate> {
    CLLocation *currentLocation;
    CLLocationManager *locationManager;
}
-(void)start;
@end