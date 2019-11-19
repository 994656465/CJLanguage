//
//  CJLocalizable.m
//  language
//
//  Created by dd luo on 2019/11/12.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "CJLocalizable.h"
#import "AppDelegate.h"
#import "ViewController.h"

#define LanguageDefaultKey @"LanguageDefaultKey"


@interface CJLocalizable ()
@property(nonatomic,copy)NSString * currentLanguage;
@property(nonatomic,strong) NSDictionary * currentLanguageDict;

@end


@implementation CJLocalizable


+ (instancetype)shareLocalizable{
    static CJLocalizable * _localizable = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _localizable = [[CJLocalizable alloc]init];
    });
    return _localizable;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
            // 本地默认的现在使用的语言
        NSArray * languageS = [NSLocale preferredLanguages];
        NSString * currentLanguage = languageS.firstObject;
        
        // 本地保存的现在使用的语言
        NSString * localLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageDefaultKey];
        if (localLanguage) {
    
            if ([localLanguage isEqualToString: @"zh-Hans"]) {
                self.nowCurrentLanguageType = KChiese;
            }else if([localLanguage isEqualToString: @"ja"]){
                self.nowCurrentLanguageType = KJapanese;
            }
            
            
            [self loadDictForNewLanguage:localLanguage];
        }else{
            [self loadDictForNewLanguage:currentLanguage];

        }
    }
    return self;
}


-(void)loadDictForNewLanguage:(NSString *)newLanguage{
    
    
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@" mainLocailzable" ofType:@"strings" inDirectory:nil forLocalization:newLanguage];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        self.currentLanguage = newLanguage;
        self.currentLanguageDict = [NSDictionary dictionaryWithContentsOfFile:path];
        
    }
}


//  取值
-(NSString *)localStringForKey:(NSString *)key
{
    if (self.currentLanguageDict == nil) {
        return NSLocalizedString(key, key);
    }else{
        NSString * localString = self.currentLanguageDict[key];
        if (localString) {
            return localString;
        }else{
            return key;
        }
    }
}

//  重置当前的语言



-(void)setNewLanguage:(languageType)languageType{
    if (self.nowCurrentLanguageType == languageType) {
        return;
    }
    
    if (languageType == KChiese) {
        self.currentLanguage = @"zh-Hans";
    }else if(languageType == KJapanese){
        self.currentLanguage = @"ja";
    }
    self.nowCurrentLanguageType = languageType;
    [self loadDictForNewLanguage:self.currentLanguage];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.currentLanguage forKey:LanguageDefaultKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSString *)getImageNameWithString:(NSString *)name{
    
    if (self.nowCurrentLanguageType == KChiese) {
        return [NSString stringWithFormat:@"%@_zh",name];
    }else if(self.nowCurrentLanguageType == KJapanese){
        return [NSString stringWithFormat:@"%@_ja",name];
    }
    return @"";
    
}


@end
