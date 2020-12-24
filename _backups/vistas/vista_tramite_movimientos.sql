DROP VIEW IF EXISTS vista_tramite_movimientos;
CREATE VIEW vista_tramite_movimientos AS
SELECT
        tm.*, ori.id_cargo, t.prioridad, t.documento, t.codigo, t.tipo_origen, t.id_empresa_externo, t.id_tipo_documento,
        td.periodo_max,
        t.flag_fisico, t.asunto, car.nombre AS cargo, p.nombre_completo, ac.nombre AS accion, o.nombre AS oficina,
        d.estado_destinatario, u.id_usuario AS id_usuario_destino, 
        e.nombre_completo AS empresa, e.tipo_documento AS empresa_tipo_documento, e.numero_documento AS empresa_numero_documento,
        ori.id_oficina, ofori.id_oficina AS id_oficina_origen, ofori.nombre AS oficina_origen, 
        pori.nombre_completo AS nombre_completo_origen, caori.nombre AS cargo_origen,
        ori.id_cargo AS id_id_cargo_origen,
        ure.nombre_usuario AS reemplazo_nombre_usuario,
        pre.nombre_completo AS reemplazo_nombre_completo,
        sori.nombre AS sede_origen,
        s.nombre AS sede
        FROM tramite_movimiento tm 
        JOIN cargos_usuarios ori ON ori.id_cargo_usuario = tm.id_cargo_origen
        JOIN oficinas ofori ON ofori.id_oficina = ori.id_oficina
        JOIN usuarios uori ON uori.id_usuario = ori.id_usuario
        JOIN personas pori ON pori.id_persona = uori.id_persona
        JOIN cargos caori ON caori.id_cargo = ori.id_cargo
        JOIN tramite_destinatarios d ON d.id_tramite_movimiento = tm.id_tramite_movimiento
        JOIN tramite t ON tm.id_tramite = t.id_tramite
        JOIN tipos_documento td ON td.id_tipo_documento = t.id_tipo_documento
        JOIN personas e ON e.id_persona = t.id_empresa_externo
        JOIN cargos_usuarios cu ON cu.id_cargo_usuario = d.id_cargo_usuario
        JOIN cargos car ON car.id_cargo = cu.id_cargo
        JOIN acciones ac ON ac.id_accion = tm.id_accion
        JOIN oficinas o ON o.id_oficina = cu.id_oficina
        JOIN usuarios u ON u.id_usuario = cu.id_usuario
        JOIN personas p ON p.id_persona = u.id_persona
        JOIN sedes sori ON sori.id_sede = ofori.id_oficina
        JOIN sedes s ON s.id_sede = o.id_oficina
        LEFT JOIN usuarios_reemplazo re ON re.id_usuario_reemplazo = tm.id_usuario_reemplazo 
        LEFT JOIN usuarios ure ON ure.id_usuario = re.id_usuario
        LEFT JOIN personas pre ON pre.id_persona = ure.id_persona
