//
//  TCLViewController.m
//  TCLGoogleMobileAds
//
//  Created by zhumingke on 08/05/2021.
//  Copyright (c) 2021 zhumingke. All rights reserved.
//

#import "TCLViewController.h"
#import <Masonry/Masonry.h>
#import "TCLADListVC.h"

@interface TCLViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , copy) NSArray *datas;

@end

@implementation TCLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

- (void)setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    
    cell.textLabel.text = self.datas[indexPath.item];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TCLADListVC *vc = [[TCLADListVC alloc] init];
    if (indexPath.row == 0) {
        vc.adtype = ADTypeBanner;
    } else if (indexPath.row == 1) {
        vc.adtype = ADTypeReward;
    } else if (indexPath.row == 2) {
        vc.adtype = ADTypeLoader;
    } else if (indexPath.row == 3) {
        vc.adtype = ADTypeInterstitial;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSArray *)datas {
    if (!_datas) {
        _datas = [NSArray arrayWithObjects:@"横幅广告-GADBannerView",@"激励广告-GADRewardedAd",@"原生广告—GADAdLoader",@"插页广告-GADInterstitial", nil];
    }
    return _datas;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
