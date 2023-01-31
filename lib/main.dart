import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
 // criação do widget personalizado

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  void decrement(){
    setState(() {
      count--;
    });
  }

  void increment(){
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/imagens/imagem.jpg',),
              fit: BoxFit.cover
              ,),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            isFull ? 'Lotado!' : 'Pode entrar!', 
            style: const TextStyle(
              fontSize: 26, 
              color: Colors.white,
              fontWeight: FontWeight.w600, 
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.grey
                ),
                Shadow(
                  offset:  Offset(-2.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.grey
                ),
                Shadow(
                  offset: Offset(0.0, -2.0),
                  blurRadius: 10.0,
                  color: Colors.grey
                ),
              ],
              ),
            ),
  
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 80,
                color: isFull ? const Color.fromARGB(255, 188, 71, 62) : const Color.fromARGB(255, 73, 133, 75),
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 10.0,
                    color: Color.fromARGB(113, 0, 0, 0),
                  )
                ]
              ),
            ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement, //caso esteja vazio, passa o null e desabilita o botão
                  style: TextButton.styleFrom(
                  backgroundColor: isEmpty ? Colors.grey.withOpacity(0.5) : Colors.white,
                  fixedSize: const Size(100, 100),
                  foregroundColor: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Saiu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )
                ,)
              ,),
              const SizedBox(width: 32,),
              TextButton(
                onPressed: isFull ? null : increment, //caso esteja cheio, passa o null e desabilita o botão
                  style: TextButton.styleFrom(
                  backgroundColor: isFull ? Colors.grey.withOpacity(0.5) : Colors.white,
                  fixedSize: const Size(100, 100),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                 )
              ,),
            ],
          ),
        ],),
      ), 
      );
  }
}
