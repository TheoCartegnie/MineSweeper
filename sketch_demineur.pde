void setup()
{
  int i = 0;
  while(i < 100)
  {
    i++;
    println("d'apres la boucle while toto en est a : ", i);
  }

  println("\n");
  
  for(int j = 0; j <= 100; j++)
  {
      println("d'apres la boucle for toto en est a : ", j);
  }
  
   while(i < 100)
  {
    i++;
    println("d'apres la boucle while toto en est a : ", i*i);
  }

  println("\n");
  for(int j = 0; j <= 100; j++)
  {
   int value = SmallerSquarOf(j);
   println("Le plus petit carré commun de : ",j," est egale a : ", value);
   value = UpperSquarOf(j);
     println("Le plus grand carré commun de : ",j," est egale a : ", value,"\n");
  }
  
   
  for(int j = 0; j <= 100; j++)
  {
      if(j % 2 ==0)
      {
        println(j, "est un nombre paire");
      }
  }
  
  
   for(int j = 0; j < 1000; j++)
   {
  
       if(IsPrime(j))
       {
         println(j, " est un nombre premier");
       }
   
 
   }

  
  println("lA VALEUR TOTAL EST DE : ", GetAdditionOfAllNUmbers(100));
  
  int [] Values = {5,5,5,5,5};
  int value = GetSum(Values);
  
  println("Value vaut : ", value);
  
  int mean = GetMean(Values);
  
   println("La moyenne est de : ", mean);
  
  DisplaySyracusSuite(14);
}

int Square(int value)
{
  int c = value * value;
  return c;
}


int GetMean(int [] array)
{
  int value = GetSum(array);
  return (value / array.length);
}

boolean IsValuePair(int value)
{
   if(value % 2 == 0)
   {
     return true;
   }
   else
   {
     return false;
   }
}

int SmallerSquarOf(int number)
{
  int ValueToVerify = 0;
  while( Square(ValueToVerify) < number)
  {
    ValueToVerify++;
  }
  return ValueToVerify;
  
}

int UpperSquarOf(int number)
{
  int ValueToVerify = 100;
  while( Square(ValueToVerify) > number)
  {
    ValueToVerify--;
  }
  return ValueToVerify;
  
}


boolean IsPrime(int number)
{
  int sqrtPrime = (int)sqrt(number);
  for(int diviseur = 2; diviseur <= sqrtPrime; diviseur++)
  {
     if( number % diviseur == 0)
      {
        return false;
      }
  }
  return true;
}

int GetAdditionOfAllNUmbers(int numbers)
{
  int value = 0;
  
  for(int i = 0; i <= numbers; i++)
  {
    value += i;  
  }
   
  return value;
}



int GetSum(int [] array)
{
  int value = 0;
  for(int i = 0; i < array.length;i++)
  {
    value += array[i];
  }
  
  return value;
}

void DisplaySyracusSuite(int nombre)
{
  int value = nombre;
  int iteration = 0;
  while(value > 1 && iteration < 100 )
  {
    if(IsValuePair(value))
    {
      value = value /2;
    }
    else
    {
      value = (value * 3) +1; 
    }
     println("a L'Itteration : ", iteration," Value est a : ", value);
     iteration++;
  }
}
