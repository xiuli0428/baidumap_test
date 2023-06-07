//
//  SignInViewController.m
//  swiftBaseDev
//
//  Created by jerei on 2021/1/13.
//  Copyright © 2021 jerei. All rights reserved.
//

#import "SignInViewController.h"
#import "WMZDialog.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    WMZDialog *alert =
    Dialog()
    .wTypeSet(DialogTypeCalander);
    
    
    alert.wHideCalanderBtnSet(NO);
    alert
    .wTitleSet(@"日历")
    //确定的点击方法
    .wEventOKFinishSet(^(id anyID, id otherData) {
        NSLog(@"%@ %@",anyID,otherData);
    })
    //开启滚动 default YES
    .wCalanderCanScrollSet(YES)
    //标题颜色
    .wMessageColorSet(DialogColor(0xdd7313))
    //改变主题色
    .wOKColorSet(DialogColor(0xdd7313))
    .wListDefaultValueSet(@[
        [NSDate dateWithTimeIntervalSinceNow:-3*24*60*60],
        [NSDate date],
        [NSDate dateWithTimeIntervalSinceNow:24*60*60],
        [NSDate dateWithTimeIntervalSinceNow:3*24*60*60],
        ])
    .wStart();
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
