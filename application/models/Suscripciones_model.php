<?php

class Suscripciones_model extends MY_Model {
    
    public $vista = 'suscripciones';
    public $primary_key = 'subscription_id';
    public $columns = array(
        [
            'db' => 'subscription_id',
            'dt' => 0
        ],
        [
            'db' => 'plan_id',
            'dt' => 1,
            'title' => 'Plan',
        ],
        [
            'db' => 'user_id',
            'dt' => 2,
            'title' => 'Usuario',
        ],
        [
            'db' => 'price_amount',
            'dt' => 3,
            'title' => 'Precio',
        ],
        [
            'db' => 'paid_amount',
            'dt' => 4,
            'title' => 'Total pagado',
        ],
        [
            'db' => 'timestamp_from',
            'dt' => 5,
            'title' => 'Desde',
        ],
        [
            'db' => 'timestamp_to',
            'dt' => 6,
            'title' => 'Hasta',
        ],
        [
            'db' => 'payment_method',
            'dt' => 7,
            'title' => 'Método de pago',
        ],
        [
            'db' => 'payment_timestamp',
            'dt' => 8,
            'title' => 'Fecha de pago',
        ],
        [
            'db' => 'estado',
            'dt' => 9,
            'title' => 'Estado',
        ]
    );
 
    public function buscar($str){
        $this->db->like('payment_method', $str);
        //$this->db->limit(10);
   
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}