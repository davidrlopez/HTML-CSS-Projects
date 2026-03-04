declare option output:method "html";
declare option output:html-version "5.0";
declare option output:indent "yes";
<html>
  <body>
    <table border="1">
      {
        for $libro in //book
        return
          <tr>
            <td>{$libro/title/text()}</td>
          </tr>
      }
    </table>
  </body>
</html>
