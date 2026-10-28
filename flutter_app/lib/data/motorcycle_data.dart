class MotorcycleInfo {
  final String id;
  final String name;
  final String category;
  final String tagline;
  final String displacement;
  final String horsepower;
  final String torque;
  final String imagePath;
  final double imageScale;
  final String curiosity;

  const MotorcycleInfo({
    required this.id,
    required this.name,
    required this.category,
    required this.tagline,
    required this.displacement,
    required this.horsepower,
    required this.torque,
    required this.imagePath,
    required this.curiosity,
    this.imageScale = 1.0,
  });
}

const Map<String, MotorcycleInfo> motorcycleDatabase = {
  'bear650': MotorcycleInfo(
    id: 'bear650',
    name: 'Royal Enfield Bear 650',
    category: 'Scrambler',
    tagline: 'A Scrambler Urbana.',
    displacement: '648 cc',
    horsepower: '47,65 cv',
    torque: '5,30 kgf·m',
    imagePath: 'assets/images/bear650.jpeg',
    curiosity: 'Inspirada na vitória de Eddie Mulder na mítica corrida Big Bear Run, na Califórnia, em 1960, nos comandos de uma Royal Enfield Fury 500, possui o mesmo motor da Interceptor porém com 8% a mais de torque e suspensão invertida.',
  ),
  'classic350': MotorcycleInfo(
    id: 'classic350',
    name: 'Royal Enfield Classic 350',
    category: 'Vintage',
    tagline: 'Pura. Simples. Atemporal.',
    displacement: '349 cc',
    horsepower: '20,2 cv',
    torque: '2,75 kgf·m',
    imagePath: 'assets/images/classic350.jpeg',
    imageScale: 1.25,
    curiosity: 'A Classic 350 possui uma edição especial que leva cores militares, fazendo referência à um modelo usado pelo exército britânico durante a Segunda Guerra Mundial que ganhou o apelido de Pulga Voadora, pois era enviada as tropas de paraquedas.',
  ),
  'continentalgt': MotorcycleInfo(
    id: 'continentalgt',
    name: 'Royal Enfield Continental GT 650',
    category: 'Café Racer',
    tagline: 'O Espírito Puro do Café Racer.',
    displacement: '648 cc',
    horsepower: '47,65 cv',
    torque: '5,30 kgf·m',
    imagePath: 'assets/images/continentalgt.jpeg',
    curiosity: 'O estilo Café Racer ao qual a Continental GT 650 se inspira nasceu na Inglaterra entre as décadas de 50 e 60 em cafés de beira de estrada, eram motos depenadas usadas em corridas ilegais, o nome "Café Racer" foi dado pelos caminhoneiros que frequentavam esses cafés e zombavam dos jovens dizendo que eles nunca seriam pilotos de verdade.',
  ),
  'guerrilla450': MotorcycleInfo(
    id: 'guerrilla450',
    name: 'Royal Enfield Guerrilla 450',
    category: 'Roadster',
    tagline: 'Feita para devorar o asfalto.',
    displacement: '452 cc',
    horsepower: '40,0 cv',
    torque: '4,08 kgf·m',
    imagePath: 'assets/images/guerrilla450.jpg',
    curiosity: 'Foi eleita Moto do Ano pela Revista Duas Rodas entre as naked até 500cc e também venceu como Melhor Moto no prêmio Best of the Best, do Motor1.',
  ),
  'himalayan': MotorcycleInfo(
    id: 'himalayan',
    name: 'Royal Enfield Himalayan 450',
    category: 'Adventure',
    tagline: 'Vá Além das rodovias.',
    displacement: '452 cc',
    horsepower: '40,0 cv',
    torque: '4,08 kgf·m',
    imagePath: 'assets/images/himalayan.jpg',
    curiosity: 'Venceu como Melhor Moto no Prêmio Estadão Mobilidade e também liderou a categoria Trail.',
  ),
  'hunter350': MotorcycleInfo(
    id: 'hunter350',
    name: 'Royal Enfield Hunter 350',
    category: 'Roadster',
    tagline: 'Nascida para as Ruas da Cidade.',
    displacement: '349 cc',
    horsepower: '20,4 cv',
    torque: '2,75 kgf·m',
    imagePath: 'assets/images/hunter350.jpg',
    imageScale: 1.25,
    curiosity: 'É 14 kg mais leve que as irmãs Classic e Meteor, pesando apenas 181 kg em ordem de marcha, tornando-a a Royal Enfield 350 mais ágil e urbana.',
  ),
  'interceptor650': MotorcycleInfo(
    id: 'interceptor650',
    name: 'Royal Enfield Interceptor 650',
    category: 'Roadster',
    tagline: 'Bicilíndrica. Icônica.',
    displacement: '648 cc',
    horsepower: '47,65 cv',
    torque: '5,30 kgf·m',
    imagePath: 'assets/images/interceptor650.jpg',
    curiosity: 'É a primeira "twin" global da Royal Enfield, lançada em 2018 e inspirada na original de 1960, O projeto foi desenvolvido do zero com participação de profissionais recrutados da Triumph.',
  ),
  'meteor350': MotorcycleInfo(
    id: 'meteor350',
    name: 'Royal Enfield Meteor 350',
    category: 'Cruiser',
    tagline: 'Sua porta de entrada para a Royal Enfield.',
    displacement: '349 cc',
    horsepower: '20,2 cv',
    torque: '2,75 kgf·m',
    imagePath: 'assets/images/meteor350.jpg',
    curiosity: 'A Meteor 350 é a porta de entrada para o universo Royal Enfield, com um diferencial tecnológico importante: sistema de navegação Tripper integrado e iluminação predominantemente em LED, recursos acima da média para a categoria 350cc.',
  ),
  'shotgun650': MotorcycleInfo(
    id: 'shotgun650',
    name: 'Royal Enfield Shotgun 650',
    category: 'Cruiser',
    tagline: 'Crua. Ousada. Sem Desculpas.',
    displacement: '648 cc',
    horsepower: '47,65 cv',
    torque: '5,30 kgf·m',
    imagePath: 'assets/images/shotgun650.jpg',
    curiosity: 'Possui design do tipo bobber, com linhas mais minimalistas e assentos individuais, é altamente costumizável.',
  ),
  'supermeteor650': MotorcycleInfo(
    id: 'supermeteor650',
    name: 'Royal Enfield Super Meteor 650',
    category: 'Cruiser',
    tagline: 'A Grande Cruiser Britânica.',
    displacement: '648 cc',
    horsepower: '47,65 cv',
    torque: '5,30 kgf·m',
    imagePath: 'assets/images/supermeteor650.jpeg',
    imageScale: 1.25,
    curiosity: 'É a cruiser mais completa da linha 650, projetada para viagens longas com postura relaxada de pilotagem.',
  ),
};
