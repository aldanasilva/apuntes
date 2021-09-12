let figuras = [
    'triangulo-grande-1',
    'triangulo-grande-2',
    'cuadrado',
    'triangulo-mediano',
    'triangulo-pequeno-1',
    'romboide',
    'triangulo-pequeno-2',
];

var posicion = 'inicial';

function cambiarPosicion(posicion) {
    figuras.forEach(figura => {
        let clazz = `${figura}-posicion`;
        let div = document.querySelector(`.${clazz}-${this.posicion}`);
        if (div != null) {
            div.classList.replace(
                `${clazz}-${this.posicion}`,
                `${clazz}-${posicion}`
            );
        }
    });
    this.posicion = posicion;
}

var btn = document.querySelector('#inicial');
btn.addEventListener('click', () => {
    cambiarPosicion('inicial');
});

btn = document.querySelector('#corredor');
btn.addEventListener('click', () => {
    cambiarPosicion('corredor');
});

btn = document.querySelector('#pato');
btn.addEventListener('click', () => {
    cambiarPosicion('pato');
});

/* Para crear más figuras
 * 
 * - Crear botón en plantilla html con id="<nombre de la figura>"
 * - Crear las clases css <figura>-posicion-<nombre de la figura>
 * - Crear el event listener en js para el botón creado
 * 
*/



