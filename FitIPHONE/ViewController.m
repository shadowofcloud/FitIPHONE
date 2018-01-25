//
//  ViewController.m
//  FitIPHONE
//
//  Created by yangjun on 2017/12/28.
//  Copyright © 2017年 com.yangjun. All rights reserved.
//

#import "ViewController.h"
#import "ATableViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *   bottomView;

/** 确认按钮 */
@property (nonatomic, strong) UIButton *confirmBtn;
/** 详情^ */
@property (nonatomic, strong) UIButton *detailBtn;
/** 弹出的详情视图 */
@property (nonatomic, strong) UIScrollView *detailView;

@property (nonatomic, strong) UIScrollView *   addedAttendeesScrollView;

@property (nonatomic, strong) UITextField *   nameTF;
@property (nonatomic, strong) UIButton *   callBtn;
@property (nonatomic, strong) UILabel *   showLabel;

@property (nonatomic, strong) UIImageView *   showIMGView;

@property (nonatomic, strong) UIView *   zeroView;
@end

@implementation ViewController



-(UILabel *)showLabel
{
    if (!_showLabel) {
        _showLabel = [[UILabel alloc]init];
        _showLabel.frame = CGRectMake(0, 133*HEIGHTSCALE, 153*WIDTHSCALE, 30*HEIGHTSCALE);
        _showLabel.textColor = [UIColor blueColor];
        _showLabel.font = [UIFont systemFontOfSize:14*WIDTHSCALE];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        [self.zeroView addSubview:_showLabel];
    }
    return _showLabel;
}
-(UIImageView *)showIMGView
{
    if (!_showIMGView) {
        _showIMGView = [[UIImageView alloc] init];
        _showIMGView.frame =CGRectMake(20*WIDTHSCALE , 0, 113*WIDTHSCALE, 113*HEIGHTSCALE);//CGRectMake(50, 50, 100, 100)
//        NSString *str = [self getImgfromBundle:@"creatConfResources" imageName:@"1113x" type:@"png"];
//        _showIMGView.image = [UIImage imageWithContentsOfFile:str];
        _showIMGView.backgroundColor = [UIColor greenColor];
        
        _showIMGView.layer.cornerRadius = 50;
        _showIMGView.layer.masksToBounds = YES;
        _showIMGView.contentMode = UIViewContentModeScaleAspectFit;
        [self.zeroView addSubview:_showIMGView];
    }
    return _showIMGView;
}
-(UIView *)zeroView
{
    if (!_zeroView) {
        _zeroView = [[UIView alloc]init];
        
        _zeroView.frame= CGRectMake((self.view.bounds.size.width-153*WIDTHSCALE) * 0.5f, 80*HEIGHTSCALE, 153*WIDTHSCALE, 113*HEIGHTSCALE+20*HEIGHTSCALE+30*HEIGHTSCALE);
        _zeroView.backgroundColor = [UIColor yellowColor];
        
        //        _zeroView.layer.cornerRadius = 50;
        //        _zeroView.layer.masksToBounds =YES;
        
        self.showLabel.hidden = NO;
        self.showIMGView.hidden = NO;
        [self.view addSubview:_zeroView];
    }
    return _zeroView;
}






-(UIButton *)callBtn
{
    if (!_callBtn) {
        _callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _callBtn.frame =CGRectMake(SCREEN_WIDTH * 0.5 -32*WIDTHSCALE,  (43+32+52 + (64+15)*3+15)*HEIGHTSCALE + navigationBarHeight, 64*WIDTHSCALE, 64*HEIGHTSCALE);
//        NSString *str1 = [self getImgfromBundle:@"creatConfResources" imageName:@"callBtn3x" type:@"png"];
//        UIImage *image1 = [UIImage imageWithContentsOfFile:str1];
//
//        image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
//        [_callBtn setImage:image1 forState:UIControlStateNormal];
        _callBtn.backgroundColor = [UIColor yellowColor];
        
        [_callBtn setTitle:@"呼叫" forState:UIControlStateNormal];
        [_callBtn setTintColor:[UIColor blueColor]];
        [self.view addSubview:_callBtn];
        [_callBtn  addTarget:self action:@selector(callAnother) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callBtn;
}
- (void)callAnother
{
    ATableViewController *tabVC = [[ATableViewController alloc]init];
    [self.navigationController pushViewController:tabVC animated:YES];
}


-(UIButton *)detailBtn
{
    if (!_detailBtn) {
        _detailBtn = [[UIButton alloc]init];
//        NSString* str=[self getImgfromBundle:@"creatConfResources" imageName:@"上_2x" type:@"png"];
//        UIImage *image = [UIImage imageWithContentsOfFile:str];
        _detailBtn.imageView.frame=CGRectMake(0, 0, 15*WIDTHSCALE, 9*HEIGHTSCALE);
        _detailBtn.imageView.contentMode=UIViewContentModeScaleAspectFill;
        _detailBtn.imageView.center=_detailBtn.center;
//        _detailBtn.imageView.image=image;
        [_detailBtn setTitle:@"详情"    forState:UIControlStateNormal];
        
//        [_detailBtn setBackgroundImage:image forState:UIControlStateNormal];
        //[_detailBtn setImage:image forState:UIControlStateNormal];
        [_detailBtn setFrame:CGRectMake(SCREEN_WIDTH-110*WIDTHSCALE, 20.5*HEIGHTSCALE, 15*WIDTHSCALE, 9*HEIGHTSCALE)];
        [_detailBtn addTarget:self action:@selector(checkDetail) forControlEvents:UIControlEventTouchUpInside];
        //        _detailBtn.backgroundColor = [UIColor lightGrayColor];
        //        [self.view addSubview:_detailBtn];
    }
    return _detailBtn;
}


- (void) checkDetail
{
     if(self.detailView.hidden == YES)
    {
        self.addedAttendeesScrollView.hidden = YES;
        self.detailView.hidden = NO;
    }else
    {
        self.addedAttendeesScrollView.hidden = NO;
        self.detailView.hidden = YES;
    }
}
-(UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc]init];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        //        _confirmBtn.backgroundColor=[UIColor colorWithHex:0xf23030];
//        _confirmBtn.backgroundColor = [UIColor colorWithHex:0xcccccc];
        _confirmBtn.backgroundColor = [UIColor redColor];
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn setTintColor:[UIColor whiteColor]];
        [self.bottomView addSubview:_confirmBtn];
        [_confirmBtn addTarget:self action:@selector(conFirmOk) forControlEvents:UIControlEventTouchUpInside];
        [_confirmBtn setFrame:CGRectMake(SCREEN_WIDTH-85*WIDTHSCALE, 10*HEIGHTSCALE, 75*WIDTHSCALE, 30*HEIGHTSCALE)];
        _confirmBtn.layer.cornerRadius=5;
        //        [self.view addSubview:_confirmBtn];
        
    }
    return _confirmBtn;
}

-(UIScrollView *)detailView{
    if (!_detailView) {
        //SCREEN_HIGHT -50*HEIGHTSCALE-navigationBarHeight - detailViewHeight
        _detailView = [[UIScrollView alloc]init];
        _detailView.frame = CGRectMake(0, SCREEN_HIGHT - navigationBarHeight - 50 * HEIGHTSCALE-kbottomBarHeight - detailViewHeight, SCREEN_WIDTH, detailViewHeight);
        _detailView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1];
//        _detailView.backgroundColor=[UIColor colorWithHex:0xf3f3f3];
        
        CGFloat width=_detailView.frame.size.width;
        CGFloat heitht=_detailView.frame.size.height;
        _detailView.hidden = YES;
        _detailView.contentSize=CGSizeMake(width, 2*heitht);
        _detailView.showsVerticalScrollIndicator = YES;
        _detailView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_detailView];
        
    }
    return _detailView;
}



- (UIScrollView*)addedAttendeesScrollView
{
    if (!_addedAttendeesScrollView)
    {
        _addedAttendeesScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-130*WIDTHSCALE, 50*HEIGHTSCALE)];
        _addedAttendeesScrollView.showsHorizontalScrollIndicator=YES;
        _addedAttendeesScrollView.scrollEnabled=YES;
        //_addedAttendeesScrollView.pagingEnabled=YES;
        //_addedAttendeesScrollView.backgroundColor = [UIColor colorWithRed:0.2 green:0.82 blue:0.2 alpha:1];
//        _addedAttendeesScrollView.backgroundColor=[UIColor colorWithHex:0xf3f3f3];
//        _addedAttendeesScrollView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1];
        _addedAttendeesScrollView.backgroundColor = [UIColor blueColor];
        //        _addedAttendeesScrollView.backgroundColor=[UIColor yellowColor];
        //        CGFloat width = _addedAttendeesScrollView.frame.size.width;
        CGFloat height = _addedAttendeesScrollView.frame.size.height;
        _addedAttendeesScrollView.contentSize=CGSizeMake(SCREEN_WIDTH-130*WIDTHSCALE, height);
        // _addedAttendeesScrollView.contentInset=UIEdgeInsetsMake(0, 0, 0,0);
        //_addedAttendeesScrollView.contentInset=UIEdgeInsetsMake(0, 0, 0, 60);
//        _addedAttendeesScrollView.delegate=self;
        //        if (staticScrollView.subviews.count > 0) {
        //           _addedAttendeesScrollView = staticScrollView;
        //
        //
        //        }
        
        
        // [self.view addSubview:_addedAttendeesScrollView];
        
    }
    return _addedAttendeesScrollView;
}


-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.frame = CGRectMake(0, SCREEN_HIGHT - navigationBarHeight -50*HEIGHTSCALE-kbottomBarHeight, SCREEN_WIDTH, 50*HEIGHTSCALE);
        
//        _bottomView.backgroundColor=[UIColor colorWithHex:0xf3f3f3];
        _bottomView.backgroundColor=[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1];
        [_bottomView addSubview:self.addedAttendeesScrollView];
        [_bottomView addSubview:self.detailBtn];
        [_bottomView addSubview:self.confirmBtn];
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.bottomView];
    self.nameTF = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 0.5 -100, 100, 200, 60)];
    self.nameTF.placeholder = @"11111hao";
    [self.view addSubview:self.nameTF];
    [self.view addSubview:self.zeroView];
    
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(pushToCreateConf) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"创建会议" forState:UIControlStateNormal];
    [rightBtn setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *newRight = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    
    //    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"创建会议" style:UIBarButtonItemStylePlain target:self action:@selector(pushToCreateConf)];
    //
    //
    //    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = newRight;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    
    
    [self.view  addSubview:self.callBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(bottomViewUp:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(bottomViewDown:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)pushToCreateConf
{
    ATableViewController *tabVC = [[ATableViewController alloc]init];
    [self.navigationController pushViewController:tabVC animated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.nameTF resignFirstResponder];
//    [self down];
}
- (void)down
{
    [UIView animateWithDuration:0.2 animations:^{
        
        
        _zeroView.frame= CGRectMake((self.view.bounds.size.width-153*WIDTHSCALE) * 0.5f, 80 * WIDTHSCALE , 153*WIDTHSCALE, 113*HEIGHTSCALE+20*HEIGHTSCALE+30*HEIGHTSCALE);
        
        
        _bottomView.frame=CGRectMake(0, SCREEN_HIGHT - navigationBarHeight -50*HEIGHTSCALE - kbottomBarHeight, SCREEN_WIDTH, 50*HEIGHTSCALE);
        
        //        CGRect rect2 =_detailView.frame;
        _detailView.frame=CGRectMake(0, SCREEN_HIGHT - navigationBarHeight- 50*HEIGHTSCALE-detailViewHeight - kbottomBarHeight, SCREEN_WIDTH, detailViewHeight);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)bottomViewUp:(NSNotification*)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    
    _zeroView.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        
        _zeroView.frame= CGRectMake((self.view.bounds.size.width-153*WIDTHSCALE) * 0.5f, 80 * WIDTHSCALE , 153*WIDTHSCALE, 113*HEIGHTSCALE+20*HEIGHTSCALE+30*HEIGHTSCALE);
        
        _bottomView.frame=CGRectMake(0, SCREEN_HIGHT - kbSize.height - navigationBarHeight -50*HEIGHTSCALE - kbottomBarHeight, SCREEN_WIDTH, 50*HEIGHTSCALE);
        
        //        CGRect rect2 =_detailView.frame;
        _detailView.frame=CGRectMake(0, SCREEN_HIGHT - kbSize.height - navigationBarHeight- 50*HEIGHTSCALE-detailViewHeight - kbottomBarHeight, SCREEN_WIDTH, detailViewHeight);
    } completion:^(BOOL finished) {
        
    }];
}
- (void) bottomViewDown:(NSNotification*)aNotification
{
    _zeroView.hidden = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        _zeroView.frame= CGRectMake((self.view.bounds.size.width-153*WIDTHSCALE) * 0.5f, SCREEN_HIGHT * 0.5 - 153 * WIDTHSCALE , 153*WIDTHSCALE, 113*HEIGHTSCALE+20*HEIGHTSCALE+30*HEIGHTSCALE);
        
        _bottomView.frame=CGRectMake(0, SCREEN_HIGHT - navigationBarHeight -50*HEIGHTSCALE - kbottomBarHeight, SCREEN_WIDTH, 50*HEIGHTSCALE);
        
        //        CGRect rect2 =_detailView.frame;
        _detailView.frame=CGRectMake(0, SCREEN_HIGHT - navigationBarHeight- 50*HEIGHTSCALE-detailViewHeight - kbottomBarHeight, SCREEN_WIDTH, detailViewHeight);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
