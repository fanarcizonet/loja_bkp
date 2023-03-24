<?php

defined('BASEPATH') OR exit ('Ação não permitida');
class Usuarios extends CI_Controller{

public function __construct() {
parent::__construct();

 if (!$this->ion_auth->logged_in())
    {
      redirect('restrita/login');
   }

}

public function index(){

$data = array(
'usuarios'=> $this->ion_auth->users()->result(),

'titulo'=> 'Usuários Cadastrados',

);

//echo '<pre>';
//print_r ($data['usuarios']);
//exit();

    $this->load->view ('restrita/layout/header', $data);
    $this->load->view ('restrita/usuarios/index');
    $this->load->view ('restrita/layout/footer');
}



public function core($usuario_id = NULL){
    
    $usuario_id = (int) $usuario_id;

if(!$usuario_id){

//cadastrar 

$this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[45]');
$this->form_validation->set_rules('last_name', 'Sobrenome', 'trim|required|min_length[4]|max_length[45]');
$this->form_validation->set_rules('email', 'E-mail', 'trim|required|min_length[4]|max_length[100]|valid_email|callback_valida_email');
$this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[4]|max_length[50]|callback_valida_usuario');
$this->form_validation->set_rules('password', 'Senha', 'trim|required|min_length[4]|max_length[200]');
$this->form_validation->set_rules('confirma', 'Confirmação', 'trim|required|min_length[4]|max_length[200]|matches[password]');


if ($this->form_validation-> run()){


    $username = $this->input->post('username');
    $password = $this->input->post('password');
    $email = $this->input->post('email');
    $additional_data = array(
                'first_name' => $this->input->post('first_name'),
                'last_name' => $this->input->post('last_name'),
                 'active' => $this->input->post('active'),
                );
    $group = array($this->input->post('perfil'));  //setando se admin ou cliente

   if( $this->ion_auth->register($username, $password, $email, $additional_data, $group)){
$this->session->set_flashdata('sucesso','Dados salvos com sucesso');

}else{
$this->session->set_flashdata('erro','Erro ao salvar dados');
}
redirect ('restrita/usuarios');
}else{


$data = array('titulo' => 'Cadastrar Usuário' , 

'grupos'=> $this->ion_auth->groups()->result(),  


);

 $this->load->view ('restrita/layout/header', $data);
    $this->load->view ('restrita/usuarios/core');
    $this->load->view ('restrita/layout/footer');

}







}else{

if(!$usuario =$this->ion_auth->user($usuario_id)->row()  ){

$this->session->set_flashdata('erro', 'Usuário não foi localizado');
redirect('restrita/usuarios');
}else{
    
$this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[45]');
$this->form_validation->set_rules('last_name', 'Sobrenome', 'trim|required|min_length[4]|max_length[45]');
$this->form_validation->set_rules('email', 'E-mail', 'trim|required|min_length[4]|max_length[100]|valid_email|callback_valida_email');
$this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[4]|max_length[50]|callback_valida_usuario');
$this->form_validation->set_rules('password', 'Senha', 'trim|min_length[4]|max_length[200]');
$this->form_validation->set_rules('confirma', 'Confirmação', 'trim|min_length[4]|max_length[200]|matches[password]');


if($this->form_validation-> run() ){

//echo '<pre>';
//print_r  ($this->input->post());
//exit();

$data = elements(

array(
'first_name',
'last_name',
'email',
'username',
'password',
'active',


),$this->input->post()

);

$password = $this->input->post('password');
//não atualiza se não for passada
if(!$password){
unset($data['password']);
}

//sanitizando data
$data = html_escape($data);


if ($this->ion_auth->update($usuario_id, $data)) {

$perfil =  (int) $this->input->post('perfil');

if($perfil){
$this->ion_auth->remove_from_group(NULL, $usuario_id);
$this->ion_auth->add_to_group($perfil, $usuario_id);
}

$this->session->set_flashdata('sucesso','Dados salvos com sucesso');
}else{
$this->session->set_flashdata('erro', 'Erro ao salvar dados' );


}

redirect ('restrita/usuarios'); 







}else{


//erro de validaçao

$data = array('titulo' => 'Editar Usuário' , 'usuario'=> $usuario, 
'perfil'=> $this->ion_auth->get_users_groups($usuario_id)->row(),
'grupos'=> $this->ion_auth->groups()->result(),  );

 $this->load->view ('restrita/layout/header', $data);
    $this->load->view ('restrita/usuarios/core');
    $this->load->view ('restrita/layout/footer');

}



}


}

}

public function valida_email($email){

$usuario_id = $this->input->post('usuario_id');
if(!$usuario_id){
 //cadastrando

if($this->core_model->get_by_id('users', array('email'=> $email) )){
$this-> form_validation->set_message('valida_email','Esse e-mail já existe');
return false;


}else{
 
return true;
}
}else{

if($this->core_model->get_by_id('users', array('email'=> $email, 'id !=' => $usuario_id) )){
$this-> form_validation->set_message('valida_email','Esse e-mail já existe');
return false;


}else{
 
return true;
}

}

}


public function valida_usuario($username){

$usuario_id = $this->input->post('usuario_id');
if(!$usuario_id){
 //cadastrando

if($this->core_model->get_by_id('users', array('username'=> $username) )){
$this-> form_validation->set_message('valida_usuario','Esse usuário já existe');
return false;


}else{
 
return true;
}
}else{

if($this->core_model->get_by_id('users', array('username'=> $username, 'id !=' => $usuario_id) )){
$this-> form_validation->set_message('valida_usuario','Esse usuário já existe');
return false;


}else{
 
return true;
}

}

}


public function delete ($usuario_id= NULL ){
$usuario = (int) $usuario_id;

if (!$usuario_id ||  !$this->ion_auth->user($usuario_id)->row()){
$this->session->set_flashdata('erro', 'Usuário não localizado');
redirect('restrita/usuarios');

}else{

if($this->ion_auth->is_admin($usuario_id) ){
$this->session->set_flashdata('erro', 'Não é permitido excluir usuário com perfil de administrador');
redirect('restrita/usuarios');
}

if($this->ion_auth->delete_user($usuario_id)){
$this->session->set_flashdata('sucesso', 'Usuário removido com sucesso');



}else{
$this->session->set_flashdata('erro', 'Erro ao remover usuário');

}
redirect('restrita/usuarios');
}

}

//codigos antes dessa chave

}


