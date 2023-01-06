int background_color = 255;
int snake_length = 2;
int snake_length_max = 1000;
int snake_head_x;
int snake_head_y;
int[] x = new int [snake_length_max];
int[] y = new int [snake_length_max];
int grid=20;
char snake_direction = 'R';
char snake_direction_temp;
int speed = 5;  
int time_saved;  
int time_passed;
int time_interval;
boolean food_key = true;
int food_x;
int food_y;
int BestScore = snake_length - 2;
int game_pause = 0;
boolean game_over = false;
boolean game_begin = false;

void setup(){
    size(600,600);       
    frameRate(30);         
   
    pushMatrix();
    background(0);  
    translate(width/2, height/2 - 50);
    fill(255);  //white
    textAlign(CENTER); 
    textSize(84);
    text("Snake", 0, 0);

    fill(120);
    textSize(40);
    text("Press 'R' to start.", 0, 260);
    popMatrix();
    
    
    time_saved = millis(); 
    

   
}

void draw(){
  if(keyPressed && (key=='r'||key=='R') ){
        game_begin = true;
    }
  if(game_again()){
        return; 
      }  
  time_interval = 1000/speed;
  time_passed = millis() - time_saved; 
  
  if(time_passed > time_interval && snake_direction != 'P' && game_begin)  
  {
     
      background(background_color);  
      
  
      switch(snake_direction){           
            case 'L':            
                snake_head_x -= grid;
                break;
            case 'R':            
                snake_head_x += grid;
                break;
            case 'D':             
                snake_head_y += grid;
                break;
            case 'U':             
                snake_head_y -= grid;
                break;

       }
       
  
      food_new(width,height);  
  
   
      if( snake_head_x == food_x && snake_head_y == food_y)    
      {
        food_key = true;
        snake_length++;   
         if ( snake_length%5 ==1){
           speed ++; 
         }
        speed = min(10,speed);
      }
      
 
        for(int i=snake_length-1; i>0; i--){
            x[i] = x[i-1];                      
            y[i] = y[i-1];
        }
        x[0] = snake_head_x;
        y[0] = snake_head_y;
        
        if(snake_head_x < 0){
          snake_head_x = width;
        }else if(snake_head_x > width ){
          snake_head_x = 0;                 
        }
        
        if(snake_head_y < 0){
          snake_head_y = height;
        }else if(snake_head_y > height ){
          snake_head_y = 0;                
        }
        
        
        stroke(0);        
        strokeWeight(1); 

        fill(50);        
        rect(x[0],y[0],grid,grid);     
        fill(80);
        for(int i=1; i<snake_length; i++){
            rect(x[i],y[i],grid,grid);
        }
        if(snake_die() ){
            return;
        }
        time_saved = millis(); 
       
      }      
      
}



void keyPressed() {
    if(key == 'p' || key == 'P'){            
        game_pause++;
        if( game_pause%2 == 1 ){                              
            snake_direction_temp = snake_direction;       
            snake_direction = 'P';                        
        }else{
            snake_direction = snake_direction_temp;           
        }

    }
    if(snake_direction != 'P' && key == CODED){       
        switch(keyCode){                             
            case LEFT:
                snake_direction = 'L';
                break;
            case RIGHT:
                 snake_direction = 'R';
                break;
            case DOWN:
                 snake_direction = 'D';
                break;
            case UP:
                 snake_direction = 'U';
                break;
        }  
    }else if( snake_direction != 'P' ){        
        switch(key){
            case 'A':
            case 'a':
                snake_direction = 'L';
                break;
            case 'D':
            case 'd':
                 snake_direction = 'R';
                break;
            case 'S':
            case 's':
                 snake_direction = 'D';
                break;
            case 'W':
            case 'w':
                snake_direction = 'U';
                break;
        }
    }
  }
       
 
void food_new(int maxWidth, int maxHeight){   
    fill(255,120,30);                                      
    int food_outbody =0;                             
    if(food_key){                                           
      while(food_outbody==0 ){ 
          food_outbody = 1;
          food_x = int( random(0, maxWidth)/grid ) * grid;    
          food_y = int( random(0, maxHeight)/grid ) * grid;
          for (int i=snake_length-1; i>=0 ; i--){
            if ( food_x == x[i] && food_y == y[i] ){
              food_outbody = 0;
          }
        }
      }
    }
    rect(food_x, food_y, grid, grid);
    food_key = false;                                     

}     
    

boolean snake_die(){                                   
    if(snake_length>2){                                                               
        for(int i=1; i<snake_length; i++){
            if(snake_head_x==x[i] && snake_head_y == y[i]){
                show_gameover();                  
                return true;
            }
        }
    }
   return false;
}
 

void show_gameover(){               
    game_over = true;  
    pushMatrix();
    BestScore = BestScore > snake_length ? (BestScore - 2 ): (snake_length - 2);

    background(0);  
    translate(width/2, height/2 - 50);
    fill(255);  
    textAlign(CENTER); 
    textSize(84);
    text(snake_length - 2 + "/" + BestScore, 0, 0);

    fill(120);
    textSize(40);
    text("Score / Best",0,230);
    text("Game Over, Press 'R' to restart.", 0, 260);
    popMatrix();
   
}


boolean game_again(){                                        
    if(game_over && keyPressed && (key=='r'||key=='R') ){
        snake_start();
    }
    return game_over;
}
   


void snake_start(){                      
    background(background_color);
    snake_length = 2;
    game_over = false;
    snake_head_x = 0;
    snake_head_y = 0;
    snake_direction = 'R';
    speed = 5;
}     
  

  
  

  
  
  
  
  
  
  
  
  
  
  
