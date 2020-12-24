<?php
    
defined('BASEPATH') OR exit('No direct script access allowed');

class Tracking extends CI_Controller {

	public function __construct(){
		
		parent::__construct();
		$this->load->model('tramite_model');
	
	}


	public function ver($id_venta_producto = 0){

		$query = $this->db->get_where("vista_ventas_productos", ["id_venta_producto" => $id_venta_producto]);
		$row = $query->row_array();

		if(!$row) return error("No se encontró este movimiento");

		$this->db->where("id_venta_producto", $id_venta_producto);
		$query = $this->db->get("vista_viajes_detalles");

		$venta = $this->db->get_where("ventas", ["id_venta" => $row["id_venta"]]);

	
		json(["venta" => $row, "movimiento" => $row, "historial" => $query->result_array()]);

	}

	public function consultas(){

		$id_usuario = $this->session->get_userdata()["id_usuario"];

		$filter = "";

		$i = 0;      
		$columns = array(
			['db' => 'id_tramite_movimiento','dt' => $i++],
			['db' => 'tipo_origen','dt' => $i++, "search_type" => "array"],
			['db' => 'codigo','dt' => $i++, "search_type" => "codigo"],
			['db' => 'accion','dt' => $i++],
			['db' => 'empresa','dt' => $i++],
			['db' => 'id_empresa_externo','dt' => $i++],
			['db' => 'tipo_movimiento','dt' => $i++],

			['db' => 'id_sede_origen','dt' => $i++, "search_type" => "array"],
			['db' => 'sede_origen','dt' => $i++],
			['db' => 'oficina_origen','dt' => $i++],
			['db' => 'cargo_origen','dt' => $i++],
			['db' => 'nombre_completo_origen','dt' => $i++],

			['db' => 'id_sede','dt' => $i++, "search_type" => "array"],
			['db' => 'sede','dt' => $i++],
			['db' => 'oficina','dt' => $i++],
			['db' => 'cargo','dt' => $i++],
			['db' => 'nombre_completo','dt' => $i++],

			['db' => 'id_oficina','dt' => $i++, "search_type" => "array"],
			['db' => 'id_oficina_origen','dt' => $i++, "search_type" => "array"],
			['db' => 'id_cargo','dt' => $i++, "search_type" => "array"],
			['db' => 'id_id_cargo_origen','dt' => $i++, "search_type" => "array"],

			['db' => 'documento','dt' => $i++],
			['db' => 'mensaje','dt' => $i++],
			['db' => 'flag_adjunto','dt' => $i++],
			['db' => 'nombre_archivo','dt' => $i++],
			['db' => 'id_tipo_documento','dt' => $i++, "search_type" => "array"],
			['db' => 'fecha','dt' => $i++],
			['db' => 'prioridad','dt' => $i++, "search_type" => "array"],
			['db' => 'reemplazo_nombre_completo','dt' => $i++, "search_type" => "array"],
			['db' => 'plazo','dt' => $i++],
			['db' => 'fecha_plazo','dt' => $i++],
			['db' => 'fecha_plazo_diff','dt' => $i++],
			['db' => 'tipo_plazo','dt' => $i++],
			['db' => 'estado_destinatario','dt' => $i++]
		);

		$post_columns = $this->input->post_get("columns");

		foreach($columns AS $j => $column){
			if(!empty($post_columns[$j]["search"]["value"])){
				
				$value = $post_columns[$j]["search"]["value"];
				$_POST["columns"][$j]["search"]["value"] = "";

				switch($column["search_type"]){
					case "array":
						$value = implode(",", array_map("intval", explode(",", $value)));
						$filter .= (!empty($filter) ? "AND " : "") . " $column[db] IN($value) ";
					break;
					case "codigo":
						$filter .= (!empty($filter) ? "AND " : "") . " $column[db] LIKE " . $this->db->escape($value . "%") . " ";
					break;
				}
				
			}
		}

		$desde = $this->input->post_get("desde", "");
		$hasta = $this->input->post_get("hasta", "");
		$dias = $this->input->post_get("dias", 0);

		if(!empty($desde)) $filter .= (!empty($filter) ? "AND " : "") . " fecha >= " . $this->db->escape($desde) . " ";
		if(!empty($hasta)) $filter .= (!empty($hasta) ? "AND " : "") . " fecha <= " . $this->db->escape(date('Y-m-d', strtotime($hasta)) . " 23:59:59") . " ";
		if($dias > 0){
			$hace_x_dias = date("Y-m-d", strtotime('-'.$dias.' days', time())) . " 00:00:00";
			$filter .= (!empty($hasta) ? "AND " : "") . " fecha >= " . $this->db->escape($hace_x_dias) . " ";
		}

		$plazo = (int) $this->input->post_get("plazo", 0);

		if($plazo > 0){
			$filter .= (!empty($filter) ? "AND " : "") . " fecha_plazo_diff >= " . $plazo . " ";
		}
	
		//p($filter);

		$sql_details = [
			'user' => $this->db->username,
			'pass' => $this->db->password,
			'db'   => $this->db->database,
			'host' => $this->db->hostname
		];
		    
		$json = SSP::complex( $_POST, $sql_details, 'vista_tramite_consultas', 'id_tramite_movimiento', $columns, null, $filter);

		json($json);

	}
	
	public function listar($tipo){

		$id_usuario = $this->session->get_userdata()["id_usuario"];

		$filter = "";

		switch($tipo){
			case "recibidos" :
				$filter = "id_usuario_destino = $id_usuario AND tipo_movimiento != 3";
			break;
			case "pendientes" :
				$filter = "estado_destinatario = " . ESTADO_DESTINATARIO_RECIBIDO . " AND id_usuario_destino = $id_usuario AND tipo_movimiento != 3 AND estado_tramite != 4";
			break;
			case "enviados" :
				$filter = "id_usuario = $id_usuario AND tipo_movimiento != 3";
			break;
			case "archivados" :
				$filter = "id_usuario = $id_usuario AND tipo_movimiento = 3";
			break;
		}

		$i = 0;      
		$columns = array(
			['db' => 'id_tramite_movimiento','dt' => $i++],
			['db' => 'tipo_origen','dt' => $i++],
			['db' => 'empresa','dt' => $i++],
			['db' => 'id_empresa_externo','dt' => $i++],
			['db' => 'tipo_movimiento','dt' => $i++],
			['db' => 'cargo_origen','dt' => $i++],
			['db' => 'oficina_origen','dt' => $i++],
			['db' => 'cargo','dt' => $i++],
			['db' => 'oficina','dt' => $i++],
			['db' => 'nombre_completo_origen','dt' => $i++],
			['db' => 'codigo','dt' => $i++],
			['db' => 'accion','dt' => $i++],
			['db' => 'flag_adjunto','dt' => $i++],
			['db' => 'nombre_archivo','dt' => $i++],
			['db' => 'fecha','dt' => $i++],
			['db' => 'estado_destinatario','dt' => $i++],
			['db' => 'documento','dt' => $i++],
			['db' => 'asunto','dt' => $i++],
			['db' => 'periodo_max','dt' => $i++],
			['db' => 'nombre_completo','dt' => $i++],
			['db' => 'mensaje','dt' => $i++],
			['db' => 'prioridad','dt' => $i++],
			['db' => 'reemplazo_nombre_completo','dt' => $i++],
			['db' => 'email','dt' => $i++],
			['db' => 'id_tipo_documento','dt' => $i++],
			['db' => 'codigo_referencia','dt' => $i++],
			['db' => 'plazo','dt' => $i++],
			['db' => 'fecha_plazo','dt' => $i++],
			['db' => 'fecha_plazo_diff','dt' => $i++],
			['db' => 'tipo_plazo','dt' => $i++],
		);
		$sql_details = [
			'user' => $this->db->username,
			'pass' => $this->db->password,
			'db'   => $this->db->database,
			'host' => $this->db->hostname
		];

		if(isset($_POST["search"]) && !empty($_POST["search"]["value"])){
			$regex_origen = '/^(INT|EXT)/i';
			if(preg_match($regex_origen, $_POST["search"]["value"], $origen_result)){
				$tipo_origen = strtoupper($origen_result[1]) === "INT" ? 1 : 2;
				$filter .= (empty($filter) ? "" : " AND ") . "tipo_origen = $tipo_origen";
			}
			$_POST["search"]["value"] = preg_replace($regex_origen, '', $_POST["search"]["value"]);
		}
		    
		$json = SSP::complex( $_POST, $sql_details, 'vista_tramite_movimientos', 'id_tramite_movimiento', $columns, null, $filter);

		json($json);

	}

	public function lista_productos(){

		$_POST = json_decode(file_get_contents('php://input'), true);

		$id_local = (int) ($this->input->post_get("id_local", 0));
		$id_estado_envio = (int) ($this->input->post_get("id_estado_envio", 0));
		$id_categoria = (int) ($this->input->post_get("id_categoria", 0));

		$filtros = ["estado" => 1];

		if($id_local) $filtros["id_local_actual"] = $id_local;
		if($id_estado_envio) $filtros["id_estado_envio"] = $id_estado_envio;
		if($id_categoria) $filtros["id_categoria"] = $id_categoria;

		$query = $this->db->get_where("vista_ventas_productos", $filtros);
		$items = $query->result_array();
		return json($items);
	}

	
	public function guardar_envio(){
		
		$_POST = json_decode(file_get_contents('php://input'), true);
		
		$origen = (int) $this->input->post_get("origen");
		$id_local = (int) $this->input->post_get("id_local");
		$id_estado_envio = (int) $this->input->post_get("id_estado_envio");

		$observacion = $this->input->post_get("observacion");
		$observacion = !empty($observacion) ? trim((string) $observacion) : ""; 
		$observacion = $observacion ? $observacion : null;

		
		$selected = $this->input->post_get("selected", []);
		
		$selected = array_map(function($item){
			return (int) $item;
		}, $selected);

		$fields = [
			"origen" => $origen,
			"id_local" => $id_local,
			"id_estado_envio" => $origen == 1 ? 2 : $id_estado_envio,
			
			"observacion" => $observacion,
			"fecha" => date("Y-m-d H:i:s"),
			"fecha_actualizacion" => date("Y-m-d H:i:s"),
		];

		$guardar = $this->tramite_model->guardar_envio($fields, [], 1, NULL, $selected);

		if(is_string($guardar)) return error($guardar);
		if($guardar === false) return error("Error al guardar registros, por favor intente nuevamente");

		return json(["ok" => 1]);

	}

	public function guardar(){
		
		$_POST = json_decode(file_get_contents('php://input'), true);

		$flag_compra_cliente = one_zero($this->input->post_get("flag_compra_cliente", 0));
		$flag_envio_cliente = one_zero($this->input->post_get("flag_envio_cliente", 0));
		
		$id_cliente = (int) $this->input->post_get("id_cliente");
		$id_servicio = (int) $this->input->post_get("id_servicio");

		//$id_local_recepcion = (int) $this->input->post_get("id_local_recepcion");
		//$id_local_actual = (int) $this->input->post_get("id_local_actual");
		$id_local_actual = 1; //EN PROCESO COMPRA
		
		$productos = $this->input->post_get("productos", []);
		$productos = is_array($productos) ? array_filter($productos, function($item){
			return is_array($item) && !empty($item["nombre_producto"]);
		}) : [];

		$fields = [
			"id_servicio" => $id_servicio,
			"id_cliente" => $id_cliente,
			"flag_compra_cliente" => $flag_compra_cliente,
			"flag_envio_cliente" => $flag_envio_cliente,

			//"id_local_recepcion" => $id_local_recepcion,
			"id_local_actual" => $id_local_actual,


			"fecha" => date("Y-m-d H:i:s"),
			"fecha_actualizacion" => date("Y-m-d H:i:s"),
		];

		$guardar = $this->tramite_model->guardar($fields, [], 1, NULL, $productos);

		if(is_string($guardar)) return error($guardar);
		if($guardar === false) return error("Error al generar registro, por favor intente nuevamente");

		return json(["ok" => 1]);

	}

	public function notificar_externo(){

		/*$id_tramite = $this->input->post_get("id_tramite");
		$tramite = $this->db->get_where("vista_tramite", ["id_tramite" => $id_tramite]);
		$tramite = $tramite->row_array();

		$data = [
			"tramite" => $tramite,
			"url_tramite" => $this->config->item("base_url") . "consulta?codigo=$tramite[codigo]"
		];
	
		$config = Array(
			'protocol' => 'smtp',
			//'smtp_host' => 'ssl://tramite.phuyufact.com',
			'smtp_host' => 'ssl://mail.phuyufact.com',
			'smtp_port' => 465,
			'smtp_user' => 'tramite@phuyufact.com',
			'smtp_pass' => 'Equicomx1.!',
			'mailtype'  => 'html'
		);

		$this->load->library('parser');
		$this->load->library('email', $config);
		$this->email->set_newline("\r\n");

		$email_html = $this->parser->parse("email/notificar_externo.html", $data, true);
		$email_html_footer = $this->parser->parse("email/footer.html", array(), true);

		$this->email->subject("Notificación - Gestión Documental");
		$this->email->from('tramite@phuyufact.com', 'Gestión Documental');
		//$this->email->to($tramite['email']);
		$this->email->to("wz.vang@gmail.com");
		$this->email->message($email_html . $email_html_footer);

		$ok = $this->email->send();

		p($this->email->print_debugger());

		return $ok;*/

	}
	
	public function upload(){

		$config = [];

		$config['upload_path']          = './uploads/tramite___tmp/';
		$config['allowed_types']        = 'docx|doc|xlsx|xls|pdf|ppt|zip|rar|jpg|gif|png|jpeg|bmp';
		$config['max_size']             = 100000;
		$config['file_ext_tolower']     = true;
		$config['encrypt_name']         = true;

		$this->load->library('upload', $config);

		if(!file_exists($config['upload_path'])){
			if(!mkdir($config['upload_path'], 0777, true)) return error("Error al crear ruta de subida, por favor establezca permisos");
		}

		if ( ! $this->upload->do_upload('file')){
			$error_str = $this->upload->display_errors();
			
			if(preg_match("/larger/", $error_str)) $error_str = "El archivo enviado excede los " . number_format($config['max_size']/1000, 2) . "MB permitidos";
			elseif(preg_match("/allowed/", $error_str)) $error_str = "El archivo enviado no está permitido";
			return error($error_str);
		}
		else{
			$data = array('upload_data' => $this->upload->data());
			return json($data);
		}
	}
}
