//
//  DrawView.m
//  TouchTracker
//
//  Created by zhangchenhua on 2021/6/2.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView ()

@property (nonatomic, strong) NSMutableDictionary *lineInprogress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, weak) Line *selectedLine;

@end

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor blackColor] set];
    for(Line *line in self.finishedLines)
    {
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.lineInprogress)
    {
        [self strokeLine:self.lineInprogress[key]];
    }
    
    if(self.selectedLine )
    {
        [[UIColor greenColor] set];
        [self strokeLine: self.selectedLine];
    }
}


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.lineInprogress = [NSMutableDictionary new];
        self.finishedLines = [NSMutableArray new];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.delaysTouchesBegan = YES;
    
    [self addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapRecognizer.delaysTouchesBegan = YES;
    [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
    [self addGestureRecognizer:tapRecognizer];
    return self;
}

- (Line *) lineAtPoint: (CGPoint) p
{
    //找出离p最近的line对象
    for(Line *l in self.finishedLines)
    {
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        for(float t = 0.0; t<=1.0; t += 0.05)
        {
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
        
            if(hypotf(x-p.x, y-p.y) < 20.0)
            {
                return l;
            }
        }
    }
    return nil;
}

- (void) tap: (UIGestureRecognizer *) gr
{
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    if(self.selectedLine)
    {
        //使视图成为UIMenuItem动作消息的目标
        [self becomeFirstResponder];
        //获取UIMenuController对象
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        
        menu.menuItems = @[deleteItem];
        
        // 先为UIMenuController对象设置显示区域，然后设置为可见
        [menu showMenuFromView:self rect:CGRectMake(point.x, point.y, 2, 2)];
        
    }
    else
    {
        [[UIMenuController sharedMenuController] hideMenu];
    }
    [self setNeedsDisplay];
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void)deleteLine: (id) sender
{
    [self.finishedLines removeObject:self.selectedLine];
    
    [self setNeedsDisplay];
}

- (void) doubleTap: (UIGestureRecognizer *) gr
{
    [self.lineInprogress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
}

- (void) strokeLine: (Line *) line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    
    [bp addLineToPoint:line.end];
    
    [bp stroke];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches)
    {
        CGPoint location = [t locationInView:self];
        Line *line = [Line new];
        
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.lineInprogress[key] = line;
    }
    
    [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches)
    {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.lineInprogress[key];
        line.end = [t locationInView:self];
    }
    
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.lineInprogress[key];
        [self.finishedLines addObject:line];
        [self.lineInprogress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITouch *t in touches)
    {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.lineInprogress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

@end
