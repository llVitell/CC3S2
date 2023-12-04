var filas = document.getElementById('movies').getElementsByTagName('tr');

for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];

    if (fila.getClassCss() === 'none') {
        console.log('Fila oculta:', fila);
    }
}
