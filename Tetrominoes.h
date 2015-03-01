//
//  Tetrominoes.h
//  tetrisClone
//
//  Created by Sean McKinley on 2/27/15.
//  Copyright (c) 2015 Sean McKinley. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum tetType : NSInteger{
    iBlock,
    jBlock,
    lBlock,
    oBlock,
    sBlock,
    tBlock,
    zBlock,
} tile; // should be able to set up a case statement in draw rect
@interface Tetrominoes : UIView
{
    tile tileType;
//    NSMutableArray *tiles;
}
-(id)initWithFrame:(CGRect)frame shape:(int)shape;

@end
