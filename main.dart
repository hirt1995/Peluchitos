import 'dart:io';
import 'MenuOptions.dart';
import 'EPeluchito.dart';
void main() {


  int inputMenu = 0;
  //creamos el objeto
  MenuOptions admPeluchitos = new MenuOptions();
  //lista de opciones
  

   

  /*  for (var i = 1; i <= 3; i++) {
    print("Agregue los datos para el peluche $i:");
    admPeluchitos.addPeluchitos();
  }*/



do{
  bool confirm = true;
  String confirmAux = " ";
  print("Bienvenido al menú de peluchitos, que deseas hacer");
  print("lista de opciones");
  print(" 1.Agregar peluchito\n 2.Buscar peluchito\n 3.Eliminar peluchito\n 4.Mostrar inventario\n 5.Realizar venta\n 6.Mostrar ganancias totales\n 7.Salir");
  print("Introduzca un número del menu de opciones.");
  try{
    inputMenu = int.parse(stdin.readLineSync()!);
  }catch(e){
    print("Entrada no válida. Por favor, ingrese un número valido del menú");
    continue;
  }
  
  switch (inputMenu) {
    case 1:
        //agregar peluchitos a la lista creada en la clase 
          while(confirm){
            stdout.write("¿Deseas agregar un peluchito? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
              if(admPeluchitos.addPeluchitos()){
                print("Peluchito agregado con exito al inventario");
                
              }else{
                print("El peluchito o su cantidad no fue agregado agregado con exito al inventario");
              }
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito más fue agregado, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
      break;
    case 2:
      // Buscar peluchito en la lista(inventario)
          while(confirm){
            stdout.write("¿Deseas buscar un peluchito? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
                print("Introduzca el nombre de un peluchito: ");
                String nameSearched = stdin.readLineSync()!;
                admPeluchitos.SearchPeluchitos(nameSearched);
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito fue buscado, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
      break;
    case 3:
      // Eliminar peluchito de la lista(inventario)
          while(confirm){
            stdout.write("¿Deseas eliminar un peluchito? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
                print("Introduzca el nombre de un peluchito: ");
                String nameSearched = stdin.readLineSync()!;
                admPeluchitos.DeletePeluchitos(nameSearched);
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito fue eliminado, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
      break;
    case 4:
      // Mostrar peluchitos de la lista(inventario)
         while(confirm){
            stdout.write("¿Deseas ver el inventario de peluchitos? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
                admPeluchitos.ShowPeluchitos();
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito fue consultado, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
          break;
    case 5:
          while(confirm){
            stdout.write("¿Deseas vender un peluchito? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
                print("Introduzca el nombre de un peluchito: ");
                String nameSearched = stdin.readLineSync()!;
                admPeluchitos.SoldPeluchitos(nameSearched);
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito fue vendido, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
      break;
    case 6:
         while(confirm){
            stdout.write("¿Deseas ver las ganancias de la venta de peluchitos? (y/n)\n");
            confirmAux = stdin.readLineSync()!;

            if(confirmAux == "Y" || confirmAux == "y"){
                admPeluchitos.ShowEearningsPeluchito();
                confirm = true;
            }else if (confirmAux == "n" || confirmAux == "N"){
                 print("Ningun peluchito fue consultado, Hasta luego");
                break;
            }else{
              print("Respuesta no válida, por favor responde (y/n)");
            }
          }
          break;
    case 7:
      print("Gracias por usar el control de inventario de pluchitos.com, vuelve pronto");
      break;    
    default:
      // Código a ejecutar si opcion no coincide con ningún caso
      print("Opción no válida, por favor digite de nuevo");
  }
}while(inputMenu != 7);
  
  
  }







  
 /* 
  try{
    int numero = int.parse(entradaMenu);
    print("ingresaste el numero: $entradaMenu");
  }catch(e){
    print("La opción seleccionada no esta en el menú");
  }
*/
