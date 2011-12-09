//
//  ViewController.h
//  SampleQuickScrollWeb
//
//  Created by Masaru Sakai on 11/12/09.
//  Copyright (c) 2011年 Masaru Sakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
{
    __unsafe_unretained IBOutlet UIWebView *_webView;
    __unsafe_unretained UIScrollView *_subScrollView;
}

@property (unsafe_unretained, nonatomic) UIWebView *webView;
@property (unsafe_unretained, nonatomic) UIScrollView *subScrollView;
@end
