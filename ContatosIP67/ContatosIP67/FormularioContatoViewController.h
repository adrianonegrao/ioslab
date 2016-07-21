//
//  ViewController.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDAO.h"

@interface FormularioContatoViewController : UIViewController

@property IBOutlet UITextField* nome;
@property IBOutlet UITextField* telefone;
@property IBOutlet UITextField* email;
@property IBOutlet UITextField* endereco;
@property IBOutlet UITextField* site;

@property ContatoDAO* contatoDAO;
@property (strong) Contato* contato;

@end

