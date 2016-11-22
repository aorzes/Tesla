//
//  bio.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface bio : UIViewController {
    NSString *historyfile;
    NSArray *popis;
    NSInteger n;
    
    CGSize velicina;
    
    __weak IBOutlet UIBarButtonItem *rightBA1;
    __weak IBOutlet UIBarButtonItem *rightBA;
    __weak IBOutlet UINavigationBar *navBar;
    __weak IBOutlet UILabel *labBr;
    __weak IBOutlet UIWebView *mWebView;
}


@end
