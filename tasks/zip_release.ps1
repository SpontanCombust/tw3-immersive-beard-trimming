$MOD_NAME    = $args[0]   
$MOD_VERSION = $args[1]
$PACKED      = $args[2]

$zip = @{
    Path                = $PACKED+'\*'
    DestinationPath     = $PACKED+'\'+$MOD_NAME+' v'+$MOD_VERSION+'.zip'
    CompressionLevel    = "Optimal" 
}

Compress-Archive @zip