Get-Module BeExceptional | Remove-Module -Force

Import-Module BeExceptional -Force

InModuleScope BeExceptional {

    function TestWriteErrorErrorActionStop {

        [CmdletBinding(PositionalBinding, ConfirmImpact = 'medium')]

        param (

        )

        Write-Error -ErrorAction Stop -Message 'TerminatingError'

    }

    function TestThrow {

        [CmdletBinding(PositionalBinding, ConfirmImpact = 'medium')]

        param (

        )

        throw 'TerminatingError'

    }

    Describe "private\Exceptions" {

        It "Behaves the same as 'throw' if ErrorAction 'Stop' is set" {

            { TestWriteErrorErrorActionStop } | Should -Throw 'TerminatingError'

            { TestThrow } | Should -Throw 'TerminatingError'

        }

    }

}
