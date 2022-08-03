rule opendir
{
    strings:
        $a = "Index of"
        $b = "Directory listing for"
    condition:
        any of them
}

rule opendir_hfs
{
    strings:
        $c = "HttpFileServer"
    condition:
        any of them
}

rule opendir_zip
{
    strings:
        $index = "Index of"
        $dir = "Directory listing for"
        $httpfs = "HttpFileServer"
        $zip = ".zip" nocase

    condition:
        ($index or $dir or $httpfs) and $zip
}

rule opendir_exe
{
    strings:
        $index = "Index of"
        $dir = "Directory listing for"
        $httpfs = "HttpFileServer"
        $exe = ".exe" nocase

    condition:
        ($index or $dir or $httpfs) and $exe
}

rule opendir_sh
{
    strings:
        $index = "Index of"
        $dir = "Directory listing for"
        $httpfs = "HttpFileServer"
        $sh = ".sh" nocase

    condition:
        ($index or $dir or $httpfs) and $sh
}

rule outlook_phish_1
{
    strings:
        $outlook = "OUTLOOK"
        $googleapi = "googleapis.com"
        $ajax = "ajax"
        $redir = "window.location.replace"
    condition:
        all of them
}

rule ms_phish_1
{
    strings:
        $msg = "This file has been moved or deleted"
        $b64_next = "bmV4dC5waHA"
        $redir_msg = "You will be redirected to Microsoft"
    condition:
        all of them
}

rule b64_next
{
    strings:
        $b64_next = "bmV4dC5waHA"
    condition:
        all of them
}

rule vmware_esxi
{
    strings:
        $vmware = "Log in - VMware ESXi"
    condition:
        all of them
}

rule ms_phish_2
{
    strings:
        $email_var = "topMembaEmail"
        $alert_text = "Your email address must be"
        $alert_text2 = "Your email address is required"
        $redir = "window.location"
    condition:
        all of them
}

rule js_unescape
{
    strings:
        $code = "document.write(unescape"
    condition:
        all of them
}

rule ms_phish_3
{
    strings:
        $comment = "new injection"
        $b64 = "bmV4dC5waHA"
    condition:
        all of them
}

rule multilogin_phish
{
    strings:
        $error = "Please try again later"
        $redir = "window.location.replace"
        $gmail = "gmail.png"
        $outlook = "outlook.png"
        $office = "office365.png"
        $yahoo = "yahoo.png"
        $next = "next.php"
    condition:
        all of them
}

rule next_php
{
    strings:
        $next = "'next.php'"
    condition:
        all of them
}
