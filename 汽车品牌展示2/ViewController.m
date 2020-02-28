//
//  ViewController.m
//  汽车品牌展示2
//
//  Created by luowentao on 2020/2/28.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "ViewController.h"
#import "LLGruop.h"
#import "LLCar.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *groups;
@property (nonatomic,strong)UITableView *tableView;

@end



@implementation ViewController

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"开始");
    return self.groups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    LLGruop *group=self.groups[section];
    return group.cars.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"car_cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
     if(cell==nil){
         cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
     }
    
    LLGruop *group=self.groups[indexPath.section];
    LLCar *car=group.cars[indexPath.row];
    
    cell.imageView.image=[UIImage imageNamed:car.icon];
    cell.textLabel.text=car.name;
    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    LLGruop *gr=self.groups[section];
    return gr.title;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.groups valueForKey:@"title"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LLGruop *group=self.groups[indexPath.section];
    LLCar *car=group.cars[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"编辑车名" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *conform=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        //1,获取文本框中的内容
        //2.修改name
        //3.刷新tableView
        NSString *name=alert.textFields[0].text;
        
        LLGruop *group=self.groups[indexPath.section];
        LLCar *car=group.cars[indexPath.row];
        
        car.name=name;
     //   [self.tableView reloadData]; //全部刷新
        [ self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请填写车名";
        textField.text=car.name;
    }];
    
    [alert addAction:conform];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark 懒加载
- (NSArray *)groups{
    //NSLog(@"LANJIAZAI");
    if(_groups==nil){
        NSString *path =[[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
         
        NSMutableArray *arrayModel=[NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict) {
            LLGruop *model=[LLGruop groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _groups=arrayModel;
        
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView= [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}


@end
