//
//  MyTelRehberTableViewController.m
//  
//
//  Created by 2015 on 11.09.2015.
//
//

#import "MyTelRehberTableViewController.h"
#import "kisiCell.h"


@interface MyTelRehberTableViewController ()

@end

@implementation MyTelRehberTableViewController{
    
    NSMutableArray *kisiler;
    NSMutableDictionary *tempKisi;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.tableView registerClass:[kisiCell class] forCellReuseIdentifier:@"kisiCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"kisiCell" bundle:nil] forCellReuseIdentifier:@"kisiCell"];
    //cell dosyasını ve içindeki xib dosyasını tanımlamaya yarıyor.
    
    
    
    
    
    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    
    kisiler = [[saved objectForKey:@"Kisi2"] mutableCopy];
    
    if(kisiler.count == 0){
        
        kisiler = [[NSMutableArray alloc] init];
        [saved setObject:kisiler forKey:@"Kisi2"];
        [saved synchronize];
        
    }
    //array e yazılan değeri kayıt edip yeni değeri kayıt etmeye yarıyor.
    //(mutable copy) yazmak önemli
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
    //tek section da çalıştığımız için 1 e döndük
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return kisiler.count;
    // array in kaç elemanlı olduğunu anlamamıza yarıyo.

}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    kisiCell * cell = [tableView dequeueReusableCellWithIdentifier:@"kisiCell" forIndexPath:indexPath];
    
    if(cell == nil){
        
        cell = [[kisiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kisiCell"];
        
    }
    
    
    cell.AdCell.text = [[kisiler objectAtIndex:[indexPath row]] valueForKey:@"kisiAd"];
    cell.SoyadCell.text = [[kisiler objectAtIndex:[indexPath row]] valueForKey:@"kisiSoyad"];
    cell.TelCell.text = [[kisiler objectAtIndex:[indexPath row]] valueForKey:@"kisiTel"];
    // Configure the cell...
    // eğer cell null sa kisicell e bellekten yer tahsis eder.
    // belirtilen key deki value leri text lere atamamızı sağlar.
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
 /*
    [kisiler removeObjectAtIndex:indexPath.row];
    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    [saved setObject:kisiler forKey:@"Kisi2"];
    [saved synchronize];
  */
    
    tempKisi = [kisiler objectAtIndex:indexPath.row];
    
    if(tempKisi != nil){
        
        [self performSegueWithIdentifier:@"ayrintiGoster" sender:self];
        
    }
    
}
//üzerine basılan cell in silinmesine yarıyor.
//silinip silinmediğini sayfayı yenileyerek anlayabiliriz.
//ikinci kısım ise ayrıntıları gösterir





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if([segue.identifier isEqualToString:@"ayrintiGoster"]){
        
        MyView *destinationView = (MyView*)segue.destinationViewController;
        destinationView.myKisi = tempKisi;
        
    }
    
    
    
}
// üzerine basılan cell in içinde bulunan kayıtı gösterir. segue olarak.


@end
