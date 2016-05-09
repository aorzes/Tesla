//
//  GameScene.m
//  jaje4_maze
//
//  Created by Anton Orzes on 12/04/16.
//  Copyright (c) 2016 Anton Orzes. All rights reserved.
//

#import "jajeScene.h"



@implementation jajeScene

-(void)spremisve{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:maxprikupljeno forKey:@"bestJaje"];
    [userDefaults synchronize];
}

-(void)ucitajsve{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    maxprikupljeno = [userDefaults integerForKey:@"bestJaje"];
   
}



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.physicsWorld.gravity = CGVectorMake(5.0f, -1.0f);
    prikazNeuspjeha=false;
    velicina=self.size;
    brkomada=20;
    dimenzija= velicina.height/(brkomada);
    a=0;
    amplituda=velicina.width/4;
    prikupljeno=0;
    [self ucitajsve];
    CGPoint polozaj;
    polozaj.y=-dimenzija;
    
    NSURL *Zvuk = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"zPada" ofType:@"mp3"]];
    zvuk1 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk error:nil];
    [zvuk1 setVolume: 1];
    [zvuk1 prepareToPlay];
    
    SKSpriteNode *nebo=[SKSpriteNode spriteNodeWithImageNamed:@"neboJS"];
    nebo.position=CGPointMake(velicina.width/2, velicina.height/2);
    nebo.size=CGSizeMake(velicina.width, velicina.height);
    nebo.name=@"nebo";
    nebo.zPosition=1;
    [self addChild:nebo];
    
    for (int i=0; i<=brkomada+1; i++) {
        polozaj.x= sin(a)*velicina.width/4+velicina.width/4;
        double sirina = dimenzija*2.0;
        if (i%4==0) {
            sirina = dimenzija*2.0;
        }
        SKSpriteNode *komad1=[SKSpriteNode spriteNodeWithImageNamed:@"kamen"];
        komad1.size = CGSizeMake(sirina, dimenzija);
        komad1.position=polozaj;
        komad1.name=@"komad1";
        komad1.zPosition=2;
        [self addChild:komad1];
        komad1.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:komad1.frame.size];
        komad1.physicsBody.affectedByGravity=NO;
        komad1.physicsBody.dynamic=NO;
        komad1.physicsBody.collisionBitMask = (UInt32)1;
        komad1.physicsBody.contactTestBitMask= (UInt32)1;
        komad1.physicsBody.categoryBitMask = (UInt32)1;
        
        SKSpriteNode *komad2=[SKSpriteNode spriteNodeWithImageNamed:@"kamen"];
        komad2.size = CGSizeMake(sirina, dimenzija);
        komad2.position=CGPointMake(polozaj.x+velicina.width/2, polozaj.y);
        komad2.name=@"komad2";
        komad2.zPosition=2;
        [self addChild:komad2];
        komad2.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:komad1.frame.size];
        komad2.physicsBody.affectedByGravity=NO;
        komad2.physicsBody.dynamic=NO;
        komad2.physicsBody.collisionBitMask = (UInt32)1;
        komad2.physicsBody.contactTestBitMask= (UInt32)1;
        komad2.physicsBody.categoryBitMask = (UInt32)1;
        
        a+=2*M_PI/(brkomada+1);
        polozaj.y+=dimenzija;
    }
    jaje=[SKSpriteNode spriteNodeWithImageNamed:@"teslinoJaje"];
    jaje.position=CGPointMake(velicina.width/2, velicina.height/2);
    jaje.size=CGSizeMake(dimenzija*1.5, dimenzija*2.2);
    jaje.name=@"jaje";
    jaje.zPosition=2;
    [self addChild:jaje];
    jaje.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:jaje.frame.size];
    jaje.physicsBody.affectedByGravity=YES;
    jaje.physicsBody.collisionBitMask = (UInt32)1;
    jaje.physicsBody.contactTestBitMask= (UInt32)1;
    jaje.physicsBody.categoryBitMask = (UInt32)1;
    
    SKTexture *fac1 = [SKTexture textureWithImageNamed:@"faca1"];
    SKTexture *fac2 = [SKTexture textureWithImageNamed:@"faca2"];
    SKTexture *fac3 = [SKTexture textureWithImageNamed:@"faca3"];
    SKTexture *fac4 = [SKTexture textureWithImageNamed:@"faca4"];
    SKTexture *fac5 = [SKTexture textureWithImageNamed:@"faca5"];
    SKTexture *fac6 = [SKTexture textureWithImageNamed:@"faca6"];
    SKTexture *fac7 = [SKTexture textureWithImageNamed:@"faca7"];
    SKTexture *fac8 = [SKTexture textureWithImageNamed:@"faca8"];
    SKTexture *fac9 = [SKTexture textureWithImageNamed:@"faca9"];
    SKTexture *fac10 = [SKTexture textureWithImageNamed:@"faca10"];
    SKTexture *fac11 = [SKTexture textureWithImageNamed:@"faca11"];
    SKTexture *fac12 = [SKTexture textureWithImageNamed:@"faca12"];
    SKTexture *fac13 = [SKTexture textureWithImageNamed:@"faca13"];
    SKTexture *fac14 = [SKTexture textureWithImageNamed:@"faca14"];
    SKTexture *fac15 = [SKTexture textureWithImageNamed:@"faca15"];
    SKTexture *fac16 = [SKTexture textureWithImageNamed:@"faca16"];
    SKTexture *fac17 = [SKTexture textureWithImageNamed:@"faca17"];

    
    NSArray *facArray = @[fac1, fac2, fac3, fac4, fac5,fac6,fac7,fac8,fac9,fac10,fac11,fac12,fac13,fac14,fac15,fac16,fac17];
    SKAction *lopFac =[SKAction animateWithTextures:facArray timePerFrame:0.1];
    SKAction *repeatLop = [SKAction repeatActionForever:lopFac];
    
    SKSpriteNode *faca=[SKSpriteNode spriteNodeWithImageNamed:@"faca1"];
    faca.position=CGPointMake(0, 0);
    faca.size=CGSizeMake(dimenzija*1.5, dimenzija*2.2);
    faca.zPosition=1;
    faca.name=@"faca";
    [jaje addChild:faca];
    [faca runAction:repeatLop];
    
    left=[SKSpriteNode spriteNodeWithImageNamed:@"zelenaTipka"];
    left.position=CGPointMake(dimenzija*2, velicina.height/2);
    left.size=CGSizeMake(dimenzija*2, dimenzija*2);
    left.name=@"left";
    left.zPosition=5;
    [self addChild:left];
    right=[SKSpriteNode spriteNodeWithImageNamed:@"crvenaTipka"];
    right.position=CGPointMake(velicina.width-dimenzija*2, velicina.height/2);
    right.size=CGSizeMake(dimenzija*2, dimenzija*2);
    right.name=@"right";
    right.zPosition=5;
    [self addChild:right];

    SKSpriteNode *magnet1=[SKSpriteNode spriteNodeWithImageNamed:@"elMagnet"];
    magnet1.size=CGSizeMake(dimenzija*2, dimenzija*2);
    magnet1.position=CGPointMake(magnet1.size.width/2, velicina.height-magnet1.size.height*2);
    magnet1.zPosition=5;
    [self addChild:magnet1];
    
    SKSpriteNode *magnet2=[SKSpriteNode spriteNodeWithImageNamed:@"elMagnet"];
    magnet2.size=CGSizeMake(dimenzija*2, dimenzija*2);
    magnet2.position=CGPointMake(velicina.width - magnet1.size.width/2, velicina.height-magnet1.size.height*2);
    magnet2.zPosition=5;
    [self addChild:magnet2];
    
    SKSpriteNode *magnet3=[SKSpriteNode spriteNodeWithImageNamed:@"elMagnet"];
    magnet3.size=CGSizeMake(dimenzija*2, dimenzija*2);
    magnet3.position=CGPointMake(magnet1.size.width/2, magnet1.size.height*2);
    magnet3.zPosition=5;
    [self addChild:magnet3];
    
    SKSpriteNode *magnet4=[SKSpriteNode spriteNodeWithImageNamed:@"elMagnet"];
    magnet4.size=CGSizeMake(dimenzija*2, dimenzija*2);
    magnet4.position=CGPointMake(velicina.width - magnet1.size.width/2, magnet1.size.height*2);
    magnet4.zPosition=5;
    [self addChild:magnet4];
    
    maliMagnet=[SKSpriteNode spriteNodeWithImageNamed:@"maliMagnet"];
    maliMagnet.size=CGSizeMake(dimenzija, dimenzija);
    maliMagnet.position=CGPointMake(velicina.width/2, maliMagnet.size.height*2);
    maliMagnet.name=@"maliMagnet";
    maliMagnet.zPosition=5;
    [self addChild:maliMagnet];
    SKAction *rotate=[SKAction rotateByAngle:M_PI duration:0.5];
    SKAction *ponovRot=[SKAction repeatActionForever:rotate];
    [maliMagnet runAction:ponovRot];
    

    
    [self timerFunction];
    b=1.5;
    
    labela =[[UILabel alloc]init];
    labela.frame = CGRectMake(0, 64, self.view.frame.size.width, 30);
    labela.backgroundColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6] ;
    [labela setFont:[UIFont systemFontOfSize:12]];
    labela.text = @"Collected: 0";
    labela.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labela];
    
    
}

-(void)napraviSve{

    if (prikupljeno>maxprikupljeno) {
        maxprikupljeno=prikupljeno;
        [self spremisve];
    }

    a=0;
    b=1.5;
    prikupljeno=0;
    labela.text = [NSString stringWithFormat:@"Collected: %ld",(long)prikupljeno];
    CGPoint polozaj;
    polozaj.y=-dimenzija;
    for (int i=0; i<=brkomada+1; i++) {
        polozaj.x= sin(a)*velicina.width/4+velicina.width/4;
        double sirina = dimenzija*2.0;
        if (i%4==0) {
            sirina = dimenzija*2.0;
        }
        SKSpriteNode *komad1=[SKSpriteNode spriteNodeWithImageNamed:@"kamen"];
        komad1.size = CGSizeMake(sirina, dimenzija);
        komad1.position=polozaj;
        komad1.name=@"komad1";
        komad1.zPosition=2;
        [self addChild:komad1];
        komad1.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:komad1.frame.size];
        komad1.physicsBody.affectedByGravity=NO;
        komad1.physicsBody.dynamic=NO;
        komad1.physicsBody.collisionBitMask = (UInt32)1;
        komad1.physicsBody.contactTestBitMask= (UInt32)1;
        komad1.physicsBody.categoryBitMask = (UInt32)1;
        
        SKSpriteNode *komad2=[SKSpriteNode spriteNodeWithImageNamed:@"kamen"];
        komad2.size = CGSizeMake(sirina, dimenzija);
        komad2.position=CGPointMake(polozaj.x+velicina.width/2, polozaj.y);
        komad2.name=@"komad2";
        komad2.zPosition=2;
        [self addChild:komad2];
        komad2.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:komad1.frame.size];
        komad2.physicsBody.affectedByGravity=NO;
        komad2.physicsBody.dynamic=NO;
        komad2.physicsBody.collisionBitMask = (UInt32)1;
        komad2.physicsBody.contactTestBitMask = (UInt32)1;
        komad2.physicsBody.categoryBitMask = (UInt32)1;
        
        a+=2*M_PI/(brkomada+1);
        polozaj.y+=dimenzija;
    }

    jaje.zRotation = 0;
    jaje.position=CGPointMake(velicina.width/2, velicina.height/2);


}

-(void) obrisiSve{
    prikazNeuspjeha=false;
     for(SKNode *node in self.scene.children ){

        if ([node.name isEqualToString:@"komad1"] || [node.name isEqualToString:@"komad2"] || [node.name isEqualToString:@"alert"] || [node.name isEqualToString:@"zvjezdica"] ) {
            [node removeFromParent];
        }
    }
    [self napraviSve];
    
}

-(void)neuspjeh{
    prikazNeuspjeha=true;
    if (prikupljeno>maxprikupljeno) {
        maxprikupljeno=prikupljeno;
        [self spremisve];
    }
    
    alert=[SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(velicina.width/1.5, velicina.height/4) cornerRadius:10];
    alert.position=CGPointMake(velicina.width/2, velicina.height/2);
    alert.zPosition=6;
    alert.fillColor = [UIColor whiteColor];
    alert.name = @"alert";
    [self addChild:alert];
    SKLabelNode *naslov= [SKLabelNode labelNodeWithText:@"Fall"];
    naslov.position = CGPointMake(0, alert.frame.size.height/4);
    naslov.zPosition=1;
    naslov.fontSize = dimenzija;
    naslov.fontColor =[UIColor blackColor];
    [alert addChild:naslov];
    
    SKLabelNode *rezultat= [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"Best:%ld You:%ld",(long)maxprikupljeno,(long)prikupljeno]];
    rezultat.position = CGPointMake(0, 0);
    rezultat.fontSize = dimenzija/1.5;
    rezultat.zPosition=1;
    rezultat.fontColor =[UIColor blackColor];
    [alert addChild:rezultat];
    
    SKShapeNode *tipka=[SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(dimenzija*2, dimenzija) cornerRadius:5];
    tipka.position=CGPointMake(0,  -alert.frame.size.height/3);
    tipka.strokeColor = [UIColor colorWithRed:0.25 green:0.52 blue:0.99 alpha:0.7];
    tipka.name= @"restart";
    [alert addChild:tipka];
    
    SKLabelNode *tipkatekst= [SKLabelNode labelNodeWithText:@"Restart"];
    tipkatekst.fontSize = dimenzija/2.5;
    tipkatekst.fontName = @"ArialRoundedMTBold";
    tipkatekst.position = CGPointMake(0, -tipkatekst.fontSize/2);
    tipkatekst.zPosition=1;
    tipkatekst.name=@"restart";
    tipkatekst.fontColor =[UIColor colorWithRed:0.25 green:0.52 blue:0.99 alpha:1.0];
    [tipka addChild:tipkatekst];
   
    
}


-(void)timerFunction {
    
    if (!timer) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(miciSve) userInfo:nil repeats:YES];
        
    }
    
}

-(void)miciSve{

    for(SKNode *node in self.children){
        if ([node.name isEqualToString:@"komad1"] || [node.name isEqualToString:@"komad2"]) {
            CGPoint pp=node.position;
            pp.y+=2;
            if (pp.y>velicina.height+dimenzija) {
                pp.y=-dimenzija;
                if ([node.name isEqualToString:@"komad1"]) {
                    pp.x= sin(a)*amplituda+velicina.width/4;
                }else if([node.name isEqualToString:@"komad2"]){
                    pp.x= sin(a)*amplituda+velicina.width/4+velicina.width/2;
                    a+=2*M_PI/(brkomada+1);
                    amplituda=fabs(sin(b))*velicina.width/4;
                    b+=0.01;

                }
            }
            pprethodni=pp.x;
            node.position=pp;
        }
        if ([node.name isEqualToString:@"maliMagnet"]) {
            CGPoint pp=node.position;
            pp.y+=1;
            if (pp.y>velicina.height+dimenzija){
                pp.y=-dimenzija;
            }
            node.position = pp;
            double d=hypotf(jaje.position.x-pp.x, jaje.position.y -pp.y);
            if (d<maliMagnet.size.width) {
                [self osvojeno:pp];
            }
        }
        if ([node.name isEqualToString:@"zvjezdica"]) {
            CGPoint pp=node.position;
            if (pp.x<0 || pp.x>velicina.width || pp.y<0 || pp.y>velicina.height) {
                [node removeFromParent];
            }
        }
        
        if ([node.name isEqualToString:@"jaje"] && !prikazNeuspjeha) {
            CGPoint pp=node.position;
            if (pp.x<-dimenzija || pp.x>velicina.width+dimenzija || pp.y<-dimenzija || pp.y>velicina.height+dimenzija) {
                [self neuspjeh];
            }
        }

    }
}

-(void)osvojeno:(CGPoint)tocka{

    double missileLaunchImpulse=5;
    [zvuk1 play];
    for (float alfa=0; alfa<2*M_PI; alfa+=0.3) {
        SKSpriteNode *zvjezdica=[SKSpriteNode spriteNodeWithImageNamed:@"spark"];
        zvjezdica.position=tocka;
        zvjezdica.size=CGSizeMake(dimenzija/2, dimenzija/2);
        zvjezdica.name=@"zvjezdica";
        zvjezdica.zPosition=5;
        [self addChild:zvjezdica];
        zvjezdica.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:zvjezdica.frame.size];
        zvjezdica.physicsBody.affectedByGravity=YES;
        zvjezdica.physicsBody.collisionBitMask = (UInt32)2;
        zvjezdica.physicsBody.contactTestBitMask= (UInt32)2;
        zvjezdica.physicsBody.categoryBitMask = (UInt32)2;
        [zvjezdica.physicsBody applyImpulse: CGVectorMake(missileLaunchImpulse*cosf(alfa),missileLaunchImpulse*sinf(alfa))];
    }
    maliMagnet.position=CGPointMake(velicina.width/2, -maliMagnet.size.height);
    prikupljeno++;
    labela.text = [NSString stringWithFormat:@"Collected: %ld",(long)prikupljeno];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        if ([node.name isEqualToString:@"left"]) {
            self.physicsWorld.gravity = CGVectorMake(-6.0f, -0.8f);
            left.texture = [SKTexture textureWithImageNamed:@"crvenaTipka"];
            right.texture = [SKTexture textureWithImageNamed:@"zelenaTipka"];
            
        }else if ([node.name isEqualToString:@"right"]) {
            self.physicsWorld.gravity = CGVectorMake(6.0f, -0.8f);
            left.texture = [SKTexture textureWithImageNamed:@"zelenaTipka"];
            right.texture = [SKTexture textureWithImageNamed:@"crvenaTipka"];
        }
    }
    if (prikazNeuspjeha) {
        for (UITouch *touch in touches) {
            CGPoint location = [touch locationInNode:alert];
            SKNode *node = [alert nodeAtPoint:location];
            if ([node.name isEqualToString:@"restart"]) {
                [self obrisiSve];
            }
            
        }
    }

}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
