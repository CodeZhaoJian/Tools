# Tools
iOS 使用工具类
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

持续更新中， QQ:961826736
