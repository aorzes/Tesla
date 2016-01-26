//
//  bio.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contentViewController.h"

@interface bio : UIViewController
<UIPageViewControllerDataSource>
{
    UIPageViewController *pageController;
    NSArray *pageContent;
    
}
@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;


@end
