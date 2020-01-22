function TestWriteError {

    [CmdletBinding(PositionalBinding, ConfirmImpact = 'low')]

    param (

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message,

        [Parameter(ValueFromPipelineByPropertyName, ValueFromPipeline, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]
        $UseErrorAction

    )

    $splat = @{

        Message = $Message

    }

    if ($PSBoundParameters.ContainsKey('UseErrorAction')) {

        $splat.Add('ErrorAction', $UseErrorAction)

    }

    Write-Error @splat

}

function TestThrow {

    [CmdletBinding(PositionalBinding, ConfirmImpact = 'low')]

    param (

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message

    )

    throw $Message

}
