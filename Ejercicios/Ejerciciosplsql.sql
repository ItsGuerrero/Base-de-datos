BEGIN
    dbms_output.put_line('Hola Mundo');
END;
/

DECLARE
    v_nombre VARCHAR2(50);
    v_edad   NUMBER;
BEGIN
    -- Solicitar nombre y edad
    v_nombre := '&Ingrese_su_nombre';
    v_edad := &ingrese_su_edad;
    
    -- Mostrar mensaje personalizado
    dbms_output.put_line('Buenas tardes '
                         || v_nombre
                         || ', tienes '
                         || v_edad
                         || ' a�os.');

END;
/

DECLARE
    v_numero1        NUMBER := &ingrese_primer_numero;
    v_numero2        NUMBER := &ingrese_segundo_numero;
    v_suma           NUMBER;
    v_resta          NUMBER;
    v_multiplicacion NUMBER;
    v_division       NUMBER;
    v_potencia       NUMBER;
BEGIN
    -- Realizar operaciones
    v_suma := v_numero1 + v_numero2;
    v_resta := v_numero1 - v_numero2;
    v_multiplicacion := v_numero1 * v_numero2;
    IF v_numero2 <> 0 THEN
        v_division := v_numero1 / v_numero2;
    ELSE
        dbms_output.put_line('No es posible dividir entre cero.');
    END IF;

    v_potencia := power(v_numero1, v_numero2);

    -- Mostrar resultados
    dbms_output.put_line('Suma: ' || v_suma);
    dbms_output.put_line('Resta: ' || v_resta);
    dbms_output.put_line('Multiplicaci�n: ' || v_multiplicacion);
    IF v_numero2 <> 0 THEN
        dbms_output.put_line('Divisi�n: ' || v_division);
    END IF;

    dbms_output.put_line('Potencia: ' || v_potencia);
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_nombre   employees.first_name%TYPE;
    v_apellido employees.last_name%TYPE;
    v_job_id   employees.job_id%TYPE;
BEGIN
    -- Asignar valores a las variables (por ejemplo, primer registro de la tabla)
    SELECT
        first_name,
        last_name,
        job_id
    INTO
        v_nombre,
        v_apellido,
        v_job_id
    FROM
        employees
    WHERE
        ROWNUM = 1;

    -- Mostrar los valores por pantalla
    dbms_output.put_line('Nombre: ' || v_nombre);
    dbms_output.put_line('Apellido: ' || v_apellido);
    dbms_output.put_line('Job ID: ' || v_job_id);
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_variable1 NUMBER;
    v_variable2 NUMBER;
    v_mayor     NUMBER;
BEGIN
    -- Leer valores de las variables
    v_variable1 := &ingrese_variable1;
    v_variable2 := &ingrese_variable2;
    
    -- Encontrar el mayor de los dos
    IF v_variable1 > v_variable2 THEN
        v_mayor := v_variable1;
    ELSE
        v_mayor := v_variable2;
    END IF;
    
    -- Mostrar el mayor en pantalla
    dbms_output.put_line('El mayor de los dos n�meros es: ' || v_mayor);
END;
/

DECLARE
    v_goles_local     NUMBER;
    v_goles_visitante NUMBER;
    v_resultado       VARCHAR2(20);
    v_signo_quiniela  CHAR(1);
BEGIN
    -- Leer los goles del equipo local y visitante
    v_goles_local := &goles_del_equipo_local;
    v_goles_visitante := &goles_del_equipo_visitante;
    
    -- Determinar el resultado del partido
    IF v_goles_local > v_goles_visitante THEN
        v_resultado := 'Gana el equipo local';
    ELSIF v_goles_local < v_goles_visitante THEN
        v_resultado := 'Gana el equipo visitante';
    ELSE
        v_resultado := 'Empate';
    END IF;
    
    -- Determinar el signo de la quiniela
    IF v_goles_local > v_goles_visitante THEN
        v_signo_quiniela := '1'; -- Gana el equipo local
    ELSIF v_goles_local < v_goles_visitante THEN
        v_signo_quiniela := '2'; -- Gana el equipo visitante
    ELSE
        v_signo_quiniela := 'X'; -- Empate
    END IF;
    
    -- Mostrar el resultado del partido y el signo de la quiniela
    dbms_output.put_line('Resultado del partido: ' || v_resultado);
    dbms_output.put_line('Signo de la quiniela: ' || v_signo_quiniela);
END;
/