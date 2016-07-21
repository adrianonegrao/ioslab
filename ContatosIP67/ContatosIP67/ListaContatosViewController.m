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
        
        self.dao = [ContatoDAO pegaInstancia];
    }
    return self;
}

-(void)exibeFormulario{
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [board instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    [self.navigationController pushViewController:form animated:YES];
}

//Quantidade de Sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)table{
    return 1;
}

//Quantidade de linhas na section
-(NSInteger)tableView:(UITableView*) tableView
                    numberOfRowsInSection:(NSInteger) section{
    return [self.dao.contatos count];
}

//O TableView usa as informacoes acima para montar a lista, por isso nao precisa do "for"
-(UITableViewCell*)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)index{
    
    static NSString* cellIdentififier = @"Cell";
  
    UITableViewCell* cell = [table dequeueReusableCellWithIdentifier:cellIdentififier];
    if(!cell){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentififier];
    }
    
    Contato* contato = [self.dao buscaContatoDaPosicao: index.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


 
@end
