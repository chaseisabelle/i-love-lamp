<?php require_once realpath(__DIR__ . '/../php/website.php'); ?>
<html>
    <head>
        <title><?php print get_title(); ?></title>
    </head>
    <body>
        <div class="container">
            <div class="row" id="fire-text-row">
                <div class="col-12" id="fire-text-col"><?php print get_title(); ?></div>
            </div>
            <div class="row">
                <div class="col">
                    col1
                </div>
                <div class="col">
                    col2
                </div>
            </div>
        </div>
    </body>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/website.css" />
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/website.js"></script>
</html>
