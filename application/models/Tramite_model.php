<?php

class Tramite_model extends CI_Model {

    public $vista = 'vista_tramite';
    public $primary_key = 'id_tramite';
    public $columns = array(
        [
            'db' => 'id_tramite',
            'dt' => 0
        ],
        [
            'db' => 'nombre_sede',
            'dt' => 1,
            'title' => 'Sede'
        ],
        [
            'db' => 'nombre',
            'dt' => 2,
            'title' => 'Oficina',
            'prompt' => 'Nombre de oficina'
        ],
        [
            'db' => 'descripcion',
            'dt' => 3,
            'title' => 'Descripción',
            'prompt' => 'Descripción'
        ],
        [
            'db' => 'estado',
            'dt' => 4,
            'title' => 'Estado'
        ]
    );
    public $codigo_generado = null;

    public function listar($estado = 1){
                        
        $sql_details = [
            'user' => $this->db->username,
            'pass' => $this->db->password,
            'db'   => $this->db->database,
            'host' => $this->db->hostname
        ];
        
        return SSP::complex( $_GET, $sql_details, $this->vista, $this->primary_key, $this->columns, null, "estado = $estado" );
    }

    public function buscar($str){
        $this->db->like('nombre', $str);
        $this->db->or_like('descripcion', $str);
        $this->db->limit(10);
        return $this->db->get($this->vista);
    }

    public function listarTodos(){
        $this->db->select('id_sede, id_oficina, nombre');
        $query = $this->db->get($this->vista);        
        return $query->result_array();
    }

    public function guardar_envio($fields, $destinatarios, $tipo_movimiento, $id_tramite = NULL, $selected = [], $restaurar = false){

        $this->db->trans_begin();

        $movimiento = [];
        $codigo_generado = null;

        //Guardamos cabecera
        if($tipo_movimiento === 1){
            $this->db->insert("viajes", $fields);
            $id_tramite = $this->db->insert_id();
 
        }else{

        }

        if(!count($selected)) return "No hay productos seleccionados";

        $items = [];
        
        foreach($selected AS $id_venta_producto){
            $items[] = [
                "id_viaje" => $id_tramite,
                "id_venta_producto" => $id_venta_producto,
                "id_estado_envio" => $fields["id_estado_envio"],
                "fecha" => date("Y-m-d H:i:s"),
                "fecha_actualizacion" => date("Y-m-d H:i:s"),
            ];
            //Update actual
            $this->db->where("id_venta_producto", $id_venta_producto);
            $update_actual = $this->db->update("ventas_productos", [
                "id_local_actual" => $fields["id_local"], 
                "id_estado_envio" => $fields["id_estado_envio"],
                "fecha_actualizacion" => date("Y-m-d H:i:s")]);
            if(!$update_actual) return "Error al actualizar registro, por favor intente nuevamente";
        }
        
        $insert_batch = $this->db->insert_batch('viajes_detalles', $items);
        if(!$insert_batch) return "No fue posible agregar un producto, por favor intente nuevamente";

        //Si no hay errores, ejecutamos, si no ..restauramos la transacción
        if($this->db->trans_status() === FALSE){
            $this->db->trans_rollback();
            return false;
        }else{
            $this->db->trans_commit();
            return $id_tramite;
        }
    }

    public function guardar($fields, $destinatarios, $tipo_movimiento, $id_tramite = NULL, $productos = [], $restaurar = false){

        $this->db->trans_begin();

        $movimiento = [];
        $codigo_generado = null;

        //Guardamos cabecera
        if($tipo_movimiento === 1){
            $this->db->insert("ventas", $fields);
            $id_tramite = $this->db->insert_id();
           
            //Obtener código generado
            /*$this->db->select("codigo");
            $row_codigo_generado = $this->db->get_where("tramite", ["id_tramite" => $id_tramite]);
            $codigo_generado = $row_codigo_generado->row_array();
            $codigo_generado = $codigo_generado["codigo"];
            $this->codigo_generado = $codigo_generado;*/
        }else{

        }

        if(!count($productos)) return "Agrega los productos";

        $items = [];

        foreach($productos AS $item){
            $items[] = [
                "id_venta" => $id_tramite,
                "nombre_producto" => $item["nombre_producto"],
                "id_categoria" => $item["id_categoria"],
                "precio" => $item["precio"],
                "id_unidad_medida" => $item["id_unidad_medida"],
                "foto" => $item["foto"],
                "cantidad" => $item["cantidad"],
                "upc" => !empty($item["upc"]) ? $item["upc"] : null,
                "fecha" => date("Y-m-d H:i:s"),
                "fecha_actualizacion" => date("Y-m-d H:i:s"),
            ];
        }
        
        $insert_batch = $this->db->insert_batch('ventas_productos', $items);
        if(!$insert_batch) return "No fue posible agregar productor, por favor intente nuevamente";


        /*foreach($archivos AS $item){

            $nombre_archivo_codificado = $item[0];
            $nombre_archivo_original = $item[1];
            $is_firmado = isset($item[2]) ? $item[2] : 0;
            
            $lineas_archivo = [
                "id_tramite_movimiento" => $id_tramite_movimiento,
                "archivo" => $nombre_archivo_codificado,
                "nombre_archivo_original" => substr($nombre_archivo_original, 0, 255),
                "fecha_registro" => DATETIME_NOW,
            ];

            $insert_linea_archivo = $this->db->insert("tramite_movimiento_archivos", $lineas_archivo);

            if(!$insert_linea_archivo) return "No fue posible agregar archivo $nombre_archivo_original, por favor intente nuevamente";

                   
        }*/

        //Si no hay errores, ejecutamos, si no ..restauramos la transacción
        if($this->db->trans_status() === FALSE){
            $this->db->trans_rollback();
            return false;
        }else{
            $this->db->trans_commit();
            return $id_tramite;
        }
    }
}