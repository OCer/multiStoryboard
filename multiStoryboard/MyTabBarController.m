//
//  MyTabBarController.m
//  积极发挥
//
//  Created by Cer on 15-10-15.
//  Copyright (c) 2015年 Cer. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:3];
    
    for (int i = 1; i < 4; ++i)
    {
        UIViewController *VC = [self getViewController:[NSString stringWithFormat:@"%d", i]];
        [array addObject:VC];
    }
    
    [self setViewControllers:array animated:YES];
    
    return;
}

- (UIViewController *)getViewController:(NSString *)stroyboard
{
    return [[UIStoryboard storyboardWithName:stroyboard bundle:nil] instantiateInitialViewController];
}

+ (void)moveToStoryboard:(NSString*)stroyboard controller:(UIViewController*)controller {
    UINavigationController *destination = [[UIStoryboard storyboardWithName:stroyboard bundle:nil] instantiateInitialViewController];
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:stroyboard source:controller destination:destination performHandler:^(void) {
        [controller presentViewController:destination animated:YES completion:nil];
    }];
    [controller shouldPerformSegueWithIdentifier:segue.identifier sender:self];
    [controller prepareForSegue:segue sender:self];
    [segue perform];
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
