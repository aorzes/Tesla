//
//  findus.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface findus : UIViewController <CLLocationManagerDelegate>{
    MKMapView *mapView;
    }


@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locMan;
-(IBAction)locationRetrieve:(id)sender;

@end
