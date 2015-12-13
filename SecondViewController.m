//
//  SecondViewController.m
//  autolayout
//
//  Created by yangdeliang on 12/6/15.
//  Copyright © 2015 yangdeliang. All rights reserved.
//

#import "SecondViewController.h"
#import "TestTableViewCell.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface SecondViewController ()

@property UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *path = @"https://maps.googleapis.com/maps/api/geocode/json?address=nanjing&sensor=true";
        NSURL *url = [NSURL URLWithString:path];
        sleep(5);
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *addr = [dict objectForKey:@"results"];
        NSLog(@"%@", addr);
        
       // NSLog(@"%@", dict);
    });
    
    [self configureTableView];
    //self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
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

#pragma mark - table configure
- (void) configureTableView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    NSLog(@"width: %.2f, height: %.2f.", rect.size.width, rect.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size
                                                                   .height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.tableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 4;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestTableViewCell *tableViewCell = (TestTableViewCell *)[tableView
                                                             dequeueReusableCellWithIdentifier:CellIdentifier
                                                                       forIndexPath:indexPath];
    
//    NSLog(@"aaàaa");
//    if (tableViewCell) {
//        tableViewCell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    [tableViewCell.mainLabel setText:@"hello world"];
    
    return tableViewCell;
}



@end
