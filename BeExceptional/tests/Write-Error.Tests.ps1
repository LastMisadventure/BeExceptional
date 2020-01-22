Get-Module BeExceptional | Remove-Module -Force

Import-Module BeExceptional -Force

InModuleScope BeExceptional {

    Describe "private\Functions" {

        $message = 'TerminatingError'

        It "Mimics 'throw' if ErrorAction 'Stop' is set" {

            { TestWriteError -UseErrorAction Stop -Message $message } | Should -Throw $message

            { TestThrow -Message $message } | Should -Throw $message

        }

        It "Mimics 'throw' if ErrorAction 'Stop' is set, even if the caller specifies EA 'SilentlyContinue'" {

            { TestWriteError -UseErrorAction Stop -Message $message -ErrorAction SilentlyContinue } | Should -Throw $message

            { TestThrow -Message $message } | Should -Throw $message

        }

        # This test writes to the error steam, but does not terminate operation.
        It "Does not mimic 'throw' if ErrorAction is not set" {

            { TestWriteError -Message $message } | Should -Not -Throw

        }

    }

}
