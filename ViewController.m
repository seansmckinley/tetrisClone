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

-(void)iClick;
-(void)jClick;
-(void)lClick;
-(void)oClick;
-(void)sClick;
-(void)tClick;
-(void)zClick;

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
 
    }
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)iClick{
    tagOut = iBlock;
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
