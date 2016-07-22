//
//  ViewController.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"


@implementation FormularioContatoViewController

//Inicializador so quando StoryBoard instancia este controller
-(NSObject*) initWithCoder:(NSCoder*) coder{
    self = [super initWithCoder:coder];
    if(self){
        self.contatoDAO = [ContatoDAO pegaInstancia];
        
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem* botao = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Adiciona"
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(adicionaContato)];
        
        self.navigationItem.rightBarButtonItem = botao;
        
    }
    return self;
}

-(void) adicionaContato{
    [self pegaDadosDoFormulario];
    [self.contatoDAO adiciona:self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pegaDadosDoFormulario{
    self.contato = [Contato new];
    self.contato.nome = [self.nome text];
    self.contato.telefone = [self.telefone text];
    self.contato.endereco = [self.endereco text];
    self.contato.email = [self.email text];
    self.contato.site = [self.site text];
}

-(void)viewDidLoad{
    if(self.contato){
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
    }
}

@end
