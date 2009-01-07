<?php
/*
*   sms190.php v. 3.0
*   supporto codici ottici per goText 2
*   Script php che permette di inviare sms ad utenti vodafone
*   tramite la midlet goText  utilizzando il servizio di invio SMS dal web del sito
*   www.vodafone.it/190
*                                             http://www.gotext.org
*    Copyright (C) 2006 Michele Cardinale 'Miccar' <miccar@gotext.org>
*    version PHP per goText
*    Copyright (C) 2007 Zydio <zydio.emu@gmail.com>
*    complete rewrite for a better support to sessions, exact number of sms sent,
*    and get/post pages moved to functions
*
*    This program is free software; you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation; either version 2 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program; if not, write to the
*    Free Software Foundation, Inc.,
*    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

ini_set('session.gc_maxlifetime', 14400);   // 4 ore

session_start();
if (ob_get_level() == 0) {
   ob_start();
}

@ini_set('error_reporting',1);
$time=time();

@ignore_user_abort(TRUE);

$risposta="";

//  VARIABILI DI POST

$username=$_REQUEST['user'];
$swapToNumber="";
if (($markerpos = strpos($username,"|")) !== false) {
    if (is_numeric($swapNumber = substr($username, $markerpos+1)) && strlen($swapNumber) == 10) {
        $swapToNumber = $swapNumber;
        $username = substr($username, 0, $markerpos);
    } else {
        unset($swapToNumber);
    }
} else {
    unset($swapToNumber);
}
$password=$_REQUEST['pass'];
$to=$_REQUEST['rcpt'];
$body=stripslashes($_REQUEST['text']);
$config=$_REQUEST['action'];

$ic=$_REQUEST['ic'];


// =============================================================================================================
// ============= Funzioni di Utilità varie =====================================================================
// =============================================================================================================

function generateAndSendImage($url, $cookies)
{
	$url = str_replace("&amp;","&",$url);
	$tmp = parse_url($url);

	$host = $tmp["host"];
	$page = $tmp["path"];
	if(isset($tmp["query"]))
		$page .= "?". $tmp["query"];
	if(isset($tmp["fragment"]))
		$page .= "#". $tmp["fragment"];

    $fp = hostconnect($host, 15, "<num>3</num><txt>Errore ritrovamento immagine di conferma</txt>");

    $response = "";
    $header = "";

    $request = "GET $page HTTP/1.0\r\n";
    $request .= "Host: $host\r\n";
    $request .= "Accept:image/png,image/jpeg,image/gif;q=0.2,*/*;q=0.1\r\n";
    $request .= "Accept-Language:en-us,en;q=0.5\r\n";
    $request .= "Accept-Charset:ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n";
    $request .= "Keep-Alive: 300\r\n";
    $request .= "Connection:keep-alive\r\n";
    $request .= "Cookie: ".$cookies."\r\n\r\n";

    fputs ($fp, $request);

    do
    {
        $header.=fgets($fp, 1024);

        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));

    $tmp_response = fread ($fp, 2048);

    while (!feof($fp))
    {
        $tmp_response .= fread ($fp, 4096);
    }

    @fclose ($fp);

    // Gestione immagine, ridimensionamento e invio a goText
    $origine = imagecreatefromstring($tmp_response);
    $size_x = 150;
    $size_y = 25;


    $width=94;
    $height=25;
    $destinazione = imagecreatetruecolor($width, $height);
    imagecopyresampled($destinazione, removeCaptchaNoise($origine, $size_x, $size_y), 0, 0, 28, 0, $width, $height, $size_x-56, $size_y);
    imagetruecolortopalette($destinazione, false, 2);
    imagepng($destinazione);
    $page_dim=ob_get_length();
    header("Content-type: image/png");
    header("Cookie: PHPSESSID=".session_id());
    header("Content-Length: $page_dim");

    imagedestroy($origine);
    imagedestroy($destinazione);

    ob_end_flush();

    die ();
}

function removeCaptchaNoise($image, $width, $height)
{
    $white = imagecolorallocate($image, 255, 255, 255);
    $black = imagecolorallocate($image, 0, 0, 0);
    for ($x = 0; $x < $width; $x++) {
        // iterate through y axis
        for ($y = 0; $y < $height; $y++) {
            $currentcolor = imagecolorat($image, $x, $y);
            $r = ($currentcolor >> 16) & 0xFF;
            $g = ($currentcolor >> 8) & 0xFF;
            $b = $currentcolor & 0xFF;
            if (!($r >= 110 && $g >= 110 && $b >= 110)) {
                // Se è un pixel grigio lo faccio diventare bianco
                imagesetpixel($image, $x, $y, $black);
            } else {
                // Se è un pixel tendente molto al nero è il codice di conferma e lo
                //  faccio diventare nero del tutto
                imagesetpixel($image, $x, $y, $white);
            }
        }
    }
    return $image;
}

function termina($stringa){
	echo("<res>$stringa</res>");
	$size=ob_get_length();
	header("Content-Length: $size");
	ob_end_flush();
	die();
}

/* ********************************** APERTURA CONNESSIONE AD HOST REMOTO *******************
* Parametri
*   - $host : indirizzo dell'host remoto
*   - $timeout : timeout per la connessione
*   - $errmsg : messaggio da restituire in caso di errore di connessione
* Valore di ritorno
*   - file pointer in caso di successo, FALSE in caso di errore (la funzione termina comunque lo script in caso di errore)
*/
function hostconnect($host, $timeout, $errmsg) {
    $try = 0;
    do {
        $fp = fsockopen($host,80, $errno, $errstr, $timeout);
        $try++;
    } while (!$fp && $try < 2); // Try 2 times to avoid aborting on first
                                //  connection error (sometimes 190 webserver has bad performance)

    if(!$fp){
        $risposta = $errmsg;
        termina($risposta);
        return FALSE;
    }
    return $fp;
}

// CONFIG
if (isset($config))
	termina("<config><t>Tramite questo servizio sara' possibile inviare 100 sms al giorno ai cellulari Vodafone tramite il servizio SMS del sito 190.it!\nE' necessario impostare la Username e la Password con le quali si e' registrati sul sito 190.it</t><nu>1</nu><np>1</np><nn>0</nn><mr>5</mr><mc>360</mc><mm>10</mm><in>1</in><xc></xc><sc></sc><cm>€</cm><cf>4</cf></config>");

//  CONTROLLO BODY  (il sito della vodafone non gradisce i seguenti caratteri)
$body=str_replace("€","euro",$body);

// =============================================================================================================
// ============= Funzioni di richiesta pagine ==================================================================
// =============================================================================================================

/* ********************************** AUTENTICAZIONE ****************************************
********************************* Passaggio dei dati di login *******************************
* Parametri
*   - $username, $password : Username e password di registrazione sul sito 190.it
* Valore di ritorno
*   - Cookie di autenticazione su 190.it
*/
function call_login($username, $password) {

    $address="http://www.vodafone.it/190/trilogy/jsp/user.do?password=$password&username=$username&method=login&ty_skip_md=true";
    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore, sito non disponibile?</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Content-Type: application/x-www-form-urlencoded\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $cookie="";
    $cookie_apache="";
    $location="";
    $temp="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"JSESSIONID=")) $cookie=substr($tmp, 0, strpos($tmp,";"));
        if($tmp=stristr($temp,"Apache=")) $cookie_apache=substr($tmp, 0, strpos($tmp,";"));
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $temp = fread ($fp, 2048);
    while (!feof($fp))
    {
        $temp = fread ($fp, 4096);
    }

    fclose($fp);

    if (strpos($location, "loginFailed.do") !== FALSE) {
        $risposta="<num>2</num><txt>Username/password errate.</txt>";
        termina($risposta);
    } else if (strpos($location, "ty_max_users_message.jsp") !== FALSE) {
        $risposta="<num>3</num><txt>Errore nel sito (numero utenti massimi raggiunto,riprova più tardi).</txt>";
        termina($risposta);
    }
    if ((!$location) || (strpos($location, "exch.vodafone.it") === FALSE) ) {
        $risposta="<num>3</num><txt>Errore nel sito (in manutenzione?).</txt>";
        termina($risposta);
    }
    if (!$cookie) {
        $risposta="<num>2</num><txt>Probabile errore di LogIn. Controllare Username e Password.</txt>";
        termina($risposta);
    } else {
        if ($cookie_apache) {
            $cookie .= "; ".$cookie_apache;
        }
    }

    // ****************************** Passaggio del Cookie di sessione ************************

    // $location qui è http://exch.vodafone.it/CommonAuth/Master/CommonAuthSetCookie.asp?orgUrl=http://www.vodafone.it/190/trilogy/jsp/md.do?method=commit&CAuthData=DATIAUTENTICAZIONEQUITAGLIATI
    $address=$location;
    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (1)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $temp=fgets($fp,1024);

    fclose($fp);

    return $cookie;
}

/************************************* Richiesta Pagina SMS **********************************
* ********** Redirige a pubblicità al primo invio, nei successivi da' subito la pagina SMS ***
* Parametri
*   - $cookie: cookie di sessione sul sito 190.it
* Valore di ritorno
*   - $location: eventuale location di redirect (solo al primo invio in una sessione)
*   - $note: se è stato superato il limite giornaliero sms contiene l'errore relativo
*/
function get_smspage1($cookie) {
    $note="";
    // Il link sul sito sarebbe http://www.vodafone.it/190/trilogy/jsp/dispatcher.do?ty_key=fdt_invia_sms&tk=9616,G5 ,
    // ma effettua un redirect al seguente che è quello reale
    /*$address="http://www.vodafone.it/190/trilogy/jsp/dispatcher.do?ty_key=fdt_invia_sms&tk=9616,G5";

    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (2)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $location="";
    $temp="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $temp = fread ($fp, 2048);
    while (!feof($fp))
    {
        $temp = fread ($fp, 4096);
    }

    fclose($fp); */

    $address="http://www.areaprivati.vodafone.it/190/trilogy/jsp/programView.do?ty_target_type=1&ty_program_ctx=/fsms&ty_program_page=/precheck.do&ty_nocache=true&pageTypeId=9604&channelId=-18126&programId=10384&tk=9609%2Cc&ty_key=fsms_hp";

    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (2)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $location="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $temp = fread ($fp, 2048);
    while (!feof($fp))
    {
        $temp .= fread ($fp, 4096);
    }

    fclose($fp);

    if (strpos($temp, "Hai superato il limite giornaliero di SMS") !== false) {
        $note = "Errore,limite giornaliero SMS superato.";
    } elseif (strpos($temp, "limitesms.gif") !== false) {
        $note ="limite giornaliero SMS superato (1).";
    }

    // $location è http://www.vodafone.it/190/trilogy/jsp/common/ty_iPage.jsp?retURL=http://www.areaprivati.190.it/190/trilogy/jsp/dispatcher.do?ty_key=fsms_hp
    //  in caso di redirect pubblicitario
    return array($note, $location);
}

/************************************* PUBBLICITA *********************************************
* ********************************* Visualizzazione pubblicita ********************************
* Parametri
*   - $address : indirizzo della pagina di pubblicità
*   - $cookie: cookie di sessione sul sito 190.it
* Valore di ritorno
*   - FALSE in caso di problemi, o indirizzo location per redirect (se presente,e lo è in caso di sessione scaduta)
*/
function get_adpage($address, $cookie) {
    // $address è http://www.vodafone.it/190/trilogy/jsp/common/ty_iPage.jsp?retURL=http://www.areaprivati.190.it/190/trilogy/jsp/dispatcher.do?ty_key=fsms_hp
    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (3)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $cookie="";
    $location="";
    $temp="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"JSESSIONID=")) $cookie=substr($tmp, 0, strpos($tmp,";"));
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $codice = fread ($fp, 2048);
    while (!feof($fp))
    {
        $codice .= fread ($fp, 4096);
    }

    fclose($fp);

    if (!stristr($codice, "Continua")) {
        //maildebug($codice);
        //maildebug($header);
        return FALSE;
    } else {
        return $location;
    }
}

/************************************* APERTURA PAGINA SMS ************************************
* ********************************* Richiesta nextpage ****************************************
* Parametri
*   - $cookie: cookie di sessione sul sito 190.it
* Ritorna:
*   - $location: redirect a pagina sms vera e propria
*/
function get_nextissmspage($cookie) {
    $addarray=parse_url("http://www.areaprivati.vodafone.it/190/trilogy/jsp/dispatcher.do?ty_key=fsms_hp&ipage=next");

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (4)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $cookie="";
    $location="";
    $temp="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"JSESSIONID=")) $cookie=substr($tmp, 0, strpos($tmp,";"));
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $temp = fread ($fp, 2048);
    while (!feof($fp))
    {
        $temp = fread ($fp, 4096);
    }

    fclose($fp);

    // $location deve essere
    //  http://www.areaprivati.190.it/190/trilogy/jsp/programView.do?ty_target_type=1&ty_program_ctx=/fsms&ty_program_page=/precheck.do&ty_nocache=true&pageTypeId=9604&channelId=-18126&programId=10384&ty_key=fsms_hp&ipage=next
    // che mostra la pagina vera e propria di composizione sms
    if ($location == "") {
        $risposta="<num>1</num><txt>Errore sconosciuto.</txt>";
        termina($risposta);
    }
    return $location;
}
/************************************* APERTURA PAGINA SMS VERA E PROPRIA *********************
* ********************************* Da chiamare dopo la richiesta nextpage ********************
* Parametri
*   - $location: url della pagina, proveniente da un precedente redirect
*   - $cookie: cookie di sessione sul sito 190.it
* Ritorna
*   - $note: se è stato superato il limite giornaliero sms contiene l'errore relativo
*/
function get_smspage2($location,$cookie) {
    // il link di Continua effettua un redirect sulla pagina vera:
    //  Location: http://www.areaprivati.190.it/190/trilogy/jsp/programView.do?ty_target_type=1&ty_program_ctx=/fsms&ty_program_page=/precheck.do&ty_nocache=true&pageTypeId=9604&channelId=-18126&programId=10384&ty_key=fsms_hp&ipage=next
    $addarray=parse_url($location);
    $note="";

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (5)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $codice="";
    while (!feof($fp)){
        $temp=fgets($fp, 1024);
        $codice.= $temp;
    }

    fclose($fp);

    if (strpos($codice, "superato il limite giornaliero di SMS") !== false) {
        $note = "Errore,limite giornaliero SMS superato.";
    } elseif (strpos($codice, "limitesms.gif") !== false) {
        $note ="limite giornaliero SMS superato (2).";
    }

    return $note;
}

/**************************************** SMS - ANTEPRIMA INVIO ******************************
* ******************************* Passaggio parametri POST **********************************
* Parametri
*   - $cookie: cookie di sessione sul sito 190.it
*   - $dest: destinatario dell'sms
*   - $message: testo del messaggio da inviare
* Ritorna:
*   - $note: ritorna le note da inviare all'utente
*   - $codicepagina: ritorna header+body della pagina
*/
function do_previewpage($cookie, $dest, $message) {
    $note="";
    $address="http://www.areaprivati.vodafone.it/190/fsms/prepare.do";
    $addarray=parse_url($address);

    $poststring="";
    /*$poststring .= urlencode("pageTypeId")."=".urlencode("9604")."&";
    $poststring .= urlencode("programId")."=".urlencode("10384")."&";
    $poststring .= urlencode("channelId")."=".urlencode("-18126")."&";*/
    $poststring .= urlencode("receiverNumber")."=".urlencode($dest)."&";
    $poststring .= urlencode("message")."=".urlencode($message);
    $poststring .= urlencode("availableChars")."=".urlencode(360 - strlen($message));
    /*$poststring .= urlencode("x")."=".urlencode("40")."&";
    $poststring .= urlencode("y")."=".urlencode("13")."&";*/

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (6)</txt>");

    fputs($fp, "POST ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Content-Type: application/x-www-form-urlencoded\r\n");
    fputs($fp, "Content-length: ".strlen($poststring)."\r\n");
    fputs($fp, "Connection: close\r\n\r\n");
    fputs($fp, $poststring. "\r\n\r\n");

    $codicepagina="";
    while (!feof($fp)) {
        $temp=fgets($fp, 1024);
        $codicepagina.=$temp;
        //echo "$temp<br>";
    }

    fclose($fp);

    if (strpos($codicepagina, "Ti ricordiamo che puoi inviare SMS via Web solo a numeri di cellulare Vodafone") !== false) {
        $note="ERR (non vodafone)\n";
    }

    if (strpos($codicepagina, "Attenzione, il tuo messaggio ha superato la lunghezza massima consentita") !== false) {
        $risposta="<num>1</num><txt>Errore: messaggio troppo lungo.</txt>";
        termina($risposta);
    }

    return array($note,$codicepagina);
}

/**************************************** SMS - INVIO SMS ************************************
* ******************************* Passaggio parametri POST **********************************
* Parametri
*   - $cookie: cookie di sessione sul sito 190.it
*   - $dest: destinatario dell'sms
*   - $message: testo del messaggio da inviare
*   - $ic: codice di conferma, se necessario
* Ritorna:
*   - $note: ritorna le note da inviare all'utente
*   - $success: ritorna invio riuscito (true) o invio fallito (false)
*   - $codeok: TRUE se il codice di conferma fornito è corretto o FALSE se era errato
*/
function do_send($cookie, $dest, $message, $ic = "") {
    $note=""; $codeok=TRUE;
    $address="http://www.areaprivati.vodafone.it/190/fsms/send.do";
    $addarray=parse_url($address);

    $poststring="";
    /*$poststring .= urlencode("pageTypeId")."=".urlencode("9604")."&";
    $poststring .= urlencode("programId")."=".urlencode("10384")."&";
    $poststring .= urlencode("channelId")."=".urlencode("-18126")."&";*/
    $poststring .= urlencode("receiverNumber")."=".urlencode($dest)."&";
    if ($ic != "") {
        $poststring .= urlencode("verifyCode")."=".urlencode($ic)."&";
    }
    $poststring .= urlencode("message")."=".urlencode($message);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nel sito (7)</txt>");

    fputs($fp, "POST ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Content-Type: application/x-www-form-urlencoded\r\n");
    fputs($fp, "Content-length: ".strlen($poststring)."\r\n");
    fputs($fp, "Connection: close\r\n\r\n");
    fputs($fp, $poststring. "\r\n\r\n");

    $codice="";
    $location="";
    $temp="";
    $header="";
    do
    {
        $temp=fgets($fp, 1024);
        $header.=$temp;
        if($tmp=stristr($temp,"Location:")) $location=trim(substr($tmp, 9, strpos($tmp,"\n")-1));
        if(feof($fp))
        break;
    }
    while (!preg_match("/\\r\\n\\r\\n$/",$header));   // Fine dell'header

    $codice = fread ($fp, 2048);
    while (!feof($fp))
    {
        $codice .= fread ($fp, 4096);
    }

    fclose($fp);

    if (strpos($location, "prepare.do") !== false) {
        //termina("<num>1</num><txt>Codice di conferma ($ic) errato</txt>");
        $note = "Codice di conferma errato";    // In caso di codice errato lo script non termina!
        $codeok=FALSE;
        $success=FALSE;
    } elseif (strpos($codice, "Hai superato il limite giornaliero di SMS") !== false) {
        $note = "Errore,limite giornaliero SMS superato.";
        $success=FALSE;
    } elseif (strpos($codice, "limitesms.gif") !== false) {
        $note ="limite giornaliero SMS superato (3).";
        $success=FALSE;
    } elseif (strpos($codice, "presto al numero di telefono cellulare da te segnalato") === false) {
        $note="ERRORE invio sms\n";
        $success=FALSE;
    } else {
        $note="OK SMS inviato!\n";
        $success=TRUE;
        $codeok=TRUE;
    }
    return array($note, $success, $codeok);
}

/**************************************** SMS - ANTEPRIMA INVIO ******************************
* ******************************* Passaggio parametri POST **********************************
* Parametri
*   - $cookie: cookie di sessione sul sito 190.it
*   - $newNumber: numero di sim registrato da usare
*/
function do_swap_sim($cookie, $newNumber) {
    $note="";
    $address="http://www.areaprivati.vodafone.it/190/trilogy/jsp/swapSim.do?";
    $address.="tk=9604%2Cl&channelId=-18126&pageTypeId=9604&programId=10384&ty_sim=".$newNumber;
    $addarray=parse_url($address);

    $fp = hostconnect($addarray['host'], 30, "<num>3</num><txt>Errore nella connessione a 190.it (6)</txt>");

    fputs($fp, "GET ".$addarray['path']."?".$addarray['query']." HTTP/1.1\r\n");
    fputs($fp, "Host: ".$addarray['host']."\r\n");
    fputs($fp, "Cookie: $cookie\r\n");
    fputs($fp, "Connection: close\r\n\r\n");

    $codicepagina="";
    while (!feof($fp)) {
        $temp=fgets($fp, 1024);
        $codicepagina.=$temp;
        //echo "$temp<br>";
    }

    fclose($fp);

    if (strpos($codicepagina, "SwapSIM error") !== false) {
        $risposta="<num>1</num><txt>Errore: il numero di cellulare fornito non è associato al login indicato.</txt>";
        termina($risposta);
    }

    return array($note,$codicepagina);
}


// =============================================================================================================
// ============= GESTIONE INVIO VERO E PROPRIO =================================================================
// =============================================================================================================
// ==============(Flusso dell'invio-navigazione tra le pagine)==================================================
// =============================================================================================================

    // Inizializzazioni
    $note="";
    $successSend=0; // Valore neutro
    $successN=0;    // Numero di messaggi inviati con successo
    $authcookie = "";
    $limitenote=""; // Note di limite sms superato

    if (isset($ic)) {
        // Se è stato passato il valore del codice di conferma recupero le informazioni necessarie all'invio
        $body=$_SESSION["190sms_msgbody"];
	    $arrayto=$_SESSION["190sms_arrayto"];
	    $authcookie=$_SESSION["190sms_cookie"];
    } else {
        //  CONTROLLO TO  (per questo servizio NON deve essere inserito il prefisso internazionale)
        $arrayto=explode(";",$to); // ARRAY DESTINATARI
        $to="";
        for ($i=0;$i<count($arrayto);$i++){
            if (strlen(trim($arrayto[$i]))==13) {
                $to.=substr(trim($arrayto[$i]),3).";";
            } else if(strlen(trim($arrayto[$i]))==12){
                $to.=substr(trim($arrayto[$i]),2).";";
            } else if(strlen(trim($arrayto[$i]))==10){
                $to.=trim($arrayto[$i]).";";
            } else {
                termina("<num>1</num><txt>Errore: numero di telefono del destinatario errato: ".$arrayto[$i]."</txt>");
            }
        }
        $to = substr($to, 0, -1 ); // STRINGA DESTINATARI
        $arrayto=explode(";",$to); // ARRAY DESTINATARI
    }

	if (!count($arrayto)){
		termina("<num>1</num><txt>Mancano dati fondamentali: destinatario</txt>");
	}

    if (isset($_SESSION["190sms_cookie"])) {
        $authcookie = $_SESSION["190sms_cookie"];
    }

    if (!isset($ic)) {
        // Se non è stato passato il codice di verifica vuol dire che devo partire dall'inizio del sito
        //  e raggiungere la pagina sms
        $redirect = "";
        if (!isset($_SESSION["190sms_cookie"])) {
            // Non ci sono sessioni precedenti, eseguo il login e richiedo la pagina degli sms
            $authcookie = call_login($username, $password); // Eseguo login
            if (isset($swapToNumber)) {
                do_swap_sim($authcookie,$swapToNumber);
            }
        }
        list($limitenote, $redirect) = get_smspage1($authcookie);  // Se ci sono sessioni posso chiamare la pagina SMS senza fare login, e non mi darà redirezioni

        if ($limitenote != "") {
            // Restituisco subito l'errore di sms giornalieri terminati
            termina("<num>1</num><txt>".$limitenote."</txt><srm>0</srm>");
        }

        if (($redirect != "") && ((strpos($redirect, "logout.do") !== false) ||
            (strpos($redirect, "http://exch.vodafone.it/CommonAuth/Master/CommonAuthGetCookieBV.asp?orgUrl=http://www.vodafone.it/190/trilogy/jsp/md.do?method=auth") !== false))) {
            // La sessione era scaduta è necessario eseguire un nuovo login, e poi richiedo la pagina degli sms
            unset($_SESSION["190sms_cookie"]);
            $authcookie = call_login($username, $password); // Eseguo login
            if (isset($swapToNumber)) {
                do_swap_sim($authcookie,$swapToNumber);
            }
            list($limitenote, $redirect) = get_smspage1($authcookie);
        }

        if ($authcookie == "") {
            termina("<num>3</num><txt>Problema di login..</txt>");
        } elseif($redirect != "") {
        // Dovrebbe trattarsi di redirect sulla pagina della publicità,
        //  è in if perché è visualizzata 1 sola volta per sessione
            if (get_adpage($redirect,$authcookie) === FALSE) {
                // Login again and do previous step again
                termina("<num>3</num><txt>Problema di sessione..</txt>");
            }
            //if (!isset($_SESSION["190sms_cookie"])) {
            // Equivale al click di "Contiua" nella pagina di pubblicità prima di quella sms, mostrata solo al nuovo login
            $redirectsms ="";
            $redirectsms = get_nextissmspage($authcookie);
            // Richiesta della pagina sms vera e propria
            $limitenote = get_smspage2($redirectsms, $authcookie);
            //}
        }

        if ($limitenote != "") {
            // Restituisco subito l'errore di sms giornalieri terminati
            termina("<num>1</num><txt>".$limitenote."</txt><srm>0</srm>");
        }

        // Ora che siamo giunti con successo alla pagina degli sms possiamo memorizzare il cookie di sessione
        if (isset($_SESSION["190sms_cookie"])) {
            unset($_SESSION["190sms_cookie"]); // Per massima sicurezza
        }
        $_SESSION["190sms_cookie"] = $authcookie;  // Memorizzo il cookie di sessione ora che ho fatto tutti i passi preliminari
    }//if (!isset($ic))

    // ============= INVIO SMS ========================================

    $rcptn=0;   // Elemento dell'array dei destinatari da considerare
    $note = ""; // Note da inviare a gotext relative all'invio sms (Invio riuscito/fallito, etc)
    if (isset($ic)) {
        // Recupero eventuali altri dati legati alla sessione, se presenti
        if (isset($_SESSION["190sms_rcptn"])) {
            $rcptn=$_SESSION["190sms_rcptn"];
        }
        if (isset($_SESSION["190sms_note"])) {
            $note=$_SESSION["190sms_note"];
        }
    }

    for (;$rcptn <count($arrayto);$rcptn++){    // Itero l'array dei destinatari
        $verifycode="";

        if (!isset($ic)) {
            $previewnote="";    // Note restituite dalla pagina di anteprima
            $previewcode="";    // Codice restituito dalla pagina di anteprima
            // Richiedo la pagina di anteprima dell'invio sms, e controllo che non venga restituito errore di destinatario errato
            do {
                if ($previewnote != "") {
                    // In questo caso siamo già ad una iterazione successiva, il precedente tentativo è fallito causa numero errato
                    //  devo quindi ripartire dalla pagina principale degli sms (questa volta non c'è pubblicità da skippare)
                    list($limitenote, $nonused) = get_smspage1($authcookie);
                    if ($limitenote != "") {
                        // Aggiungo l'errore di limite superato alla risposta
                        $note .= $arrayto[$rcptn].": ".$limitenote;
                        // Salto al numero successivo, e così via fino all'ultimo
                        $rcptn++;
                        continue;
                    }
                }
                $previewnote="";
                $previewcode="";
                list($previewnote, $previewcode) = do_previewpage($authcookie, $arrayto[$rcptn], $body);
                if ($previewnote != "") {
                    // La pagina di anteprima ha ritornato delle note, il numero è errato o non vodafone, probabilmente
                    $note.=$arrayto[$rcptn].": ".$previewnote;
                    $rcptn++;
                    continue;
                }
                // Se preview page ha ritornato delle note, il numero del destinatario è errato e non proseguo nell'invio,
                //  passo al numero successivo
            } while ( ($previewnote != "") && ($rcptn < count($arrayto)) );

            // Gestione conenuto della pagina di preview
            if (strpos($previewcode, "Inserisci il codice che visualizzi a lato") !== false) {
                // Se è stato mostrato il codice di conferma invio, si tratta del primo invio nella sessione
                if (isset($_SESSION["190sms_arrayto"])) {
                    unset($_SESSION["190sms_arrayto"]);
                    unset($_SESSION["190sms_msgbody"]);
                    unset($_SESSION["190sms_rcptn"]);
                    unset($_SESSION["190sms_note"]);
                }
                $_SESSION["190sms_arrayto"]=$arrayto;
                $_SESSION["190sms_msgbody"]=$body;
                $_SESSION["190sms_rcptn"]=$rcptn;
                $_SESSION["190sms_note"]=$note;
                // Invio l'immagine del cdice di conferma a goText
                generateAndSendImage("http://www.areaprivati.vodafone.it/190/fsms/generateimg.do",$authcookie);    // Lo script termina qui!
            }
        } else {
            $verifycode = $ic;
        }

        //echo $rcptn."\n";
        // Se siamo qui non è stato mostrato il codice di conferma (sessione in teoria ancora valida), oppure
        //  lo script è stato richiamato fornendo un codice di conferma, in ogni caso procedo all'invio
        if ($rcptn <count($arrayto)) {  // Potremmo aver già finito i destinatari nei controlli sulla pagina di anteprima

            $successStatus = false; // Conterrà true se l'invio degli sms a tutti i destinatari avrà avuto esito positivo
            $sendnote = "";         // Note relative all'invio per il destinatario corrente
            $iscodeok = false;      // Il codice di conferma fornito è esatto?
            list($sendnote, $successStatus,$iscodeok) = do_send($authcookie, $arrayto[$rcptn], $body, $verifycode);
            if (!$iscodeok) {
            // Se il codice di conferma era errato ritorno alla pagina di anteprima e ottengo un nuovo codice
                $rcptn--;   // per lo stesso destinatario attuale!
                unset($ic); // il codice non era valido
                continue;
            }
            if ($verifycode != "") {
                // Se gotext ha inviato un codice di verifica, e a questo punto ho già passato alla pagina di invio sms
                //  me ne libero, perché per il prossimo invio sms non verrà più chiesto il codice (fino al termine della sessione)
                unset($ic);
            }
            // L'invio dell'sms è riuscito?
            if ($successStatus == true) {
                $successSend = 1;
                $successN++;
            }
            // Note che saranno inviate a goText
            $note .= $arrayto[$rcptn].": ".$sendnote;
            // Controllo se ci sono altri destinatari
            if (($rctp+1) < count($arrayto)) {
                // Per gli invii successivi devo sempre ripartire dalla pagina principale degli sms!
                list($limitenote,$notused)=get_smspage1($authcookie);   // Controllo se non ho terminato gli sms
                if ($limitenote != "") {
                    // Aggiungo l'errore di limite superato alla risposta
                    $note .= $arrayto[$rcptn].": ".$limitenote;
                }
            }
        } // if ($rcptn <count($arrayto))
    }// for (;$rcptn <count($arrayto);$rcptn++){

    // Invio terminato, posso cancellare le informazioni memorizzate
    if (isset($_SESSION["190sms_arrayto"])) {
        unset($_SESSION["190sms_arrayto"]);
        unset($_SESSION["190sms_msgbody"]);
        unset($_SESSION["190sms_rcptn"]);
        unset($_SESSION["190sms_note"]);
    }

    // Fine dello script, costruzione risposta per l'utente
    $risposta="";
    if($successSend==1){
        if ($successN != count($arrayto)) {
            // Supporto al ritorno del numero esatto di SMS inviati, in caso di invii parziali
            $risposta.="<num>0,$successN</num>";
        } else {
            $risposta.="<num>0</num>";
        }
    }else{
        $risposta.="<num>3</num>";
    }
    $risposta.="<txt>".$note."</txt>";
    termina($risposta);

?>