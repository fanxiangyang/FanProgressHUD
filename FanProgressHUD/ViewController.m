//
//  ViewController.m
//  FanProgressHUD
//
//  Created by 向阳凡 on 2017/9/26.
//  Copyright © 2017年 向阳凡. All rights reserved.
//

#import "ViewController.h"
#import "FanProgressHUD.h"
#import "FanHUDVisionView.h"
#import "FanHUDAlertView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *testView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor colorWithRed:142/255.0f green:136/255.0f blue:68/255.0f alpha:1];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray=@[@[@"显示文字提示",@"显示加载等待",@"显示加载和文字",@"两个按钮的",@"一个按钮弹窗",@"带icon的弹窗"],@[@"修改界面风格",@"横屏自定义"]];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    

}

#pragma  mark -  tableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray *)(_dataArray[section]) count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=_dataArray[indexPath.section][indexPath.row];
    cell.detailTextLabel.text=_dataArray[indexPath.section][indexPath.row];

    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"默认风格";
    }else{
        return @"自定义";
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showHUD:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)showHUD:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                FanProgressHUD *hud = [FanProgressHUD fan_showHUDWithStatus:@"我这里显示几个文字！\n主要测试文字长度超过两行的显示效果！"];
//                hud.blackAlpha=0;
            }
                break;
            case 1:
            {
                [FanProgressHUD fan_showProgressHUD];
//                [FanProgressHUD fan_showProgressHUDToView:self.view];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [FanProgressHUD fan_hideProgressHUD];
                    [FanProgressHUD fan_hideAllProgressHUD];
                });
            }
                break;
            case 2:
            {
                [FanProgressHUD fan_showProgressHUD:@"连接中..."];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [FanProgressHUD fan_hideProgressHUD];
                });
            }
                break;
            case 3:
            {
                [FanProgressHUD fan_showAlertHUDTitle:@"温馨提示" subTitle:@"你今天看天气预报了吗？" buttonTitles:@[@"没有看",@"看了"] alertBlock:^(NSInteger index) {
                    
                }];
            }
                break;
            case 4:
            {
               FanProgressHUD *hud = [FanProgressHUD fan_showAlertHUDTitle:@"温馨提示" subTitle:@"你今天看天气预报了吗？" buttonTitles:@[@"不知道"] alertBlock:^(NSInteger index) {
                    
                }];
                [hud fan_setTitleColor:[UIColor redColor]];
            }
                break;
            case 5:{
                [FanProgressHUD fan_showIconAlertHUDTitle:@"你的Heart没有绑定任何模块！" imageName:@"heart-yilian" buttonTitles:@[@"绑定",@"取消"] alertBlock:^(NSInteger index) {
                    
                }];
            }
                break;
            default:
                break;
        }
    }else{
        if(indexPath.row==0){
            FanHUDAlertView *hud=[FanHUDAlertView fan_showAlertHUDTitle:@"温馨提示" subTitle:@"我们都是好孩子，天天好好上班的好孩子" buttonTitles:@[@"取消",@"确认"] alertBlock:^(NSInteger index) {
                switch (index) {
                    case 0:
                    {

                    }
                        break;
                    case 1:
                    {

                    }
                        break;
                    default:
                        break;
                }
            }];
            [hud fan_setTitleColor:[UIColor redColor] subTitleColor:[UIColor grayColor]];
            
        }else if(indexPath.row==1){
            [FanHUDVisionView fan_showAlertHUDTitle:nil subTitle:@"" buttonTitles:@[@"已经设置",@"去设置"] alertBlock:^(NSInteger index) {
                switch (index) {
                    case 0:
                    {
                        
                    }
                        break;
                    case 1:
                    {
                        if([[UIApplication sharedApplication]respondsToSelector:@selector(openURL:options:completionHandler:)]){
                            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"App-Prefs:root=WIFI"] options:@{} completionHandler:^(BOOL success) {
                                
                            }];
                        }else{
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
                            
                        }
                        
                    }
                        break;
                    default:
                        break;
                }
            }];
        }
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
