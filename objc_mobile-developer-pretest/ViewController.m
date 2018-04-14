//
//  ViewController.m
//  objc_mobile-developer-pretest
//
//  Created by Lin Cheng Lung on 10/04/2018.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking/AFNetworking.h>

static NSString *const dataSourceURL = @"http://www.mocky.io/v2/5a97c59c30000047005c1ed2";

@interface ViewController ()

@property (nonatomic, strong) NSArray *dramaList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchDramaList];
}

- (void)fetchDramaList {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    
    [manager GET:dataSourceURL
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@", responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"%@", error);
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dramaList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dramaInfo" forIndexPath:indexPath];

    if (NULL == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dramaInfo"];
    }

    [self configureCell:cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dramaInfo = self.dramaList[indexPath.row];

    cell.textLabel.text = dramaInfo[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"rating: %@\ncreated at: %@", dramaInfo[@"rating"], dramaInfo[@"created_at"]];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:dramaInfo[@"thumb"]]];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
