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

DECLARE
TYPE nombres IS VARRAY(10) OF VARCHAR2(30);
misnombres nombres := nombres('Juan', 'Pepe', 'Luis');
BEGIN
    FOR i IN 1..misnombres.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('NOMBRES ' || misnombres(i));
    END LOOP;
END;

DECLARE
v_salary employees.salary%type;
v_apellido employees.last_name%type;
BEGIN
SELECT last_name, salary INTO v_apellido, v_salary
FROM hr.employees
WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE('Salario es ' || v_salary);
DBMS_OUTPUT.PUT_LINE('Apellido es ' || v_apellido);
END;

DECLARE rec_empleado hr.employees%rowtype;
BEGIN
SELECT * INTO rec_empleado FROM hr.employees WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE('ID = ' || rec_empleado.employee_id);
DBMS_OUTPUT.PUT_LINE('Nombre = ' || rec_empleado.first_name);
DBMS_OUTPUT.PUT_LINE('Apellido = ' || rec_empleado.last_name);
DBMS_OUTPUT.PUT_LINE('Salario = ' || rec_empleado.salary);
END;

DECLARE
CURSOR cur_locations
IS
SELECT
location_id, city
FROM locations;

loc_id hr.locations.location_id%type;
ciudad hr.locations.city%type;

BEGIN
OPEN cur_locations;
FETCH cur_locations INTO loc_id, ciudad;
DBMS_OUTPUT.PUT_LINE('LOC_ID: ' || loc_id);
DBMS_OUTPUT.PUT_LINE('CIUDAD: ' || ciudad);
CLOSE cur_locations;
END;

DECLARE
CURSOR cursorEmpleado IS
SELECT *
FROM hr.employees;
registroEmpleado hr.employees%ROWTYPE;
BEGIN
OPEN cursorEmpleado;
FETCH cursorEmpleado INTO registroEmpleado;
WHILE cursorEmpleado%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(registroEmpleado.employee_id || ' ' || registroEmpleado.last_name || ' ' || registroEmpleado.department_id);
FETCH cursorEmpleado INTO registroEmpleado;
END LOOP;
CLOSE cursorEmpleado;
DBMS_OUTPUT.PUT_LINE('Consulta con cursor finalizada');
END;

DECLARE
CURSOR cur_depart IS
SELECT department_id, department_name
FROM hr.departments;
BEGIN
FOR rec_departments IN cur_depart LOOP
DBMS_OUTPUT.PUT_LINE('ID: ' || rec_departments.department_id);
DBMS_OUTPUT.PUT_LINE('NAME: ' || rec_departments.department_name);
END LOOP;
END;