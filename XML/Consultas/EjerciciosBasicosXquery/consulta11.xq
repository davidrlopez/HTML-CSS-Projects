declare option output:indent "yes";
for $libro in //book
  let $precio_iva := ($libro/price*1.21)
  (: return $precio_iva :)
  order by $precio_iva
  return
  <libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()}€</precio>
  <precio_iva>{$precio_iva}€</precio_iva>
  </libro>
