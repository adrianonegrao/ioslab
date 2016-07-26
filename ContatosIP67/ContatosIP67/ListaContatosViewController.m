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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        self.dao = [ContatoDAO pegaInstancia];
        self.linhaDestaque = -1;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    [self.tableView addGestureRecognizer:longPress];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    if(self.linhaDestaque >= 0){
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.linhaDestaque inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        self.linhaDestaque = -1;
    }
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
    
    static NSString* cellIdentififier = @"linha";
  
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


-(void)tableView:(UITableView*)table
        commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
        forRowAtIndexPath: (NSIndexPath*) indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.dao removeContatoDaPosicao:indexPath.row];
        [table deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.dao buscaContatoDaPosicao:indexPath.row];
    [self exibeFormulario];
    self.contatoSelecionado = nil;
}

-(void)contatoAtualizado:(Contato *)contato{
    self.linhaDestaque = [self.dao buscarPosicaoDoContato:contato];
}

-(void)contatoAdicionado:(Contato *)contato{
    self.linhaDestaque = [self.dao buscarPosicaoDoContato:contato];
}

-(void)exibeFormulario{
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [board instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    form.delegate = self;
    
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    
    [self.navigationController pushViewController:form animated:YES];
}

-(void)exibeMaisAcoes:(UIGestureRecognizer*) gesture{
    if(gesture.state == UIGestureRecognizerStateBegan){
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath* index = [self.tableView indexPathForRowAtPoint:ponto];
        
        if(index){
            self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
            _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.contatoSelecionado];
            [self.gerenciador acoesDoController:self];
        }
    }
}
 
@end
