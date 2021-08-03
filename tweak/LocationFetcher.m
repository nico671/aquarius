#import "LocationFetcher.h"
@implementation LocationFetcher
-(void)start{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    NSLog(@"[aquarius] starting location fetch %@", locationManager.location);
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    currentLocation = [locations lastObject];
    [locationManager stopUpdatingLocation];
    NSLog(@"[aquarius] currentLocation is %@",currentLocation);
}

@end