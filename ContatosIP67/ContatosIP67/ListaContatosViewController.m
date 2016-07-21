//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController

-(id)init{
    self = [super init];
    if(self){
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem* botaoAdd = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                                     target:self
                                     action:@selector(exibeFormulario) ];
        
        self.navigationItem.rightBarButtonItem = botaoAdd;
    }
    return self;
}

-(void)exibeFormulario{
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [board instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
