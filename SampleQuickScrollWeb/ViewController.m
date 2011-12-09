//
//  ViewController.m
//  SampleQuickScrollWeb
//
//  Created by Masaru Sakai on 11/12/09.
//  Copyright (c) 2011年 Masaru Sakai. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize webView = _webView;
@synthesize subScrollView = _subScrollView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)dealloc
{
    self.webView.delegate = nil;
    self.subScrollView = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // UIWebView内のScrollViewの調整
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 5.0) {
        for (UIView *subview in [self.webView subviews]) {
            if ([[subview.class description] isEqualToString:@"UIScrollView"]) {
                self.subScrollView = (UIScrollView *)subview;
            }
        }
    }else {
        self.subScrollView = (UIScrollView *)[self.webView scrollView];
    }
    self.subScrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.co.jp/news/i?hl=ja&source=mog&gl=jp"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.webView.delegate = nil;
    self.webView = nil;
    self.subScrollView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSLog(@"%s", __func__);
    return YES;
}

- (void) webViewDidStartLoad: (UIWebView *) view {
	NSLog(@"%s", __func__);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)view {
	NSLog(@"%s", __func__);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	NSLog(@"%s", __func__);
    
}

@end
