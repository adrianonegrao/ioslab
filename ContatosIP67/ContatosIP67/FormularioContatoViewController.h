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
#import <CoreLocation/CoreLocation.h>

@protocol FormularioContatoViewControllerDelegate <NSObject>

-(void)contatoAtualizado:(Contato*) contato;
-(void)contatoAdicionado:(Contato*) contato;

@end

@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property IBOutlet UITextField* nome;
@property IBOutlet UITextField* telefone;
@property IBOutlet UITextField* email;
@property IBOutlet UITextField* endereco;
@property IBOutlet UITextField* site;

@property ContatoDAO* contatoDAO;
@property (strong) Contato* contato;

@property (weak) id<FormularioContatoViewControllerDelegate> delegate;

@property IBOutlet UIButton* botaoFoto;

-(IBAction)selecionaFoto:(id)sender;

@property IBOutlet UITextField* campoLatitude;
@property IBOutlet UITextField* campoLongitude;

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* loading;



@end