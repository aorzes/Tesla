//
//  coil.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface coil : UIViewController
{
    UIImageView *drawImage;
    UIImageView *coilImage;
    CGPoint centar;
    CGPoint currentPoint;
    NSTimer * timerT;
    CGSize velicina;

    __weak IBOutlet UINavigationBar *navBar;
}
@end
