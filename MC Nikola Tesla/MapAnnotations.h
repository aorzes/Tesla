//
//  MapAnnotations.h
//  MC Nikola Tesla
//
//  Created by Milorad Orzes on 12/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotations : NSObject <MKAnnotation>{
    
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
