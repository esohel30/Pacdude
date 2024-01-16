public interface Entities {
  public int getXPos();
  public int getYPos();
  public void setXPos(int newpos);
  public void setYPos(int newpos);
  public String getDirection();
  public void setDirection(String newdir);
  public boolean nextToBlock(String checkdir);
  public void move();
  public void drawSelf();
}
