//
//  bio.h
//  MC Nikola Tesla
//
//  Created by Anton Orzes on 25.01.2016..
//  Copyright © 2016. Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface bio : UIViewController

{
    NSString *historyfile;
    NSArray *popis;
    NSInteger n;
    
    __weak IBOutlet UIWebView *mWebView;
}


@end
