//
//  MyKayitEkle.h
//  
//
//  Created by 2015 on 11.09.2015.
//
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MyView.h"
#import "MyTelRehberTableViewController.h"

@interface MyKayitEkle : UIViewController







@property (weak, nonatomic) IBOutlet UITextField *AdText;

@property (weak, nonatomic) IBOutlet UITextField *SoyadText;

@property (weak, nonatomic) IBOutlet UITextField *TelText;

@property (nonatomic, strong) Person *kisi;


- (IBAction)KayitButon:(id)sender;





@end
