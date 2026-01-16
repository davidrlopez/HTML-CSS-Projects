document.addEventListener("DOMContentLoaded", iniciar);

let todosLosDatos = [];

function iniciar() {
  cargarDatos();
  const entradaElement = document.getElementById("entrada");
  if (entradaElement) {
    entradaElement.addEventListener("input", () => cargar(todosLosDatos));
  }
}

function cargarDatos() {
  fetch("mates.json")
    .then((response) => {
      if (!response.ok) throw new Error("Error en la respuesta de red");
      return response.json();
    })
    .then((datos) => {
      todosLosDatos = datos;
      cargar(datos);
    })
    .catch((error) => console.error("Error al cargar los datos:", error));
}

function cargar(datos) {
  const entradaElement = document.getElementById("entrada");
  const valorBusqueda = entradaElement
    ? entradaElement.value.toUpperCase().trim()
    : "";
  const contenedor = document.getElementById("cartas");

  if (!contenedor) return;

  const matematicosFiltrados = datos.filter((matematico) => {
    if (!valorBusqueda) return true;
    const nombreCompleto =
      `${matematico.nombre} ${matematico.apellido}`.toUpperCase();
    const pais = matematico.pais.toUpperCase();
    return (
      nombreCompleto.includes(valorBusqueda) || pais.includes(valorBusqueda)
    );
  });

  contenedor.innerHTML = "";
  const fragmento = document.createDocumentFragment();

  matematicosFiltrados.forEach((matematico) => {
    const carta = document.createElement("div");
    carta.classList.add("carta");
    carta.innerHTML = `
            <div class="cara1">
                <img src="img/${matematico.imagen}" alt="${matematico.nombre} ${matematico.apellido}" loading="lazy">
            </div>
            <div class="cara2">
                <h1>${matematico.nombre} ${matematico.apellido}</h1>
                <h2>(${matematico.nacimiento}-${matematico.fallecimiento})</h2>
                <h2>${matematico.pais}</h2>
                <p>${matematico.biografia}</p>
            </div>
        `;

    fragmento.appendChild(carta);
  });

  contenedor.appendChild(fragmento);
}
