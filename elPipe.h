//
//  elPipe.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface elPipe : UIViewController
{
    //UIPanGestureRecognizer *panGesture;
    CGRect velicina;
    NSArray *popisCijevi;
    __weak IBOutlet UINavigationBar *navBar;
    NSMutableArray *izbornikArray;
    UIImageView *aktivnaSlika;
    float dimenzija;
    CGPoint granice;
    int polje[6][9];
    int stariX;
    int stariY;
    CGPoint staraPozicija;
    NSTimer * timerM;
    double kutp,pomak;
    bool ukljuceno;
    __weak IBOutlet UIImageView *strelica2;
    __weak IBOutlet UIImageView *strelica1;
    __weak IBOutlet UIImageView *ruckaVentila;
    __weak IBOutlet UIImageView *zarulja;
    __weak IBOutlet UIImageView *prvaCijev;
    int ciljana; // krajnja u matrici
    int curiX;
    int curiY;
    int vektor;
}
@property (weak, nonatomic) IBOutlet UIImageView *podloga;

@property (weak, nonatomic) IBOutlet UIImageView *rotor;
@property (weak, nonatomic) IBOutlet UIImageView *stator;

@property (weak, nonatomic) IBOutlet UIImageView *nadolazece;
@property (weak, nonatomic) IBOutlet UIImageView *pocetna;
@property (weak, nonatomic) IBOutlet UIImageView *zavrsna;

@end
