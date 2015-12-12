//
//  FirstViewController.m
//  autolayout
//
//  Created by yangdeliang on 12/6/15.
//  Copyright © 2015 yangdeliang. All rights reserved.
//


#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property UIButton *btnSecond;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSecond = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    self.btnSecond.backgroundColor = [UIColor redColor];
    [self.btnSecond setTitle:@"hello world" forState:UIControlStateNormal];
    [self.btnSecond addTarget:self
                       action:@selector(jumpSencondView:)
             forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.btnSecond];
    
    // Do any additional setup after loading the view.
}

- (void)jumpSencondView:(id)sender {
    SecondViewController *secondView = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
