let figuras = [
    'triangulo-grande-1',
    'triangulo-grande-2',
    'cuadrado',
    'triangulo-mediano',
    'triangulo-pequeno-1',
    'romboide',
    'triangulo-pequeno-2',
];

var posicion = 1;

function moverFigura(figura, de, a) {
    if (typeof(figura) == 'number') {
        figura = figuras[figura];
    }
    let clazz = `${figura}-posicion`;
    let div = document.querySelector(`.${clazz}-${de}`);
    if (div != null) {
        div.classList.replace(`${clazz}-${de}`, `${clazz}-${a}`);
    }
};

var btn = document.querySelector('#todas');
btn.addEventListener('click', () => {
    figuras.forEach(figura => {
        moverFigura(figura, posicion, posicion == 1 ? 2 : 1);
    });

    if (posicion == 1) {
        posicion = 2;
    } else {
        posicion = 1;
    }
});

var numFigura = 0;
btn = document.querySelector('#una-por-una');
btn.addEventListener('click', () => {
    moverFigura('asd');
    moverFigura(1);
    if (numFigura >= figuras.length) {
        numFigura = 0
        figuras.forEach(figura => {
            moverFigura(figura, 2, 1);
        });
    } else {
        moverFigura(numFigura, 1, 2);
        numFigura += 1;
    }
});






