import 'dart:io';

import 'EPeluchito.dart';
import 'Peluchito.dart';
import 'RegistroVenta.dart';
var registro = 0;

class MenuOptions{
  //creamos una lista para almacenar los peluchitos que creemos
  List<Peluchito> listaPeluchitos = [];
  List<EPeluchito> listaGanancia = [];
  List<RegistroVenta> registro = [];
  var maxIntVal = 2147483647;

  //método de la clase MenuOption, método agregar peluchito
   bool addPeluchitos(){
    while(true){
      print("Ingrese el nombre del peluchito: ");
      String name = stdin.readLineSync()!.toLowerCase();
      //hacemos una referencia a la clase Peluchito para poder tener una variable temporal que almaecene o reciba los cambios al objeto peluchito
            //por si el peluchito está repetido
      bool peluchitoExist = false;
      Peluchito?existingPeluchito;

      for(var peluchito in listaPeluchitos){
        if(peluchito.name == name){
          peluchitoExist = true;
          //guardamos el peluchito encontrado para modificarle atributos
          existingPeluchito = peluchito;
          break;
        }
      }
      //comprobación de que si ya existe o no el peluchito
      if(peluchitoExist){
        print("El peluchito \"$name\" ya esta en el inventario.\n");
        String resp = ' ';
        
        while(resp != 'y' && resp !='n'){
          print("¿Desea agregar más cantidad de peluchitos a este?(y/n)");
          resp = stdin.readLineSync()!.toLowerCase();
          if(resp != 'y' && resp !='n'){
            print("Por favor solo responda (y/n)");
          }
        }
        if(resp == 'y'){
          print("Agregue el número extra de peluchitos");
          BigInt bigAddPeluchitos = BigInt.zero;
          bool validateValue = false;
           //evitar desbordamiento por enteros muy grandes y evitar error de caracteres no númericos
          while(!validateValue){                
            try{
              bigAddPeluchitos = BigInt.parse(stdin.readLineSync()!);
              validateValue = true;
            }catch(e){
              print("Por favor, ingrese un valor númerico válido");
              continue;
            }
                      //verificación si el valor ingresado para que no desborde
            if(bigAddPeluchitos >= BigInt.from(maxIntVal)){
              print("La cantidad ingresada excede el tamaño del inventario. Por favor ingrese una menor cantidad de peluchitos");
              continue;
            }
            else{
              int addPeluchito = bigAddPeluchitos.toInt();
              existingPeluchito!.quantity += addPeluchito;
              existingPeluchito.rquantity += addPeluchito;//actualiza la cantidad anterior de registro anterior
              print("Se agregó con exito la cantidad adicional del peluchito ${addPeluchito} unidades nuevas");
              return true;
            }
          }

        }else if(resp == 'n'){
          print("No se ha agregado mas peluchitos a ${existingPeluchito!.name}");
          return false;
          //break;
        }else{
          print("Por favor agregue valores númericos unicamente");
        }
      }else{
        print("Ingrese la cantidad del peluchito:");
        //evitar desbordamiento por enteros muy grandes
        BigInt bigAddPeluchitos = BigInt.zero;
          bool validateValue = false;
           //evitar desbordamiento por enteros muy grandes y evitar error de caracteres no númericos
          while(!validateValue){                
            try{
              bigAddPeluchitos = BigInt.parse(stdin.readLineSync()!);
              validateValue = true;
            }catch(e){
              print("Por favor, ingrese un valor númerico válido");
              continue;
            }
              if(bigAddPeluchitos >= BigInt.from(maxIntVal)){
              print("La cantidad ingresada excede el tamaño del inventario. Por favor ingrese una menor cantidad de peluchitos");
              continue;// continuar con el ciclo para volver a ingresar el valor
              }else{
                int quantity = bigAddPeluchitos.toInt();
                print("Ingrese el valor individual del peluchito:");

                double valueUnit = 0;
                bool validateValueUnit = false;
                while(!validateValueUnit || valueUnit <= 0){
                  try{
                    valueUnit = double.parse(stdin.readLineSync()!);
                    validateValueUnit=true;
                  }catch(e){
                    print("Por favor ingrese un valor en dolares válido");
                    continue;
                  }
                  if(valueUnit <= 0){
                    print("El valor individual debe ser mayor que cero, por favor ingreselo.");
                  }
                }
        //agregamos el peluchito a la si no esta repetido lista(inventario) de peluchitos que tenemos
                listaPeluchitos.add(Peluchito(name, quantity, valueUnit,0));
                return true;
              }
            }
      return false;
      }

      }
  }  

  //--------metodo eliminar peluches  
  void DeletePeluchitos(String searchedPeluName){
        //hacemos un for in para buscar más faciles y comparar a la vez en al lista
    bool founded = false;
    for(var peluchito in listaPeluchitos){
      if(peluchito.name == searchedPeluName){
        //removemos directamente el objeto peluchito que tiene como atributo o por valor el valor del que buscamos
          listaPeluchitos.remove(peluchito);
          //ListaPeluchitos.remove(peluchito.quantity);  habia un error no es necesario llamar el atributo del objeto
          //ListaPeluchitos.remove(peluchito.valueUnit);
          print("Peluchito encontrado con exito y fue eliminado:\n");
        founded = true;
        break;
      }
    }
    if(!founded){
      print("El peluchito \"$searchedPeluName\" no se encuentra en inventario");
    }
    return;
  }
//método para buscar peluchitos por nombre
   void SearchPeluchitos(String searchedPeluName){
    //hacemos un for in para buscar más faciles y comparar a la vez en al lista
    bool founded = false;
    for(var peluchito in listaPeluchitos){
      if(peluchito.name == searchedPeluName){
        print("Peluchito encontrado con exito:\n");
        print("El peluchito se llama: ${peluchito.name}, Existen ${peluchito.quantity} unidades y la unidad vale ${peluchito.valueUnit} dolares\n");
        founded = true;
        break;
      }
    }
    if(!founded){
      print("El peluchito \"$searchedPeluName\" no se encuentra en inventario");
    }
    return;
  }
void ShowEearningsPeluchito(){
        //for in para recorrer y mostrar todos los objetos de la lista
    int contador = 0;
    double sumEarnings = 0;
    for(var peluchito in listaGanancia){
      contador++;
      
      print("El peluchito número $contador es:");
      print("Nombre del peluchito: ${peluchito.gname}");
      print("Cantidad de unidades vendidas: ${peluchito.gquantity} unidades");
      print("Ganancia de este peluchito vendido: \$${peluchito.gEarnings} dolares\n");
      sumEarnings += peluchito.gEarnings;

    }
        print("Las ganancias totales por la venta de peluchitos fue de: ${sumEarnings} dolares");
     return;
  }

//------Método mostrar inventario de peluches
void ShowPeluchitos(){
  if(listaPeluchitos.isEmpty){
    print("El inventario está vacío. Debes agregar mas peluchitos");
    //cerramos de una el método
    return;
  }
  print("Registro de la ultima entrada al inventario de peluchitos:\n");

  //mostramos los peluches del inventario, inclusidos los que estan sin cantidad
  for(var peluchito in listaPeluchitos){
    print("Nombre del peluchito: ${peluchito.name}");
    print("Ultimos peluchitos adicionados: ${peluchito.rquantity}");
    print("Valor por unidad del peluchito: \$${peluchito.valueUnit}\n");
  }
  //Eliminamos peluches con cantidad igual a 0 ya sin stock
  listaPeluchitos.removeWhere((peluchito) => peluchito.quantity ==0 );
  print("peluchitos con cantidad igual 0 fueron eliminados del inventario\n");

  //mostrmos los peluches que quedan ahora sin los que estan sin stock
  print("Inventario de peluchitos actual y actualizado:\n");
    for(var peluchito in listaPeluchitos){
    print("Nombre del peluchito: ${peluchito.name}");
    print("Cantidad del peluchito: ${peluchito.quantity}");
    print("Valor por unidad del peluchito: \$${peluchito.valueUnit} \n");
  }
return;
}

  //metodo para realizar venta
  void SoldPeluchitos(String searchedPeluName) {
  bool founded = false;

  for (var peluchito in listaPeluchitos) {
    if (peluchito.name == searchedPeluName) {
      print("Peluchito ${peluchito.name} encontrado con éxito, cuenta con ${peluchito.quantity} unidades\n¿Cuántos desea vender?:\n");
//uso de try cathch para evitar y capturar errores con la entrada de datos
      try {
        int gquantity = int.parse(stdin.readLineSync()!);
        if (gquantity <= 0) {
          print("Por favor, ingrese un número mayor que cero.");
        } else if (gquantity <= peluchito.quantity) {
          double gEarnings = gquantity * peluchito.valueUnit;
          peluchito.quantity -= gquantity; // Actualiza el inventario
          print("Se vendieron: $gquantity de ${peluchito.name}, quedan ${peluchito.quantity} unidades y la unidad vale ${peluchito.valueUnit} dólares.\n");

          registro.add(RegistroVenta(peluchito.name, gquantity, gEarnings));
          listaGanancia.add(EPeluchito(peluchito.name, gquantity,gEarnings));

          founded = true;
        } else {
          print("No hay suficiente inventario de ${peluchito.name} para vender.");
        }
      } catch (e) {
        print("Entrada no válida. Por favor, ingrese un número válido.");
      }

      break;
    }
  }

  if (!founded) {
    print("No existe \"$searchedPeluName\" en el inventario, ingresa un peluchito válido.");
  }
}

}