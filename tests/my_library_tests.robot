*** Settings ***
# Import the Remote library pointing to your Java Server
Library    Remote    http://127.0.0.1:8270/    AS    RobotJavaLibrary

*** Variables ***
# A list where numbers divisible by 3 are replaced with "foo",
# numbers divisible by 5 are replaced with "bar",
# and numbers divisible by both 3 and 5 are replaced with "foobar".
@{EXPECTED_FOOBAR}    1  2  foo  4  bar  foo  7  8  foo  bar  11  foo  13  14  foobar  16  17  foo  19  bar

*** Test Cases ***
Execute Java Logic
    ${result}=    Hello From Java
    Should Be Equal    ${result}    hello from java

Execute Multiply Keyword
    ${result}=    Multiply    ${5}    ${10}
    Should Be Equal As Integers    ${result}    50

    ${result}=    Multiply    -3    7
    Should Be Equal As Integers    ${result}    -21

    ${result}=    Multiply    0    100
    Should Be Equal As Integers    ${result}    0

Execute Foobar Keyword
    ${result}=    Generate Foobar   20
    Should Be Equal    ${result}    ${EXPECTED_FOOBAR}

    # The actual error is java.lang.IllegalArgumentException
    Run Keyword And Expect Error    *IllegalArgumentException*    Generate Foobar   -5
