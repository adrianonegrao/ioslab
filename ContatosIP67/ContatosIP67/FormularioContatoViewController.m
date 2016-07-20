//
//  ViewController.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"


@implementation FormularioContatoViewController

-(NSObject*) initWithCoder:(NSCoder*) coder{
    self = [super initWithCoder:coder];
    if(self){
        self.contatoDAO = [ContatoDAO pegaInstancia];
    }
    return self;
}

-(IBAction)pegaDadosDoFormulario{
    Contato* contato = [Contato new];
    contato.nome = [self.nome text];
    contato.telefone = [self.telefone text];
    contato.endereco = [self.endereco text];
    contato.email = [self.email text];
    contato.site = [self.site text];
    
    [self.contatoDAO adiciona:contato];
}

@end
