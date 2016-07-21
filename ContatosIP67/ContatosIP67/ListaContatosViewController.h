//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "ContatoDAO.h"

@interface ListaContatosViewController : UITableViewController

@property ContatoDAO* dao;

@end