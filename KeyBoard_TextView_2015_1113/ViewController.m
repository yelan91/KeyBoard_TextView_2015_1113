//
//  ViewController.m
//  KeyBoard_TextView_2015_1113
//
//  Created by MBAChina-IOS on 15/11/18.
//  Copyright © 2015年 Gwh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UITextField *textView;
@property(nonatomic, strong)UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView=[[UITextView alloc]init];
    self.textView.frame = CGRectMake(0, self.view.frame.size.height-500, self.view.frame.size.width, 200);
    self.textView.text=@"请输入文字";
    self.textView.backgroundColor = [UIColor grayColor];
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    self.btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.textView];
}
- (void)viewWillAppear:(BOOL)animated
{
    //注册通知,监听键盘出现
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(handleKeyboardDidShow:)
                                                name:UIKeyboardDidShowNotification
                                              object:nil];
    //注册通知，监听键盘消失事件
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(handleKeyboardDidHidden)
                                                name:UIKeyboardDidHideNotification
                                              object:nil];
    [super viewWillAppear:YES];
}

//监听事件
- (void)handleKeyboardDidShow:(NSNotification*)paramNotification
{
    //获取键盘高度
    NSValue *keyboardRectAsObject=[[paramNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    [keyboardRectAsObject getValue:&keyboardRect];
    self.view.frame = CGRectMake(0,-20, self.view.frame.size.width, self.view.frame.size.height);
    //self.textView.frame = CGRectMake(0, self.view.frame.size.height-500-keyboardRect.size.height, self.view.frame.size.width, 200);
    //self.textView.frame = UIEdgeInsetsMake(0, 0,keyboardRect.size.height, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)handleKeyboardDidHidden
{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    //self.textView.frame = CGRectMake(0, self.view.frame.size.height-500, self.view.frame.size.width, 200);
    //self.textView.contentInset=UIEdgeInsetsZero;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

