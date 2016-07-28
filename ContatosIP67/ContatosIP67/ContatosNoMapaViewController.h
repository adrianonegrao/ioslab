//
//  ContatoNoMapaViewController.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 26/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContatosNoMapaViewController : UIViewController

@property IBOutlet MKMapView* mapa;
@property CLLocationManager* manager;
@property (nonatomic, weak) NSMutableArray* contatos;

@end
