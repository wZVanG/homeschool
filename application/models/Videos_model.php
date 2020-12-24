<?php

class Videos_model extends MY_Model {
    
    public $vista = 'vista_videos';
    public $primary_key = 'movie_id';
    public $columns = array(
        [
            'db' => 'movie_id',
            'dt' => 0
        ],
        [
        
            'db' => 'thumb',
            'dt' => 1,
            'title' => 'Imagen listado',
            'file' => [
                'type' => 'image',
                'module' => 'thumb',
                'draw' => true,
                'size' => [
                    "width" => 100,
                    "height" => 50,
                ],
                'className' => 'square'
            ]
        ],
        [
        
            'db' => 'imagen',
            'dt' => 2,
            'title' => 'Imagen',
            'file' => [
                'type' => 'image',
                'module' => 'portadas',
                'draw' => true,
                'size' => [
                    "width" => 100,
                    "height" => 50,
                ],
                'className' => 'square'
            ]
        ],
        [
            'db' => 'title',
            'dt' => 3,
            'title' => 'Título',
        ],
        [
            'db' => 'seo_url',
            'dt' => 4,
            'title' => 'SEO Url',
        ],
        [
            'db' => 'description_short',
            'dt' => 5,
            'title' => 'Descripción corta',
        ],
        [
            'db' => 'description_long',
            'dt' => 6,
            'title' => 'Descripción',
        ],
        [
            'db' => 'description_add',
            'dt' => 7,
            'title' => 'Descr. adicional',
        ],
        [
            'db' => 'id_genero',
            'dt' => 8,
            'title' => 'Género',
        ],
        [
            'db' => 'genero',
            'dt' => 9,
            'title' => 'Género',
        ],
        [
            'db' => 'id_categoria',
            'dt' => 10,
            'title' => 'Categoría',
        ],
        [
            'db' => 'categoria',
            'dt' => 11,
            'title' => 'Categoría',
        ],
        [
            'db' => 'url',
            'dt' => 12,
            'title' => 'URL',
        ],
        [
            'db' => 'trailer',
            'dt' => 13,
            'title' => 'Trailer',
        ],
        [
            'db' => 'year',
            'dt' => 14,
            'title' => 'Año',
        ],
        [
            'db' => 'actors',
            'dt' => 15,
            'title' => 'Actores',
        ],
        [
            'db' => 'categoria_url',
            'dt' => 16,
            'title' => 'Categoría URL',
        ],
        [
            'db' => 'estado',
            'dt' => 17,
            'title' => 'Estado',
        ]
    );
 
    public function buscar($str){
        $this->db->like('title', $str);
        //$this->db->limit(10);
   
        $query = $this->db->get($this->vista);
        return $query->result_array();
    }
  
}