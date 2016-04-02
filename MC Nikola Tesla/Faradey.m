//
//  Faradey.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "Faradey.h"

@interface Faradey ()

@end

@implementation Faradey
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    stojiS = [NSArray arrayWithObjects:
              [UIImage imageNamed: @"stop1.png"],
              [UIImage imageNamed: @"stop2.png"],
              [UIImage imageNamed: @"stop3.png"],
              [UIImage imageNamed: @"stop4.png"],
              [UIImage imageNamed: @"stop5.png"],
              [UIImage imageNamed: @"stop6.png"],
              [UIImage imageNamed: @"stop7.png"],
              [UIImage imageNamed: @"stop8.png"],
              [UIImage imageNamed: @"stop7.png"],
              [UIImage imageNamed: @"stop6.png"],
              [UIImage imageNamed: @"stop5.png"],
              nil];
    trciS = [NSArray arrayWithObjects:
             [UIImage imageNamed: @"boyWalk1.png"],
             [UIImage imageNamed: @"boyWalk2.png"],
             [UIImage imageNamed: @"boyWalk3.png"],
             [UIImage imageNamed: @"boyWalk4.png"],
             [UIImage imageNamed: @"boyWalk5.png"],
             [UIImage imageNamed: @"boyWalk6.png"],
             [UIImage imageNamed: @"boyWalk7.png"],
             [UIImage imageNamed: @"boyWalk9.png"],
             nil];
    
    puziS = [NSArray arrayWithObjects:
             [UIImage imageNamed: @"crawling3.png"],
             [UIImage imageNamed: @"crawling2.png"],
             [UIImage imageNamed: @"crawling1.png"],
             [UIImage imageNamed: @"crawling2.png"],
             nil];
    
    ukavezu = true;
    
}
-(void)viewDidAppear:(BOOL)animated{
    // djecak je 2 zemlja je 3, coil 4, cage 5
    velicina = self.view.frame.size;
    
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    b=0;
    stoji = true;
    najPresao=0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    najPresao = [defaults floatForKey:@"najduze"];
    
    polozajZemlje = velicina.height - 60;
    visinaCoila =velicina.height/1.9;
    visinaDjecaka =velicina.width/4*1.5;
    mrtav = false;
    
    podloga = [[UIImageView alloc]init];
    podloga.image = [UIImage imageNamed:@"crnaPodloga"];
    podloga.tag = 6;
    podloga.frame = CGRectMake(0, 0, velicina.width, velicina.height);
    [self.view addSubview:podloga];
    
    planine1 = [[UIImageView alloc]init];
    planine1.image = [UIImage imageNamed:@"planine"];
    planine1.tag = 8;
    planine1.frame = CGRectMake(0, polozajZemlje-velicina.height/3, velicina.width*3, velicina.height/3);
    [self.view addSubview:planine1];
    
    planine2 = [[UIImageView alloc]init];
    planine2.image = [UIImage imageNamed:@"planine"];
    planine2.tag = 8;
    planine2.frame = CGRectMake(planine1.frame.size.width, polozajZemlje-velicina.height/3, velicina.width*3, velicina.height/3);
    [self.view addSubview:planine2];
    
    podloga.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [podloga addGestureRecognizer:panGesture];
    
    tcoil = [[UIImageView alloc]init];
    tcoil.image = [UIImage imageNamed:@"tcoil2"];
    tcoil.tag = 4;
    tcoil.frame = CGRectMake(velicina.width-velicina.width/6, polozajZemlje-visinaCoila, velicina.width/4, visinaCoila );
    [self.view addSubview:tcoil];
    
    djecak = [[UIImageView alloc]init];
    djecak.image = [UIImage imageNamed:@"stop1"];
    djecak.tag = 2;
    djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-visinaDjecaka, velicina.width/4, visinaDjecaka);
    [self.view addSubview:djecak];
    djecak.animationImages=stojiS;
    djecak.animationDuration=1.00;
    djecak.animationRepeatCount=0;
    [djecak startAnimating];
    
    [self napraviZemlju];
    
    cage = [[UIImageView alloc]init];
    cage.image = [UIImage imageNamed:@"cage"];
    cage.tag = 5;
    cage.frame = CGRectMake(velicina.width/8, djecak.frame.origin.y-djecak.frame.size.height*0.2, velicina.width/4, visinaDjecaka*1.2);
    [self.view addSubview:cage];
    
    strelica = [[UIImageView alloc]init];
    strelica.image = [UIImage imageNamed:@"strelica"];
    strelica.tag = 10;
    strelica.frame = CGRectMake(velicina.width/2, velicina.height/2, 30, 30);
    [self.view addSubview:strelica];
    
    [self startT];
    //[self startN];
    [self startB];
    [self.view bringSubviewToFront:navBar];
    
    labela = [[UILabel alloc]init];
    labela.frame = CGRectMake(velicina.width/2, navBar.frame.origin.y+navBar.frame.size.height, 70, 50);
    labela.center = CGPointMake(velicina.width/2, labela.center.y);
    [self.view addSubview:labela];
    labela.backgroundColor = [UIColor redColor];
    labela.textColor = [UIColor whiteColor];
    labela.textAlignment = NSTextAlignmentCenter;
    presao =0;
    labela.text =[NSString stringWithFormat:@"%.1f",presao];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"How far you can get?"
                                                                   message:@"Faraday cage can protect you. Slide right, left, down, up."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    UIImage *image = [UIImage imageNamed:@"cage2"];
    [defaultAction setValue:image forKey:@"image"];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    if (mrtav) {
        return;
    }
    CGPoint translation=[recognizer translationInView:self.view];
    if (fabs(translation.x)>fabs(translation.y)) {
        if (translation.x>0) {
            strelica.transform = CGAffineTransformMakeRotation(-M_PI_2);
            if (!mrtav) {
                [self startZ];
                
            }
        }
        else
        {
            strelica.transform = CGAffineTransformMakeRotation(M_PI_2);
            [timerZ invalidate];
            timerZ=nil;
            [self stoj];
        }
    }
    else
    {
        if (translation.y>0) {
            [timerZ invalidate];
            timerZ=nil;
            stoji=false;
            strelica.transform = CGAffineTransformMakeRotation(0);
            [djecak  removeFromSuperview];
            djecak = [[UIImageView alloc]init];
            djecak.image = [UIImage imageNamed:@"crawling3"];
            djecak.tag = 2;
            djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-velicina.width/6, velicina.width/3, velicina.width/6);
            djecak.center = CGPointMake(velicina.width/7, polozajZemlje-velicina.width/12);
            [self.view addSubview:djecak];
            [self.view bringSubviewToFront:cage];
            
            
        }
        else
        {
            strelica.transform = CGAffineTransformMakeRotation(M_PI);
            [timerZ invalidate];
            timerZ=nil;
            stoji = true;
            [djecak  removeFromSuperview];
            djecak = [[UIImageView alloc]init];
            djecak.image = [UIImage imageNamed:@"stop1"];
            djecak.tag = 2;
            djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-visinaDjecaka, velicina.width/4, visinaDjecaka);
            [self.view addSubview:djecak];
            [self.view bringSubviewToFront:cage];
        }
    }
    
    
}

- (IBAction)ponovoPokreni:(id)sender {
    mrtav = false;
    ukavezu = true;
    presao =0;
    labela.text =[NSString stringWithFormat:@"%.1f",presao];
    [timerZ invalidate];
    timerZ = nil;
    [djecak  removeFromSuperview];
    djecak = [[UIImageView alloc]init];
    djecak.image = [UIImage imageNamed:@"stop1"];
    djecak.tag = 2;
    djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-visinaDjecaka, velicina.width/4, visinaDjecaka);
    [self.view addSubview:djecak];
    djecak.animationImages=stojiS;
    djecak.animationDuration=1.60;
    djecak.animationRepeatCount=0;
    [djecak startAnimating];
    [self.view bringSubviewToFront:cage];
    
    cage.frame = CGRectMake(velicina.width/8, djecak.frame.origin.y-djecak.frame.size.height*0.2, velicina.width/4, visinaDjecaka*1.2);
    tcoil.frame = CGRectMake(velicina.width-velicina.width/6, polozajZemlje-visinaCoila, velicina.width/4, visinaCoila );
    [self startT];
    [self startB];
    
}


-(void)startB{
    
    if(!timerB)
    {
        timerB = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                  target:self
                                                selector:@selector(brisiMunju)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(void)startN{
    
    if(!timerN)
    {
        timerN = [NSTimer scheduledTimerWithTimeInterval:0.8
                                                  target:self
                                                selector:@selector(napraviMunju)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(void)startZ{
    
    if(!timerZ)
    {
        timerZ = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                  target:self
                                                selector:@selector(miciZemlju)
                                                userInfo:nil
                                                 repeats:YES];
        [self hodaj];
    }
}

-(void)napraviMunju{
    
    //CGPoint currentPoint = CGPointMake(arc4random()%(int)velicina.width, velicina.height-50);
    CGPoint currentPoint = tocka;
    double alp = atan2(currentPoint.y-(tcoil.center.y-tcoil.frame.size.height/2.5), currentPoint.x-tcoil.center.x);
    double duz = hypotf(currentPoint.x-tcoil.center.x, currentPoint.y-(tcoil.center.y-tcoil.frame.size.height/2.5));
    [self cMunju:alp duzina:duz kraj:currentPoint];
    
}

-(void)brisiMunju{
    
    int n=0;
    for(UIImageView *tempImage in self.view.subviews){
        if(tempImage.tag==7){
            [tempImage removeFromSuperview];
            n++;
            if(n>1)break;
        }
    }
    
    
    
}

-(void)cMunju:(double)kut duzina:(double)duzina kraj:(CGPoint)kraj{
    
    //da=(double)(arc4random()%10)/10;
    da=0.1;
    pda=-1;
    a = kut;
    double r=10;
    double oldx = tcoil.center.x;
    double oldy = tcoil.center.y-tcoil.frame.size.height/2.5;
    double xx=0;
    double yy=0;
    for (int i=0; i<20; i++) {
        xx= cos(a)*r+tcoil.center.x;
        yy = sin(a)*r+tcoil.center.y-tcoil.frame.size.height/2.5;
        if (i>5) {
            [self nacrtajCrtu:CGPointMake(oldx, oldy) dotocke:CGPointMake(xx, yy) debljina:(26-i)/5];
        }
        else
        {
            [self nacrtajCrtu:CGPointMake(oldx, oldy) dotocke:CGPointMake(xx, yy) debljina:i+1];
        }
        if (CGRectContainsPoint(djecak.frame, CGPointMake(xx, yy)) && !ukavezu && !mrtav) {
            
            mrtav = true;
            
            [djecak.layer removeAllAnimations];
            djecak.image = [UIImage imageNamed:@"stop1"];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.2];
            [UIView setAnimationDidStopSelector:@selector(myAnimationEnded)];
            [UIView setAnimationDelegate:self];
            djecak.center = CGPointMake(djecak.center.x, polozajZemlje);
            djecak.transform = CGAffineTransformMakeRotation(-M_PI_2);
            djecak.center = CGPointMake(velicina.width/6, polozajZemlje-velicina.width/12);
            
            [UIView commitAnimations];
            
            
        }
        oldx =xx;
        oldy =yy;
        r+=duzina/20;
        a+=da;
        double sluc = (double)(arc4random()%10)/100;
        if(i>15) a=kut;
        da=sluc * pda;
        pda*=-1;
        
    }
    
    [self nacrtajCrtu:CGPointMake(oldx, oldy) dotocke:CGPointMake(kraj.x, kraj.y) debljina:1];
    
    
    
}

-(void)myAnimationEnded{
    [djecak  removeFromSuperview];
    djecak = [[UIImageView alloc]init];
    djecak.image = [UIImage imageNamed:@"boyDead"];
    djecak.tag = 2;
    djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-velicina.width/6, velicina.width/3, velicina.width/6);
    djecak.center = CGPointMake(velicina.width/6, polozajZemlje-velicina.width/12);
    [self.view addSubview:djecak];
    [self.view bringSubviewToFront:cage];
    
    //save
    
    if (presao>najPresao) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setFloat:presao forKey:@"najduze"];
        [defaults synchronize];
        najPresao=presao;
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Best:"
                                                                   message:[NSString stringWithFormat:@"%.1f",najPresao]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}

-(void)nacrtajCrtu:(CGPoint)tockaOd dotocke:(CGPoint)tockaDo debljina:(double)debljina{
    
    UIGraphicsBeginImageContext(velicina);
    
    CGRect myImageRect = CGRectMake(0, 0, velicina.width, velicina.height);//NAPRAVI kvadrat za sliku
    drawImage=[[UIImageView alloc] initWithFrame:myImageRect];//alociraj memoriju
    drawImage.tag = 7;
    [self.view addSubview:drawImage];
    
    //osobina crte
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), debljina*5);//debljina crte
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.2, 0, 1, 0.3);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), tockaOd.x, tockaOd.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), tockaDo.x,tockaDo.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), debljina);//debljina crte
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 1, 1, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), tockaOd.x, tockaOd.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), tockaDo.x,tockaDo.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    CGContextFlush(UIGraphicsGetCurrentContext());
    
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}


-(void)napraviZemlju{
    CGPoint polozajZ=CGPointMake(0, polozajZemlje);
    while (polozajZ.x<velicina.width+velicina.width/7) {
        UIImageView *komadZemlje=[[UIImageView alloc]init];
        komadZemlje.image = [UIImage imageNamed:@"zemlja"];
        komadZemlje.frame = CGRectMake(polozajZ.x, polozajZ.y-5, velicina.width/6.9, 30);
        komadZemlje.tag = 3;
        [self.view addSubview:komadZemlje];
        polozajZ.x+=velicina.width/7;
    }
    
}


//tajmer micanja tocke udara munje
-(void)startT{
    
    if(!timerT)
    {
        timerT = [NSTimer scheduledTimerWithTimeInterval:0.7
                                                  target:self
                                                selector:@selector(miciTocku)
                                                userInfo:nil
                                                 repeats:YES];
        
    }
}

-(void)miciTocku{
    b+=0.5;
    tocka.x = sin(b)*velicina.width+tcoil.center.x;
    //tocka.y = sin(a)*velicina.width/1.2+tcoil.center.y-tcoil.frame.size.height/2.5;
    tocka.y = polozajZemlje-velicina.width/6;
    poluga.center = tocka;
    [self napraviMunju];
}

-(void)miciZemlju{
    
    if (mrtav) {
        //[djecak.layer removeAllAnimations];
        [timerZ invalidate];
        timerZ=nil;
    }
    double brzina = 0.3;
    if (stoji) {
        brzina = 3.0;
    }
    presao +=brzina/10;
    labela.text =[NSString stringWithFormat:@"%.1f",presao];
    CGRect ppl= planine1.frame;
    ppl.origin.x -= brzina/2;
    if (ppl.origin.x<-planine1.frame.size.width) {
        ppl.origin.x= planine2.frame.origin.x+planine2.frame.size.width;
    }
    planine1.frame=ppl;
    
    ppl= planine2.frame;
    ppl.origin.x -= brzina/2;
    if (ppl.origin.x<-planine2.frame.size.width) {
        ppl.origin.x= planine1.frame.origin.x+planine1.frame.size.width;
    }
    planine2.frame=ppl;
    
    
    for(UIImageView *tempImage in self.view.subviews){
        //micanje zemlje
        if (tempImage.tag==3) {
            CGRect pp= tempImage.frame;
            pp.origin.x-=brzina;
            if (pp.origin.x<=-velicina.width/7) {
                pp.origin.x=velicina.width;
            }
            tempImage.frame = pp;
        }
        //micanje kaveza i coila
        if (tempImage.tag==4 || tempImage.tag==5) {
            CGRect pp= tempImage.frame;
            pp.origin.x-=brzina;
            if (pp.origin.x<-tempImage.frame.size.width) {
                pp.origin.x=velicina.width;
            }
            tempImage.frame = pp;
            ukavezu =  CGRectContainsPoint(cage.frame, djecak.center);
            
        }
        
    }
    
}

-(void)hodaj{
    [djecak.layer removeAllAnimations];
    if (stoji) {
        djecak.animationImages=trciS;
        djecak.animationDuration=0.60;
    }
    else
    {
        djecak.animationImages=puziS;
        djecak.animationDuration=1.0;
    }
    
    
    djecak.animationRepeatCount=0;
    [djecak startAnimating];
    
}

-(void)stoj{
    [djecak.layer removeAllAnimations];
    if (mrtav) {
        return;
    }
    if (stoji) {
        djecak.animationImages=stojiS;
        djecak.animationDuration=1.50;
        djecak.animationRepeatCount=0;
        [djecak startAnimating];
    }
    else
    {
        djecak.image = [UIImage imageNamed:@"crawling3"];
        djecak.frame = CGRectMake(velicina.width/8, polozajZemlje-velicina.width/6, velicina.width/3, velicina.width/6);
        djecak.center = CGPointMake(velicina.width/7, polozajZemlje-velicina.width/12);
    }
    
    
    
}


@end
