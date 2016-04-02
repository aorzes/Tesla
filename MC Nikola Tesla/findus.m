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
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    
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
    
    
    
    
    // Do any additional setup after loading the view.
    mapView.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{

    velicina = self.view.frame.size;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    _mapView.frame = CGRectMake(0, navBar.frame.origin.y+navBar.frame.size.height, velicina.width, velicina.height-navBar.frame.origin.y-navBar.frame.size.height-10);
    toolBar.frame = CGRectMake(0, velicina.height-44, velicina.width, 44);
    [UIView commitAnimations];

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

    //NSLog(@"%ld", (long)((UISegmentedControl *)sender).selectedSegmentIndex);
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
-(IBAction)directions:(id)sender{

NSString *url = @"https://maps.apple.com/?daddr=44.560335,15.307954";
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];



}

@end
