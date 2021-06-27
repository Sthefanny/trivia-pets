
//
//  QuestionBank.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import Foundation

class QuestionBank {
    static var instance = QuestionBank()
    var questionList = [QuestionCard]()

    
    func questionFilter(category: QuestionCategory, guessedRight: [Int]) -> [QuestionCard] {
        var actual: [QuestionCard] = questionList.filter { i in
            return !guessedRight.contains(i.questionId)
        }
        
        if category != .allOptions {
            actual = actual.filter { i in
                return i.category == category
            }
        }
        
        return actual.shuffled()
    }
    
    
    init() {
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual cardápio está correto para alimentar o seu cão?",
                                options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."],
                                correctOption: 1, questionId: 1))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "No que consiste a dieta de alimentação natural?",
                                options: ["Mix de ingredientes naturais e pouco processados.","Dieta de produtos orgânicos.","Alimentação à base de carne crua.","Dieta à base de frutas e salada."],
                                correctOption: 0, questionId: 2))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual opção NÃO traz algum dos benefícios da alimentação natural?",
                                options: ["Gorduras saudáveis.","Maior índice de água.","Isento de conservantes e corantes.","Alto índice glicêmico."],
                                correctOption: 3, questionId: 3))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual a melhor receita de alimentação natural para um dia quente?",
                                options: ["Biscoito de maçã.","Picolé de frutas.","Bolo de chocolate canino.","Cubo de gelo."],
                                correctOption: 1, questionId: 4))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Além de água, qual a melhor opção para hidratar seu cãozinho?",
                                options: ["Leite.","Água de coco.","Suco de laranja.","Água com limão."],
                                correctOption: 1, questionId: 5))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Ossos de quais animais podem ser dados para cães?",
                                options: ["Osso bovino.","Osso de porco.","Osso de frango.","Todas acima, mas apenas crus."],
                                correctOption: 1, questionId: 6))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Cachorros podem comer frutas?",
                                options: ["Sim, pois elas substituem as refeições normais do pet.","Sim, mas apenas frutas cítricas.","Não, todas as frutas fazem mal para o cachorro.","Sim, mas somente algumas frutas específicas."],
                                correctOption: 3, questionId: 7))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual dessas opções é permitido dar ao cachorro?",
                                options: ["Chocolate.","Abacate.","Salsicha.","Batata."],
                                correctOption: 3, questionId: 8))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Identifique o ingrediente não prejudicial ao cachorro, em petiscos:",
                                options: ["Sódio.","Lactose.","Proteína animal.","Açúcar."],
                                correctOption: 2, questionId: 9))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual o maior benefício da ração úmida?",
                                options: ["Ajuda na saúde bucal.","Melhora hidratação.","Combate a obesidade.","É mais nutritiva."],
                                correctOption: 1, questionId: 10))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que é enriquecimento ambiental para cães?",
                                options: ["Otimização da rotina do animal.","Brinquedoteca em casa, para o cachorro.","Caminhas de cachorro em todos os cômodos.","Decoração feita especialmente para o animal."],
                                correctOption: 0, questionId: 11))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Como não estimular o animal?",
                                options: ["Com brinquedo de esconder ração.","Congelando petiscos em um cubo de gelo.","Amarrando um brinquedo no alto.","Deixando o pote de ração sempre cheio."],
                                correctOption: 3, questionId: 12))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que não torna a alimentação do seu cão instintiva?",
                                options: ["Espalhar a ração no chão.","Brincar de caça ao tesouro.","Dar ração no comedouro automático.","Oferecer alimentos com consistências diferentes."],
                                correctOption: 2, questionId: 13))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Qual aromatizante deve ser evitado colocar no mesmo ambiente do animal?",
                                options: ["Lavanda.","Capim-limão.","Amêndoa.","Hortelã."],
                                correctOption: 2, questionId: 14))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que não melhora as habilidades sociais do seu cachorro?",
                                options: ["Levar ao parque.","Creche de cachorro.","Passeio coletivo.","Soltar na rua, para passeio."],
                                correctOption: 3, questionId: 15))
    }
    
}
