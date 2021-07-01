
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
    
    func loadCorrectAnswers(_ category: QuestionCategory) -> [QuestionCard] {
        let allQuestions = QuestionBank.instance.questionList
        let rightIDs = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        let rightQuestions = allQuestions.filter {
            rightIDs.contains($0.questionId) &&
                $0.category == category
        }
        
        return (rightQuestions)
    }
    
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
                                note: "O cardápio que oferecemos para nossos pets na alimentação natural deve ser planejado por nutricionistas especializados nesse tipo de dieta. No entanto, alguns alimentos não são permitidos de maneira geral, como:\n\n • Cebola: tanto crua quanto cozida, contém uma toxina que pode oxidar os glóbulos vermelhos do cachorro, reduzindo a capacidade de transportar oxigênio. Isso pode resultar em uma doença chamada anemia hemolítica, que pode vir a ser fatal; \n\n • Frutas ácidas, como laranja, uva ou abacaxi, pois podem causar gastrite;\n\n • Frituras, e até mesmo gorduras em geral podem causar pancreatite nos cães."
))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "No que consiste a dieta de alimentação natural?",
                                options: ["Mix de ingredientes naturais e pouco processados.","Dieta de produtos orgânicos.","Alimentação à base de carne crua.","Dieta à base de frutas e salada."],
                                correctOption: 1, questionId: 2,
                                note: "A dieta de alimentação natural é balanceada, composta por ingredientes naturais e pouco processados, projetada especificamente para suprir todas as necessidades do cão.Por ser personalizada, o cão recebe a quantidade exata de nutrientes que precisa, melhorando sua saúde e digestão.\nNão contrária das rações industrializadas, a alimentação natural passa por poucos tratamentos. Ela é composta, majoritariamente, por:\n\n • proteínas, como peixe, frango, boi ou ovos;\n • carboidratos e fibras, como arroz, lentilha, cenoura (normalmente triturados, como se tivessem sido consumidos pelas fontes de proteína);\n • gorduras, como banha suína, óleo de peixe e de coco.\nA dieta pode ser crua ou cozida, dependendo do caso de cada cão, e pode existir a necessidade de ser congelada, caso seja crua, para reduzir o risco de potenciais infecções alimentares."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual opção NÃO traz algum dos benefícios da alimentação natural?",
                                options: ["Gorduras saudáveis.","Maior índice de água.","Isento de conservantes e corantes.","Alto índice glicêmico."],
                                correctOption: 4, questionId: 3,
                                note: "A alimentação natural traz diversos benefícios para o pet, como: \n\n • índices ideais de proteína animal; \n • carboidratos não inflamatórios e de baixo índice glicêmico; \n • gorduras saudáveis. \n\nEla não leva nenhum tipo de aditivo químico, como conservantes, corantes e estabilizantes artificiais."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Qual a melhor receita de alimentação natural para um dia quente?",
                                options: ["Biscoito de maçã.","Picolé de frutas.","Bolo de chocolate canino.","Cubo de gelo."],
                                correctOption: 2, questionId: 4,
                                note: "Nos dias quentes, o ideal para os cachorros são mimos que ajudem a hidratar de maneira saborosa.\nUma boa ideia é fazer picolé caseiro de frutas, sem adição de açúcar e leite. Uma opção de receita é congelar água de coco com pequenos pedaços de fruta, como maçã ou banana.\n\nOs picolés são uma boa forma de interação, o que ajuda a aliviar o estresse e ansiedade do animal.\n\nNo entanto, devem ser entendidos como petisco, ou seja, não podem substituir uma refeição principal do animal e o volume ingerido deve ser o equivalente a até 10% da necessidade calórica diária do cão."))
        questionList.append(QuestionCard(
                                category: .naturalDiet,
                                description: "Além de água, qual a melhor opção para hidratar seu cãozinho?",
                                options: ["Leite.","Água de coco.","Suco de laranja.","Água com limão."],
                                correctOption: 2, questionId: 5,
                                note: "Uma boa alternativa de líquido permitido para os cachorros é a água de coco.\nMuito popular no verão, ela é saudável, nutritiva, saborosa e ótima fonte de potássio para os bichinhos. Além disso, a água de coco contribui para melhorar a função renal dos cães.\n\nEntretanto, assim como o suco de frutas, ela deve ser oferecida com parcimônia: caso seja dada quente ou em grande quantidade, pode resultar em dor de barriga no seu cachorro. Por isso, lembre-se que é só um pouquinho!"))
        
        //MARK: - Comidas Permitidas
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Ossos de quais animais podem ser dados para cães?",
                                options: ["Ossos crus, bovinos.","Ossos assados de porco.","Ossos de coxa de frango.","Ossos crus ou sintéticos."],
                                correctOption: 4, questionId: 6,
                                note: "Apesar de serem fonte de proteína e nem sempre serem perigosos, os ossos podem se despedaçar, quando mordidos, e causar lesões em órgãos internos, ou mesmo asfixia, gerando um risco desnecessário à vida do animal. \n\nOssos cozidos ou assados de alguma forma, principalmente os que representam restos de comida humana, como churrascos e refogados, além de possuírem vestígios de tempero impróprio para animais, por terem sido aquecidos, se encontram mais frágeis e propensos a quebrar e gerar farpas extremamente perigosas aos cães. \nGarantir que o cachorro tenha um objeto seguro para roer é ótimo para promover seu bem estar, mas é importante observar seu pet durante o processo, para evitar riscos.\n\nCaso a escolha seja os ossos naturais, que são altamente proteicos, é importante garantir que estejam crus, além de evitar os ossos pequenos, como os de frango.\n\nNo entanto, alguns veterinários não recomendam esses ossos, por conta dos possíveis riscos de contaminação, e preferem opções sintéticas, como petiscos rígidos, próprios para roer, ossos feitos com ingredientes 100% naturais, que simulam a textura de ossos de verdade, ou ossinhos de plástico mastigável. É necessário se atentar ao teor calórico desses materiais, controlando a alimentação do animal e evitando a obesidade canina.\n\nDentre os muitos benefícios dos ossos, se destacam:\n\n• Auxílio na remoção de sujeira dos dentes;\n\n• Prevenção do tártaro canino;\n\n• Fortalecimento da musculatura craniana e do pescoço;\n\n• Estímulo dos instintos caninos;\n\n• Alívio do estresse;\n\n• Distração e entretenimento do pet."))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Cachorros podem comer frutas?",
                                options: ["Sim, pois elas substituem as refeições normais do pet.","Sim, mas apenas frutas cítricas.","Não, todas as frutas fazem mal para o cachorro.","Sim, mas somente algumas frutas específicas."],
                                correctOption: 4, questionId: 7,
                                note: "Cachorros não devem ser alimentados exclusivamente por frutas*, uma vez que elas não suprem todas as exigências nutricionais do animal. No entanto, algumas podem ser inseridas na dieta do seu cão, seguindo certos cuidados:\n\n• higienizar bem a fruta;\n\n• cortar em pedaços que estejam de acordo com o tamanho do pet;\n\n• retirar cascas e sementes. \n\nAs frutas podem substituir os petiscos artificiais, ou servir como um lanchinho antes das refeições principais (mas devem ser oferecidas na quantidade diária estipulada, para que não ocorra excesso de calorias). As ideais para seu bichinho são:\n\n• Banana (rica em potássio e carboidratos);\n• Pêra (rica em fibras, ácido fólico, potássio, fósforo e antioxidantes);• Maçã (de fácil digestão e rica em vitaminas A, C, B, E, K e minerais);\n• Mamão (textura de fácil mastigação e rica em vitamina A, C e fibras para o trato intestinal);\n• Melancia (auxílio na hidratação e rica em potássio, magnésio e vitaminas A e C);\n• Laranja (auxílio na hidratação e rica em fibra e vitamina C - recomendada apenas a cães sem gastrite);\n• Coco (rico em vitaminas, especialmente a E, e antioxidante);\n• Kiwi (rico em vitamina C, suas pequenas sementes não fazem mal);\n• Goiaba (rica em fósforo, ferro, vitaminas A, B e C, suas pequenas sementes não fazem mal).\n\n*Um cachorro pode ser alérgico a algumas frutas, por isso é importante consultar o médico veterinário do seu pet antes de inserir esse tipo de alimento em sua dieta."))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual dessas opções é permitido dar ao cachorro?",
                                options: ["Chocolate.","Abacate.","Salsicha.","Batata."],
                                correctOption: 4, questionId: 8,
                                note: "• Batatas podem ser dadas a cachorros, tanto assadas quanto cozidas, e sem a adição de sal e outros temperos.\nElas são ricas em vitaminas do complexo B e K, fósforo e potássio. Auxiliam na metabolização de nutrientes, sistema nervoso, estrutura óssea dentária, transmissão de impulsos nervosos, além de serem antioxidantes.\nSeu pet pode comer batata cozida amassada, evitando a receita tradicional de purê que leva manteiga e leite, que são ingredientes não seguros aos cães. Crua, a batata possui uma substância que pode intoxicar o animal, por isso não é permitido.\n\nAlimentos não permitidos: \n\n• O chocolate tem como base os grãos de cacau, que contém dois ingredientes potencialmente letais para cachorros: a teobromina e a cafeína. \nPor isso, quanto mais cacau houver no chocolate, mais tóxico ele é aos cães. Além disso, a maior parte dos chocolates contém açúcar, altamente prejudicial para a saúde canina. \nCaso o pet ingira chocolate sem o seu conhecimento, os sintomas perceptíveis são inquietação e hiperatividade. Ao perceber que o bichinho comeu chocolate, leve-o imediatamente ao médico veterinário. Existem muitas opções no mercado de chocolate para cachorro, e, somente nesse caso, ele pode comer chocolate.\n\n• O abacate também deve ficar longe de seu amigo peludo. A fruta possui uma substância chamada persina, que é venenosa para os pets, e pode causar intoxicação alimentar, vômitos, diarréias e problemas no coração.\n• A salsicha é um embutido que contém temperos como sal, alho, cebola, pimenta e outras especiarias, além de conservantes (sendo um deles o nitrito, que possui efeito maléfico no organismo e é um potente cancerígeno) e corantes. Este alimento pode levar à anemia canina, ou mesmo problemas respiratórios. As guloseimas feitas especialmente para cachorro são muito mais saudáveis para o seu cão.\n\nE, lembre-se: nenhuma fritura pode ser dada ao bichinho, portanto batata frita ou chips industrializadas também são proibidas!\n\n*Antes de dar qualquer alimento ao seu cãozinho, procure sempre saber se fará bem ou mal a ele, conferindo com um profissional da área a melhor maneira de alimentar o pet."))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Identifique o ingrediente NÃO prejudicial ao cachorro, em petiscos:",
                                options: ["Sódio.","Lactose.","Proteína animal.","Açúcar."],
                                correctOption: 3, questionId: 9,
                                note: "As proteínas de origem animal são as mais adequadas para os cães, pensando em seu metabolismo, que é adaptado para digerir e absorver esses nutrientes. Essa proteína colabora para diferentes funções como crescimento, desenvolvimento, reprodução, reparo tecidual, produção de novos tecidos, formação de uma pelagem saudável e produção de células de defesa.\n\nNa dosagem adequada, o sódio não apresenta nenhum problema na alimentação do cão e é, inclusive, essencial para a dieta deles. Ele participa de processos celulares importantes para o bom funcionamento do organismo, além de colaborar nas contrações musculares, como as do coração, e na manutenção de energia do corpo. Mas, seu consumo excessivo pode causar problemas renais, hipertensão, ou mesmo as incômodas pedras nos rins (que podem acontecer principalmente por conta da ração seca industrializada, que contém um nível muito alto de sódio). Nesse caso, pode ser uma boa ideia subtituir, aos poucos a ração por uma alimentação natural para o cão.\n\nAssim como os humanos, os cães também passam a produzir menos lactase — enzima responsável pela quebra da lactose — conforme vão crescendo. Com uma capacidade limitada de quebrar o açúcar do leite, a digestão do alimento vai ficando cada vez mais prejudicada ao longo do tempo e, por isso, muitos deles se tornam intolerantes à lactose, o que pode provocar diversas reações gastrointestinais após a ingestão de leite, com quadros de vômitos, diarreias, gases e dores abdominais.\n\nO açúcar pode trazer inúmeros problemas como sobrepeso, obesidade e rejeição futura de outros alimentos adequados para a saúde do animal. Os tutores podem oferecer sabores adocicados para os cães, mas apenas de fontes naturais, como frutas e vegetais, e com moderação."))
        questionList.append(QuestionCard(
                                category: .allowedFood,
                                description: "Qual o maior benefício da ração úmida?",
                                options: ["Ajuda na saúde bucal.","Melhora hidratação.","Combate a obesidade.","É mais nutritiva."],
                                correctOption: 2, questionId: 10,
                                note: "Rações úmidas trazem o benefício de conter uma concentração de até 80% de líquido, ajudando a hidratar o animal. Por conta disso, problemas como alta concentração na urina, doenças renais e hepáticas acabam sendo prevenidos. \n\nAnimais mais velhos, que já perderam parte do seu olfato e precisam do paladar, podem se mostrar mais inclinados a comer um alimento com aroma mais forte e sabor mais acentuado. Essa também pode ser uma alternativa para pets doentes que apresentem pouco apetite, assegurando assim que eles estão recebendo as proteínas, vitaminas e minerais que precisam para se recuperar. \n\nAs rações úmidas são mais moles e por isso também beneficiam cães com falta de dentes, mandíbulas mal alinhadas ou bocas menores. \n\nEntretanto, a ingestão de ração úmida em maiores quantidades não é indicada, pois aumenta as chances de o animal desenvolver placas bacterianas nos dentes, por não haver o atrito comumente feito pela ração seca. \nAlém disso, dependendo da marca, o alimento pode apresentar alta concentração de conservantes e corantes, podendo causar alergias se houver exagero no consumo. \n\nConsulte um veterinário para saber a quantidade correta que deve ser dada, de acordo com as necessidades nutricionais do seu cão."))
        
        //MARK: - Enriquecimento Ambiental
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que é enriquecimento ambiental para cães?",
                                options: ["Otimização da rotina do animal.","Brinquedoteca em casa, para o cachorro.","Caminhas de cachorro em todos os cômodos.","Decoração feita especialmente para o animal."],
                                correctOption: 1, questionId: 11,
                                note: "O enriquecimento ambiental é uma prática que busca adaptar, ao máximo, o local de vivência do seu cão. Ele tem por objetivo estimular os pets, com atividades que podem envolver:\n\n• o raciocínio e a memória (geralmente tarefas e pequenos desafios para que o cachorro seja levado a resolver situações); \n\n• a alimentação (estimulando o comportamento de caça e de desafio dos cães, que é algo natural da espécie); \n\n•  o desenvolvimento físico (através de mecanismos para estimular a atividade física e interação com o espaço); \n\n • o desenvolvimento social (buscando integrar o animal em outros ambientes, como na natureza, e em contato com outros animais, inclusive de outras espécies, e pessoas — essa socialização é muito importante, mas você precisa preparar seu pet para isso)."))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que NÃO torna a alimentação do seu cão instintiva?",
                                options: ["Com brinquedo de esconder ração.","Congelando petiscos em um cubo de gelo.","Amarrando um brinquedo no alto.","Deixando o pote de ração sempre cheio."],
                                correctOption: 4, questionId: 12,
                                note: "Quando os animais estão na natureza, precisam competir constantemente para conseguir alimento. Já os animais domésticos tendem a conseguir seu alimento com muita facilidade. \nO animal pode ter uma experiência mais próxima do que teria na natureza ao utlizar o enriquecimento ambiental para estimular o comportamento natural de caça e de desafio. \n\nExistem diversos brinquedos em que a ração fica escondida e o cachorro precisa mexer bastante para conseguir comer, ou atividades e tarefas que podem otimizar o cotidiano do pet, assim como sua maneira de se alimentar. \n\nUma maneira simples de fazer o animal gastar energia é oferecer a ração de forma criativa: congelando petiscos, escondendo a ração e até dando petiscos com diferentes consistências."))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Como NÃO estimular o animal?",
                                options: ["Montar mini circuitos interativos.","Brincar de caça ao tesouro.","Brincar de laser com o cachorro.","Pendurar brinquedos numa altura elevada."],
                                correctOption: 3, questionId: 13,
                                note: "Além das tarefas básicas de cuidados com um bichinho, é necessário criar um ambiente saudável para a convivência do animal. \n\nUma das maneiras de melhorar a cognição do seu animal é por meio de estímulos interativos como:\n\n• mini circuitos;\n\n• caça ao tesouro;\n\n• pendurar brinquedos.\n\nPorém, devemos sempre ter em mente que é necessário que o pet tenha uma recompensa ao final.\n\nBrincadeiras como o uso de laser costumam deixar os animais muito estressados por nunca conseguirem alcançar a luz, o que pode ser extremamente confuso e frustrante. Dessa maneira, tais tipos de atividades devem ser evitadas, para não afetar a saúde física e mental do cachorro."))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "Qual aromatizante deve ser evitado no ambiente do animal?",
                                options: ["Lavanda.","Capim-limão.","Amêndoa.","Hortelã."],
                                correctOption: 3, questionId: 14,
                                note: "Determinados aromas podem acalmar e relaxar, ou mesmo proporcionar outros benefícios para cães. Eles podem facilmente detectar os odores com extrema precisão, e usam seu olfato para obter todos os tipos de informações complexas do ambiente. Desse modo, podem calcular e prever que resposta e postura devem adotar. \n\nA aromaterapia, através de óleos essenciais, é recomendada para cães por seus diversos benefícios. Porém, devemos nos atentar com a qualidade do oléo, procurando sempre a versão pura para evitar possíveis prejuízos para a saúde do pet.\n\nEnquanto o aroma de lavanda cria sensações calmantes, o aroma de capim-limão repele insetos (como pulgas e carrapatos), o aroma de hortelã ajuda na perda de peso canina, bem como a equilibra o metabolismo e estimula a bexiga, nem todos os odores são ideais para seu pet. \nExistem 30 óleos essenciais que devem ser evitados em animais (dentre eles, está o óleo de amêndoa):\n\n• absinto;\n• alho;\n• anis;\n• amêndoa;\n• artemísia;\n• boldo;\n• cálamo;\n• cânfora;\n• cássia;\n• chenopodium;\n• cravinho;\n• goosefoot;\n• hissopo;\n• juniper;\n• melaleuca;\n• milefólio;\n• mostarda;\n• orégano;\n• pennyroyql;\n• rábano;\n• rue;\n• santolina;\n• sassafrás;\n• salgados;\n• tansa;\n• terebinto;\n• thuja;\n• tomilho (vermelho ou branco);\n• vidoeiro;\n• wintergreen."))
        questionList.append(QuestionCard(
                                category: .environmentalEnrichment,
                                description: "O que NÃO melhora as habilidades sociais do seu cachorro?",
                                options: ["Levar ao parque.","Creche de cachorro.","Passeio coletivo.","Soltar na rua."],
                                correctOption: 4, questionId: 15,
                                note: "É muito importante integrar o cachorro em outros ambientes, como na natureza, e em contato com outros animais (inclusive de outras espécies) e pessoas. \n\nEsse é um estímulo que somente pode ser feito com supervisão do dono, seja em parques e praças, enquanto caminham, ou até mesmo ao receber visitas em casa.\nSoltar o cão na rua ou próximo a ela sem qguia pode ser muito perigoso para o pet, devido aos diferentes estímulos que ele vai encontrar. Como não podemos controlar a movimentação de pessoas, outros animais e até mesmo veículos, para evitar acidentes, o ideal é sempre fazer uso da guia, nos passeios com o pet, e nunca deixá-lo desacompanhado em locais públicos. \n\nSe você não tem certeza de como começar a socializar seu pet, uma opção é levar em locais especializados, como as creches e hotéis caninos, pois já são preparadas para esse tipo de situação."))
    }
    
}
