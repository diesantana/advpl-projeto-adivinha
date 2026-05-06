#include 'totvs.ch'

/*/{Protheus.doc} ADVINHA
Gera a lógica do Jogo de Adivinhar. 
@type user function
@author Diego Santana
@since 06/05/2026
@version 1.0
/*/
User Function ADIVINHA
	Local aNiveis := {"Fácil", "Normal", "Dificil"} // Define os níveis de dificuldade
	Local nNivel := 0 // Define o Nível de dificuldade
	Local nMax := 100 // Define o valor máximo de números randomicos

	Local nRandom := 0 // Número a ser adivinhado
	Local nUser := 0 // Número digitado pelo usuário
	Local nErrors := 0 // Número de tentativas erradas
	Local cMsg // Monta a mensagem de retorno

	// Pergunta o nível para o usuário
	// Aviso( <cTitulo>, <cMensagem>, <aBotões>, <nTempo>, <cSubtitulo> ).
	nNivel := Aviso("Dificuldade", "Escolha o nível de dificuldade:", aNiveis, 3, )

    // Define o valor máximo de números randomicos de acordo com a escolha do usuário
    Do Case
        Case nNivel == 1
            nMax := 50 // Nível Fácil
        Case nNivel == 2
            nMax := 100 // Nível Normal
        Case nNivel == 3
            nMax := 200 // Nível Dificil
        Otherwise
            nMax := 100 // Default = Normal
    EndCase

    // Gera o número aleatório de acordo com a dificuldade
    nRandom := Randomize(1, nMax)

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
