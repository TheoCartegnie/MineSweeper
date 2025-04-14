int [][] grid;
int MineNumber = 40;
int GridSize = 40;
int CaseSize = 20;
color Unclicked = color (255,255,255);
color Verified = color (255/2,255/2,255/2);
color Mines = color (170,0,0);
color Check = color (0,0,255);

void setup()
{
   
  size(1200,1200);
   InitGrid();
   
   DrawGrid();
   
   ReadArray();
   println("Nombre de mines : ",GetMines());
     
  // DrawCase(1,1);
}

void draw()
{
 
}

void mouseClicked()
{
  int MousPosX = GetMouseAxisOnGrid(mouseX) ;
  int MousPosY = GetMouseAxisOnGrid(mouseY) ;
   if(MousPosX < GridSize && MousPosY < GridSize )
  {
     CheckGrid(MousPosX,MousPosY);    
  }

 

}


void DrawNumber(int X, int Y)
{
      println("Bien joué");
      textSize(CaseSize/4);
      text("10",(X * CaseSize) + CaseSize / 2,(Y * CaseSize) + CaseSize / 2);
}

void DrawMine(int X, int Y)
{
   fill(Mines);
   rect(X * CaseSize,Y * CaseSize,CaseSize, CaseSize);
}

void DrawCase(int x,int y, color Color)
{
   fill(Color);
   rect(x * CaseSize,y * CaseSize,CaseSize,CaseSize); 
}

int GetMouseAxisOnGrid(int Axis)
{
  return Axis/CaseSize;
}


int GetCaseType(int x, int y)
{
      PVector Position = new PVector(GetMouseAxisOnGrid(mouseX), GetMouseAxisOnGrid(mouseY));
     return grid[(int)Position.x][(int)Position.y];
 
}


void CheckGrid(int X, int Y)
{
   if(grid[X][Y]== 1)
   {
      DrawMine(X,Y);
      //Game over
   }
   if(grid[X][Y] == 0)
   {
      CheckAdjacentGrid(X,Y);
   }
}

void CheckAdjacentGrid(int X, int Y)
{
  int CheckedI = 0;
  int CheckedJ = 0;
  boolean NoMine = true;
  
    for(int i = X - 1; i <= X + 1; i++)
    {
      for(int j = Y - 1; j <= Y + 1; j++)
      {
        CheckedI = constrain(i, 0, grid.length -1);
        CheckedJ = constrain(j, 0, grid.length- 1);
        println("I est a : ",CheckedI," J est a : ", CheckedJ);
        
        if(grid[CheckedI][CheckedJ] == 1)
        {
            DrawMine(CheckedI,CheckedJ);
            grid[CheckedI][CheckedJ] = 2;
            CheckAdjacentGrid(CheckedI,CheckedJ);
        }
        
        else if(grid[CheckedI][CheckedJ] == 0)
        {
          DrawCase(CheckedI ,CheckedJ ,Verified);
          //NoMine = false;
        }
        
        
      }
    }
}

void InitGrid()
{
  grid = new int [GridSize][GridSize];
  
  for(int i = 0; i < GridSize;i++)
  {
    for(int j = 0; j < GridSize;j++)
    {
      grid[i][j] = 0;
    }
  }
  
  
  for(int i = 0; i < MineNumber;i++)
  {
    AddRandomMineInGrid();
  }

}

/*
Checker les cases autour du perso 
*/



boolean IsAMine(int x, int y)
{
 
  if(grid[x][y] == 1)
  {
    return true;
  }
  else
  {
    return false;
  }
 
}


int GetMines()
{
  int mines = 0;
  for(int x = 0; x < GridSize;x++)
  {
    print("///");
    for(int y = 0; y < GridSize;y++)
    {
        if(IsAMine(x,y))
        {
           mines++;
        }
    }
  
  }
  return mines;
}

void ReadArray()
{
     print("////////////\n");
  for(int i = 0; i < GridSize;i++)
  {
    print("///");
    for(int j = 0; j < GridSize;j++)
    {
          print(grid[i][j]);
    }
      print("///", "\n");
  }
}


void AddRandomMineInGrid()
{
   
    int x = (int)random(0,GridSize -1);
    int y = (int)random(0,GridSize -1);
  
    grid[x][y]= 1;
}



void DrawGrid()
{
  for(int i = 0; i < GridSize;i++)
  {
    for(int j = 0; j < GridSize; j++)
    {
      DrawCase(i, j,Unclicked);
    }
  }
  
}
