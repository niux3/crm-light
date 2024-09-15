<?php
    //print_r($_GET);
    $tpl = "%s :: INFO :: %s %s %s (%s) lu !";
    $output = @vsprintf($tpl, [
        @date('c'),
        $_GET['civility'],
        $_GET['firstname'],
        $_GET['lastname'],
        $_GET['email']
    ]);
    @file_put_contents('./log/info.log', $output);
    @header ("Content-type: image/png");
    $im = @ImageCreate (1, 1); // or die ("Erreur lors de la création de l'image");
    $couleur_fond = @ImageColorAllocate ($im, 245, 245, 245);
    @ImagePng ($im);
?>
