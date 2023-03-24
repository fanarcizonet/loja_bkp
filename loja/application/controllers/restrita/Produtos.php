<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Produtos extends CI_Controller {

    public function __construct() {
        parent::__construct();

 if (!$this->ion_auth->logged_in())
    {
      redirect('restrita/login');
    }

    }

    public function index() {

       

            $data = array(
                'titulo' => 'Produtos Cadastrados',
		'produtos' => $this->produtos_model->get_all(),
               
                
            );

           
            $this->load->view('restrita/layout/header', $data);
            $this->load->view('restrita/produtos/index');
            $this->load->view('restrita/layout/footer');
        
    }
    
    
    
    
    
    
    
    
    public function core($produto_id = null) {
        
$produto_id = (int) $produto_id;

if (!$produto_id) {
    
    
//cadastra


  $this->form_validation->set_rules('produto_nome','Nome da Produto','trim|required|min_length[4]|max_length[240]|callback_valida_nome_produto');
 

 $this->form_validation->set_rules('produto_categoria_id','Categoria do Produto', 'trim|required');
 
 $this->form_validation->set_rules('produto_marca_id','Marca do Produto', 'trim|required');

 $this->form_validation->set_rules('produto_valor','Valor de Venda do Produto','trim|required');
 
  $this->form_validation->set_rules('produto_peso','Peso do Produto','trim|required|integer');
  
  
   $this->form_validation->set_rules('produto_altura','Altura do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_largura','Largura do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_comprimento','Comprimento do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_quantidade_estoque','Quantidade em Estoque','trim|required|integer');
 $this->form_validation->set_rules('produto_descricao','Descrição do Produto','trim|required|min_length[10]|max_length[5000]');
 
 
$fotos_produtos = $this->input->post('fotos_produtos');

if(!$fotos_produtos){

$this->form_validation->set_rules('fotos_produtos','Fotos do Produto', 'required');

}





if($this->form_validation->run()){
    
    
    
     $data = elements(
array(
'produto_nome',
'produto_categoria_id',
'produto_marca_id',
'produto_valor',
'produto_peso',
'produto_altura',
'produto_largura',
'produto_comprimento',
'produto_quantidade_estoque',
'produto_ativo',
'produto_destaque',
'produto_controlar_estoque',
'produto_descricao',

),$this->input->post()


);






$data['produto_valor'] = str_replace(',' , '' , $data['produto_valor']);

$data['produto_meta_link'] = url_amigavel($data['produto_nome']);

$data['produto_codigo'] = $this->input->post('produto_codigo');
$data = html_escape($data);
$this->core_model->insert('produtos'  , $data , TRUE);

$produto_id = $this->session->userdata('last_id');

$fotos_produtos = $this->input->post('fotos_produtos');



    
$fotos_produtos = $this->input->post('fotos_produtos');

if($fotos_produtos){
$total_fotos = count($fotos_produtos);

for ($i = 0; $i < $total_fotos; $i++){
$data = array (

'foto_produto_id' => $produto_id,
'foto_caminho'  => $fotos_produtos[$i],

);

$this->core_model->insert('produtos_fotos',  $data);

}
}

redirect ('restrita/produtos');
    
    

}else{
//erro de validadação

 $data = array(
                'titulo' => 'Cadastrar Produto',
		
		'codigo_gerado' => $this->core_model->generate_unique_code('produtos','numeric' , 8 , 'produto_codigo'),
		'categorias'    => $this->core_model->get_all('categorias'     , array ('categoria_ativa' => 1)),
		'marcas'        => $this->core_model->get_all('marcas'         , array ('marca_ativa' => 1)),
               
                
            );

           
            $this->load->view('restrita/layout/header', $data);
            $this->load->view('restrita/produtos/core');
            $this->load->view('restrita/layout/footer');

}

}else{
//editar

if(!$produto = $this->core_model->get_by_id('produtos', array ('produto_id' => $produto_id))){
$this->session->set_flashdata('erro','Esse produto não foi localizado');
redirect ('restrita/produtos');
}else{
//editando
 $this->form_validation->set_rules('produto_nome','Nome da Produto','trim|required|min_length[4]|max_length[240]|callback_valida_nome_produto');
 

    $this->form_validation->set_rules('produto_categoria_id','Categoria do Produto', 'trim|required');

 $this->form_validation->set_rules('produto_valor','Valor de Venda do Produto','trim|required');
 
  $this->form_validation->set_rules('produto_peso','Peso do Produto','trim|required|integer');
  
  
   $this->form_validation->set_rules('produto_altura','Altura do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_largura','Largura do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_comprimento','Comprimento do Produto','trim|required|integer');
 $this->form_validation->set_rules('produto_quantidade_estoque','Quantidade em Estoque','trim|required|integer');
 $this->form_validation->set_rules('produto_descricao','Descrição do Produto','trim|required|min_length[10]|max_length[5000]');
 
 








if($this->form_validation->run()){
    
    
    
     $data = elements(
array(
'produto_nome',
'produto_categoria_id',
'produto_marca_id',
'produto_valor',
'produto_peso',
'produto_altura',
'produto_largura',
'produto_comprimento',
'produto_quantidade_estoque',
'produto_ativo',
'produto_destaque',
'produto_controlar_estoque',
'produto_descricao',

),$this->input->post()


);






$data['produto_valor'] = str_replace(',' , '' , $data['produto_valor']);

$data['produto_meta_link'] = url_amigavel($data['produto_nome']);
$data = html_escape($data);
$this->core_model->update('produtos'  , $data , array('produto_id' => $produto_id) );


$this->core_model->delete('produtos_fotos' , array ('foto_produto_id' => $produto_id));
    
$fotos_produtos = $this->input->post('fotos_produtos');

if($fotos_produtos){
$total_fotos = count($fotos_produtos);

for ($i = 0; $i < $total_fotos; $i++){
$data = array (

'foto_produto_id' => $produto_id,
'foto_caminho'  => $fotos_produtos[$i],

);

$this->core_model->insert('produtos_fotos',  $data);

}
}

redirect ('restrita/produtos');
    
    

}else{
//erro de validadação

 $data = array(
                'titulo' => 'Editar Produto',
		'produto' => $produto,
		'fotos_produto' => $this->core_model->get_all('produtos_fotos' , array ('foto_produto_id' => $produto_id)),
		'categorias'    => $this->core_model->get_all('categorias'     , array ('categoria_ativa' => 1)),
		'marcas'        => $this->core_model->get_all('marcas'         , array ('marca_ativa' => 1)),
               
                
            );

           
            $this->load->view('restrita/layout/header', $data);
            $this->load->view('restrita/produtos/core');
            $this->load->view('restrita/layout/footer');

}



}

}

       

           
        
    }
    
    
    
    
    public function valida_nome_produto($produto_nome){

$produto_id = $this->input->post('produto_id');
if(!$produto_id){
 //cadastrando

if($this->core_model->get_by_id('produtos', array('produto_nome'=> $produto_nome) )){
$this-> form_validation->set_message('valida_nome_produto','Esse produto já existe');
return false;


}else{
 
return true;
}
}else{

if($this->core_model->get_by_id('produtos', array('produto_nome'=> $produto_nome, 'produto_id !=' => $produto_id) )){
$this-> form_validation->set_message('valida_nome_produto','Esse produto já existe');
return false;


}else{
 
return true;
}

}

}

    
    
    
 public function upload (){

$config ['upload_path'] = './uploads/produtos/';
$config ['allowed_types'] = 'jpg|png|jpeg';
$config ['max_size'] = '2048';
$config ['max_width'] = '1000';
$config ['max_heigth'] = '1000';
$config ['encrypt_name'] = TRUE;
$config ['max_filename'] = '200';
$config ['file_ext_tolower'] = TRUE;




$this->load->library('upload' , $config);


  if (  $this->upload->do_upload('foto_produto')){
                       
          $data = array(
'uploaded_data' => $this->upload->data(),
'mensagem' => 'Imagem enviada com sucesso',
'foto_caminho' => $this->upload->data('file_name'),
'erro' => 0,


);      

//resize image configuration

$config['image_library'] = 'gd2';
$config['source_image'] = './uploads/produtos/' . $this->upload->data('file_name'); ;
$config['new_image'] = './uploads/produtos/small/' . $this->upload->data('file_name');
$config['width']        = 300;
$config['height']       = 300;

$this->load->library('image_lib', $config);
//$this->image_lib->resize();

if(!$this->image_lib->resize() ){
$data['erro'] = $this->image_lib->display_errors();
}





}else{
$data =array(

'mensagem' => $this->upload->display_errors(),
'erro' =>5,

);
}
echo json_encode($data);
}       
    
 
 public function generate_unique_code( $tabela = NULL , $tipo_codigo = NULL , $tamanho_codigo = NULL , $campo_procura =NULL){


do{

$codigo = random_string($tipo_codigo, $tamanho_codigo);
$this ->db->where($campo_procura, $codigo);
$this->db->from($tabela);

}while($this->db->count_all_results() >= 1);

return $codigo;

}

 
 
 public function delete ($produto_id = NULL){

$produto_id = (int) $produto_id;

if (!$produto_id || !$this->core_model->get_by_id ('produtos', array ('produto_id' => $produto_id) )){
$this->session->set_flashdata('erro','Esse produto não foi localizado');
redirect ('restrita/produtos');
}

if ($this->core_model->get_by_id ('produtos', array ('produto_id' => $produto_id , 'produto_ativo' => 1)  )){
$this->session->set_flashdata('erro','Não é permitido remover um produto ativo');
redirect ('restrita/produtos');
}

$fotos_produto = $this->core_model->get_all('produtos_fotos' , array ('foto_produto_id'  => $produto_id));
$this->core_model->delete('produtos' , array ('produto_id' => $produto_id));


if ($fotos_produto){
foreach($fotos_produto as $foto){

$foto_grande = FCPATH . 'uploads/produtos/' . $foto->foto_caminho;

$foto_pequena = FCPATH . 'uploads/produtos/small/' . $foto->foto_caminho;

if(file_exists($foto_grande) && file_exists($foto_pequena)){
unlink($foto_pequena);
unlink($foto_grande);

}

}



}


redirect('restrita/produtos');

}
   
    

}

