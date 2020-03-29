<?php
if (!isset($_POST["body"], $_POST["url"])) {
    return;
}

$request = json_encode([
    "content" => "",
	"username" => "AWarn3 Logs",
	"avatar_url" => "https://g4p.org/awarn2/awarn3_chatlogo.png",
    "embeds" => [
        [
            "title" => $_POST["title"],
            "type" => "rich",
            "description" => $_POST["body"],
            "color" => hexdec($_POST["bar_color"]),
            "timestamp" => date("c"),
        ]
    ]
], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);

$ch = curl_init($_POST["url"]);

curl_setopt_array($ch, [
    CURLOPT_POST => 1,
    CURLOPT_FOLLOWLOCATION => 1,
    CURLOPT_HTTPHEADER => array("Content-type: application/json"),
    CURLOPT_POSTFIELDS => $request,
    CURLOPT_RETURNTRANSFER => 1
]);

curl_exec($ch);