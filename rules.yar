rule login
{
    strings:
        $a = "username" nocase
        $b = "password" nocase

    condition:
        $a and $b
}

rule opendir
{
    strings:
        $a = "Index of"
        $b = "Directory listing for"
        $c = "HttpFileServer"
    condition:
        any of them
}

rule opendir_zip
{
    strings:
        $a = "Index of"
        $b = ".zip" nocase

    condition:
        $a and $b
}

rule opendir_exe
{
    strings:
        $a = "Index of"
        $b = ".exe" nocase

    condition:
        $a and $b
}
