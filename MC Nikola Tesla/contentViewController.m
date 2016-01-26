//
//  contentViewController.m
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 10/6/12.
//  Copyright (c) 2012 anton.orzes@gmail.com. All rights reserved.
//

#import "contentViewController.h"

@interface contentViewController ()

@end


@implementation contentViewController

@synthesize webView, dataObject;

-(IBAction) povratak{
    //[self dismissModalViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Ovo omogucava stavljanje slika odnosno odredjuje path
    [self.webView loadHTMLString:dataObject baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
