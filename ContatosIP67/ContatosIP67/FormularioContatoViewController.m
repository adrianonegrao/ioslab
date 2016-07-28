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

-(void)viewDidLoad{
    if(self.contato){
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem* confirmar = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Confirmar"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(atualizaContato)];
        
        self.navigationItem.rightBarButtonItem = confirmar;
        
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        if(self.contato.foto) {
            [self.botaoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
            [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
        }
        self.campoLatitude.text = [self.contato.latitude stringValue];
        self.campoLongitude.text = [self.contato.longitude stringValue];
    }
}


-(void) adicionaContato{
    [self pegaDadosDoFormulario];
    [self.contatoDAO adiciona:self.contato];
    
    if(self.delegate){
        [self.delegate contatoAdicionado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pegaDadosDoFormulario{
    if(!self.contato){
        self.contato = [Contato new];
    }
    self.contato.nome = [self.nome text];
    self.contato.telefone = [self.telefone text];
    self.contato.endereco = [self.endereco text];
    self.contato.email = [self.email text];
    self.contato.site = [self.site text];
    
    if([self.botaoFoto backgroundImageForState:UIControlStateNormal]) {
        self.contato.foto = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
    }
    
    self.contato.latitude = [NSNumber numberWithFloat:
                             [self.campoLatitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat:
                              [self.campoLongitude.text floatValue]];
    
}


-(void)atualizaContato{
    [self pegaDadosDoFormulario];
    
    if(self.delegate){
        [self.delegate contatoAtualizado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)selecionaFoto:(id)sender{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"Escolha a foto do contato" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Tirar foto", @"Escolher da biblioteca", nil];
        
        [sheet showInView:self.view];
    }else{
        UIImagePickerController*  picker = [UIImagePickerController new];
        picker.sourceType= UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage* imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    
    [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)actionSheet:(UIActionSheet*) actionSheet didDismissWithButtonIndex:(NSInteger) buttonIndex{
    UIImagePickerController* picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing=YES;
    
    switch (buttonIndex) {
        case 0:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            return;
    }
    
    [self presentViewController:picker animated:YES completion:nil];
}

-(IBAction)buscarCoordenadas:(UIButton*)botao{
    [self.loading startAnimating];
    botao.hidden = YES;
    
    CLGeocoder* geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString: self.endereco.text
                 completionHandler:
     ^(NSArray* resultados, NSError* error){
         if(error == nil && [resultados count] > 0){
             
             CLPlacemark* resultado = resultados[0];
             CLLocationCoordinate2D coordenada = resultado.location.coordinate;
             self.campoLatitude.text = [NSString stringWithFormat:@"%f", coordenada.latitude];
             self.campoLongitude.text = [NSString stringWithFormat:@"%f", coordenada.longitude];
         }
         
         [self.loading stopAnimating];
         botao.hidden = NO;
     }];
}

@end