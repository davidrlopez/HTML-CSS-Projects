declare option output:indent "yes";
let $total := count(//book)
let $titulos := (for $libro in //book/title return <titulo>{$libro/text()}</titulo>)
return <resultado>{$titulos}<total>{$total}</total></resultado>
