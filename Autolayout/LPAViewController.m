//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;

//added
@property (nonatomic) UIView *customPurpleBox;
@property (nonatomic) UIView *customOrangeBox1;
@property (nonatomic) UIView *customOrangeBox2;
@property (nonatomic) UIView *customRedBox;
@property (nonatomic) UIView *customBlueBox;

@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here--------------------------------------------------------
    
    self.customPurpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    self.customPurpleBox.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.customPurpleBox];
    
    self.customPurpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *rightConstraintPurple = [NSLayoutConstraint constraintWithItem:self.customPurpleBox attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20];
    NSLayoutConstraint *bottomConstraintPurple = [NSLayoutConstraint constraintWithItem:self.customPurpleBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    NSLayoutConstraint *heightConstraintPurple = [NSLayoutConstraint constraintWithItem:self.customPurpleBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    NSLayoutConstraint *widthConstraintPurple = [NSLayoutConstraint constraintWithItem:self.customPurpleBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:(305.0/500.0) constant:0];

    //ANCHOR - new way of using constraints
    //    NSLayoutConstraint *rightConstraint2 = [self.customPurpleBox.trailingAnchor constraintEqualToAnchor:self.framingView.trailingAnchor constant:20];
    
    [NSLayoutConstraint activateConstraints:@[rightConstraintPurple,bottomConstraintPurple,heightConstraintPurple,widthConstraintPurple]];

    self.customOrangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    self.customOrangeBox1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.customOrangeBox1];
    self.customOrangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *heightConstraintOrange1 = [NSLayoutConstraint constraintWithItem:self.customOrangeBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
    
    NSLayoutConstraint *widthConstraintOrange1 = [NSLayoutConstraint constraintWithItem:self.customOrangeBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:(50.0/500.0) constant:0];
    NSLayoutConstraint *rightConstraintOrange1 = [NSLayoutConstraint constraintWithItem:self.customOrangeBox1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20];
    NSLayoutConstraint *topConstraintOrange1 = [NSLayoutConstraint constraintWithItem:self.customOrangeBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    
    [NSLayoutConstraint activateConstraints:@[heightConstraintOrange1, widthConstraintOrange1, rightConstraintOrange1, topConstraintOrange1]];

    
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
