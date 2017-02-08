//
//  YWUtil.h
//  PopStudy
//
//  Created by tao on 16/8/5.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWUtil : NSObject
+ (UIColor *) colorWithHexString: (NSString *)color;
+ (float)countWidthOfString:(NSString *)string WithHeight:(float)height Font:(UIFont *)font;
@end
