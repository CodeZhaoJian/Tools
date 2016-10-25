//
//  WHISPERSTools.m
//  Tools
//
//  Created by WHISPERS on 2016/10/25.
//  Copyright © 2016年 WHISPERS. All rights reserved.
//

#import "WHISPERSTools.h"

@implementation WHISPERSTools

/*
 
 判断是否是中文用户名
 
 */

+ (BOOL)validateNickname:(NSString *)nickname{
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [passWordPredicate evaluateWithObject:nickname];
}


/*
 
 判断是否已成年
 
 */

+ (BOOL)isManhoodWithCertID:(NSString *)certID{
   
    NSRange range = NSMakeRange(6, 8);
    certID = [certID substringWithRange:range];
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"yyyyMMdd";
    
    //出生日期
    NSDate *burnDate = [dateF dateFromString:certID];
    
    //当前日期
    NSDate *dateNow = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:burnDate
                                                 toDate:dateNow
                                                options:0];
    if (components.year >= 18) {
        return YES;
    } else {
        return NO;
    }
}



/*
 
 判断是否为正整数
 
 */

+ (BOOL)isPositiveInteger:(NSString *)number{
   
    NSString *Regex = @"^[1-9]\\d*$";
    
    NSPredicate *PositiveIntegerPridi = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    
    return [PositiveIntegerPridi evaluateWithObject:number];
}

/*
 
 转换日期时间字符串格式
 
 */

+ (NSString *)convertToDateWith:(NSString *)dateString separateStr:(NSString *)separateStr{
    
    if (dateString.length > 8) {
        NSString *year = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString *month = [dateString substringWithRange:NSMakeRange(year.length, 2)];
        NSString *day = [dateString substringWithRange:NSMakeRange(year.length + month.length, 2)];
        NSString *hour = [dateString substringWithRange:NSMakeRange(year.length + month.length + day.length, 2)];
        NSString *minute = [dateString substringWithRange:NSMakeRange(year.length + month.length + day.length + hour.length, 2)];
        NSString *second = [dateString substringWithRange:NSMakeRange(year.length + month.length + day.length + hour.length + minute.length, 2)];
        return [NSString stringWithFormat:@"%@%@%@%@%@ %@:%@:%@", year, separateStr, month, separateStr, day, hour, minute, second];
    } else {
        if (dateString.length == 8) {
            NSString *year = [dateString substringWithRange:NSMakeRange(0, 4)];
            NSString *month = [dateString substringWithRange:NSMakeRange(year.length, 2)];
            NSString *day = [dateString substringWithRange:NSMakeRange(year.length + month.length, 2)];
            return [NSString stringWithFormat:@"%@%@%@%@%@", year, separateStr, month, separateStr, day];
        } else if (dateString.length == 6){
            NSString *hour = [dateString substringWithRange:NSMakeRange(0, 2)];
            NSString *minute = [dateString substringWithRange:NSMakeRange(hour.length, 2)];
            NSString *second = [dateString substringWithRange:NSMakeRange(hour.length + minute.length, 2)];
            return [NSString stringWithFormat:@"%@:%@:%@", hour, minute, second];
        } else {
            return dateString;
        }
    }
}

/*
 
 检测是否联网
 
 */

+(BOOL)CheckNetIsConnection{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    //    [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
    }
    
    if (!isExistenceNetwork) {
        NSLog(@"请检测网络");
        return NO;
    }
    
    return isExistenceNetwork;
}

/*
 
 获取当前日期
 
 */

+(NSString *)GetDataNow{
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *nowStr = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:currentDate]];
    
    return nowStr;
}


/*
 
 16进制颜色
 
 */


+(UIColor *)DefineColorString: (NSString *) stringToConvert{
    if ([stringToConvert length] <6){
        
        NSLog(@"长度不合法");
        return [UIColor blackColor];
    }
    NSString *tempString=[stringToConvert lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:1.0f];
}

/*
 
 使用颜色创建图片
 
 */

+ (UIImage *)createImageWithColor: (UIColor *)color{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    NSLog(@"34567890-0987");
}


@end
