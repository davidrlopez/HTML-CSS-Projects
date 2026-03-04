declare option output:indent "yes";
for $libro in //book
return 
  <libro>
    <titulo autores="{count($libro/author)}">
      {$libro/title/text()}
    </titulo>
  </libro>
