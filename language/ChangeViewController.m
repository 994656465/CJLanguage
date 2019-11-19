//
//  ChangeViewController.m
//  language
//
//  Created by dd luo on 2019/11/12.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "ChangeViewController.h"
#import "CJLocalizable.h"
@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * chineseButton = [UIButton buttonWithType:0];
    [chineseButton setTitle:@"中文" forState:UIControlStateNormal];
    [chineseButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    chineseButton.backgroundColor = [UIColor grayColor];
    chineseButton.frame = CGRectMake(0, 100, 180, 80);
    [chineseButton addTarget:self action:@selector(chineseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chineseButton];
    
    UIButton * englishiButton = [UIButton buttonWithType:0];
    [englishiButton setTitle:@"日本語" forState:UIControlStateNormal];
    [englishiButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    englishiButton.backgroundColor = [UIColor yellowColor];
    englishiButton.frame = CGRectMake(0, 200, 180, 80);
    [englishiButton addTarget:self action:@selector(japaneseButtonCLICK) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:englishiButton];
    // Do any additional setup after loading the view.
}

-(void)chineseButtonClick{
    [[CJLocalizable shareLocalizable] setNewLanguage:KChiese];

//    NSLog(@"----%@----",self.updateViews);

    if (self.updateViews) {
        self.updateViews();
    }
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)japaneseButtonCLICK{
    [[CJLocalizable shareLocalizable] setNewLanguage:KJapanese];

        if (self.updateViews) {
              self.updateViews();
          }
    [self.navigationController popViewControllerAnimated:YES];

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
