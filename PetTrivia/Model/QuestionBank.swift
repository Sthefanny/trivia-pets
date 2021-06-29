
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
        // tudo que não foi guessedRight
        var actual: [QuestionCard] = questionList.filter { i in
            return !guessedRight.contains(i.questionId)
        }
        
        // faz o alloptions funcionar
        if category != .allOptions {
            actual = actual.filter { i in
                return i.category == category
            }
        }
        
        return actual.shuffled()
    }
    
    
    init() {
        //MARK: - As opções corretas vão de 1 a 4 (não de 0 a 3)
        
        //MARK: - Alimentação Natural
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual cardápio está correto para alimentar o seu cão?",
                                options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."],
                                correctOption: 2,
                                questionId: 1,
                                note: "O cardápio que oferecemos para nossos pets na alimentação natural deve ser planejado por nutricionistas especializados nesse tipo de dieta. No entanto, alguns alimentos não são permitidos de maneira geral, como:\nCebola: tanto crua quanto cozida, contém uma toxina que pode oxidar os glóbulos vermelhos do cachorro, reduzindo a capacidade de transportar oxigênio. Isso pode resultar em uma doença chamada anemia hemolítica, que pode vir a ser fatal.\nFrutas ácidas, como laranja, uva ou abacaxi, pois podem causar gastrite;\nFrituras, e até mesmo gorduras em geral podem causar pancreatite nos cães."
))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "No que consiste a dieta de alimentação natural?",
                                options: ["Mix de ingredientes naturais e pouco processados.","Dieta de produtos orgânicos.","Alimentação à base de carne crua.","Dieta à base de frutas e salada."],
                                correctOption: 1, questionId: 2, note: "A dieta de alimentação natural é balanceada, composta por ingredientes naturais e pouco processados, projetadas especificamente para suprir todas as necessidades do cão. Por ser personalizada, o cão recebe a quantidade exata de nutrientes que precisa, melhorando a saúde e a digestão.\nAo contrário das rações industrializadas, a alimentação natural passa por poucos tratamentos. Ela é composta majoritariamente por:\nproteínas, como peixe, frango, boi ou ovos;\ncarboidratos e fibras, como arroz, lentilha, cenoura, normalmente triturados, como se tivessem sido consumidos pelas fontes de proteína;\ngorduras, como banha suína, óleo de peixe e de coco.\nA dieta pode ser crua ou cozida, dependendo do caso de cada cão, e tendo necessidade de ser congelada caso seja crua para reduzir o risco de potenciais infecções alimentares."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual opção NÃO traz algum dos benefícios da alimentação natural?",
                                options: ["Gorduras saudáveis.","Maior índice de água.","Isento de conservantes e corantes.","Alto índice glicêmico."],
                                correctOption: 4, questionId: 3, note: "A alimentação natural traz diversos benefícios para o pet, como seus índices ideais de proteína animal, carboidratos não inflamatórios e de baixo índice glicêmico, além de gorduras saudáveis. Ela não leva nenhum tipo de aditivo químico, como conservantes, corantes e estabilizantes artificiais."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual a melhor receita de alimentação natural para um dia quente?",
                                options: ["Biscoito de maçã.","Picolé de frutas.","Bolo de chocolate canino.","Cubo de gelo."],
                                correctOption: 2, questionId: 4, note: "Nota: Nos dias quentes, o ideal para os cachorros são mimos que ajudem a hidratar de maneira saborosa.\nUma boa ideia é fazer picolé caseiro de frutas, sem adição de açúcar e leite. Uma opção de receita é congelar água de coco com pequenos pedaços de fruta, como maçã ou banana.\nOs picolés são uma boa forma de interação, que ajuda a aliviar o estresse e ansiedade do animal. Deve ser entendido como um petisco, ou seja, não pode substituir uma refeição principal do animal e o volume ingerido deve ser o equivalente a até 10% da necessidade calórica diária do cão."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Além de água, qual a melhor opção para hidratar seu cãozinho?",
                                options: ["Leite.","Água de coco.","Suco de laranja.","Água com limão."],
                                correctOption: 2, questionId: 5, note: "Uma boa alternativa de líquido permitido para os cachorros é a água de coco. Muito popular no verão, ela é saudável, nutritiva, saborosa e ótima fonte de potássio para os bichinhos. Além disso, a água de coco contribui para melhorar a função renal dos cães.\nEntretanto, assim como o suco de frutas, ela deve ser oferecida com parcimônia: caso seja dada quente ou em grande quantidade, pode dar dor de barriga no seu cachorro. Por isso, lembre-se que é só um pouquinho!"))
        
        //MARK: - Comidas Permitidas
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Ossos de quais animais podem ser dados para cães?",
                                options: ["Ossos crus, bovinos.","Ossos assados de porco.","Ossos de coxa de frango.","Ossos crus ou sintéticos."],
                                correctOption: 4, questionId: 6, note: nil))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Cachorros podem comer frutas?",
                                options: ["Sim, pois elas substituem as refeições normais do pet.","Sim, mas apenas frutas cítricas.","Não, todas as frutas fazem mal para o cachorro.","Sim, mas somente algumas frutas específicas."],
                                correctOption: 4, questionId: 7, note: nil))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual dessas opções é permitido dar ao cachorro?",
                                options: ["Chocolate.","Abacate.","Salsicha.","Batata."],
                                correctOption: 4, questionId: 8, note: nil))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Identifique o ingrediente NÃO prejudicial ao cachorro, em petiscos:",
                                options: ["Sódio.","Lactose.","Proteína animal.","Açúcar."],
                                correctOption: 3, questionId: 9, note: nil))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual o maior benefício da ração úmida?",
                                options: ["Ajuda na saúde bucal.","Melhora hidratação.","Combate a obesidade.","É mais nutritiva."],
                                correctOption: 2, questionId: 10, note: nil))
        
        //MARK: - Enriquecimento Ambiental
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que é enriquecimento ambiental para cães?",
                                options: ["Otimização da rotina do animal.","Brinquedoteca em casa, para o cachorro.","Caminhas de cachorro em todos os cômodos.","Decoração feita especialmente para o animal."],
                                correctOption: 1, questionId: 11, note: nil))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que NÃO torna a alimentação do seu cão instintiva?",
                                options: ["Com brinquedo de esconder ração.","Congelando petiscos em um cubo de gelo.","Amarrando um brinquedo no alto.","Deixando o pote de ração sempre cheio."],
                                correctOption: 4, questionId: 12, note: nil))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Como NÃO estimular o animal?",
                                options: ["Montar mini circuitos interativos.","Brincar de caça ao tesouro.","Brincar de laser com o cachorro.","Pendurar brinquedos numa altura elevada."],
                                correctOption: 3, questionId: 13, note: nil))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Qual aromatizante deve ser evitado colocar no mesmo ambiente do animal?",
                                options: ["Lavanda.","Capim-limão.","Amêndoa.","Hortelã."],
                                correctOption: 3, questionId: 14, note: nil))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que NÃO melhora as habilidades sociais do seu cachorro?",
                                options: ["Levar ao parque.","Creche de cachorro.","Passeio coletivo.","Soltar na rua."],
                                correctOption: 4, questionId: 15, note: nil))
    }
    
}
