//
//  ViewController.m
//  language
//
//  Created by dd luo on 2019/11/12.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "ViewController.h"
#import "ChangeViewController.h"
#import "CJLocalizable.h"
#import "languageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadChileView];


    // Do any additional setup after loading the view.
}

-(void)loadChileView{
    LOCALIZATION(@"setting");
    
    UIButton * pushButton = [UIButton buttonWithType:0];
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton setTitle: LOCALIZATION(@"setting") forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushButtonCLick) forControlEvents:UIControlEventTouchUpInside];

    pushButton.frame = CGRectMake(0, 100, 180, 80);
    [self.view addSubview:pushButton];
    
    
    
    
    UILabel * label = [[UILabel alloc]init];
    label.text =  LOCALIZATION(@"iloveyou");
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(0, 200, 180, 80);

    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    UIImageView * image = [[UIImageView alloc]init];
    image.frame = CGRectMake(0, 300, 200, 200);
    image.image = [UIImage imageNamed:LOCALIZATION(@"icon")];
    [self.view addSubview:image];
    

    languageView * lanView = [[[NSBundle mainBundle]loadNibNamed:@"languageView" owner:self options:nil] firstObject];
      lanView.frame = CGRectMake(250, 100, 100, 100);

      [self.view addSubview:lanView];
}

-(void)pushButtonCLick{
    
    
    
    __weak typeof(self)weakself = self;
    ChangeViewController * changeVC = [[ChangeViewController alloc]init];

    changeVC.updateViews = ^{
        [[weakself.view subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];

        [weakself loadChileView];
    };
    [self.navigationController pushViewController:changeVC animated:YES];
}


@end
