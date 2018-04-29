//
//  ViewController.m
//  objc_mobile-developer-pretest
//
//  Created by Lin Cheng Lung on 10/04/2018.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

#import "ViewController.h"
#import "DramaListCell.h"

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

static NSString *const dataSourceURL = @"http://www.mocky.io/v2/5a97c59c30000047005c1ed2";

@interface ViewController ()

@property (nonatomic, strong) NSArray *dramaList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[DramaListCell class] forCellReuseIdentifier:@"dramaInfo"];

    [self fetchDramaList];
}

- (void)fetchDramaList {

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];

    [manager GET:dataSourceURL
        parameters:nil
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                self.dramaList = responseObject[@"data"];
                [self.tableView reloadData];
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
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

    DramaListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dramaInfo"];

    if (NULL == cell) {
        cell = [DramaListCell new];
    }

    [self configureCell:cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(DramaListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dramaInfo = [self.dramaList objectAtIndex:indexPath.row];

    cell.dramaName.text = dramaInfo[@"name"];
    cell.rating.text = [NSString stringWithFormat:@"rating: %@", dramaInfo[@"rating"]];
    cell.createdDate.text = [NSString stringWithFormat:@"created at: %@", dramaInfo[@"created_at"]];

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 50), NO, 0.0);
    UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSURL *imageURL = [NSURL URLWithString:dramaInfo[@"thumb"]];
    [cell.thumbnail setImageWithURL:imageURL placeholderImage:blank];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
