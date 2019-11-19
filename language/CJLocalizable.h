//
//  CJLocalizable.h
//  language
//
//  Created by dd luo on 2019/11/12.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define LOCALIZATION(text) [[CJLocalizable shareLocalizable] localStringForKey:(text)]

#define LOCALIMAGE(imageName) [[CJLocalizable shareLocalizable] getImageNameWithString:(imageName)]

typedef NS_ENUM(NSInteger,languageType) {
    KChiese,
    KJapanese
};



@interface CJLocalizable : NSObject
@property (nonatomic, assign) languageType  nowCurrentLanguageType;

+(instancetype)shareLocalizable;
//  取值
-(NSString * )localStringForKey:(NSString *)key;

//  重置当前的语言
-(void)setNewLanguage:(languageType)languageType;

// 获取图片名称
-(NSString *)getImageNameWithString:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
