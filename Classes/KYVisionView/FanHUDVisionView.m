//
//  FanHUDVisionView.m
//  FanProgressHUD
//
//  Created by 向阳凡 on 2017/9/28.
//  Copyright © 2017年 向阳凡. All rights reserved.
//

#import "FanHUDVisionView.h"

@implementation FanHUDVisionView
#pragma mark - 创建UI
-(void)fan_configUI{
   
    
    NSString *bgImagName=@"fan_bg_txt";
    
    switch (self.progressHUDStyle) {
        case FanProgressHUDStyleText:
        {
            self.contentHeight=64;//(kFanScreenWidth_Show*0.8*128)/508;
            self.contentWidth=254;//kFanScreenWidth_Show*0.8;
            self.isTouchRemove=NO;
        }
            break;
        case FanProgressHUDStyleLoding:
        {
            self.contentHeight=64;
            self.contentWidth=94;
            self.isTouchRemove=NO;
            bgImagName=@"fan_bg_loding";
        }
            break;
        case FanShowViewStyleLodingText:
        {
            self.contentHeight=64;
            self.contentWidth=94;
            self.isTouchRemove=NO;
            bgImagName=@"fan_bg_loding";
        }
            break;
        case FanProgressHUDStyleAlert:
        {
            self.contentHeight=228;
            self.contentWidth=382;
            self.isTouchRemove=NO;
            bgImagName=@"fan_bg_alert";
        }
            break;
        default:
            break;
    }
    
    CGFloat leftSpace=(self.frame.size.width-self.contentWidth)/2.0;
    CGFloat topSpace=( self.frame.size.height-self.contentHeight)/2.0;
    
    
    self.fan_cententView=[[UIView alloc]initWithFrame:CGRectMake(leftSpace, topSpace, self.contentWidth, self.contentHeight)];
    
    [self addSubview:self.fan_cententView];
    self.fan_cententView.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    
    self.fan_cententView.clipsToBounds=YES;
    
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentWidth, self.contentHeight)];
    backgroundImageView.image=[UIImage imageNamed:bgImagName];
    [self.fan_cententView addSubview:backgroundImageView];
    
    switch (self.progressHUDStyle) {
        case FanProgressHUDStyleText:
        {
            [self fan_createTextUI];
        }
            break;
        case FanProgressHUDStyleLoding:
        {
            [self fan_createLodingUI];
        }
            break;
        case FanShowViewStyleLodingText:
        {
            [self fan_createLodingUI];
        }
            break;
        case FanProgressHUDStyleAlert:
        {
            [self fan_createAlertUI];
        }
            break;
        default:
            break;
    }

}

-(void)fan_createAlertUI{
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, self.contentWidth-40, 20)];
    titleLabel.text=@"please connect Vision's WiFi in 'SETTING->WiFi' first";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont systemFontOfSize:14];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.fan_cententView addSubview:titleLabel];
    
    UIColor *themeColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:232/255.0 alpha:1];

    UILabel *subLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 142+10, self.contentWidth-40, 20)];
    subLabel.text=@"1.choose WiFi named CellRobot_Vision  2.enter the password Vision";
    subLabel.textColor=themeColor;
    subLabel.font=[UIFont systemFontOfSize:14];
    subLabel.textAlignment=NSTextAlignmentCenter;
//    subLabel.numberOfLines=0;
    subLabel.adjustsFontSizeToFitWidth=YES;
    [self.fan_cententView addSubview:subLabel];
    
    
    CGFloat space=(self.contentWidth-136)/3.0f;

    UIImageView *wifiView=[[UIImageView alloc]initWithFrame:CGRectMake(space+34-60, 50+10, 120, 71)];
    wifiView.image=[UIImage imageNamed:@"fan_vision_wifi"];
    
    [self.fan_cententView addSubview:wifiView];
    
    UIImageView *visionView=[[UIImageView alloc]initWithFrame:CGRectMake(self.contentWidth/2.0f+space/2.0f+34-42, 50, 84, 92)];
    visionView.image=[UIImage imageNamed:@"fan_vision_password"];
    
    [self.fan_cententView addSubview:visionView];
    
    for (int i=0; i<self.buttonTitleArray.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(space+i*(68+space), self.contentHeight-40, 68, 24)];

        [btn setBackgroundImage:[UIImage imageNamed:@"fan_vision_btn"] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag=100+i;
        [btn setTitle:self.buttonTitleArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.fan_cententView addSubview:btn];
    }
    
//    if(self.title.length<=0){
//        subLabel.frame=CGRectMake(20, 20, self.contentWidth-40, 80);
//    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
