<?php

// $password = 'BicolU40753';
// $hashed_password = 'pbkdf2(1000,20,sha512)$8d6d0368041c3d3c$bb156a02c1fdc844024afd9cbf48bfc2bac19cb8';
// $mygeneratedpass = pbkdf2(1000,20,sha512)$ab75c257d83921d0$95cfe5b6c859893f6e3d4027ff93a62f1f051eb4
$mayorPW = 'pbkdf2(1000,20,sha512)$9b39b5dd90922bb5$0b6c55b43b1b0c487ce44761bb8ce06db235c209';

$split = explode('$', $mayorPW);
$digest_algo = explode(',', trim(str_replace('pbkdf2', '', $split[0]), '()'));
$iterations = $digest_algo[0];
$keylen = $digest_algo[1];
$algo = $digest_algo[2];
$salt = $split[1];
$hash = $split[2];

echo var_dump($split) . '<br>';
echo var_dump($digest_algo) . '<br>';
echo var_dump($iterations) . '<br>';
echo var_dump($keylen) . '<br>';
echo var_dump($algo) . '<br>';
echo var_dump($salt) . '<br>';
echo var_dump($hash) . '<br>';

$algo = 'sha512';
$salt = '9b39b5dd90922bb5';
$iterations = 1000;
$keylen = 20;
$hash = '0b6c55b43b1b0c487ce44761bb8ce06db235c209'; // <- !!

$newhash = openssl_pbkdf2('BicolU40753', $salt, 20, $iterations, $algo);
echo var_dump(bin2hex($newhash));


