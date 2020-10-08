//
//  View.h
//  Counter
//
//  Created by young_jerry on 2020/10/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ViewDelegate <NSObject>
-(void)click:(UIButton *)button;
@end

@interface View : UIView

@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)UIButton *zeroButton;
@property (nonatomic,strong)UIButton *oneButton;
@property (nonatomic,strong)UIButton *pointButton;
@property (nonatomic,strong)UIButton *resultButton;

@property id<ViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
