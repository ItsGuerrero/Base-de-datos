BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END;
/



DECLARE
    v_nombre VARCHAR2(50);
    v_edad   NUMBER;
BEGIN
    -- Solicitar nombre y edad
    v_nombre := '&Ingrese_su_nombre';
    v_edad := &Ingrese_su_edad;
    
    -- Mostrar mensaje personalizado
    DBMS_OUTPUT.PUT_LINE('Buenas tardes ' || v_nombre || ', tienes ' || v_edad || ' años.');
END;
/

DECLARE
    v_numero1    NUMBER := &Ingrese_primer_numero;
    v_numero2    NUMBER := &Ingrese_segundo_numero;
    v_suma       NUMBER;
    v_resta      NUMBER;
    v_multiplicacion NUMBER;
    v_division   NUMBER;
    v_potencia   NUMBER;
BEGIN
    -- Realizar operaciones
    v_suma := v_numero1 + v_numero2;
    v_resta := v_numero1 - v_numero2;
    v_multiplicacion := v_numero1 * v_numero2;

    IF v_numero2 <> 0 THEN
        v_division := v_numero1 / v_numero2;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No es posible dividir entre cero.');
    END IF;

    v_potencia := POWER(v_numero1, v_numero2);

    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('Suma: ' || v_suma);
    DBMS_OUTPUT.PUT_LINE('Resta: ' || v_resta);
    DBMS_OUTPUT.PUT_LINE('Multiplicación: ' || v_multiplicacion);

    IF v_numero2 <> 0 THEN
        DBMS_OUTPUT.PUT_LINE('División: ' || v_division);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Potencia: ' || v_potencia);
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_nombre    employees.first_name%TYPE;
    v_apellido  employees.last_name%TYPE;
    v_job_id    employees.job_id%TYPE;
BEGIN
    -- Asignar valores a las variables (por ejemplo, primer registro de la tabla)
    SELECT first_name, last_name, job_id
    INTO v_nombre, v_apellido, v_job_id
    FROM employees
    WHERE ROWNUM = 1;

    -- Mostrar los valores por pantalla
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || v_apellido);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_job_id);
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_variable1 NUMBER;
    v_variable2 NUMBER;
    v_mayor NUMBER;
BEGIN
    -- Leer valores de las variables
    v_variable1 := &Ingrese_variable1;
    v_variable2 := &Ingrese_variable2;
    
    -- Encontrar el mayor de los dos
    IF v_variable1 > v_variable2 THEN
        v_mayor := v_variable1;
    ELSE
        v_mayor := v_variable2;
    END IF;
    
    -- Mostrar el mayor en pantalla
    DBMS_OUTPUT.PUT_LINE('El mayor de los dos números es: ' || v_mayor);
END;
/



