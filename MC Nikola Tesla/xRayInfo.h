//
//  xRayInfo.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 16/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xRayInfo : UIViewController
{
    UIImageView *tube;
    UIImageView *elektron;
    UIImageView *xReyBeam;
    NSTimer * timerE;

    __weak IBOutlet UINavigationBar *navBar;
}

@end
