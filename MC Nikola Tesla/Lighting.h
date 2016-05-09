//
//  Lighting.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 07/05/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Lighting : UIViewController
{
    NSMutableArray *izbornikArray;
    NSArray *popisZarulja;
    NSArray *popisSZarulja;
    NSArray *popisGrla;
    NSTimer *timerM;
    UIImageView *aktivnaSlika;
    UIImageView *aktivniNosac;
    UIImageView *podloga;
    double dimenzija;
    double sredinaIzbora;
    double polozajAktivnogNosaca;
    CGSize velicina;
    int brojacSpustanja;
    double koeficijentBrzine;
    double brzina;
    int kolikoMjesta;
    int brojUklopljenih;
    bool imaLiNosaca;
    __weak IBOutlet UINavigationBar *navBar;
    UILabel *labela;
    int ukupniBrojSpojenih;
    int upaljeniProzori[6][4];
    int brojUpaljenihProzora;
    AVAudioPlayer *zvuk1;
    NSInteger maxConnected;
}

@end
