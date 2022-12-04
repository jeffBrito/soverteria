import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement (){
    setState(() {
      if(isEmpty){
        SnackBar snackBar = const SnackBar(
          content: Text('Todos os cliente já fora em seu estabelecimento !',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.amber,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        count --;
      }
    });
  }

  void increment(){
    setState(() {
        if(isFull){
          SnackBar snackBar = const SnackBar(
             content: Text('Estabelecimento lotado !',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }else{
          count ++; 
        }
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0),
          image: const DecorationImage(
            image: AssetImage('assets/images/fundo.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text(isFull ? 'Lotado' : 'Pode Entrar',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ?Colors.red : Colors.white,
                ),  
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: isEmpty ? null : decrement, 
                  child: const Text('Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:  isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                   fixedSize: const Size(100,100),
                   primary:Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                   )
                  ),
                ),
                const SizedBox(
                  width: 42,
                ),
                TextButton(
                  onPressed: isFull ? null : increment, 
                  child: const Text('Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ?Colors.white.withOpacity(0.3) : Colors.white,
                    fixedSize: const Size(100,100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}