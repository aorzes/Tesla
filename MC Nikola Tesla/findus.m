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
    // Do any additional setup after loading the view.
    mapView.delegate = self;
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

@end
