//
//  laser.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface elCircuit : UIViewController{

    CGRect velicina;
    double dimenzija;
    UIImageView *podloga;
    UIImageView *izbornik;
    UIImageView *aktivnaSlika;
    UIImageView *drugaStrana;
    UIImageView *smece;
    NSArray *popisElemenata;
    NSArray *popisSlicica;
    BOOL ukljuceno;
    CGPoint staraPozicija;
    int stariX;
    int stariY;
    CGPoint granice;

    int osobineKomada[10][5];
    int poljeKomada[7][9][5];
    
    __weak IBOutlet UIBarButtonItem *backButton;
    __weak IBOutlet UINavigationBar *navBar;
    __weak IBOutlet UIBarButtonItem *resetTipka;
}

@end
