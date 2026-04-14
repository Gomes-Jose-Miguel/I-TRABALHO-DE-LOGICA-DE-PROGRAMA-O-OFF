algoritmo "Sistema_de_Notas"
var
   matricula: vetor[1..50] de inteiro
   nome: vetor[1..50] de caractere
   notas: vetor[1..50, 1..4] de real
   media: vetor[1..50] de real
   total, i, j, opcao: inteiro
   soma, mediaTurma: real
inicio
   total <- 0
   repita
      escreval("1 - Cadastrar aluno")
      escreval("2 - Lançar notas")
      escreval("3 - Calcular médias")
      escreval("4 - Relatórios")
      escreval("0 - Sair")
      leia(opcao)
      escolha opcao
      caso 1
         total <- total + 1
         escreva("nº de Matricula: ")
         leia(matricula[total])
         escreva("Nome do Estudante: ")
         leia(nome[total])
         escreval ("Estudante Cadastrato ")
         escreval(" ")
      caso 2
         para i de 1 ate total faca
            escreval(" Aluno: ", nome[i])
            para j de 1 ate 4 faca
               escreva(" Nota ", j, ": ")
               leia(notas[i,j])
            fimpara
         fimpara
      caso 3
         para i  de 1 ate total faca
            soma <- 0
            para j de 1 ate 4 faca
               soma <- soma + notas[i,j]
            fimpara
            media[i] <- soma / 4
         fimpara
      caso 4
         escreval(" --- RELATÓRIO DA TURMA ---")
         escreval(" ")
         escreval(" --- APROVADOS ---")
         para i de 1 ate total faca
            se media[i] >= 10 entao
               escreval(nome[i], " - ", media[i])
            fimse
         fimpara
         escreval("--- REPROVADOS ---")
         para i de 1 ate total faca
            se media[i] < 10 entao
               escreval(nome[i], " - ", media[i])
            fimse
         fimpara

         // média da turma
         soma <- 0
         para i de 1 ate total faca
            soma <- soma + media[i]
         fimpara
         mediaTurma <- soma / total
         escreval("Media da turma: ", mediaTurma)
         // ranking (ordenação simples)
         para i de 1 ate total-1 faca
            para j de i+1 ate total faca
               se media[j] > media[i] entao
                  // troca média
                  soma <- media[i]
                  media[i] <- media[j]
                  media[j] <- soma
                  // troca nome
                  nome[0] <- nome[i]
                  nome[i] <- nome[j]
                  nome[j] <- nome[0]
               fimse
            fimpara
         fimpara
         escreval("--- RANKING ---")
         para i de 1 ate total faca
            escreval(i, "º ", nome[i], " - ", media[i])
         fimpara
      fimescolha
   ate opcao = 0
fimalgoritmo
