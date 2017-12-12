# FanProgress

### 主要是自己动手实现一个简单的加载等待框及系统弹窗，可以修改可以继承自定义需要的界面。


###  功能介绍

##### 1.主要调用方法 
```
[FanProgressHUD fan_showHUDWithStatus:@"我这里显示几个文字！\n主要测试文字长度超过两行的显示效果！"];
//加载等待
[FanProgressHUD fan_showProgressHUD];
[FanProgressHUD fan_showProgressHUDToView:self.view];
//隐藏弹窗
[FanProgressHUD fan_hideProgressHUD];
[FanProgressHUD fan_hideAllProgressHUD];
//带确认按钮的弹窗
[FanProgressHUD fan_showAlertHUDTitle:@"温馨提示" subTitle:@"你今天看天气预报了吗？" buttonTitles:@[@"没有看",@"看了"] alertBlock:^(NSInteger index) {
                    
}];

```
##### 2.具体类头文件
```
#pragma mark -  显示和隐藏的类方法
/**
 弹出提示对话框
 
 @param textStr 提示文本
 @return self
 */
+ (instancetype _Nullable )fan_showHUDWithStatus:(NSString*_Nullable)textStr;
+ (instancetype _Nullable )fan_showHUDWithStatus:(NSString *_Nullable)textStr afterDelay:(NSTimeInterval)seconds;

/**
 弹出加载等待框

 @return self
 */
+ (instancetype _Nullable )fan_showProgressHUD;
+ (instancetype _Nullable )fan_showProgressHUDToView:(UIView *_Nullable)view;
+ (instancetype _Nullable )fan_showProgressHUD:(NSString *_Nullable)textStr;
+ (instancetype _Nullable )fan_showProgressHUDToView:(UIView *_Nullable)view title:(NSString * _Nullable)textStr;
+ (instancetype _Nullable )fan_showProgressHUD:(NSString *_Nullable)textStr afterDelay:(NSTimeInterval)seconds;
/**
 隐藏弹窗

 @return YES
 */
+ (BOOL)fan_hideProgressHUD;
+ (BOOL)fan_hideAllProgressHUD;
+ (BOOL)fan_hideProgressHUDForView:(UIView *_Nullable)view;
+ (FanProgressHUD *_Nullable)fan_progressHUDForView:(UIView *_Nullable)view;
+ (BOOL)fan_hideAllProgressHUDForView:(UIView *_Nullable)view;


/**
 弹窗类似系统对话框

 @param textStr 标题
 @param subTitle 文本内容
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype _Nullable )fan_showAlertHUDTitle:(NSString *_Nullable)textStr subTitle:(NSString *_Nonnull)subTitle buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(FanProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )fan_showAlertHUDTitle:(NSString *_Nullable)textStr subTitle:( NSString * _Nonnull )subTitle buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(FanProgressHUDAlertBlock _Nullable)alertBlock;
/**
 弹窗类似系统对话框
 
 @param textStr 标题
 @param imageName 图标名称
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype _Nullable )fan_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(FanProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )fan_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(FanProgressHUDAlertBlock _Nullable)alertBlock;


-(void)fan_removeSelfView:(BOOL)animation;


-(void)fan_setTitleColor:(UIColor *_Nullable)titleColor subTitleColor:(UIColor *_Nullable)subTitleColor;

-(void)fan_setTitleColor:(UIColor *_Nullable)titleColor;

#pragma mark - 子类可以重写
-(void)fan_configUI;//子类重写
-(void)fan_createTextUI;
-(void)fan_createLodingUI;
-(void)fan_createAlertUI;
``` 
##### 3.另外可以自定义，超级简单，可以继承，copy到自己项目，轻轻松松修改完毕

Like(喜欢)
==============
#### 有问题请直接在文章下面留言,喜欢就给个Star(小星星)吧！ 
#### Email:<fqsyfan@gmail.com>
