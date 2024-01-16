import java.util.*;


public class Map {

  private int height;
  private int width;
  private int[][] map;
  private int pelletCount; 
  final int empty = 0;
  final int wall = 1;
  final int pellet = 2;
  final int powePellet = 3;
  final int ghostOnly = 4;
  final int teleportWall = 5;

  // this is the preset map 2d array 
  int[][] preset = new int[][]
    {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 1, 1, 1, 4, 4, 1, 1, 1, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 

    {5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 4, 4, 4, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5}, 

    {1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {4, 4, 4, 4, 4, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 4, 4, 4, 4, 4}, 
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 

  };

  int[][]preset2 = new int[][]

    {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 4, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 4, 4, 4, 1, 0, 0, 0, 0, 0, 1, 1, 1, 4}, 
    {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 4, 4, 4}, 
    {5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 4, 4}, 
    {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 4, 4, 4}, 
    {1, 4, 4, 4, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1}, 
    {1, 4, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 

  };

  public Map() {

    int[][] temp = combine(randomized(preset2));
    int[][] temp2 = randomized(temp);
    map = randomized2(temp2); 

    generatePowerPellet(1, 7); 
    generatePowerPellet(26, 7); 
    generatePowerPellet(1, 19); 
    generatePowerPellet(26, 19);
    pelletCount = generatePellets();
  }

  public Map(int temp) {
    map = preset;
    generatePowerPellet(1, 7); 
    generatePowerPellet(26, 7); 
    generatePowerPellet(1, 19); 
    generatePowerPellet(26, 19);
    pelletCount = generatePellets();
  }
  public Map(int hi, int wi) {
    map = new int[hi][wi];
  }

  // allows user to set value of map to specified value 
  public void setVal(int xpos, int ypos, int val) {
    map[ypos][xpos] = val;
  }

  //allows user to get a value from the map 
  public int getVal(int xpos, int ypos) { 
    return map[ypos][xpos];
  } 

  //allows user to get the number of pellets inside of the map 
  public int getPellets() { 
    return pelletCount;
  } 

  // allows user to decrement the number of pellets after pac-dude eats them. 
  public void decrementPellets() { 
    pelletCount -= 1;
  } 

  // will attempt to fill the empty spaces within the map with pellets and will return the number of pellets addded 
  public int generatePellets() {
    int counter =0; 
    for (int i =0; i < map.length; i++) {
      for (int j =0; j < map[i].length; j++) {
        if (map[i][j] == 0) { 
          map[i][j] = 2;
          counter ++;
        } else if (map[i][j] == 3) { 
          counter ++;
        }
      }
    }
    return counter;
  }


  public void generatePowerPellet(int xpos, int ypos) { 
    map[ypos][xpos] = 3;
  } 






  // will print out the map for debugging purposes
  public String toString() {
    String temp = "";
    for (int i =0; i < map.length; i++) {
      for (int j =0; j < map[i].length; j++) {
        if (map[i][j] == 1) {
          temp += "x";
        }
        if (map[i][j] == 4 || map[i][j] == 0) {
          temp += " ";
        }
        if (map[i][j] == 2) {
          temp += ".";
        }
        if (map[i][j] == 5) {
          temp += "t";
        }
      }
      temp += "\n";
    }
    return temp;
  }


  public  int[][] reverse(int[][] nums) {
    int[][] temp = new int[nums.length][nums[0].length];
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j <nums[0].length; j++) {
        temp[i][j] = nums[i][nums[0].length - j - 1];
      }
    }
    return temp;
  }


  public  int[][] combine(int[][] nums) {
    int[][] temp = new int[27][28];
    int[][] reversed = new int[27][14];
    reversed = reverse(nums);

    for (int i =0; i < nums.length; i++) {
      for (int j =0; j < nums[i].length; j++) {
        temp[i][j] = nums[i][j];
        temp[i][j+14] = reversed[i][j];
      }
    }

    return temp;
  }


  public  int[][] randomized(int[][] nums) {
    for (int i =2; i < nums.length - 1; i++) {
      for (int j =2; j <nums[0].length -5; j++) {

        int random = (int) (Math.random() * 4 + 1);

        // shape2
        if (random ==1) {

          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0) {
            if (nums[i][j-2] == 0 && nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0 ) {
              if (nums[i+1][j-2] == 0 && nums[i+1][j-1] == 0  && nums[i+1][j] == 0 && nums[i][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-2] == 0 && nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0 && nums[i+2][j+2] == 0) {
                  nums[i][j] = 1; 
                  nums[i+1][j] = 1; 
                  nums[i+1][j-1] = 1; 
                  nums[i+1][j+1] = 1;
                }
              }
            }
          }
        }

        if (random == 2) {
          //  shape1
          if (nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0  && nums[i][j+3] == 0 &&  nums[i][j+4] == 0) {
            if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0  && nums[i+1][j+3] == 0 &&  nums[i+1][j+4] == 0) {
              if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0 && nums[i-1][j+2] == 0  && nums[i-1][j+3] == 0 &&  nums[i-1][j+4] == 0) {
                nums[i][j] =1; 
                nums[i][j+1] =1; 
                nums[i][j+2] = 1; 
                nums[i][j+3] =1;
              }
            }
          }
        }

        if (random ==3) {
          // shape3
          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0 && nums[i-1][j+2] == 0) {
            if (nums[i][j-1] == 0 && nums[i][j] == 0 &&  nums[i][j+1] == 0 && nums[i][j+2] == 0) {
              if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0 && nums[i+2][j+2] == 0) {
                  nums[i][j] =1; 
                  nums[i+1][j] =1; 
                  nums[i][j+1] =1; 
                  nums[i+1][j+1] =1;
                }
              }
            }
          }
        }


        if (random == 4) {
          //shape4
          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 &&  nums[i-1][j+1] == 0) {
            if (nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0) {
              if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0  && nums[i+2][j+2] == 0) {
                  if (nums[i+3][j-1] == 0 && nums[i+3][j] == 0 && nums[i+3][j+1] == 0) {
                    nums[i][j] =1; 
                    nums[i+1][j] =1;  
                    nums[i+2][j] =1; 
                    nums[i+1][j+1] =1;
                  }
                }
              }
            }
          }
        }
      }
    }

    return nums;
  }


  public  int[][] randomized2(int[][] nums) {
    for (int i =2; i < nums.length - 1; i++) {
      for (int j =2; j <nums[0].length -5; j++) {

        int random = (int) (Math.random() * 5 + 1);

        // shape2
        if (random ==1) {

          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0) {
            if (nums[i][j-2] == 0 && nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0 ) {
              if (nums[i+1][j-2] == 0 && nums[i+1][j-1] == 0  && nums[i+1][j] == 0 && nums[i][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-2] == 0 && nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0 && nums[i+2][j+2] == 0) {
                  nums[i][j] = 1; 
                  nums[i+1][j] = 1; 
                  nums[i+1][j-1] = 1; 
                  nums[i+1][j+1] = 1;
                }
              }
            }
          }
        }

        if (random ==2) {
          //  shape1
          if (nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0  && nums[i][j+3] == 0 &&  nums[i][j+4] == 0) {
            if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0  && nums[i+1][j+3] == 0 &&  nums[i+1][j+4] == 0) {
              if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0 && nums[i-1][j+2] == 0  && nums[i-1][j+3] == 0 &&  nums[i-1][j+4] == 0) {
                nums[i][j] =1; 
                nums[i][j+1] =1; 
                nums[i][j+2] = 1; 
                nums[i][j+3] =1;
              }
            }
          }
        }

        if (random ==3) {
          // shape3
          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0 && nums[i-1][j+2] == 0) {
            if (nums[i][j-1] == 0 && nums[i][j] == 0 &&  nums[i][j+1] == 0 && nums[i][j+2] == 0) {
              if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0 && nums[i+2][j+2] == 0) {
                  nums[i][j] =1; 
                  nums[i+1][j] =1; 
                  nums[i][j+1] =1; 
                  nums[i+1][j+1] =1;
                }
              }
            }
          }
        }


        if (random == 4) {
          //shape4
          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 &&  nums[i-1][j+1] == 0) {
            if (nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0 && nums[i][j+2] == 0) {
              if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0 && nums[i+1][j+2] == 0) {
                if (nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0  && nums[i+2][j+2] == 0) {
                  if (nums[i+3][j-1] == 0 && nums[i+3][j] == 0 && nums[i+3][j+1] == 0) {
                    nums[i][j] =1; 
                    nums[i+1][j] =1;  
                    nums[i+2][j] =1; 
                    nums[i+1][j+1] =1;
                  }
                }
              }
            }
          }
        }


        if (random == 5) {
          if (nums[i-1][j-1] == 0 && nums[i-1][j] == 0 && nums[i-1][j+1] == 0) { 
            if (nums[i][j-1] == 0 && nums[i][j] == 0 && nums[i][j+1] == 0) { 
              if (nums[i+1][j-1] == 0 && nums[i+1][j] == 0 && nums[i+1][j+1] == 0) { 
                if (nums[i+2][j-1] == 0 && nums[i+2][j] == 0 && nums[i+2][j+1] == 0) { 
                  nums[i][j] = 1; 
                  nums[i+1][j] = 1;
                }
              }
            }
          }
        }
      }
    }

    return nums;
  }
} 
