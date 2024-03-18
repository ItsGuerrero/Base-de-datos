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
                         || ' años.');

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
    dbms_output.put_line('Multiplicación: ' || v_multiplicacion);
    IF v_numero2 <> 0 THEN
        dbms_output.put_line('División: ' || v_division);
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
    dbms_output.put_line('El mayor de los dos números es: ' || v_mayor);
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

DECLARE
TYPE rec_empleado IS RECORD
(
nombre employees.first_name%TYPE,
apellido employees.last_name%TYPE,
salario employees.salary%TYPE,
email employees.email%TYPE
);
miempleado rec_empleado;
BEGIN
miempleado.nombre := 'Pepe';
miempleado.apellido := 'Martin';
miempleado.salario := 1200;
miempleado.email := 'pepemartin@gmail.com';
DBMS_OUTPUT.PUT_LINE('Nombre: ' ||miempleado.nombre);
END;

DECLARE
TYPE numeros IS VARRAY(10) OF NUMBER;
--miarray numeros := numeros(0, 0, 0, 0, 0, 0, 0, 0, 0, 0); --INICIALIZAMOS
miarray numeros := numeros(); --Inicializamos vacio
BEGIN
FOR i IN 1..10 LOOP
miarray.EXTEND(); --Extend amplia a un elemento nulo
miarray(i) := i; --Asignamos el valor
END LOOP;
FOR i IN 1..miarray.count LOOP
DBMS_OUTPUT.PUT_LINE(' Numeros ' || miarray(i));
END LOOP;
END;

DECLARE
TYPE
t_numeros IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
v_numeros t_numeros;
v_total NUMBER;
BEGIN
FOR i IN 1..50 LOOP
    v_numeros(i) := i;
END LOOP;
v_total := v_numeros.COUNT;
END;

DECLARE
    TYPE PAIS_TYPE IS RECORD (
        codigo_pais VARCHAR2(3),
        nombre_pais VARCHAR2(50),
        continente VARCHAR2(50)
    );

    v_pais PAIS_TYPE;

BEGIN
    -- Asignar valores al registro
    v_pais.codigo_pais := 'ESP';
    v_pais.nombre_pais := 'España';
    v_pais.continente := 'Europa';

    -- Mostrar los valores del registro
    DBMS_OUTPUT.PUT_LINE('Código del país: ' || v_pais.codigo_pais);
    DBMS_OUTPUT.PUT_LINE('Nombre del país: ' || v_pais.nombre_pais);
    DBMS_OUTPUT.PUT_LINE('Continente: ' || v_pais.continente);
END;
/

DECLARE
    TYPE PAIS_TYPE IS RECORD (
        codigo_pais VARCHAR2(3),
        nombre_pais VARCHAR2(50),
        continente VARCHAR2(50)
    );

    -- Declaración de la variable tipo PAIS
    otro_pais PAIS_TYPE;

BEGIN
    -- Asignar valores a la variable otro_pais
    otro_pais.codigo_pais := 'USA';
    otro_pais.nombre_pais := 'Estados Unidos';
    otro_pais.continente := 'América';

    -- Mostrar los valores asignados a otro_pais
    DBMS_OUTPUT.PUT_LINE('Código del país: ' || otro_pais.codigo_pais);
    DBMS_OUTPUT.PUT_LINE('Nombre del país: ' || otro_pais.nombre_pais);
    DBMS_OUTPUT.PUT_LINE('Continente: ' || otro_pais.continente);
END;
/

DECLARE
    TYPE t_CIUDADES IS TABLE OF VARCHAR2(50);
    misciudades t_CIUDADES := t_CIUDADES('Ciudad A', 'Ciudad B', 'Ciudad C', 'Ciudad D');
BEGIN
    -- Acceder a los elementos de la variable misciudades
    FOR i IN 1..misciudades.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Ciudad ' || i || ': ' || misciudades(i));
    END LOOP;
END;
/

DECLARE
    TYPE t_CIUDADES IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;

    -- Declarar la variable misciudades y asignar valores
    misciudades t_CIUDADES;
BEGIN
    -- Asignar valores a la variable misciudades
    misciudades(1) := 'MADRID';
    misciudades(2) := 'MALAGA';
    misciudades(3) := 'BILBAO';

    -- Mostrar el primer elemento de misciudades
    DBMS_OUTPUT.PUT_LINE('Primer elemento: ' || misciudades(misciudades.FIRST));

    -- Mostrar el último elemento de misciudades
    DBMS_OUTPUT.PUT_LINE('Último elemento: ' || misciudades(misciudades.LAST));
END;
/

DECLARE
    TYPE t_CIUDADES IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;

    -- Declarar la variable misciudades y asignar valores
    misciudades t_CIUDADES;
    ciudad_a_buscar VARCHAR2(50) := 'MALAGA'; -- Ciudad a buscar
    num_registros INTEGER; -- Variable para almacenar el número de registros

BEGIN
    -- Asignar valores a la variable misciudades
    misciudades(1) := 'MADRID';
    misciudades(3) := 'BILBAO';

    -- Comprobar si la ciudad MALAGA existe en misciudades
    IF misciudades.EXISTS(2) THEN
        DBMS_OUTPUT.PUT_LINE('La ciudad MALAGA existe.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La ciudad MALAGA no existe.');
    END IF;

    -- Contar el número de registros de la tabla
    num_registros := misciudades.COUNT;
    DBMS_OUTPUT.PUT_LINE('Número de registros de la tabla: ' || num_registros);
END;
/
