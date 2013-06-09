//
//  DWFParticleView.h
//  DrwWithFire
//
//  Created by Edward on 13-6-9.
//  Copyright (c) 2013年 Lihang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWFParticleView : UIView

- (void)setEmitterPositionFromTouch:(UITouch *)t;
- (void)setIsEmitting:(BOOL)isEmitting;
@end
