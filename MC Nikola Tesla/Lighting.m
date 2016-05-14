//
//  Lighting.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 07/05/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "Lighting.h"

@interface Lighting ()

@end

@implementation Lighting

-(void)spremisve{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:maxConnected forKey:@"bestZarulje"];
    [userDefaults synchronize];
}

-(void)ucitajsve{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    maxConnected = [userDefaults integerForKey:@"bestZarulje"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    popisZarulja = @[@"zarulja1",@"zarulja2",@"zarulja3",@"zarulja4",@"zarulja5",@"zarulja6"];
    popisSZarulja = @[@"zaruljaS1",@"zaruljaS2",@"zaruljaS3",@"zaruljaS4",@"zaruljaS5",@"zaruljaS6"];
    popisGrla = @[@"grlo1",@"grlo2",@"grlo3",@"grlo4",@"grlo5",@"grlo6"];
    brojacSpustanja=0;
    koeficijentBrzine=2000;
    kolikoMjesta = 5;
    brojUklopljenih=0;
    ukupniBrojSpojenih=0;
    aktivniNosac=nil;
    brojUpaljenihProzora=0;
    for (int i=0; i<6; i++) {
        for (int j=0; j<4; j++) {
            upaljeniProzori[i][j]=0;
        }
    }
    [self ucitajsve];
    NSURL *Zvuk = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"klikP" ofType:@"mp3"]];
    zvuk1 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk error:nil];
    [zvuk1 setVolume: 1];
    [zvuk1 prepareToPlay];
    NSURL *Zvuk2 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"stkl4" ofType:@"mp3"]];
    zvuk2 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk2 error:nil];
    [zvuk2 setVolume: 0.5];
    [zvuk2 prepareToPlay];
    
    NSURL *Zvuk3 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"stkl1" ofType:@"mp3"]];
    zvuk3 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk3 error:nil];
    [zvuk3 setVolume: 0.5];
    [zvuk3 prepareToPlay];

}

-(void)viewDidAppear:(BOOL)animated{
    
    dimenzija=self.view.frame.size.width/5;
    velicina = self.view.frame.size;
    navBar.frame = CGRectMake(0, 20, velicina.width, 44);
    podloga = [[UIImageView alloc]init];
    podloga.image = [UIImage imageNamed:@"nebo15"];
    podloga.frame = CGRectMake(0, 0,velicina.width , velicina.height);
    [self.view addSubview:podloga];
    
    polozajAktivnogNosaca = -dimenzija/2;
    brzina = velicina.height/koeficijentBrzine;
    
    [self napraviFasade:velicina.height*2-velicina.height/10 tag:50];
    [self povuciFasadeGore];
    [self napraviIzbor];
    [self napraviNosac];
    [self startM];
    [self.view bringSubviewToFront:navBar];
    navBar.alpha=0.6;
    labela =[[UILabel alloc]init];
    labela.frame = CGRectMake(0, 64, self.view.frame.size.width, 30);
    labela.backgroundColor=[UIColor colorWithRed:0.4 green:0.2 blue:0.0 alpha:0.6] ;
    [labela setFont:[UIFont systemFontOfSize:16]];
    labela.textColor = [UIColor whiteColor];
    labela.text = [NSString stringWithFormat:@"Connected:%d",ukupniBrojSpojenih];
    labela.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labela];
    
    
    
}

-(void)napraviFasade:(double)polozaj tag:(int)tag{
    
    
    for (int i=0; i<5; i++) {
        UIImageView *fasada = [[UIImageView alloc]init];
        fasada.image = [UIImage imageNamed:@"fasada"];
        fasada.frame = CGRectMake(0, 0,velicina.width/3 , velicina.height/5);
        fasada.tag=tag;
        fasada.center=CGPointMake(velicina.width/2, polozaj);
        [self.view addSubview:fasada];
        [self.view sendSubviewToBack:fasada];
        polozaj-=velicina.height/5;
        
        NSArray *points = [NSArray arrayWithObjects:
                           [NSValue valueWithCGPoint:CGPointMake(velicina.width/12, velicina.width/12)],
                           [NSValue valueWithCGPoint:CGPointMake(velicina.width/4, velicina.width/12)],
                           [NSValue valueWithCGPoint:CGPointMake(velicina.width/12, velicina.width/4)],
                           [NSValue valueWithCGPoint:CGPointMake(velicina.width/4, velicina.width/4)],
                           nil];
        for (int j=0; j<4; j++) {
            UIImageView *prozor = [[UIImageView alloc]init];
            prozor.image = [UIImage imageNamed:@"prozor"];
            prozor.frame = CGRectMake(0, 0,velicina.width/12 , velicina.height/14);
            prozor.tag=40;
            prozor.center=[[points objectAtIndex:j] CGPointValue];
            [fasada addSubview:prozor];
        }
        
    }
    [self.view sendSubviewToBack:podloga];
}


-(void)upaliProzor{
    if (brzina<2.0 && koeficijentBrzine>400) {
        koeficijentBrzine-=50;//brzina
        brzina = velicina.height/koeficijentBrzine;
        
    }
    int n=0;
    for (UIImageView *fasada in self.view.subviews){
        if (fasada.tag==50) {
            for (UIImageView *prozor in fasada.subviews){
                NSLog(@"SLIKA:%d %d", n/4,n%4);
                if (upaljeniProzori[n/4][n%4]==0 && prozor.tag==40) {
                    upaljeniProzori[n/4][n%4]=1;
                    prozor.image=[UIImage imageNamed:@"prozorS"];
                    if(n/4==4 && n%4==3) {
                        [self povuciFasadeGore];
                        for (int i=0; i<6; i++) {
                            for (int j=0; j<4; j++) {
                                upaljeniProzori[i][j]=0;
                            }
                        }
                    }
                    return;
                }
                n++;
            }
        }
    }
    
}
- (IBAction)povuciPotegni:(id)sender {
    [self povuciFasadeGore];
}

-(void)povuciFasadeGore{
    
    [self napraviFasade:velicina.height*2-velicina.height/10 tag:51];
    for (UIImageView *fasada in self.view.subviews){
        if (fasada.tag==50 || fasada.tag==51) {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height);
            if (fasada.tag==50) {
                translate = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height*2);
            }
            [UIView animateWithDuration:1.0
                                  delay: 0.0
                                options: UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 fasada.transform = translate;
                             }
                             completion:^(BOOL finished){
                                 if(fasada.tag==50)
                                 {[fasada removeFromSuperview];}
                                 else
                                 {fasada.tag=50;}
                                 
                             }];
            
        }
    }
    
    
}



-(void)napraviNosac{
    
    UIImageView *nosac = [[UIImageView alloc]init];
    nosac.image = [UIImage imageNamed:@"nosacZarulja"];
    nosac.frame = CGRectMake(velicina.width, -dimenzija,velicina.width , dimenzija/2);
    nosac.tag=20;
    [self.view addSubview:nosac];
    //polozajAktivnogNosaca+=dimenzija;
    double prvoMjesto=velicina.width/(kolikoMjesta+1)-dimenzija/4;
    for (int i=0; i<kolikoMjesta; i++) {
        int n= arc4random()%popisGrla.count;
        NSString *imeGrla=[popisGrla objectAtIndex: n];
        UIImageView *grlo = [[UIImageView alloc]init];
        grlo.image = [UIImage imageNamed:imeGrla];
        grlo.frame = CGRectMake(prvoMjesto, dimenzija/2,dimenzija/1.6 , dimenzija/2);
        grlo.tag = 30+n;
        [nosac addSubview:grlo];
        prvoMjesto+=velicina.width/(kolikoMjesta+1);
    }
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    nosac.frame = CGRectMake(0, dimenzija, velicina.width, dimenzija/2);
    [UIView commitAnimations];
    [self.view bringSubviewToFront:navBar];
    [self.view bringSubviewToFront:labela];
    if (aktivniNosac==nil) {
        aktivniNosac = nosac;
    }
    
    
}
-(void)startM{
    
    if(!timerM)
    { timerM = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                target:self
                                              selector:@selector(miciNosacDolje)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}
-(void)miciNosacDolje{
    
    brojacSpustanja++;
    if (brojacSpustanja>koeficijentBrzine/5) {
        [self napraviNosac];
        brojacSpustanja=0;
    }
    for (UIImageView *nosac in self.view.subviews) {
        if (nosac.tag==20) {
            CGPoint pn=nosac.center;
            pn.y+=brzina;
            nosac.center=pn;
            
            if (pn.y>velicina.height-dimenzija*2) {
               
                [timerM invalidate];
                timerM=nil;
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game over"
                                                                               message:[NSString stringWithFormat:@"You are:%d, max.connected:%ld",ukupniBrojSpojenih,(long)maxConnected]
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                                          [self povovoPokreni];
                                                                      }];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
                if (ukupniBrojSpojenih>maxConnected) {
                    maxConnected=ukupniBrojSpojenih;
                    [self spremisve];
                }
                
            }
        }
    }
    
    
    
}

-(void)povovoPokreni{
    
    //obrisi nosace
    for (UIImageView *nosac in self.view.subviews) {
        if (nosac.tag==20) {
            [nosac removeFromSuperview];
        }
    }
    koeficijentBrzine=2000;
    brzina = velicina.height/koeficijentBrzine;
    brojUklopljenih=0;
    aktivniNosac=nil;
    brojacSpustanja=0;
    [self napraviNosac];
    [self startM];
    ukupniBrojSpojenih=0;
    labela.text = [NSString stringWithFormat:@"Connected:%d",ukupniBrojSpojenih];
    [self povuciFasadeGore];
    for (int i=0; i<6; i++) {
        for (int j=0; j<4; j++) {
            upaljeniProzori[i][j]=0;
        }
    }
    
}


-(void)napraviIzbor{
    float popisX = dimenzija;
    izbornikArray = [[NSMutableArray alloc]init];
    [izbornikArray addObject:[NSNumber numberWithFloat:popisX]];
    for (int i=0; i<4; i++) {
        int n= arc4random()%popisZarulja.count;
        UIImageView *slikaIzbor = [[UIImageView alloc]init];
        slikaIzbor.image = [UIImage imageNamed:popisZarulja[n]];
        slikaIzbor.frame = CGRectMake(popisX, self.view.frame.size.height-dimenzija*1.2, dimenzija/1.2, dimenzija*1.2);
        sredinaIzbora=slikaIzbor.center.y;
        slikaIzbor.tag = n+1;
        [self.view addSubview:slikaIzbor];
        slikaIzbor.userInteractionEnabled=YES;
        UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneIzbor:)];
        [slikaIzbor addGestureRecognizer:panGesture];
        //obrub
        [slikaIzbor.layer setCornerRadius:10];
        [slikaIzbor.layer setBorderWidth:2];
        popisX += slikaIzbor.frame.size.width;
        [izbornikArray addObject:[NSNumber numberWithFloat:popisX]];
    }
    
}

-(void)popuniIzbor{
    int i=0;
    float trazeni = [[izbornikArray objectAtIndex:i]floatValue];
    for(UIImageView *tempImage in self.view.subviews)
    {
        if (tempImage.center.y==sredinaIzbora){
            if (trazeni<tempImage.center.x) {
                // animiraj
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration: 1.0];
                tempImage.frame = CGRectMake(trazeni, sredinaIzbora, tempImage.frame.size.width, tempImage.frame.size.height);
                tempImage.center=CGPointMake(trazeni+dimenzija, sredinaIzbora);
                [UIView commitAnimations];
                i++;
                
                trazeni = [[izbornikArray objectAtIndex:i]floatValue];
                
            }
        }
    }
    
    int n= arc4random()%popisZarulja.count;
    UIImageView *slikaIzbor = [[UIImageView alloc]init];
    slikaIzbor.image = [UIImage imageNamed:popisZarulja[n]];
    slikaIzbor.frame = CGRectMake([[izbornikArray lastObject]floatValue], 0, dimenzija/1.2, dimenzija*1.2);
    slikaIzbor.center=CGPointMake(trazeni+dimenzija, sredinaIzbora);
    slikaIzbor.userInteractionEnabled=YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneIzbor:)];
    [slikaIzbor addGestureRecognizer:panGesture];
    [self.view addSubview:slikaIzbor];
    slikaIzbor.tag=n+1;
    //obrub
    [slikaIzbor.layer setCornerRadius:10];
    [slikaIzbor.layer setBorderWidth:2];
    
    
    
}

-(IBAction)paneIzbor:(UIPanGestureRecognizer *)recognizer{
   
    if (recognizer.view.tag>popisZarulja.count) {
        return;
    }
    
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        bool uklopljeno=false;
        for (UIImageView *nosac in self.view.subviews) {
            if (nosac==aktivniNosac) {
                for (UIImageView *grlo in nosac.subviews)
                {
                    if (grlo.tag/10==3) {
                        int n=grlo.tag%10+1;
                        BOOL zauzeto=false;
                        if(grlo.subviews.count>0) {
                            zauzeto=true;
                        }
                        if (aktivnaSlika.tag==n && !zauzeto) {
                            CGPoint mjesto1 =[self.view convertPoint:aktivnaSlika.center toView:nosac];
                            mjesto1.y += dimenzija/4;
                            double dy=fabs(mjesto1.y-grlo.center.y*2);
                            double dx=fabs(mjesto1.x-grlo.center.x);
                            if (dx<20 && dy<40) {
                                uklopljeno=true;
                                ukupniBrojSpojenih++;
                                [zvuk1 play];
                                [self upaliProzor];
                                labela.text = [NSString stringWithFormat:@"Connected:%d",ukupniBrojSpojenih];
                                UIImageView *novaSlika = [[UIImageView alloc]init];
                                novaSlika.frame = CGRectMake(0, 0, aktivnaSlika.frame.size.width, aktivnaSlika.frame.size.height);
                                novaSlika.center = CGPointMake(grlo.frame.size.width/2, novaSlika.center.y+grlo.frame.size.height/2);
                                novaSlika.image=aktivnaSlika.image;
                                novaSlika.image = [UIImage imageNamed:[popisSZarulja objectAtIndex:aktivnaSlika.tag-1]];
                                [grlo addSubview:novaSlika];
                                UIImageView *novoGrlo = [[UIImageView alloc]init];
                                novoGrlo.frame = grlo.frame;
                                novoGrlo.image=grlo.image;
                                [nosac addSubview:novoGrlo];
                                [aktivnaSlika removeFromSuperview];//to
                                brojUklopljenih++;
                                if (brojUklopljenih>4) {
                                    brojUklopljenih=0;
                                    imaLiNosaca=false;
                                    [UIView animateWithDuration:0.5
                                                          delay:0.0
                                                        options:UIViewAnimationOptionTransitionCrossDissolve
                                                     animations:^{
                                                         aktivniNosac.center = CGPointMake(-velicina.width, aktivniNosac.center.y);
                                                         
                                                     } completion:^(BOOL finished){
                                                         [aktivniNosac removeFromSuperview];
                                                         
                                                         for (UIImageView *nosac in self.view.subviews) {
                                                             if (nosac.tag==20){
                                                                 aktivniNosac=nosac;
                                                                 imaLiNosaca=true;
                                                                 break ;
                                                             }
                                                         }
                                                         if (!imaLiNosaca) {
                                                             aktivniNosac=nil;
                                                             [self napraviNosac];
                                                             brojacSpustanja=0;
                                                         }
                                                         
                                                     }];
                                    
                                }
                                break;
                                
                            }
                        }
                    }
                    
                }
            }
        }
        
        if (!uklopljeno) {
            [UIView animateWithDuration:0.5
                                  delay:0.0
                                options:UIViewAnimationOptionTransitionCrossDissolve
                             animations:^{
                                 recognizer.view.center = CGPointMake(recognizer.view.center.x, self.view.frame.size.height+dimenzija);
                                 
                             } completion:^(BOOL finished){
                                 [recognizer.view removeFromSuperview];
                                 if (arc4random()%2==0) {
                                     [zvuk2 play];
                                 }else{
                                     [zvuk3 play];
                                 }
                                 
                             }];
        }
        
        
        
    }
    
    CGPoint translation=[recognizer translationInView:self.view];
    translation.y-=0.2;
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    aktivnaSlika = (UIImageView *)recognizer.view;
    aktivnaSlika.layer.borderColor =[UIColor redColor].CGColor;
    
    int brUizboru=0;
    for(UIImageView *tempImage in self.view.subviews){
        if ((int)tempImage.center.y==(int)sredinaIzbora) {
            brUizboru++;
        }
    }
    
    if (brUizboru<4) {
        [self popuniIzbor];
    }
    
    
}
- (IBAction)vratiSe:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
