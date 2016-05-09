//
//  energy.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "energy.h"
#import <QuartzCore/QuartzCore.h>

@interface energy ()

@end

@implementation energy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    turbinaA = [NSArray arrayWithObjects:
                [UIImage imageNamed: @"turbinaH1.png"],
                [UIImage imageNamed: @"turbinaH2.png"],
                [UIImage imageNamed: @"turbinaH3.png"],
                [UIImage imageNamed: @"turbinaH4.png"],
                [UIImage imageNamed: @"turbinaH5.png"],
                [UIImage imageNamed: @"turbinaH6.png"],
                [UIImage imageNamed: @"turbinaH7.png"],
              nil];
    rotorA = [NSArray arrayWithObjects:
                [UIImage imageNamed: @"rotorH1.png"],
                [UIImage imageNamed: @"rotorH2.png"],
                [UIImage imageNamed: @"rotorH3.png"],
                [UIImage imageNamed: @"rotorH4.png"],
                [UIImage imageNamed: @"rotorH5.png"],
                [UIImage imageNamed: @"rotorH6.png"],
                [UIImage imageNamed: @"rotorH7.png"],
                nil];
    mlazDA = [NSArray arrayWithObjects:
            [UIImage imageNamed: @"mlazD1.png"],
            [UIImage imageNamed: @"mlazD2.png"],
            [UIImage imageNamed: @"mlazD3.png"],
            [UIImage imageNamed: @"mlazD2.png"],
            nil];
    mlazGA = [NSArray arrayWithObjects:
              [UIImage imageNamed: @"mlazG1.png"],
              [UIImage imageNamed: @"mlazG2.png"],
              [UIImage imageNamed: @"mlazG3.png"],
              nil];
    vodaUlaz = [NSArray arrayWithObjects:
                [UIImage imageNamed: @"vodaUlazi1.png"],
                [UIImage imageNamed: @"vodaUlazi2.png"],
                [UIImage imageNamed: @"vodaUlazi3.png"],
                [UIImage imageNamed: @"vodaUlazi4.png"],
                [UIImage imageNamed: @"vodaUlazi5.png"],
              nil];


}

-(void)viewDidAppear:(BOOL)animated{

    otvorenVentil = false;
    otvorenaUstava =false;
    kutP = 0;
    velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    podloga = [[UIImageView alloc]init];
    podloga.image = [UIImage imageNamed:@"powerProduction"];
    podloga.frame = CGRectMake(0, 0, velicina.height*1.39, velicina.height);
    [self.view addSubview:podloga];
    
    podloga.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [podloga addGestureRecognizer:panGesture];

    turbina = [[UIImageView alloc]init];
    turbina.image = [UIImage imageNamed:@"turbinaH"];
    turbina.frame = CGRectMake( podloga.frame.size.width*0.36, podloga.frame.size.width*0.496,podloga.frame.size.width*0.215,podloga.frame.size.width*0.048);
    [podloga addSubview:turbina];
    
    osovina1 = [[UIImageView alloc]init];
    osovina1.image = [UIImage imageNamed:@"elektron"];
    osovina1.frame = CGRectMake( podloga.frame.size.width*0.178, podloga.frame.size.width*0.532,podloga.frame.size.width*0.006,podloga.frame.size.width*0.006);
    [podloga addSubview:osovina1];
    
    osovina2 = [[UIImageView alloc]init];
    osovina2.image = [UIImage imageNamed:@"elektron"];
    osovina2.frame = CGRectMake( podloga.frame.size.width*0.1125, podloga.frame.size.width*0.532,podloga.frame.size.width*0.006,podloga.frame.size.width*0.006);
    [podloga addSubview:osovina2];
    
    osovina3 = [[UIImageView alloc]init];
    osovina3.image = [UIImage imageNamed:@"elektron"];
    osovina3.frame = CGRectMake( podloga.frame.size.width*0.046, podloga.frame.size.width*0.532,podloga.frame.size.width*0.006,podloga.frame.size.width*0.006);
    [podloga addSubview:osovina3];
    
    ulazVode = [[UIImageView alloc]init];
    ulazVode.image = [UIImage imageNamed:@"vodaUlazi1"];
    ulazVode.frame = CGRectMake( podloga.frame.size.width*0.17, podloga.frame.size.width*0.185,podloga.frame.size.width*0.1,podloga.frame.size.width*0.1);
    [podloga addSubview:ulazVode];
    ulazVode.animationImages=vodaUlaz;
    ulazVode.animationDuration=0.35;
    ulazVode.animationRepeatCount=0;
    [ulazVode startAnimating];
    ulazVode.alpha=0;
    
    
    UIImageView *kazaljka1 = [[UIImageView alloc]init];
    kazaljka1.image = [UIImage imageNamed:@"kazaljkaT"];
    kazaljka1.frame = CGRectMake( 0, 0,podloga.frame.size.width*0.012,podloga.frame.size.width*0.045);
    kazaljka1.center = CGPointMake(2, 2);
    [osovina1 addSubview:kazaljka1];
    
    UIImageView *kazaljka2 = [[UIImageView alloc]init];
    kazaljka2.image = [UIImage imageNamed:@"kazaljkaT"];
    kazaljka2.frame = CGRectMake( 0, 0,podloga.frame.size.width*0.012,podloga.frame.size.width*0.045);
    kazaljka2.center = CGPointMake(2, 2);
    [osovina2 addSubview:kazaljka2];
    
    UIImageView *kazaljka3 = [[UIImageView alloc]init];
    kazaljka3.image = [UIImage imageNamed:@"kazaljkaT"];
    kazaljka3.frame = CGRectMake( 0, 0,podloga.frame.size.width*0.012,podloga.frame.size.width*0.045);
    kazaljka3.center = CGPointMake(2, 2);
    [osovina3 addSubview:kazaljka3];
    
    UIImageView *mrlja1 = [[UIImageView alloc]init];
    mrlja1.image = [UIImage imageNamed:@"bijelaMrlja"];
    mrlja1.frame = CGRectMake( podloga.frame.size.width*0.19, podloga.frame.size.width*0.52,podloga.frame.size.width*0.012,podloga.frame.size.width*0.012);
    mrlja1.alpha = 0.7;
    [podloga addSubview:mrlja1];
    
    UIImageView *mrlja2 = [[UIImageView alloc]init];
    mrlja2.image = [UIImage imageNamed:@"bijelaMrlja"];
    mrlja2.frame = CGRectMake( podloga.frame.size.width*0.125, podloga.frame.size.width*0.52,podloga.frame.size.width*0.012,podloga.frame.size.width*0.012);
    mrlja2.alpha = 0.7;
    [podloga addSubview:mrlja2];
    
    UIImageView *mrlja3 = [[UIImageView alloc]init];
    mrlja3.image = [UIImage imageNamed:@"bijelaMrlja"];
    mrlja3.frame = CGRectMake( podloga.frame.size.width*0.06, podloga.frame.size.width*0.52,podloga.frame.size.width*0.012,podloga.frame.size.width*0.012);
    mrlja3.alpha = 0.7;
    [podloga addSubview:mrlja3];

    
    rotor = [[UIImageView alloc]init];
    rotor.image = [UIImage imageNamed:@"rotorH1"];
    rotor.frame = CGRectMake( podloga.frame.size.width*0.412, podloga.frame.size.width*0.622,podloga.frame.size.width*0.114,podloga.frame.size.width*0.0485);
    [podloga addSubview:rotor];
    
    prekidac = [[UIImageView alloc]init];
    prekidac.image = [UIImage imageNamed:@"teslaSwitch0000"];
    prekidac.frame = CGRectMake( podloga.frame.size.width*0.312, podloga.frame.size.width*0.365,podloga.frame.size.width*0.05,podloga.frame.size.width*0.09);
    [podloga addSubview:prekidac];
    prekidac.layer.shadowColor = [UIColor blackColor].CGColor;
    prekidac.layer.shadowOffset = CGSizeMake(-3, 3);
    prekidac.layer.shadowOpacity = 0.4;
    prekidac.layer.shadowRadius = 1.0;
    
    ruckaVentila = [[UIImageView alloc]init];
    ruckaVentila.image = [UIImage imageNamed:@"ruckaVentila"];
    ruckaVentila.tag = 1;
    ruckaVentila.frame = CGRectMake(podloga.frame.size.width*0.212, podloga.frame.size.width*0.375, podloga.frame.size.width*0.073, podloga.frame.size.width*0.073);
    [podloga addSubview:ruckaVentila];
    ruckaVentila.layer.shadowColor = [UIColor blackColor].CGColor;
    ruckaVentila.layer.shadowOffset = CGSizeMake(-2, 2);
    ruckaVentila.layer.shadowOpacity = 0.6;
    ruckaVentila.layer.shadowRadius = 2.0;
    
    mlazD = [[UIImageView alloc]init];
    mlazD.image = [UIImage imageNamed:@"mlazD1"];
    mlazD.frame = CGRectMake( podloga.frame.size.width*0.737, podloga.frame.size.width*0.571,podloga.frame.size.width*0.262,podloga.frame.size.width*0.126);
    [podloga addSubview:mlazD];
    mlazD.alpha=0;
    
    letva = [[UIImageView alloc]init];
    letva.image = [UIImage imageNamed:@"zupcastaLetva"];
    letva.frame = CGRectMake( podloga.frame.size.width*0.376, podloga.frame.size.width*0.17,podloga.frame.size.width*0.015,podloga.frame.size.width*0.115);
    [podloga addSubview:letva];
    
    zupcanik1 = [[UIImageView alloc]init];
    zupcanik1.image = [UIImage imageNamed:@"zupcanik1"];
    zupcanik1.frame = CGRectMake( podloga.frame.size.width*0.345, podloga.frame.size.width*0.17,podloga.frame.size.width*0.035,podloga.frame.size.width*0.035);
    [podloga addSubview:zupcanik1];
    
    zupcanik2 = [[UIImageView alloc]init];
    zupcanik2.image = [UIImage imageNamed:@"zupcanik1"];
    zupcanik2.frame = CGRectMake( podloga.frame.size.width*0.33, podloga.frame.size.width*0.2,podloga.frame.size.width*0.035,podloga.frame.size.width*0.035);
    [podloga addSubview:zupcanik2];
    
    mlazG = [[UIImageView alloc]init];
    mlazG.image = [UIImage imageNamed:@"mlazG1"];
    mlazG.frame = CGRectMake( podloga.frame.size.width*0.46, podloga.frame.size.width*0.25,podloga.frame.size.width*0.54,podloga.frame.size.width*0.445);
    [podloga addSubview:mlazG];
    mlazG.alpha = 0;
    
    textUstav = [[UITextView alloc]init];
    textUstav.frame = CGRectMake( podloga.frame.size.width*0.23, podloga.frame.size.width*0.1,podloga.frame.size.width*0.22,podloga.frame.size.width*0.1);
    textUstav.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    textUstav.font=[textUstav.font fontWithSize:12];
    textUstav.text =@"Fusegates are a mechanism designed to provide the controlled release of water in the event of exceptionally large floods.";
    [podloga addSubview:textUstav];
    
    [textUstav.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.8] CGColor]];
    [textUstav.layer setBorderWidth:2.0];
    textUstav.layer.cornerRadius = 5;
    textUstav.clipsToBounds = YES;
    
    textTurb = [[UITextView alloc]init];
    textTurb.frame = CGRectMake( podloga.frame.size.width*0.38, podloga.frame.size.width*0.38,podloga.frame.size.width*0.18,podloga.frame.size.width*0.1);
    textTurb.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    textTurb.font=[textUstav.font fontWithSize:12];
    textTurb.text =@"Turbine is a rotary mechanical device that extracts energy from a fluid flow and converts it into useful work.";
    [podloga addSubview:textTurb];
    [textTurb.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.8] CGColor]];
    [textTurb.layer setBorderWidth:2.0];
    textTurb.layer.cornerRadius = 5;
    textTurb.clipsToBounds = YES;
    
    textGen = [[UITextView alloc]init];
    textGen.frame = CGRectMake( podloga.frame.size.width*0.425, podloga.frame.size.width*0.622,podloga.frame.size.width*0.35,podloga.frame.size.width*0.08);
    textGen.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    textGen.font=[textUstav.font fontWithSize:12];
    textGen.text =@"Generator is a device that converts mechanical energy to electrical energy. Nikola Tesla developed polyphase alternating current system of generators.";
    [podloga addSubview:textGen];
    [textGen.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.8] CGColor]];
    [textGen.layer setBorderWidth:2.0];
    textGen.layer.cornerRadius = 5;
    textGen.clipsToBounds = YES;
    
    
    textUstav.alpha=0;
    textTurb.alpha=0;
    textGen.alpha=0;

    
    [self.view bringSubviewToFront:navBar];
    
    
    
}

- (IBAction)infoOnOff:(id)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.5];
    if (textGen.alpha==0) {
    
        textUstav.alpha=1;
        textTurb.alpha=1;
        textGen.alpha=1;
    }
    else{
        textUstav.alpha=0;
        textTurb.alpha=0;
        textGen.alpha=0;
    
    }
    [UIView commitAnimations];
}


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:podloga];
    CGAffineTransform rotate1;
    if (CGRectContainsPoint(ruckaVentila.frame, currentPoint)){
        if (otvorenVentil) {
            rotate1 = CGAffineTransformMakeRotation(0);
            otvorenVentil = false;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration: 1.5];
            ulazVode.alpha=0;
            [UIView commitAnimations];
        }
        else
        {
            rotate1 = CGAffineTransformMakeRotation(3);
            [self startR];
            turbina.animationImages=turbinaA;
            turbina.animationDuration=0.30;
            turbina.animationRepeatCount=0;
            [turbina startAnimating];
            
            rotor.animationImages=rotorA;
            rotor.animationDuration=0.30;
            rotor.animationRepeatCount=0;
            [rotor startAnimating];
            
            mlazD.alpha=0.9;
            mlazD.animationImages=mlazDA;
            mlazD.animationDuration=0.40;
            mlazD.animationRepeatCount=0;
            [mlazD startAnimating];
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration: 1.5];
            ulazVode.alpha=1;
            [UIView commitAnimations];

            otvorenVentil = true;
        }
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [UIView setAnimationDidStopSelector:@selector(myAnimationEnded)];
        [UIView setAnimationDelegate:self];
        [ruckaVentila setTransform:rotate1];
        [UIView commitAnimations];
        
    }
    if (CGRectContainsPoint(prekidac.frame, currentPoint)){
        CGAffineTransform rotate1 = CGAffineTransformMakeRotation(-3);
        CGAffineTransform rotate2 = CGAffineTransformMakeRotation(3);
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -30);
        if (otvorenaUstava) {
            rotate1 = CGAffineTransformMakeRotation(0);
            rotate2 = CGAffineTransformMakeRotation(0);
            translate = CGAffineTransformMakeTranslation(0, 0);
            otvorenaUstava = false;
            //mlazG.alpha=0;
            //[mlazG stopAnimating];
            prekidac.image = [UIImage imageNamed:@"teslaSwitch0000"];
            
        }else
        {
            otvorenaUstava = true;
            mlazG.alpha=1;
            mlazG.animationImages=mlazGA;
            mlazG.animationDuration=0.40;
            mlazG.animationRepeatCount=0;
            [mlazG startAnimating];
            prekidac.image = [UIImage imageNamed:@"teslaSwitch0090"];
    
        }
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [UIView setAnimationDidStopSelector:@selector(secondAnimationEnded)];
        [UIView setAnimationDelegate:self];
        [zupcanik1 setTransform:rotate1];
        [zupcanik2 setTransform:rotate2];
        [letva setTransform:translate];
        [UIView commitAnimations];
        
    
    }
}

-(void) secondAnimationEnded{

    if (!otvorenaUstava) {
        mlazG.alpha=0;
        [mlazG stopAnimating];
    }
    

}

-(void) myAnimationEnded{

    
    if (!otvorenVentil) {
        [turbina stopAnimating];
        [rotor stopAnimating];
        [mlazD stopAnimating];
        mlazD.alpha =0;
        [timerR invalidate];
        timerR=nil;
        [osovina1 setTransform:CGAffineTransformMakeRotation(0)];
        [osovina2 setTransform:CGAffineTransformMakeRotation(0)];
        [osovina3 setTransform:CGAffineTransformMakeRotation(0)];
        kutP=0;
        
    }
   

}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation=[recognizer translationInView:self.view];
    if ((podloga.frame.origin.x<=0 && translation.x>0) || (podloga.frame.origin.x+podloga.frame.size.width>velicina.width && translation.x<0)) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y);
        [UIView commitAnimations];
    }
    if (podloga.frame.origin.x>0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        podloga.frame = CGRectMake(0, 0, velicina.height*1.39, velicina.height);
        [UIView commitAnimations];
    
    }
    if (podloga.frame.origin.x+podloga.frame.size.width<velicina.width) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        podloga.frame = CGRectMake(-podloga.frame.size.width+velicina.width, 0, velicina.height*1.39, velicina.height);
        [UIView commitAnimations];
        
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
   
}

-(void)startR{
    
    if(!timerR)
    { timerR = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                target:self
                                              selector:@selector(rotacija)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
}



-(void)rotacija{
    kutP+=0.1;
    //kazaljke
    [osovina1 setTransform:CGAffineTransformMakeRotation(sin(kutP))];
    [osovina2 setTransform:CGAffineTransformMakeRotation(sin(kutP+2.09))];
    [osovina3 setTransform:CGAffineTransformMakeRotation(sin(kutP+4.18))];
    
}

- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
