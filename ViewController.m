//
//  ViewController.m
//  tetrisClone
//
//  Created by Sean McKinley on 2/26/15.
//  Copyright (c) 2015 Sean McKinley. All rights reserved.
//

#import "ViewController.h"
#import "Tetrominoes.h"

@interface ViewController (){
    CGPoint blockInitCenter;
    NSInteger blockWidth;
    NSInteger tagOut;
}
@property(nonatomic) UITapGestureRecognizer *tG;
@property(nonatomic) UIView *blockView;
@property(nonatomic) Tetrominoes *i;
@property(nonatomic)     UICollisionBehavior *cB;
-(void)iClick;
-(void)jClick;
-(void)lClick;
-(void)oClick;
-(void)sClick;
-(void)tClick;
-(void)zClick;
-(void)swiper:(UIPanGestureRecognizer *)gR;
@end

const NSInteger downAnimationInitDuration = 5.0;
const NSInteger sideAnimationDuration = 1.0;
const CGFloat margins = 10.0;
const NSInteger widthInBlocks = 10;
const NSInteger widthInLetters =7;



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = [NSArray arrayWithObjects:@"I",@"J",@"L",@"O",@"S",@"T",@"Z",nil];
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    NSInteger width = blockWidth, height = width;
    UIPanGestureRecognizer *swipe = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swiper:)];
    CGFloat lbw = aF.size.width/widthInLetters;


    for(int i = 0; i < 7; i++)
    {
        UIButton * u = [[UIButton alloc] initWithFrame:CGRectMake(0+lbw*i, aF.size.height-height,width ,height)];
        [u setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        [u setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [u setTag:i];
        switch(u.tag){
            case 0:;
            {
                [u addTarget:self action:@selector(iClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 1:;
            {
                [u addTarget:self action:@selector(jClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 2:;
            {
                [u addTarget:self action:@selector(lClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 3:;
            {
                [u addTarget:self action:@selector(oClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 4:;
            {
                [u addTarget:self action:@selector(sClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 5:;
            {
                [u addTarget:self action:@selector(tClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 6:;
            {
                [u addTarget:self action:@selector(zClick) forControlEvents:UIControlEventTouchUpInside];
                break;
            }
                
        };
        [self.view addSubview:u];
        [self.view addGestureRecognizer:swipe];
        
    }
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)swiper:(UIPanGestureRecognizer *) gR{
    CGPoint  distance = [gR translationInView:self.view];
    CALayer * layer = self.i.layer;
    CFTimeInterval pt = [layer convertTime:(CACurrentMediaTime()) fromLayer:nil];

    layer.speed = 0.0;
    layer.timeOffset = pt;
    
    CGPoint center = self.blockView.center;

    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    NSInteger right_bound = aF.size.width-10;
    NSInteger left_bound = 10;
    NSInteger bottom_bound = aF.size.height;
    NSInteger upper_bound = 0;
    
    if(gR.state == UIGestureRecognizerStateEnded)
    {
        if(distance.x > 0 && distance.x > abs(distance.y) )
        { //right
            if((layer.frame.origin.x + layer.frame.size.width + blockWidth) < right_bound)
            {
                center.x += blockWidth;
                [UIView animateWithDuration:sideAnimationDuration animations:^{
                    self.blockView.center = center;
                }completion:^(BOOL finished){
                    CFTimeInterval pausedTime = [layer timeOffset];
                    layer.speed = 1.0;
                    layer.timeOffset = 0.0;
                    layer.beginTime = 0.0;
                    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
                    layer.beginTime = timeSincePause;
                }];
            }
        }
        else if(distance.x < 0 && abs(distance.x) > abs(distance.y))
        { //left
            if((layer.frame.origin.x - blockWidth) > left_bound)
            {
                center.x -= blockWidth;
                [UIView animateWithDuration:sideAnimationDuration animations:^{
                    self.blockView.center = center;
                }completion:^(BOOL finished){
                    CFTimeInterval pausedTime = [layer timeOffset];
                    layer.speed = 1.0;
                    layer.timeOffset = 0.0;
                    layer.beginTime = 0.0;
                    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
                    layer.beginTime = timeSincePause;
                }];
            }

        }
        else if(distance.y > 0  && abs(distance.y) > abs(distance.x) )
        { //down
            if((layer.frame.origin.y + blockWidth) < bottom_bound)
            {
                center.y += blockWidth;
                [UIView animateWithDuration:sideAnimationDuration animations:^{
                    self.blockView.center = center;
                }completion:^(BOOL finished){
                    CFTimeInterval pausedTime = [layer timeOffset];
                    layer.speed = 1.0;
                    layer.timeOffset = 0.0;
                    layer.beginTime = 0.0;
                    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
                    layer.beginTime = timeSincePause;}
                 ];
            }

        }
        else if(distance.y < 0 && abs(distance.y) > abs(distance.x) )
        { //up
            if((layer.frame.origin.y - blockWidth) > upper_bound)
            {
                center.y -= blockWidth;
                [UIView animateWithDuration:sideAnimationDuration animations:^{
                    self.blockView.center = center;
                }completion:^(BOOL finished){
                    CFTimeInterval pausedTime = [layer timeOffset];
                    layer.speed = 1.0;
                    layer.timeOffset = 0.0;
                    layer.beginTime = 0.0;
                    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
                    layer.beginTime = timeSincePause;
                }];
            }
        }
    }
}
-(void)iClick{
    [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;

    CGRect frame = CGRectMake(margins+width*2, 50,width,4*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:iBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
    
    
}
-(void)jClick{
    [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,2*width,3*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:jBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
    
}
-(void)lClick{
    [self.i removeFromSuperview];
    [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,2*width,3*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:lBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
}
-(void)oClick{
    [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,2*width,2*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:oBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
}

-(void)sClick{
        [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,3*width,2*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:sBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
}
-(void)tClick
{
        [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,3*width,2*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:tBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
}

-(void)zClick{
        [self.i removeFromSuperview];
    NSInteger width = blockWidth, height = width;
    CGRect aF = [[UIScreen mainScreen] applicationFrame];    //appFrame
    NSInteger gVW = (aF.size.width - 2 *margins);     //gameViewWidth
    blockWidth = gVW/widthInBlocks;
    
    CGRect frame = CGRectMake(margins+width*2, 50,3*width,2*height);
    self.i = [[Tetrominoes alloc]initWithFrame:frame shape:zBlock];
    [self.i setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.i.center;
    NSLog(@"iClick");
    
    self.blockView = [[UIView alloc]initWithFrame:self.i.frame];
    [self.blockView addSubview:self.i];
    [self.view addSubview:self.blockView];
}

@end
