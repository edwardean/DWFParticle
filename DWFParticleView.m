//
//  DWFParticleView.m
//  DrwWithFire
//
//  Created by Edward on 13-6-9.
//  Copyright (c) 2013年 Lihang. All rights reserved.
//

#import "DWFParticleView.h"
#import <QuartzCore/QuartzCore.h>
@implementation DWFParticleView {
    CAEmitterLayer *fireEmitter; // 1
}

- (void)awakeFromNib {
    NSLog(@"%s",__func__);
    // set ref to the layer
    fireEmitter = (CAEmitterLayer *)self.layer; //2
    
    //configure the emitter layer
    fireEmitter.emitterPosition = CGPointMake(50, 50);
    fireEmitter.emitterSize = CGSizeMake(10, 10);
    
    
    //This is the single line of code which turns our rusty smoke into a boiling ball of fire.
    //if there are overlapping particle parts – their color intensity increases!
    fireEmitter.renderMode = kCAEmitterLayerAdditive;
    
    //add a CAEmitterCell to the CAEmitterLayer
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    
    fire.birthRate = 0;//The number of emitted objects created every second.For a good fire or waterfall you need at least few hundred particles, so we set this to 200.
    
    fire.lifetime = 3.0;//The number of seconds before a particle should disappear. We set this to 3.0.
    
    fire.lifetimeRange = 0.5;//You can use this to vary the lifetime of particles a bit. The system will give each individual a random lifetime in the range (lifetime – lifetimeRange, lifetime + lifetimeRange). So in our case, a particle will live from 2.5-3.5 seconds.
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];//The color of each emitted object. Animatable.
    
    fire.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage];//An object that provides the contents of the layer. Animatable.
    
    //Add more dynamic effect
    fire.velocity = 10;//The particles’s velocity in points per second. This will make our cell emit particles and send them towards the right edge of the screen
    
    fire.velocityRange = 20;//This is the range by which the velocity should vary, similar to lifetimeRange.
    
    fire.emissionRange = M_PI_2;//This is the angle range (in radians) in which the cell will emit. M_PI_2 is 45 degrees (and since this is the a range, it will be +/- 45 degrees).
    
    [fire setName:@"fire"];//Set the name of the cell
    
    fire.scaleSpeed = 0.3;//The rate of change per second at which the particle changes its scale. We set this to 0.3 to make the particles grow over time.
    
    fire.speed = 0.5;//Sets the rotation speed of each particle. We set this to 0.5 to give the particles a nice spin.
    
    //add the cell to the layer and we're done
    fireEmitter.emitterCells = [NSArray arrayWithObject:fire];
}

- (void)setIsEmitting:(BOOL)isEmitting {
    //turn on/off the emitting of particles
    [fireEmitter setValue:[NSNumber numberWithInt:isEmitting?200:0] forKeyPath:@"emitterCells.fire.birthRate"];
}
//The UIView method which tells UIKit which class to use for the CALayer of the view
+ (Class)layerClass { //3
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setEmitterPositionFromTouch:(UITouch *)t {
    //change the emitter's position
    fireEmitter.emitterPosition = [t locationInView:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
