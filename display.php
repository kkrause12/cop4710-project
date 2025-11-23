<!DOCTYPE html>
<html>
    <head>
        <style type = "text/css">
         body  { font-family: sans-serif;
                 background-color: lightblue; } 
         table { background-color: pink; 
                 border-collapse: collapse; 
                 border: 1px solid gray; }
         td    { padding: 5px; }
         tr:nth-child(odd) {
                 background-color: white; }
      </style>
    </head>
    <body>
        <?php
            $select = $_POST["select"];
            $query = "SELECT * FROM " . $select;
            if ( !( $database = mysqli_connect( "localhost", "root", "" ) ) )
                die("Could not connect to database </body></html>");
            if(!mysqli_select_db($database, "Real_Estate"))
                die("Could not open real estate database </body></html>");
            if(!($result = mysqli_query($database, $query))){
                print("<p>Could not execute query</p>");
                die(mysql_error() . "</body></html>");
            }
            mysqli_close($database);

            ?>
            <table>
                <caption>Displaying <?php print("$select") ?> Information</caption>
                <?php
                    if($select === "Listings"){
                        $houses = array();
                        $businesses = array();
                        $database = mysqli_connect( "localhost", "root", "" );
                        mysqli_select_db($database, "Real_Estate");
                        while($row = mysqli_fetch_array($result)){
                            $address = $row[1];
                            $query2 = "SELECT * FROM House WHERE address = \"" . $address . "\"";
                            $result2 = mysqli_query( $database, $query2 );
                            if($result2->num_rows === 0){
                                $businesses[] = $row;
                            }
                            else{
                                $houses[] = $row;
                            }
                        }
                        mysqli_close($database);
                        print("<table>");
                        print("<caption>House Listings</caption>");
                        foreach($houses as $house){
                            print("<tr>");
                            foreach($house as $value){
                                print("<td>$value</td>");
                            }
                            print("<tr>");
                        }
                        print("</table>");

                        print("<br>");

                        print("<table>");
                        print("<caption>Business Property Listings</caption>");
                        foreach($businesses as $property){
                            print("<tr>");
                            foreach($property as $value){
                                print("<td>$value</td>");
                            }
                            print("<tr>");
                        }
                        print("</table>");
                    }
                    else{
                        while($row = mysqli_fetch_row($result)){
                            print("<tr>");
                            foreach($row as $value)
                                print("<td>$value</td>");
                            print("</tr>");
                        }
                    }
                ?>
            </table>
    </body>
</html>

