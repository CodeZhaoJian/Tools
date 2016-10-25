//
//  WHISPERSTools.h
//  Tools
//
//  Created by WHISPERS on 2016/10/25.
//  Copyright © 2016年 WHISPERS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"        //检测网络请求


@interface WHISPERSTools : NSObject


/*
 判断是否是中文用户名
 */

+ (BOOL)validateNickname:(NSString *)nickname;

/*
 判断是否已成年
 */

+ (BOOL)isManhoodWithCertID:(NSString *)certID;

/*
 判断是否为正整数
 */

+ (BOOL)isPositiveInteger:(NSString *)number;

/*
 转换日期时间字符串格式
 */

+ (NSString *)convertToDateWith:(NSString *)dateString separateStr:(NSString *)separateStr;

/*
 检测是否联网
 */

+(BOOL)CheckNetIsConnection;

/*
 获取当前日期
 */
+(NSString *)GetDataNow;

/*
 16进制颜色
 */

+(UIColor *)DefineColorString: (NSString *) stringToConvert;


/*
 使用颜色创建图片
 */
+ (UIImage *)createImageWithColor: (UIColor *)color;



@end
