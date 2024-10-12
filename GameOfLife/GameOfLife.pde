int grid_size = 20;
float update_rate = 10;

boolean paused = true;
ArrayList<Node> nodes = new ArrayList<Node>();

Node get_node_at_pos(int x, int y) {
  for(Node node : nodes) {
    if(node.x==x && node.y==y) {
      return node;
    }
  }
  
  return null;
}

class Node {
 
  int x,y;
  boolean temp_dead=true;
  boolean dead=true;
  
  Node(int _x, int _y) {
    x=_x;
    y=_y;
  }
  
  int get_neighbour_count() {
    
    int count=0;
    
    for(Node node : nodes) {
      
      if((node.x>=x-1&&node.x<=x+1&&node.y>=y-1&&node.y<=y+1)&&!(node.x==x&&node.y==y)&&!node.temp_dead) {
        count++;
      }
    }
    return count;
    
  }
  
  void update() {
    
    if(!dead) {
      if(get_neighbour_count()<2||get_neighbour_count()>3) {
        dead=true;
      }
    }
    else {
      if(get_neighbour_count()==3) {
        dead=false;
      }
    }
    
    
  }
  
  void draw_node() {
    
    fill(255, 255, 255);
    strokeWeight(0);
    square(((float)width/grid_size)*x, ((float)height/grid_size)*y, ((float)width/grid_size));
  }
  
}

void setup() {
  
  size(800,800);
  frameRate(60);
  
  for(int x=0; x<grid_size; x++) {
    for(int y=0; y<grid_size; y++) {
      nodes.add(new Node(x,y));
    }
  }
  
}

void draw() {
  
  background(20);
  
  Node x = get_node_at_pos(2,2);
  println(x.get_neighbour_count());
  
  for(int i=0; i<=grid_size; i++) {
    stroke(50);
    strokeWeight(2);
    line(((float)width/grid_size)*i, 0, ((float)width/grid_size)*i, height);
    line(0, ((float)height/grid_size)*i, width, ((float)height/grid_size)*i);
    
  }
  
  text("PAUSED: "+paused, 20, 20);
  
  if(frameCount%update_rate==0 && !paused) {
    
    for(Node node : nodes)
      node.temp_dead=node.dead;
    
    for(Node node : nodes) {
      node.update();
      if(!node.dead)
        node.draw_node();
    }
    
  } else {
    
    for(Node node : nodes) {
      if(!node.dead)
        node.draw_node();
    }
    
  }
  
}

void keyPressed() {
  
  if(key==' ')
    paused=!paused;
  
  if(key=='r')
    for(Node node : nodes)
      node.dead=true;
}

void mousePressed() {
  
  int x = mouseX/(width/grid_size);
  int y = mouseY/(height/grid_size);
  
  Node target = get_node_at_pos(x, y);
  if(target!=null) {
    target.dead=!target.dead;
    target.temp_dead=target.dead;
  }
}
