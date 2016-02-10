//
//  elPipe.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "elPipe.h"

@interface elPipe ()

@end

@implementation elPipe

- (void)viewDidLoad {
    [super viewDidLoad];
    kutp = 0;
    pomak = 0.05;
    ukljuceno = false;
    // Do any additional setup after loading the view, typically from a nib.
    popisCijevi = @[@"cijevi1",@"cijevi2",@"cijevi3",@"cijevi4",@"cijevi5",@"cijevi6"];
    for (int i=0; i<6; i++) {
        for (int j=0; j<9; j++) {
            polje[i][j]=0;
        }
    }
    polje[0][1] = 5;
    polje[4][8] = 1;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    velicina = self.view.frame;
    podloga = [[UIImageView alloc]init];
    podloga.image = [UIImage imageNamed:@"podlogaPipe2"];
    podloga.frame= CGRectMake(0, 0, velicina.size.width, velicina.size.height);
    [self.view addSubview:podloga];
    [self.view sendSubviewToBack:podloga];
    dimenzija = velicina.size.width/5;
    prvaCijev = [[UIImageView alloc]init];
    prvaCijev.image = [UIImage imageNamed:@"cijevi5"];
    prvaCijev.frame = CGRectMake(0,0, dimenzija, dimenzija);
    [self.view addSubview:prvaCijev];
    granice = CGPointMake((int)(dimenzija*5), (int)dimenzija*7);
    pocetna = [[UIImageView alloc]init];
    pocetna.image = [UIImage imageNamed:@"cijevVentil"];
    pocetna.frame = CGRectMake(0, dimenzija, dimenzija, dimenzija);
    [pocetna setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:pocetna];
    float proporcije = (velicina.size.height-pocetna.frame.origin.y)/velicina.size.width;
    ruckaVentila = [[UIImageView alloc]init];
    ruckaVentila.image = [UIImage imageNamed:@"ruckaVentila"];
    ruckaVentila.frame = CGRectMake(0, pocetna.frame.origin.y, dimenzija, dimenzija);
    [self.view addSubview:ruckaVentila];
    
    nadolazece = [[UIImageView alloc]init];
    nadolazece.image = [UIImage imageNamed:@"podlogaPipe2"];
    nadolazece.frame = CGRectMake(dimenzija*2, pocetna.frame.origin.y, velicina.size.width-dimenzija*2,dimenzija );
    [nadolazece setBackgroundColor:[UIColor orangeColor]];
    nadolazece.userInteractionEnabled = YES;
    [self.view addSubview:nadolazece];
    
    [self napraviIzbor];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [nadolazece addGestureRecognizer:singleTap];
    
    zavrsna = [[UIImageView alloc]init];
    zavrsna.image = [UIImage imageNamed:@"cijevTurbine"];
    zavrsna.frame = CGRectMake(velicina.size.width-dimenzija*2, pocetna.frame.origin.y+dimenzija*7, dimenzija*2, dimenzija);
    [self.view addSubview:zavrsna];
    
    stator = [[UIImageView alloc]init];
    stator.image = [UIImage imageNamed:@"turbinaStator"];
    stator.frame = CGRectMake(velicina.size.width - dimenzija*3, velicina.size.height-dimenzija*2, dimenzija*2, dimenzija*2);
    [self.view addSubview:stator];
    
    rotor = [[UIImageView alloc]init];
    rotor.image = [UIImage imageNamed:@"turbina3"];
    rotor.frame = CGRectMake(stator.center.x-dimenzija*0.75 , stator.frame.origin.y+dimenzija*0.25, dimenzija*1.5, dimenzija*1.5);
    [self.view addSubview:rotor];
    [rotor bringSubviewToFront:stator];
    
    strelica1 = [[UIImageView alloc]init];
    strelica1.image = [UIImage imageNamed:@"strelica"];
    strelica1.frame = CGRectMake(pocetna.frame.origin.x , pocetna.frame.origin.y+dimenzija, dimenzija*0.75, dimenzija*0.75);
    strelica1.center = CGPointMake(pocetna.center.x, pocetna.center.y+dimenzija);
    [self.view addSubview:strelica1];
    
    strelica2 = [[UIImageView alloc]init];
    strelica2.image = [UIImage imageNamed:@"strelica"];
    strelica2.frame = CGRectMake(pocetna.frame.origin.x , pocetna.frame.origin.y+dimenzija, dimenzija*0.75, dimenzija*0.75);
    strelica2.center = CGPointMake(velicina.size.width-dimenzija/2, zavrsna.center.y-dimenzija);
    [self.view addSubview:strelica2];
    
    zarulja = [[UIImageView alloc]init];
    zarulja.image = [UIImage imageNamed:@"zarulja0000"];
    zarulja.frame = CGRectMake(0, velicina.size.height-dimenzija, dimenzija, dimenzija);
    [self.view addSubview:zarulja];
    
    if(proporcije>1.5)
    {
        polje[4][8] = 1;
        zavrsna.frame = CGRectMake(velicina.size.width-dimenzija*2, pocetna.frame.origin.y+dimenzija*7-10, dimenzija*2, dimenzija);
        ciljana=8;
    }
    else if(proporcije>1.4)
    {
        polje[4][7] = 1;
        zavrsna.frame = CGRectMake(velicina.size.width-dimenzija*2, pocetna.frame.origin.y+dimenzija*6-10, dimenzija*2, dimenzija);
        ciljana=7;
        
    }
    else
    {
        polje[4][6] = 1;
        zavrsna.frame = CGRectMake(velicina.size.width-dimenzija*2, pocetna.frame.origin.y+dimenzija*5-10, dimenzija*2, dimenzija);
        ciljana=6;
    }
    
    [self.view bringSubviewToFront:navBar];
    
    NSLog(@"odnos:%f",proporcije);
    
}
- (IBAction)pokreniPonovo:(id)sender {
    [zarulja stopAnimating];
    ukljuceno = false;
    zarulja.image = [UIImage imageNamed:@"zarulja0000"];
    [pocetna setBackgroundColor:[UIColor yellowColor]];
    [timerM invalidate];
    timerM = nil;
    kutp = 0;
    for (int i=0; i<6; i++) {
        for (int j=0; j<9; j++) {
            polje[i][j]=0;
        }
    }
    polje[0][1] = 5;
    polje[4][ciljana] = 1;
    
    for(UIImageView *tempImage in self.view.subviews){
        
        if (tempImage.tag>0) {
            [tempImage removeFromSuperview];
        }
        
    }
    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(0);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    [ruckaVentila setTransform:rotate1];
    [UIView commitAnimations];
    
}

-(void)napraviIzbor{
    izbornikArray = [[NSMutableArray alloc]init];
    float popisX = 0;
    [izbornikArray addObject:[NSNumber numberWithFloat:popisX]];
    for (int i=0; i<4; i++) {
        int n= arc4random()%6;
        UIImageView *slikaIzbor = [[UIImageView alloc]init];
        slikaIzbor.image = [UIImage imageNamed:popisCijevi[n]];
        slikaIzbor.frame = CGRectMake(popisX, 0, nadolazece.frame.size.height, nadolazece.frame.size.height);
        slikaIzbor.tag = n+1;
        [nadolazece addSubview:slikaIzbor];
        
        //obrub
        CALayer *borderLayer = [CALayer layer];
        CGRect borderFrame = CGRectMake(0, 0, slikaIzbor.frame.size.width, slikaIzbor.frame.size.width);
        [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
        [borderLayer setFrame:borderFrame];
        [borderLayer setCornerRadius:10];
        [borderLayer setBorderWidth:2];
        [borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
        [slikaIzbor.layer addSublayer:borderLayer];
        popisX += nadolazece.frame.size.height;
        [izbornikArray addObject:[NSNumber numberWithFloat:popisX]];
    }
    
}

-(void)popuniIzbor{
    int i=0;
    float trazeni = [[izbornikArray objectAtIndex:i]floatValue];
    for(UIImageView *tempImage in nadolazece.subviews)
    {
        
        if (trazeni<tempImage.center.x) {
            // animiraj
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration: 1.0];
            tempImage.frame = CGRectMake(trazeni, tempImage.frame.origin.y, tempImage.frame.size.width, tempImage.frame.size.height);
            [UIView commitAnimations];
            i++;
            trazeni = [[izbornikArray objectAtIndex:i]floatValue];
            
        }
        
    }
    
    int n= arc4random()%6;
    UIImageView *slikaIzbor = [[UIImageView alloc]init];
    slikaIzbor.image = [UIImage imageNamed:popisCijevi[n]];
    slikaIzbor.frame = CGRectMake([[izbornikArray lastObject]floatValue], 0, nadolazece.frame.size.height, nadolazece.frame.size.height);
    [nadolazece addSubview:slikaIzbor];
    slikaIzbor.tag=n+1;
    //obrub
    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(0, 0, slikaIzbor.frame.size.width, slikaIzbor.frame.size.width);
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:10];
    [borderLayer setBorderWidth:2];
    [borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
    [slikaIzbor.layer addSublayer:borderLayer];
    
    
    
}

//pusti vodu
- (void)provjera {
    //NSLog(@"PAZI!");
    if ([self provjeriSpoj]) {
        [pocetna setBackgroundColor:[UIColor whiteColor]];
        [self startM];
        zarulja.image = [UIImage imageNamed:@"zarulja0010"];
        zarulja.animationImages=[NSArray arrayWithObjects:
                                 [UIImage imageNamed: @"zarulja0006.png"],
                                 [UIImage imageNamed: @"zarulja0007.png"],
                                 [UIImage imageNamed: @"zarulja0008.png"],
                                 [UIImage imageNamed: @"zarulja0009.png"],
                                 [UIImage imageNamed: @"zarulja0010.png"],
                                 nil];
        zarulja.animationDuration=0.10;
        zarulja.animationRepeatCount=0;
        [zarulja startAnimating];
        
    }
    else
    {
        
        [pocetna setBackgroundColor:[UIColor redColor]];
        [self poplava];
    }
    
}
-(void)startM{
    
    if(!timerM)
    { timerM = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                target:self
                                              selector:@selector(rotacija)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
    
}
-(void)rotacija{
    kutp+=pomak;
    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(kutp);
    [rotor setTransform:rotate1];
    
}

-(void)poplava{
    
    UIImageView *cvit = [[UIImageView alloc]init];
    cvit.image = [UIImage imageNamed:@"mlazVode1"];
    cvit.tag = 1;
    cvit.frame = CGRectMake(curiX*dimenzija+dimenzija/2, curiY*dimenzija+dimenzija/2, dimenzija, self.view.frame.size.height);
    [self.view addSubview:cvit];
    if (vektor == 0) {
        cvit.alpha = 0.8;
        cvit.center= CGPointMake(curiX*dimenzija+dimenzija/2, curiY*dimenzija-dimenzija/2+self.view.frame.size.height/2);
        cvit.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"mlazVodeA0.png"],
                              [UIImage imageNamed: @"mlazVodeB0.png"],
                              [UIImage imageNamed: @"mlazVodeC0.png"],
                              [UIImage imageNamed: @"mlazVodeD0.png"],
                              nil];
        cvit.animationDuration=0.60;
        cvit.animationRepeatCount=0;
        [cvit startAnimating];    }
    if (vektor == 1) {
        cvit.alpha = 0.8;
        cvit.center= CGPointMake(curiX*dimenzija+dimenzija*1.5, curiY*dimenzija+dimenzija/4+self.view.frame.size.height/2);
        cvit.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"mlazVodeA1.png"],
                              [UIImage imageNamed: @"mlazVodeB1.png"],
                              [UIImage imageNamed: @"mlazVodeC1.png"],
                              [UIImage imageNamed: @"mlazVodeD1.png"],
                              nil];
        cvit.animationDuration=0.60;
        cvit.animationRepeatCount=0;
        [cvit startAnimating];
    }
    if (vektor == 2) {
        cvit.center= CGPointMake(curiX*dimenzija+dimenzija/2, curiY*dimenzija+dimenzija+self.view.frame.size.height/2);
        cvit.image = [UIImage imageNamed:@"mlazVode2"];
        [UIView animateWithDuration:0.2 animations:^(void) {
            [UIView setAnimationRepeatCount:MAXFLOAT];
            cvit.alpha = 0.8;
            cvit.alpha = 0.95;
        }];
        
    }
    if (vektor == 3) {
        cvit.alpha = 0.8;
        cvit.center= CGPointMake(curiX*dimenzija-dimenzija/2, curiY*dimenzija+dimenzija/4+self.view.frame.size.height/2);
        cvit.animationImages=[NSArray arrayWithObjects:
                              [UIImage imageNamed: @"mlazVodeA3.png"],
                              [UIImage imageNamed: @"mlazVodeB3.png"],
                              [UIImage imageNamed: @"mlazVodeC3.png"],
                              [UIImage imageNamed: @"mlazVodeD3.png"],
                              nil];
        cvit.animationDuration=0.60;
        cvit.animationRepeatCount=0;
        [cvit startAnimating];
    }
    
    
}

-(BOOL)provjeriSpoj{
    int i = 0;
    int j = 1;
    polje[i][j] = 5;
    polje[4][ciljana] = 1;
    int koja = 5;
    vektor = 2;
    bool kraj = false;
    do
    {
        koja = polje[i][j];
        NSLog(@"koja:%d i:%d j:%d vektor:%d",koja,i,j,vektor);
        switch (koja)
        {
            case 0:
                curiX=i;curiY=j;
                return false;
                break;
            case 1: // L
                if((polje[i+1][j]==3 || polje[i+1][j]==4 || polje[i+1][j]==6) && vektor == 1) //odozgo prema dolje
                {
                    i++; //ide desno
                    NSLog(@"AsHa!");
                    if(i>5) { curiX=i;curiY=j;return false;}
                    if(polje[i][j]==3) vektor = 2; //s lijeva dolje
                    if(polje[i][j]==4) vektor = 0; //s lijeva gore
                    if(polje[i][j]==6) vektor = 1; //ravna cijev
                }
                else if((polje[i][j-1]==2 || polje[i][j-1]==3 || polje[i][j-1]==5) && vektor == 3) // s desna
                {
                    j--;
                    if(j<2) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==2) vektor = 1; // odozdo desno
                    if(polje[i][j]==3) vektor = 3; // odozdo lijevo
                    if(polje[i][j]==5) vektor = 0; // ravno gore
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
            case 2:
                if((polje[i+1][j]==3 || polje[i+1][j]==4 || polje[i+1][j]==6) && vektor == 1) //desno
                {
                    i++;
                    if(i>5) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==3) vektor = 2; //s lijeva dolje
                    if(polje[i][j]==4) vektor = 0; //s lijeva gore
                    if(polje[i][j]==6) vektor = 1; // vodoravno
                    
                }
                else if ((polje[i][j+1]==1 || polje[i][j+1]==4 || polje[i][j+1]==5) && vektor == 2)
                {
                    j++;
                    if(i==4 && j==ciljana) return true;
                    if(j>ciljana) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 1; // odozgo pa desno
                    if(polje[i][j]==4) vektor = 3; // odozgo pa lijevo
                    if(polje[i][j]==5) vektor = 2; // ravno dolje
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
            case 3:
                if((polje[i-1][j]==1 || polje[i-1][j]==4 || polje[i-1][j]==6) && vektor == 0)
                {
                    i--;
                    if(i<0) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 0; // s desna gore
                    if(polje[i][j]==4) vektor = 3; // s desna dolje
                    if(polje[i][j]==6) vektor = 2; // ravno lijevo
                    
                }
                else if ((polje[i][j+1]==1 || polje[i][j+1]==4 || polje[i][j+1]==5) && vektor == 2)
                {
                    j++;
                    if(i==4 && j==ciljana) return true;
                    if(j>ciljana) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 1; //odozgo desno
                    if(polje[i][j]==4) vektor = 3; // odozgo lijevo
                    if(polje[i][j]==5) vektor = 2; // odozgo ravno dolje
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
            case 4:
                if((polje[i-1][j]==1 || polje[i-1][j]==2 || polje[i-1][j]==6) && vektor == 3)
                {
                    i--;
                    if(i<0) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 0; // s desna gore
                    if(polje[i][j]==2) vektor = 2; // s desna dolje
                    if(polje[i][j]==6) vektor = 3; // ravno lijevo
                    
                }
                else if ((polje[i][j-1]==2 || polje[i][j-1]==3 || polje[i][j-1]==5) && vektor == 0)
                {
                    j--;
                    if(j<2) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==2) vektor = 1; //odozgo desno
                    if(polje[i][j]==3) vektor = 3; // odozgo lijevo
                    if(polje[i][j]==5) vektor = 0; // odozdo ravno gore
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
            case 5:
                if((polje[i][j-1]==2 || polje[i][j-1]==3 || polje[i][j-1]==5) && vektor == 0)
                {
                    j--;
                    if(j<2) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==2) vektor = 1; // odozdo desno
                    if(polje[i][j]==3) vektor = 3; // odozdo lijevo
                    if(polje[i][j]==5) vektor = 0; // ravno gore
                    
                }
                else if ((polje[i][j+1]==1 || polje[i][j+1]==4 || polje[i][j+1]==5) && vektor == 2)
                {
                    j++;
                    if(i==4 && j==ciljana) return true;
                    NSLog(@"HA!");
                    if(j>ciljana) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 1; //odozgo desno
                    if(polje[i][j]==4) vektor = 3; // odozgo lijevo
                    if(polje[i][j]==5) vektor = 2; // odozdo ravno dolje
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
            case 6:
                if((polje[i+1][j]==3 || polje[i+1][j]==4 || polje[i+1][j]==6) && vektor == 1)
                {
                    i++;
                    if(i>5) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==3) vektor = 2; // desno dolje
                    if(polje[i][j]==4) vektor = 0; // desno gore
                    if(polje[i][j]==6) vektor = 1; // ravno desno
                    
                }
                else if ((polje[i-1][j]==1 || polje[i-1][j]==2 || polje[i-1][j]==6) && vektor == 3)
                {
                    i--;
                    if(i<0) {curiX=i;curiY=j;return false;}
                    if(polje[i][j]==1) vektor = 0; //odozgo desno
                    if(polje[i][j]==2) vektor = 2; // odozgo lijevo
                    if(polje[i][j]==6) vektor = 3; // odozdo ravno dolje
                }
                else
                {curiX=i;curiY=j;return false;}
                break;
                
        }
        //NSLog(@"kraj:%d",kraj);
    }
    while(!kraj);
    return kraj;
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    if (CGRectContainsPoint(ruckaVentila.frame, currentPoint)){
        ukljuceno = true;
        CGAffineTransform rotate1 = CGAffineTransformMakeRotation(3);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration: 2.0];
        [ruckaVentila setTransform:rotate1];
        [UIView commitAnimations];
        [self provjera];
    }
}
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    strelica1.alpha = 0;
    strelica2.alpha = 0;
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    if (ukljuceno) return;
    CGPoint pt=[gesture locationInView:nadolazece];
    CGPoint prstPt = [gesture locationInView:self.view];
    strelica1.alpha = 0;
    strelica2.alpha = 0;
    for(UIImageView *tempImage in nadolazece.subviews)
    {
        if (CGRectContainsPoint(tempImage.frame, pt))
        {
            tempImage.alpha = 0.5;
            UIImageView *novaSlika = [[UIImageView alloc]init];
            novaSlika.frame = tempImage.frame;
            novaSlika.center = CGPointMake(prstPt.x-15, prstPt.y+5);
            novaSlika.image = tempImage.image;
            novaSlika.tag = tempImage.tag;
            [self.view addSubview:novaSlika];
            novaSlika.userInteractionEnabled = YES;
            UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
            [novaSlika addGestureRecognizer:panGesture];
            novaSlika.layer.shadowColor = [UIColor blackColor].CGColor;
            novaSlika.layer.shadowOffset = CGSizeMake(-5, 5);
            novaSlika.layer.shadowOpacity = 0.4;
            novaSlika.layer.shadowRadius = 1.0;
            
            
            aktivnaSlika = novaSlika;
            
            [tempImage removeFromSuperview];
            [self popuniIzbor];
            return;
        }
        else
        {
            tempImage.alpha = 1.0;
        }
        
    }
    
}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    if (ukljuceno) {return;}
    CGPoint translation=[recognizer translationInView:self.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    aktivnaSlika = (UIImageView *)recognizer.view;
    
    
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        staraPozicija = aktivnaSlika.frame.origin;
        stariX=(int)roundf(aktivnaSlika.frame.origin.x / dimenzija);
        stariY=(int)roundf(aktivnaSlika.frame.origin.y / dimenzija);
        staraPozicija.x = dimenzija*(stariX);
        staraPozicija.y = dimenzija*(stariY);
        
    }
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint trenutnaPozicija = aktivnaSlika.frame.origin;
        trenutnaPozicija.x = dimenzija*(roundf(trenutnaPozicija.x / dimenzija));
        trenutnaPozicija.y = dimenzija*(roundf(trenutnaPozicija.y / dimenzija));
        if (trenutnaPozicija.x<0) {trenutnaPozicija.x = 0;}
        if (trenutnaPozicija.x>granice.x) {trenutnaPozicija.x = granice.x;}
        if (trenutnaPozicija.y<dimenzija) {trenutnaPozicija.y = dimenzija;}
        if (trenutnaPozicija.y>granice.y) {trenutnaPozicija.y = granice.y;}
        int xx = (int)roundf(trenutnaPozicija.x / dimenzija);
        int yy = (int)roundf(trenutnaPozicija.y / dimenzija);
        if (polje[xx][yy]>0) {
            trenutnaPozicija = staraPozicija;
        }
        else
        {
            polje[xx][yy] = (int)aktivnaSlika.tag;
            polje[stariX][stariY] = 0;
        }
        NSLog(@"x:%d y:%d vrsta:%d",xx,yy,polje[xx][yy]);
        
        aktivnaSlika.frame = CGRectMake(trenutnaPozicija.x, trenutnaPozicija.y, aktivnaSlika.frame.size.width, aktivnaSlika.frame.size.height);
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
