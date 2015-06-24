//
//  TwoViewController.m
//  Thirteen23RadialMenu
//
//  Created by Brian Sinnicke on 6/22/15.
//  Copyright (c) 2015 Brian Sinnicke. All rights reserved.
//

#import "TwoViewController.h"
#import "RadialMenu.h"
#import "OneViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController () <RadialMenuDelegate>
@property (strong, nonatomic) RadialMenu *menu;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"2";
    label.font = [UIFont boldSystemFontOfSize:200.0f];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.view addGestureRecognizer:longPressGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)handleLongPressGesture:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        if (self.menu)
        {
            [self.menu hideAnimated];
        }
        CGPoint location = [longPress locationInView:self.view];
        self.menu = [[RadialMenu alloc] initWithLocation:location andScreen:ScreenIndexTwo];
        self.menu.delegate = self;
        [self.menu showAnimated];
        [self.view addSubview:self.menu];
    }
}
-(void)selectedButtonAtScreenIndex:(ScreenIndex)index
{
    switch (index)
    {
        case ScreenIndexHome:
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case ScreenIndexOne:
        {
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case ScreenIndexThree:
        {
            [self.navigationController pushViewController:[[ThreeViewController alloc] init] animated:YES];
            break;
        }
        default:
        {
            break;
        }
    }
}

@end