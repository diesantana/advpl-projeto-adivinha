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

    // Repete o While enquanto o nRandom for diferente de nUser
    while nRandom != nUser
        // Recebe o valor digitado pelo Usuário
        nUser := Val(FWInputBox("Digite um número:", ""))

        // Verifica se acertou o número
        if nUser == nRandom
            MsgInfo("Você acertou! O Número é:<b>" + cValToChar(nRandom) + "</b>", "Fim de Jogo!")
        elseif nUser > nRandom
            MsgInfo("Você Errou! O Número é MENOR que:<b>" + cValToChar(nUser) + "</b>", "Tente Novamente")
        else
            MsgInfo("Você Errou! O Número é MAIOR que:<b>" + cValToChar(nUser) + "</b>", "Tente Novamente")
        endif
    end
Return
