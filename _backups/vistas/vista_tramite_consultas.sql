DROP VIEW IF EXISTS vista_tramite_consultas;
CREATE VIEW vista_tramite_consultas AS

SELECT
    `tm`.`id_tramite_movimiento` AS `id_tramite_movimiento`,
    `tm`.`id_movimiento_origen` AS `id_movimiento_origen`,
    `tm`.`id_cargo_origen` AS `id_cargo_origen`,
    `tm`.`id_tramite` AS `id_tramite`,
    `tm`.`tipo_movimiento` AS `tipo_movimiento`,
    `tm`.`id_usuario` AS `id_usuario`,
    `tm`.`id_accion` AS `id_accion`,
    `tm`.`mensaje` AS `mensaje`,
    `tm`.`flag_adjunto` AS `flag_adjunto`,
    `tm`.`nombre_archivo` AS `nombre_archivo`,
    `tm`.`fecha` AS `fecha`,
    `tm`.`fecha_actualizacion` AS `fecha_actualizacion`,
    `tm`.`codigo_archivo` AS `codigo_archivo`,
    `ori`.`id_cargo` AS `id_id_cargo_origen`,
    `cu`.`id_cargo` AS `id_cargo`,
    `t`.`documento` AS `documento`,
    `t`.`prioridad` AS `prioridad`,
    `t`.`codigo` AS `codigo`,
    `t`.`tipo_origen` AS `tipo_origen`,
    `t`.`id_empresa_externo` AS `id_empresa_externo`,
    `t`.`id_tipo_documento` AS `id_tipo_documento`,
    `td`.`periodo_max` AS `periodo_max`,
    `t`.`flag_fisico` AS `flag_fisico`,
    `car`.`nombre` AS `cargo`,
    `p`.`nombre_completo` AS `nombre_completo`,
    `ac`.`nombre` AS `accion`,
    `o`.`nombre` AS `oficina`,
    `d`.`estado_destinatario` AS `estado_destinatario`,
    `u`.`id_usuario` AS `id_usuario_destino`,
    `e`.`nombre_completo` AS `empresa`,
    `e`.`tipo_documento` AS `empresa_tipo_documento`,
    `e`.`numero_documento` AS `empresa_numero_documento`,
    `o`.`id_sede` AS `id_sede`,
    `se`.`nombre` AS `sede`,
    `ofori`.`id_sede` AS `id_sede_origen`,
    `seori`.`nombre` AS `sede_origen`,
    `ori`.`id_oficina` AS `id_oficina`,
    `ofori`.`id_oficina` AS `id_oficina_origen`,
    `ofori`.`nombre` AS `oficina_origen`,
    `pori`.`nombre_completo` AS `nombre_completo_origen`,
    `caori`.`nombre` AS `cargo_origen`,
    ure.nombre_usuario AS reemplazo_nombre_usuario,
pre.nombre_completo AS reemplazo_nombre_completo
FROM

                                                                        `tramite_destinatarios` `d`
                                                                    JOIN `tramite_movimiento` `tm`
                                                                    ON
                                                                      
                                                                            `tm`.`id_tramite_movimiento` = `d`.`id_tramite_movimiento`
                                                          
                                                                JOIN `cargos_usuarios` `ori`
                                                                ON
                                                             
                                                                        `ori`.`id_cargo_usuario` = `tm`.`id_cargo_origen`
                                                          
                                                            JOIN `oficinas` `ofori`
                                                            ON
                                                      
                                                                    `ofori`.`id_oficina` = `ori`.`id_oficina`
                                                     
                                                        JOIN `sedes` `seori`
                                                        ON
                                                            `seori`.`id_sede` = `ofori`.`id_sede`
                                                    
                                                    JOIN `usuarios` `uori`
                                                    ON
                                                       
                                                            `uori`.`id_usuario` = `ori`.`id_usuario`
                                                    
                                                
                                                JOIN `personas` `pori`
                                                ON
                                                
                                                        `pori`.`id_persona` = `uori`.`id_persona`
                                                  
                                            JOIN `cargos` `caori`
                                            ON
                                                `caori`.`id_cargo` = `ori`.`id_cargo`
                                          
                                        JOIN `tramite` `t`
                                        ON
                                            `tm`.`id_tramite` = `t`.`id_tramite`
                                        
                                    JOIN `tipos_documento` `td`
                                    ON
                                        
                                            `td`.`id_tipo_documento` = `t`.`id_tipo_documento`
                                        
                                JOIN `personas` `e`
                                ON
                                    
                                        `e`.`id_persona` = `t`.`id_empresa_externo`
                                    
                            JOIN `cargos_usuarios` `cu`
                            ON
                                
                                    `cu`.`id_cargo_usuario` = `d`.`id_cargo_usuario`
                                
                        JOIN `cargos` `car`
                        ON
                            `car`.`id_cargo` = `cu`.`id_cargo`
                        
                    JOIN `acciones` `ac`
                    ON
                        `ac`.`id_accion` = `tm`.`id_accion`
                    
                JOIN `oficinas` `o`
                ON
                    `o`.`id_oficina` = `cu`.`id_oficina`
            
            JOIN `sedes` `se`
            ON
                `se`.`id_sede` = `o`.`id_sede`
            
        JOIN `usuarios` `u`
        ON
            `u`.`id_usuario` = `cu`.`id_usuario`
        
    JOIN `personas` `p`
    ON
        `p`.`id_persona` = `u`.`id_persona`
    LEFT JOIN usuarios_reemplazo re ON re.id_usuario_reemplazo = tm.id_usuario_reemplazo 
    LEFT JOIN usuarios ure ON ure.id_usuario = re.id_usuario 
    LEFT JOIN personas pre ON pre.id_persona = ure.id_persona