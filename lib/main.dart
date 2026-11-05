import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Explore Mundo',
      home: ExploreMundoPage(),
    );
  }
}

class ExploreMundoPage extends StatefulWidget {
  const ExploreMundoPage({super.key});

  @override
  State<ExploreMundoPage> createState() => _ExploreMundoPageState();
}

class _ExploreMundoPageState extends State<ExploreMundoPage> {
  int _userRating = 0;
  int _totalRatings = 41;

  final TextEditingController _commentController = TextEditingController();

  final List<Map<String, String>> _comments = [
    {'name': 'Maria S.', 'text': 'As praias de Noronha são paradisíacas! Recomendo.'},
    {'name': 'João P.', 'text': 'Atendimento excelente, reserva super prática.'},
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _rate(int stars) {
    setState(() {
      if (_userRating == 0) {
        _totalRatings++;
      }
      _userRating = stars;
    });
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) {
      return;
    }
    setState(() {
      _comments.add({'name': 'Você', 'text': text});
      _commentController.clear();
    });
    FocusScope.of(context).unfocus();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  Widget _buildButtonColumn(
      Color color, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStar(int index) {
    final int displayed = _userRating > 0 ? _userRating : 4;
    return GestureDetector(
      onTap: () => _rate(index),
      child: Icon(
        index <= displayed ? Icons.star : Icons.star_border,
        color: Colors.red[500],
        size: 22,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Praia de Fernando de Noronha',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Pernambuco - Brasil',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('$_totalRatings'),
        ],
      ),
    );

    Color color = Colors.blue;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL',
            () => _showMessage('Ligando para a Explore Mundo...')),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE',
            () => _showMessage('Abrindo rota para o destino...')),
        _buildButtonColumn(color, Icons.share, 'SHARE',
            () => _showMessage('Compartilhando destino...')),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'A Explore Mundo oferece experiências inesquecíveis para destinos nacionais e internacionais. Consulte nossos pacotes, encontre o destino ideal para sua família e faça sua reserva com praticidade. Nossa equipe está pronta para ajudá-lo a planejar a viagem dos seus sonhos.',
        softWrap: true,
      ),
    );

    Widget commentSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Avaliações e Comentários',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Avalie este destino:',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(width: 8),
              for (int i = 1; i <= 5; i++) _buildStar(i),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _userRating > 0
                ? 'Sua nota: $_userRating de 5 ($_totalRatings avaliações)'
                : 'Toque nas estrelas para dar sua nota',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _commentController,
            decoration: const InputDecoration(
              hintText: 'Compartilhe sua experiência de viagem...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: _addComment,
              icon: const Icon(Icons.send, size: 16),
              label: const Text('Comentar'),
            ),
          ),
          const SizedBox(height: 8),
          for (final comment in _comments)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.account_circle),
              title: Text(comment['name']!),
              subtitle: Text(comment['text']!),
            ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/destino.jpg',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          commentSection,
        ],
      ),
    );
  }
}
