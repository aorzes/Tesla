//
//  findus.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "findus.h"
#import "MapAnnotations.h"


@interface findus ()

@end

@implementation findus {

    CLLocationManager *locationManager;


}

@synthesize mapView = _mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 44.560335;
    region.center.longitude = 15.307954;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    MapAnnotations *ann = [[MapAnnotations alloc]init];
    ann.title = @"MC Nikola Tesla";
    ann.subtitle = @"Smiljan";
    ann.coordinate = region.center;
    [_mapView addAnnotation:ann];
    
    
    self.locMan = [[CLLocationManager alloc]init];
    self.locMan.delegate = self;
    if ([self.locMan respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        
        [self.locMan requestWhenInUseAuthorization];
        
    }
    [self.locMan startUpdatingLocation];
    
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)setmap:(id)sender{

    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            _mapView.mapType = MKMapTypeSatellite;
            break;
        
        case 2:
            _mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }

}
-(IBAction)locationRetrieve:(id)sender{
    
    NSLog(@"radi");
   // [self uzmiLokaciju];
    _mapView.showsUserLocation = YES;
   

}

@end
