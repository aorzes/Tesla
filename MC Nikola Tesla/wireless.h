//
//  wireless.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wireless : UIViewController
{
    UIImageView *wire1;
    UIImageView *wire2;
    UIImageView *stator;
    UIImageView *rotor;
    UIImageView *zarulja;
    UIImageView *zarulja2;
    UIImageView *valovi;

    __weak IBOutlet UINavigationBar *navBar;
    double kutp;
    double pomak;
    NSTimer * timerR;
}

@end
