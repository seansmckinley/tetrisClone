//
//  Tetrominoes.m
//  tetrisClone
//
//  Created by Sean McKinley on 2/27/15.
//  Copyright (c) 2015 Sean McKinley. All rights reserved.
//

#import "Tetrominoes.h"





@implementation Tetrominoes

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

 */
-(id)initWithFrame:(CGRect)frame shape:(int)shape;
{
    
    self = [super initWithFrame:frame];
    if(self){
        
        tileType = shape;
//        tiles = [[NSMutableArray alloc]initWithCapacity:4];
    }
    return self;
    
}
-(void)drawRect:(CGRect)rect
{
    switch(tileType){
        case iBlock:
            [self drawIth:rect]; //draw i shaped block
        break;
        case jBlock:
            [self drawJay:rect]; //draw j shaped block
        break;
        case lBlock:
            [self drawEl:rect]; //draw l shaped block
        break;
        case oBlock:
            [self drawOh:rect   ];//draw o shaped block
        break;
        case sBlock:
            [self drawEss:rect  ];//draw s shaped block
        break;
        case tBlock:
            [self drawTee:rect]; //draw t shaped block
        break;
        case zBlock:
            [self drawZee:rect];
        break;
            
    }
 
    
}
-(void)drawIth:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width, height = size.height/4;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x, rect.origin.y, width, height);

    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];

    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];

    CGAffineTransform tr =  CGAffineTransformMakeTranslation(0, height);
   
    [outer applyTransform:tr];
    [in applyTransform:tr];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr];
    [in applyTransform:tr];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr];
    [in applyTransform:tr];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
}



-(void)drawJay:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/2, height = size.height/3;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x+width, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
    //down
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);
    //left
    CGAffineTransform tr2 =  CGAffineTransformMakeTranslation(-width, 0);
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
}
-(void)drawEl:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/2, height = size.height/3;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
    //down
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);
    //right
    CGAffineTransform tr2 =  CGAffineTransformMakeTranslation(width, 0);
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
}
-(void)drawOh:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/2, height = size.height/2;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
    //down
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);
    //right
    CGAffineTransform tr2 =  CGAffineTransformMakeTranslation(width, 0);
    //up
    CGAffineTransform tr3 =  CGAffineTransformMakeTranslation(0, -height);
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr3];
    [in applyTransform:tr3];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];}
-(void)drawEss:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/3, height = size.height/2;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x+width*2, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
    //down
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);

    //left
    CGAffineTransform tr3 =  CGAffineTransformMakeTranslation(-width, 0);
    
    [outer applyTransform:tr3];
    [in applyTransform:tr3];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr3];
    [in applyTransform:tr3];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
}
-(void)drawTee:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/3, height = size.height/2;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
  
    //down
   
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);
    //right
    CGAffineTransform tr3 =  CGAffineTransformMakeTranslation(width, 0);
    
    //left
    CGAffineTransform tr2 =  CGAffineTransformMakeTranslation(-width, 0);
    
    
    [outer applyTransform:tr3];
    [in applyTransform:tr3];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr3];
    [in applyTransform:tr3];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
}
-(void)drawZee:(CGRect)rect
{
    CGSize size = rect.size;
    NSLog(@"%f",size.width);
    NSInteger width = size.width/3, height = size.height/2;
    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGRect newrect = CGRectMake(rect.origin.x, rect.origin.y, width, height);
    
    UIBezierPath *outer= [UIBezierPath bezierPathWithRect:newrect];
    [outer fill]; [outer stroke];
    
    newrect.origin.x+=4.0f;
    newrect.origin.y+=4.0f;
    newrect.size.width-=8.0f;
    newrect.size.height-=8.0f;
    CGRect inner = newrect;
    UIBezierPath *in = [UIBezierPath bezierPathWithRect:inner];
    [in fill]; [in stroke];
    //down
    CGAffineTransform tr1 =  CGAffineTransformMakeTranslation(0, height);
    //right
    CGAffineTransform tr2 =  CGAffineTransformMakeTranslation(width, 0);
    //up
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr1];
    [in applyTransform:tr1];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
    
    [outer applyTransform:tr2];
    [in applyTransform:tr2];
    [outer fill]; [outer stroke];
    [in fill]; [in stroke];
}
@end 