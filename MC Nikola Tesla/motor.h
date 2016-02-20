//
//  motor.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface motor : UIViewController
{
    UIImageView *stator;
    UIImageView *rotor;
    UIImageView *instrument1;
    UIImageView *instrument2;
    UIImageView *instrument3;
    UIImageView *osovinaK1;
    UIImageView *osovinaK2;
    UIImageView *osovinaK3;
    UIImageView *kazaljka1;
    UIImageView *kazaljka2;
    UIImageView *kazaljka3;
    UIImageView *prekidac;
    UIImageView *podlogaPrekidaca;
    UIImageView *trigonom;
    __weak IBOutlet UINavigationBar *navBar;
    CGSize velicina;
    
    NSMutableArray *zarulje;
    NSTimer * timerR;
    double kutp;
    double pomak;
    
}

@end
