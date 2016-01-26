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

@synthesize pageController,pageContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (contentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
        (index >= [self.pageContent count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    contentViewController *dataViewController =
    [[contentViewController alloc]
     initWithNibName:@"contentViewController"
     bundle:nil];
    dataViewController.dataObject =
    [self.pageContent objectAtIndex:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(contentViewController *)viewController
{
    return [self.pageContent indexOfObject:viewController.dataObject];
}

- (void) createContentPages
{
    
    //[self.webView loadHTMLString:htmlContent baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];
    NSString *contentString;
    /*for (int i = 1; i < 5; i++)
     {
     contentString = [[NSString alloc]
     initWithFormat:@"<html><head></head><body><h1>Poglavlje %d</h1><p>Tesla’s biography</p><img src='smiljan2.png'></body></html>", i, i];
     [pageStrings addObject:contentString];
     }*/
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Tesla’s biography</h1><p>Nikola Tesla (1856-1943) was a scientist and inventor born in Smiljan, Croatia.<img src='smiljan2.png'> His father (Milutin) was an Orthodox priest, and his mother (Georgina, called Đuka) had no formal education, but she was very intelligent. His education began in Gospić and then he went to gymnasium in Rakovac near Karlovac.                        Tesla attended the Technical University in Vienna and Prague. For a time he worked for the Edison Company in Paris. Shortly after that he went to America. In America, he continued to work for Edison, but soon they realized that they have different opinions, Tesla advocated for the AC and Edison advocated for the DC. </body></html>"];
    [pageStrings addObject:contentString];
    
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Tesla’s biography</h1><p>In 1885 George Westinghouse (the owner of the Westinghouse Electric Company) bought the rights to Tesla's polyphase dynamo generators, transformers and motors. Soon, Tesla began to conduct various experiments in his lab that he showed to the public, like turning on the lights without a wire. He allowed the electricity to flow through his body in order to lessen the fears of alternating current. One of his glorious inventions is the Tesla coil, which is now widely used in radios, televisions and other electronic equipment. At the World's Columbian Exposition in Chicago, in 1893, Westinghouse used Tesla's lighting systems. That success was an important factor in obtaining a contract to set up his power plant at Niagara Falls, which was practically the beginning of the electrification of the world. In 1898 at Madison Square Garden Tesla unveiled a boat that could be managed with the help of a remote device. <img src='brodizvan.png' width=300>In Colorado Springs Tesla discovered what he considered his greatest discovery and that were the terrestrial stationary waves. He has discovered that the land can be used as an electricity conductor. He managed to light 200 lamps at a distance of 40 kilometers. He also managed to create artificial lightning. </body></html>"];
    [pageStrings addObject:contentString];
    
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Tesla’s biography</h1><p>In 1900 Tesla tried to make a tower which could send signals to the whole world. Thus he wanted to create a worldwide communication grid. He had 150 000 dollar capital obtained from JP Morgan. The project failed because it wasn't financially profitable so Morgan withdrew from it. Tesla then continued with his other projects that were generally not realized due to lack of funds so most of his projects remained in his notebooks. Tesla was supposed to get the Nobel Prize in 1915, but he rejected it because he was supposed to share it with Edison. In the end, it was not assigned to either one. Although he didn't get the Nobel Prize, in 1917 he got The Edison Medal, the highest honor that could be given by the American Institute of Electrical Engineering.<img src='stator3.png' width=300> </body></html>"];
    [pageStrings addObject:contentString];
    
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Tesla’s biography</h1><p>Tesla allegedly cooperated with the U.S. government and other scientists on the production of weapons that would give the U.S. supremacy in the war against the Nazi. Thus, there are theories that he invented the 'death ray'. Allegedly they managed to achieve the invisibility of one American ship, and they even managed to teleport it. He died in 1943 and the U.S. government took over all of his records and research. Even today, people can't take the advantage of all his designs because they are far ahead of our time.<img src='coil.png' width=300>  </body></html>"];
    [pageStrings addObject:contentString];
    
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Wireless transmission</h1><p>Tesla most experimented with wireless power transmission. In 1891 he presented the first wireless transmission on the principle of induction coil. In 1896 he managed to show the transfer of energy to a distance of 48 km (30 miles). He experimented mostly in his laboratory in Colorado Springs, but failed to complete his research because the investors could not see any profit in his project. Today's world is unthinkable without wireless technology, but it is used mainly for data transmission, and for the transmission of energy there is still not enough interest.<img src='spring.jpg' width=300> </body></html>"];
    [pageStrings addObject:contentString];
    
    contentString = [[NSString alloc]
                     initWithFormat:@"<html><head></head><body><h1>Hydropower plant</h1><p>The potential energy of the water which falls through the pipes on the turbine blades is converted into kinetic and spins a turbine, and that rotation through a common shaft transmits to the rotating rotor of an electric generator. The rotor is actually an electromagnet. Electricity that is produced is formed in the stator windings. When the magnetic field (due to rotation) quickly changes in front of the stator poles it is generating an electric potential or current. The powerplants must pay particular attention to the turbine speed so that the frequency (the number of changes per second) of the AC remains the same (by the industry standard). Therefore putting a hydropower plant to work is a complex procedure, and only when it reaches the correct frequency, the power plant is connected to the power system. With the construction of the Tesla’s power plant on the Niagara Falls started the electrification of our planet.<img src='teslaSwitch0000.png' width=200> </body></html>"];
    [pageStrings addObject:contentString];
    
    
    
    pageContent = [[NSArray alloc] initWithArray:pageStrings];
}


- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerBeforeViewController:
(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (contentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (contentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createContentPages];
    NSDictionary *options =
    [NSDictionary dictionaryWithObject:
     [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                                forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[UIPageViewController alloc]
                           initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                           navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                           options: options];
    
    pageController.dataSource = self;
    [[pageController view] setFrame:[[self view] bounds]];
    
    contentViewController *initialViewController =
    [self viewControllerAtIndex:0];
    NSArray *viewControllers =
    [NSArray arrayWithObject:initialViewController];
    
    [pageController setViewControllers:viewControllers
                             direction:UIPageViewControllerNavigationDirectionForward
                              animated:NO
                            completion:nil];
    
    [self addChildViewController:pageController];
    [[self view] addSubview:[pageController view]];
    [pageController didMoveToParentViewController:self];
    
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
