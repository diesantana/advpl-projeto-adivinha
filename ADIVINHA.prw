#include 'totvs.ch'

/*/{Protheus.doc} ADVINHA
Gera a lógica do Jogo de Adivinhar. 
@type user function
@author Diego Santana
@since 06/05/2026
@version 1.0
/*/
User Function ADIVINHA
    Local nRandom := Randomize(1, 100) // Número a ser adivinhado
    Local nUser := 0 // Número digitado pelo usuário
    Local nErrors := 0 // Número de tentativas erradas
    Local cMsg // Monta a mensagem de retorno

    // Repete o While enquanto o nRandom for diferente de nUser
    while nRandom != nUser
        // Recebe o valor digitado pelo Usuário
        nUser := Val(FWInputBox("Digite um número:", ""))

        // Verifica se acertou o número
        if nUser == nRandom
            cMsg := "Você acertou!<br>O Número é:<b>" + cValToChar(nRandom) + "</b><br>Erros: " + cValToChar(nErrors)
            MsgInfo(cMsg, "Fim de Jogo!")
        elseif nUser > nRandom
            cMsg := "Você Errou!<br>O Número é MENOR que <b>" + cValToChar(nUser) + "</b>"
            MsgInfo(cMsg, "Tente Novamente")
            nErrors++ // Incrementa a variável de erros
        else
            cMsg := "Você Errou!<br>O Número é MAIOR que <b>" + cValToChar(nUser) + "</b>"
            MsgInfo(cMsg, "Tente Novamente")
            nErrors++ // Incrementa a variável de erros
        endif
    end
Return
