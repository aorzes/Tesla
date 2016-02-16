//
//  bio.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import "bio.h"

@interface bio ()

@end

@implementation bio


- (void)viewDidLoad
{
    [super viewDidLoad];
    historyfile=@"prva.html";
    popis = @[@"prva.html",@"druga.html",@"treca.html",@"cetvrta.html",@"peta.html",@"sesta.html"];
    n=0;
    //ucitaj stranicu
    [self ucitajStranicu];
}
- (IBAction)sljedeca:(id)sender {
    n++;
    if (n>=popis.count) {
        n=0;
    }
    historyfile = popis[n];
    [self ucitajStranicu];
}
- (IBAction)prethodna:(id)sender {
    n--;
    if (n<=0) {
        n=0;
    }
    historyfile = popis[n];
    [self ucitajStranicu];
    
}

-(void)ucitajStranicu{

    //ucitaj stranicu
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:historyfile ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [mWebView loadRequest:request];

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
