//
//  CHTextField.m
//  ChromaHash
//
//  Created by Zachary Davison on 15/03/2013.
//  Copyright (c) 2013 thingsdoer. All rights reserved.
//

#import "CHTextField.h"
#import <QuartzCore/QuartzCore.h>
#import <CommonCrypto/CommonDigest.h>

@interface CHTextField()
@property(nonatomic,strong)UIView *chromaView;
@property(nonatomic,strong)NSMutableArray *chromaLayers;
@end

@implementation CHTextField

#pragma mark - Lifecycle

-(void)setup{
    self.barCount = 3;
    self.barWidth = 10;
    self.salt = @"twitter: @thingsdoer";
    [self addTarget:self action:@selector(updateColors:) forControlEvents:UIControlEventAllEditingEvents];
}

-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

-(void)awakeFromNib{
    [self setup];
}

#pragma mark - Get/Set
-(void)setBarCount:(int)barCount{
    NSAssert(barCount > 1 && barCount <= 4, @"numberOfBars must be between 1 and 4");
    _barCount = barCount;
    self.chromaView = nil;
}

-(void)setBarWidth:(float)barWidth{
    _barWidth = barWidth;
    self.chromaView = nil;
}

-(void)setChromaView:(UIView *)chromaView{
    _chromaView = chromaView;
    [self setNeedsLayout];
    [self updateColors:self];
}

-(void)setSalt:(NSString *)salt{
    _salt = salt;
    [self updateColors:self];
}

#pragma mark - Overrides
-(void)layoutSubviews{
    [super layoutSubviews];
    if(!self.chromaView){
        self.chromaView = [[UIView alloc] initWithFrame:CGRectMake((self.bounds.size.width - self.chromaWidth),
                                                                   0,
                                                                   self.chromaWidth,
                                                                   self.bounds.size.width)];
        [self addSubview:self.chromaView];
        self.chromaLayers = [NSMutableArray array];
        for(int i=0;i<self.barCount;i++){
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(i * self.barWidth,
                                     0,
                                     self.barWidth,
                                     self.chromaView.bounds.size.height);
            [self.chromaView.layer addSublayer:layer];
            [self.chromaLayers addObject:layer];
        }
    }
}

#pragma mark -
-(void)updateColors:(id)sender{
    if(self.text.length > 0){
        NSString *md5 = md5_string([self.text stringByAppendingString:self.salt]);
        for(int i=0;i<self.barCount;i++){
            NSString *colorHex = [md5 substringWithRange:NSMakeRange(i * 6, 6)];
            const char *cStr = [colorHex cStringUsingEncoding:NSASCIIStringEncoding];
            long hex = strtol(cStr+1, NULL, 16);
            CALayer *layer = self.chromaLayers[i];
            layer.backgroundColor = colorWithHex(hex).CGColor;
        }
    }
}

-(float)chromaWidth{
    return self.barWidth * self.barCount;
}

#pragma mark - Drawing
//-(void)drawRect:(CGRect)rect{
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    for(int i=0;i<self.barCount;i++){
//        CGRect bar = CGRectMake((rect.size.width - self.chromaWidth) + (i * self.barWidth),
//                                0,
//                                self.barWidth,
//                                rect.size.width);
//        UIColor *color = (self.colors.count >= i+1) ? self.colors[i] : [UIColor clearColor];
//        [color set];
//        CGContextFillRect(c, bar);
//    }
//}

#pragma mark - Helpers
NS_RETURNS_NOT_RETAINED NSString* md5_string(NSString *string){
    const char *ptr = [string UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

NS_RETURNS_NOT_RETAINED UIColor* colorWithHex(long hex){
    unsigned char r, g, b;
    b = hex & 0xFF;
    g = (hex >> 8) & 0xFF;
    r = (hex >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

@end
