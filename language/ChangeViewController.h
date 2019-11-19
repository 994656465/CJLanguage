//
//  ChangeViewController.h
//  language
//
//  Created by dd luo on 2019/11/12.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangeViewController : UIViewController
@property (nonatomic, copy) void(^updateViews)();
@end

NS_ASSUME_NONNULL_END
