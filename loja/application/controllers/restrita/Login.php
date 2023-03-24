<?php

defined('BASEPATH') OR exit ('Ação não permitida');
class Login extends CI_Controller{



public function index(){

$data = array(


'titulo'=> 'Login Área Restrita',

);

  $this->load->view ('restrita/layout/header', $data);
    $this->load->view ('restrita/login/index');
    $this->load->view ('restrita/layout/footer');

}

public function auth(){

    $identity = $this->input->post('email');
    $password = $this->input->post('password');
    $remember = ($this->input->post('remember' ? TRUE : FALSE ));
    
 $login = $this->input->post('login');

    
if($this->ion_auth->login($identity, $password, $remember )){
$this->session->set_flashdata('sucesso','Seja Bem Vindo(a)! ');
redirect('restrita');



}else{
$this->session->set_flashdata('erro',' Verifique suas credenciais de acesso ');
redirect('restrita/login');

}
}

public function logout (){

$this->ion_auth->logout();
redirect ('restrita/login');

}


}