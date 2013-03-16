//
//  CHTextField.h
//  ChromaHash
//
//  Created by Zachary Davison on 15/03/2013.
//  Copyright (c) 2013 thingsdoer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTextField : UITextField

@property(nonatomic,assign)int barCount;
@property(nonatomic,assign)float barWidth;
@property(nonatomic,strong)NSString *salt;
@property(nonatomic,strong)UIBezierPath *maskPath;

@end
