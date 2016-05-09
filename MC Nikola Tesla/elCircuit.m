//
//  laser.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "elCircuit.h"

@interface elCircuit ()

@end

@implementation elCircuit

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popisElemenata = @[@"zicaK",@"zicaV",@"zicaT",@"zicaX",@"zicaB",@"zicaZ",@"zicaP",@"zicaPZ"];
    popisSlicica = @[@"zicaKut",@"zicaRavno",@"zicaNaT",@"zicaKriz",@"baterija",@"zarulja",@"sklopkaO",@"sklopkaZ",@"zaruljaS"];
    for (int i=0; i<10; i++) {
        for (int j=0; j<5; j++) {
            osobineKomada[i][j]=0;
        }
    }
    
    osobineKomada[0][1]=1;
    osobineKomada[0][2]=1;
    
    osobineKomada[1][2]=1;
    osobineKomada[1][4]=1;
    
    osobineKomada[2][2]=1;
    osobineKomada[2][3]=1;
    osobineKomada[2][4]=1;
    
    osobineKomada[2][1]=1;
    osobineKomada[2][2]=1;
    osobineKomada[2][3]=1;
    osobineKomada[2][4]=1;
    
    osobineKomada[3][2]=1;
    osobineKomada[3][4]=1;
    
    osobineKomada[4][2]=1;
    osobineKomada[4][4]=1;
    
    osobineKomada[5][2]=1;
    osobineKomada[5][4]=1;
    
    
    ukljuceno = false;
    
    for (int i=0; i<7; i++) {
        for (int j=0; j<9; j++){
            for (int k=0; k<5; k++) {
                poljeKomada[i][j][k]=0;
            }
        }
    }
}

-(void) viewDidAppear:(BOOL)animated{
    
    velicina = self.view.frame;
    dimenzija=velicina.size.height/10;
    navBar.frame = CGRectMake(0, 20, velicina.size.width, 44);
    
    izbornik = [[UIImageView alloc]init];
    izbornik.frame = CGRectMake(0, velicina.size.height-dimenzija-4, velicina.size.width,dimenzija+4 );
    [izbornik setBackgroundColor:[UIColor orangeColor]];
    izbornik.userInteractionEnabled = YES;
    [self.view addSubview:izbornik];
    [self napraviIzbor];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.numberOfTapsRequired = 1;
    [izbornik addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(skrolaj:)];
    [izbornik addGestureRecognizer:panGesture];
    [self.view addGestureRecognizer:singleTap];
    granice = CGPointMake((int)(dimenzija*6), (int)dimenzija*8);
    
    smece = [[UIImageView alloc]init];
    smece.frame = CGRectMake(velicina.size.width-dimenzija-10, navBar.frame.origin.y+navBar.frame.size.height+ 10, dimenzija,dimenzija+4 );
    smece.image = [UIImage imageNamed:@"smece"];
    [self.view addSubview:smece];
    
    
    drugaStrana = [[UIImageView alloc]init];
    drugaStrana.frame = CGRectMake(0, 0, velicina.size.width,velicina.size.height );
    [drugaStrana setBackgroundColor:[UIColor whiteColor]];
    drugaStrana.image = [UIImage imageNamed:@"podlogaG"];
    drugaStrana.userInteractionEnabled = YES;
    [self.view addSubview:drugaStrana];
    drugaStrana.alpha=0;
    UIPanGestureRecognizer *panGesture2 =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(miciDrugu:)];
    [drugaStrana addGestureRecognizer:panGesture2];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Use:"
                                                                   message:@"Single tap:rotate, double tap:switch on-off"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    navBar.frame = CGRectMake(0, 20, velicina.size.width, 44);
}

-(void)napraviIzbor{
    
    float popisX = 0;
    for (int i=0; i<popisElemenata.count-1; i++) {
        UIImageView *slikaIzbor = [[UIImageView alloc]init];
        slikaIzbor.image = [UIImage imageNamed:popisElemenata[i]];
        slikaIzbor.frame = CGRectMake(popisX, 2, dimenzija, dimenzija);
        slikaIzbor.tag = i+1;
        [izbornik addSubview:slikaIzbor];
        
        //obrub
        CALayer *borderLayer = [CALayer layer];
        CGRect borderFrame = CGRectMake(0, 0, slikaIzbor.frame.size.width, slikaIzbor.frame.size.width);
        [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
        [borderLayer setFrame:borderFrame];
        [borderLayer setCornerRadius:10];
        [borderLayer setBorderWidth:2];
        [borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
        [slikaIzbor.layer addSublayer:borderLayer];
        popisX += dimenzija;
        
    }
    
}

- (void)doDoubleTap:(UITapGestureRecognizer *)gesture{
    CGPoint prstPt = [gesture locationInView:self.view];
    
    for(UIImageView *tempImage in self.view.subviews)
    {
        if (CGRectContainsPoint(tempImage.frame, prstPt) && (tempImage.tag==7 || tempImage.tag==8)){
            if (tempImage.tag==7) {
                tempImage.tag=8;
                tempImage.image = [UIImage imageNamed:[popisElemenata objectAtIndex:7]];
            }else if (tempImage.tag==8){
                tempImage.tag=7;
                tempImage.image = [UIImage imageNamed:[popisElemenata objectAtIndex:6]];
            }
        }
    }
    
    [self testiraj2];
    
}


- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    if (ukljuceno) return;
    CGPoint pt=[gesture locationInView:izbornik];
    CGPoint prstPt = [gesture locationInView:self.view];
    
    for(UIImageView *tempImage in izbornik.subviews)
    {
        if (CGRectContainsPoint(tempImage.frame, pt))
        {
            if (tempImage.alpha<1.0) {
                return;
            }
            UIImageView *novaSlika = [[UIImageView alloc]init];
            novaSlika.frame = tempImage.frame;
            novaSlika.center = CGPointMake(prstPt.x, prstPt.y-dimenzija);
            novaSlika.image = tempImage.image;
            novaSlika.tag = tempImage.tag;
            [self.view addSubview:novaSlika];
            if (tempImage.tag==5) {
                tempImage.alpha=0.2;
            }
            switch (novaSlika.tag) {
                case 1:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija/2-2.5, -2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                }
                    break;
                case 2:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                }
                    break;
                case 3:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija/2-2.5, -2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                    UIView *pointView3 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija/2-2.5, dimenzija-2.5, 5, 5)];
                    pointView3.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView3];
                }
                    break;
                case 4:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija/2-2.5, -2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                    UIView *pointView3 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija/2-2.5, dimenzija-2.5, 5, 5)];
                    pointView3.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView3];
                    UIView *pointView4 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView4.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView4];
                }
                    break;
                case 5:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                }
                    break;
                case 6:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                }
                    break;
                case 7:
                {
                    UIView *pointView1 = [[UIView alloc] initWithFrame:CGRectMake(-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView1.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView1];
                    UIView *pointView2 = [[UIView alloc] initWithFrame:CGRectMake(dimenzija-2.5, dimenzija/2-2.5, 5, 5)];
                    pointView2.backgroundColor = [UIColor blackColor];
                    [novaSlika addSubview:pointView2];
                    
                }
                    break;
                default:
                    break;
            }
            
            novaSlika.userInteractionEnabled = YES;
            UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
            [novaSlika addGestureRecognizer:panGesture];
            
            //ukupnoC++;
            
            aktivnaSlika = novaSlika;
            
            return;
        }
        else
        {
            //tempImage.alpha = 1.0;
        }
        
    }
    
    for(UIImageView *tempImage in self.view.subviews){
        
        if (CGRectContainsPoint(tempImage.frame, prstPt) && tempImage.tag>0)
        {
            tempImage.transform = CGAffineTransformRotate(tempImage.transform, M_PI/2.0);
            [self testiraj2];
        }
    }
    
}
-(IBAction)miciDrugu:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation=[recognizer translationInView:drugaStrana];
    for (UIImageView *element in drugaStrana.subviews) {
        if (element.tag > 0) {
            element.center=CGPointMake(element.center.x+translation.x,element.center.y+translation.y);
        }
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:drugaStrana];
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
        if (poljeKomada[xx][yy][0]>0) {
            trenutnaPozicija = staraPozicija;
        }
        else
        {
            poljeKomada[xx][yy][0] = (int)aktivnaSlika.tag;
            poljeKomada[stariX][stariY][0] = 0;
        }
        
        // NSLog(@"x:%d y:%d vrsta:%d",xx,yy,polje[xx][yy]);
        
        aktivnaSlika.frame = CGRectMake(trenutnaPozicija.x, trenutnaPozicija.y, aktivnaSlika.frame.size.width, aktivnaSlika.frame.size.height);
        if (CGRectContainsPoint(smece.frame, aktivnaSlika.center) ){
            [aktivnaSlika removeFromSuperview];
            poljeKomada[xx][yy][0] = 0;
        }
        [self testiraj2];
    }
    
}

-(IBAction)skrolaj:(UIPanGestureRecognizer *)recognizer{
    
    
    CGPoint translation=[recognizer translationInView:izbornik];
    for(UIImageView *tempImage in izbornik.subviews){
        
        tempImage.center=CGPointMake(tempImage.center.x+translation.x,tempImage.center.y);
        
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

-(void)testiraj2{
    
    
    //nađi bateriju
    for (UIImageView *element in self.view.subviews) {
        if (element.tag == 5) {
            UIColor *boja= [UIColor redColor];
            for (UIView *kockica in element.subviews){
                kockica.backgroundColor=boja;
                if (boja==[UIColor redColor]) {
                    boja=[UIColor cyanColor];
                }
                else
                {boja=[UIColor redColor];}
            }
            
            
        }else if(element.tag > 0){
            for (UIView *kockica in element.subviews){
                kockica.backgroundColor = [UIColor blackColor];
            }
        }
        
    }
    
    bool imaPromjena= true;
    while (imaPromjena) {
        imaPromjena= false;
        for (UIImageView *element1 in self.view.subviews) {
            if (element1.tag>0 && element1.tag!=6 && element1.tag!=7 ) {
                for (UIView *kockica1 in element1.subviews){
                    if (kockica1.backgroundColor == [UIColor redColor] || kockica1.backgroundColor == [UIColor cyanColor]) {
                        CGPoint p1 = [element1 convertPoint:kockica1.center toView:self.view];
                        UIColor *boja= kockica1.backgroundColor;
                        for (UIImageView *element2 in self.view.subviews) {
                            for (UIView *kockica2 in element2.subviews){
                                CGPoint p2 = [element2 convertPoint:kockica2.center toView:self.view];
                                if (hypotf((p1.x-p2.x), (p1.y-p2.y))<10 && kockica2.backgroundColor == [UIColor blackColor] && element2.tag!=6 && element2.tag!=7) {
                                    imaPromjena = true;
                                    for (UIView *kockica3 in element2.subviews){
                                        kockica3.backgroundColor=boja;
                                    }
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                }
            }
        }
    }
    bool kratkiSpoj=false;
    for (UIImageView *element1 in self.view.subviews) {
        if (element1.tag>0 && element1.tag!=6 && element1.tag!=7) {
            for (UIView *kockica1 in element1.subviews){
                if (kockica1.backgroundColor == [UIColor redColor] || kockica1.backgroundColor == [UIColor cyanColor]) {
                    CGPoint p1 = [element1 convertPoint:kockica1.center toView:self.view];
                    UIColor *boja= kockica1.backgroundColor;
                    for (UIImageView *element2 in self.view.subviews) {
                        for (UIView *kockica2 in element2.subviews){
                            CGPoint p2 = [element2 convertPoint:kockica2.center toView:self.view];
                            if (hypotf((p1.x-p2.x), (p1.y-p2.y))<10 && kockica2.backgroundColor != [UIColor blackColor] && element2.tag!=6 && element1.tag!=7) {
                                if (kockica2.backgroundColor != boja) {
                                    kratkiSpoj=true;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    if (kratkiSpoj) NSLog(@"Kratki spoj"); else NSLog(@"nije kratki spoj");
    //nađi žarulju i postavi joj boju kockica
    for (UIImageView *element in self.view.subviews) {
        if (element.tag == 6) {
            for (UIView *kockica1 in element.subviews){
                //NSLog(@"%ld",(long)element.tag);
                CGPoint p1 = [element convertPoint:kockica1.center toView:self.view];
                for (UIImageView *element2 in self.view.subviews) {
                    if (element2.tag>0) {
                        for (UIView *kockica2 in element2.subviews){
                            CGPoint p2 = [element2 convertPoint:kockica2.center toView:self.view];
                            UIColor *boja= kockica2.backgroundColor;
                            //NSLog(@"%.2f",hypotf((p1.x-p2.x), (p1.y-p2.y)));
                            if (hypotf((p1.x-p2.x), (p1.y-p2.y))<10) {
                                kockica1.backgroundColor=boja;
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    NSMutableArray *zarulje=[[NSMutableArray alloc]init];
    for (UIImageView *element in self.view.subviews) {
        if (element.tag == 6) {
            [zarulje addObject:element];
            element.image=[UIImage imageNamed:@"zicaZ"];
            
        }
    }
    
    
    if (!kratkiSpoj) {
        for (int i=0; i<zarulje.count; i++) {
            UIImageView *element=[zarulje objectAtIndex:i];
            int b=0;
            UIColor *boja1;
            UIColor *boja2;
            for (UIImageView *kockica in element.subviews){
                if (b==0) {
                    boja1=kockica.backgroundColor;
                    b++;
                }
                else{
                    boja2=kockica.backgroundColor;
                }
            }
            if ((boja1 == [UIColor redColor] && boja2 == [UIColor cyanColor]) || (boja2 == [UIColor redColor] && boja1 == [UIColor cyanColor])) {
                element.image=[UIImage imageNamed:@"zicaZS"];
                element.highlighted = YES;
            }
            else{
                element.image=[UIImage imageNamed:@"zicaZ"];
                element.highlighted = NO;
            }
        }
    }
    
}

- (IBAction)ponovoPokreni:(id)sender {
    for (UIImageView *element in self.view.subviews) {
        if (element.tag > 0) {
            [element removeFromSuperview];
            
        }
    }
    for (int i=0; i<7; i++) {
        for (int j=0; j<9; j++){
            for (int k=0; k<5; k++) {
                poljeKomada[i][j][k]=0;
            }
        }
    }
    for (UIImageView *element in izbornik.subviews) {
        element.alpha=1.0;
    }

}
- (IBAction)prikaziDruguStranu:(id)sender {
    
    for (UIImageView *element in drugaStrana.subviews) {
        if (element.tag > 0) {
            [element removeFromSuperview];
        }
    }
    if (drugaStrana.alpha==1.0)
    {
        drugaStrana.alpha=0;
        resetTipka.enabled=YES;
        backButton.enabled=YES;
    }
    else
    {
        drugaStrana.alpha=1;
        [self.view bringSubviewToFront:drugaStrana];
        resetTipka.enabled=NO;
        backButton.enabled=NO;
    }
    for (UIImageView *element in self.view.subviews) {
        if (element.tag > 0) {
            UIImageView *tempImage=[[UIImageView alloc]init];
            tempImage.frame= element.frame;
            
            tempImage.image=[UIImage imageNamed:[popisSlicica objectAtIndex:element.tag-1]];
            if (element.highlighted) {
                tempImage.image=[UIImage imageNamed:[popisSlicica objectAtIndex:8]];
            }
            [drugaStrana addSubview:tempImage];
            tempImage.transform=element.transform;
            tempImage.tag=element.tag;
            //sjena
            
            tempImage.layer.shadowColor = [UIColor blackColor].CGColor;
            tempImage.layer.shadowOffset = CGSizeMake(0, 0);
            tempImage.layer.shadowOpacity = 0.8;
            tempImage.layer.shadowRadius = 5.0;
            
        }
    }
    
    [self.view bringSubviewToFront:navBar];
    

}
- (IBAction)captureScreen:(id)sender {
    izbornik.alpha=0;
    smece.alpha=0;
    navBar.alpha=0;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Image captured"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    izbornik.alpha=1;
    smece.alpha=1;
    navBar.alpha=1;
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
