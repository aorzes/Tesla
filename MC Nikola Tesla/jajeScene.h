//
//  GameScene.h
//  jaje4_maze
//

//  Copyright (c) 2016 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
//#import "jajeViewController.h"

@interface jajeScene : SKScene{

    NSTimer *timer;
    CGSize velicina;
    double dimenzija;
    SKSpriteNode *left;
    SKSpriteNode *right;
    SKSpriteNode *jaje;
    SKSpriteNode *maliMagnet;
    SKShapeNode *alert;
    double a,b;
    int brkomada;
    double amplituda;
    UILabel *labela;
    NSInteger prikupljeno;
    NSInteger maxprikupljeno;
    AVAudioPlayer *zvuk1;
    BOOL prikazNeuspjeha;
    double pprethodni;
}

-(void)obrisiSve;

@end
