//
//  Model.h
//  Counter
//
//  Created by young_jerry on 2020/10/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property (nonatomic, strong) NSMutableArray *numArray;
@property (nonatomic, strong) NSMutableArray *symbolArray;
@property (nonatomic, strong) NSString *test;
@property (nonatomic, strong) NSNumber *result;
-(int)count:(char *)a;
@end

NS_ASSUME_NONNULL_END
