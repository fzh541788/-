//
//  View.m
//  Counter
//
//  Created by young_jerry on 2020/10/4.
//

#import "View.h"
#import "Masonry.h"

@implementation View

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor blackColor];
    
    _textView = [[UITextView alloc] init];
    _textView.backgroundColor = [UIColor blackColor];
    [self addSubview:_textView];
    _textView.textColor = [UIColor whiteColor];
    _textView.font = [UIFont systemFontOfSize:50];
    _textView.textAlignment = NSTextAlignmentRight;
//    _showTextView.editable = NO;
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@0);
        make.width.equalTo(@(self.frame.size.width));
        make.height.equalTo(@(self.frame.size.height / 3));
    }];
    
    int i,j;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            _oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_oneButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_oneButton];
                _oneButton.layer.cornerRadius = 45;
                _oneButton.layer.borderWidth = 1;
                [_oneButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
                _oneButton.titleLabel.font = [UIFont systemFontOfSize:45];
                [_oneButton mas_makeConstraints:^(MASConstraintMaker *make){
                        make.top.equalTo(@(self.frame.size.height/3 + 100 * i + 80));
                        make.left.equalTo(@(10+(j*100)));
                        make.height.equalTo(@90);
                    make.width.equalTo(@90);
                }];
            if(i == 0 && j != 3){
                _oneButton.backgroundColor = [UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1];
                if(j == 0){
                    [_oneButton setTitle:@"AC" forState:UIControlStateNormal];
                    _oneButton.tag = 18;
                }
                if(j == 1){
                    [_oneButton setTitle:@"(" forState:UIControlStateNormal];
                    _oneButton.tag = 16;
                }
                if(j == 2){
                    [_oneButton setTitle:@")" forState:UIControlStateNormal];
                    _oneButton.tag = 17;
                }
            }
            if(j == 3){
                _oneButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.565 blue:0.243 alpha:1];
                if(i == 0){
                    [_oneButton setTitle:@"÷" forState:UIControlStateNormal];
                    _oneButton.tag = 15;
                }
                if(i == 1){
                    [_oneButton setTitle:@"×" forState:UIControlStateNormal];
                    _oneButton.tag = 14;
                }
                if(i == 2){
                    [_oneButton setTitle:@"-" forState:UIControlStateNormal];
                    _oneButton.tag = 13;
                }
                if(i == 3){
                    [_oneButton setTitle:@"+" forState:UIControlStateNormal];
                    _oneButton.tag = 12;
                }
            }
            if(i != 0 && j != 3){
                _oneButton.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
                if(i == 1 && j == 0){
                    [_oneButton setTitle:@"7" forState:UIControlStateNormal];
                    _oneButton.tag = 7;
                }
                if(i == 1 && j == 1){
                    [_oneButton setTitle:@"8" forState:UIControlStateNormal];
                    _oneButton.tag = 8;
                }
                if(i == 1 && j == 2){
                    [_oneButton setTitle:@"9" forState:UIControlStateNormal];
                    _oneButton.tag = 9;
                }
                if(i == 2 && j == 0){
                    [_oneButton setTitle:@"4" forState:UIControlStateNormal];
                    _oneButton.tag = 4;
                }
                if(i == 2 && j == 1){
                    [_oneButton setTitle:@"5" forState:UIControlStateNormal];
                    _oneButton.tag = 5;
                }
                if(i == 2 && j == 2){
                    [_oneButton setTitle:@"6" forState:UIControlStateNormal];
                    _oneButton.tag = 6;
                }
                if(i == 3 && j == 0){
                    [_oneButton setTitle:@"1" forState:UIControlStateNormal];
                    _oneButton.tag = 1;
                }
                if(i == 3 && j == 1){
                    [_oneButton setTitle:@"2" forState:UIControlStateNormal];
                    _oneButton.tag = 2;
                }
                if(i == 3 && j == 2){
                    [_oneButton setTitle:@"3" forState:UIControlStateNormal];
                    _oneButton.tag = 3;
                }
            }
        }
    }
    _zeroButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_zeroButton];
    _zeroButton.layer.cornerRadius = 45;
    _zeroButton.layer.borderWidth = 1;
    _zeroButton.tag = 0;
    [_zeroButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_zeroButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _zeroButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
    _zeroButton.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    [_zeroButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@10);
            make.height.equalTo(@90);
            make.width.equalTo(@180);
    }];
    
    _pointButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_pointButton];
    _pointButton.layer.cornerRadius = 45;
    _pointButton.layer.borderWidth = 1;
    [_pointButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    _pointButton.tag = 10;
    [_pointButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _pointButton.titleLabel.font = [UIFont systemFontOfSize:45];
    _pointButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_pointButton setTitle:@"·" forState:UIControlStateNormal];
    _pointButton.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    [_pointButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@210);
            make.height.equalTo(@90);
        make.width.equalTo(@90);
    }];

    _resultButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_resultButton];
    _resultButton.layer.cornerRadius = 45;
    _resultButton.layer.borderWidth = 1;
    _resultButton.tag = 11;
    [_resultButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_resultButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _resultButton.titleLabel.font = [UIFont systemFontOfSize:45];
    _resultButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_resultButton setTitle:@"=" forState:UIControlStateNormal];
    _resultButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.565 blue:0.243 alpha:1];
    [_resultButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@310);
            make.height.equalTo(@90);
        make.width.equalTo(@90);
    }];

    return self;
    
}
-(void)press{
    NSLog(@"111");
}
-(void)click:(UIButton *)button{
    [_delegate click:button];
}
@end
