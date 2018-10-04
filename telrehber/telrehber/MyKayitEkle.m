//
//  MyKayitEkle.m
//  
//
//  Created by 2015 on 11.09.2015.
//
//

#import "MyKayitEkle.h"
#import "Person.h"

@interface MyKayitEkle ()

@end

@implementation MyKayitEkle {
    
    NSMutableArray *kisiler;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];
    
    kisiler = [[saved objectForKey:@"Kisi2"] mutableCopy];
    
    if(kisiler.count == 0){
        
        kisiler = [[NSMutableArray alloc] init];
        [saved setObject:kisiler forKey:@"Kisi2"];
        [saved synchronize];
        
    }
    
    

    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)KayitButon:(id)sender {
    
    NSUserDefaults *saved = [NSUserDefaults standardUserDefaults];

    _kisi = [[Person alloc] init];
    
    _kisi.Ad = _AdText.text ;
    _kisi.Soyad = _SoyadText.text;
    _kisi.TelNum = _TelText.text ;
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                       _kisi.Ad, @"kisiAd",
                                       _kisi.Soyad ,@"kisiSoyad",
                                       _kisi.TelNum, @"kisiTel",
                                       nil];
    
    [kisiler addObject:dictionary];
    
    
    [saved setObject:kisiler forKey:@"Kisi2"];
    [saved synchronize];
    
    [self performSegueWithIdentifier:@"kaydetSegue" sender:self];
    
}


@end
