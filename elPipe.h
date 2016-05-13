//
//  elPipe.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface elPipe : UIViewController
{
    
    CGRect velicina;
    NSArray *popisCijevi;
    UIImageView *podloga;
    UIImageView *prvaCijev;
    UIImageView *pocetna;
    UIImageView *ruckaVentila;
    //UIImageView *nadolazece;
    UIImageView *stator;
    UIImageView *rotor;
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
    UIImageView *strelica2;
    UIImageView *strelica1;
    
    UIImageView *zarulja;
    UIImageView *zavrsna;
    double sredinaIzbora;
    int ciljana; // krajnja u matrici
    int curiX;
    int curiY;
    int vektor;
    int ukupnoC;
    AVAudioPlayer *zvuk1;
    AVAudioPlayer *zvuk2;
    AVAudioPlayer *zvuk3;
    UILabel *labela;
    
}



@end
