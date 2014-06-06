class Land implements Displaceable{
  int maxHeight;
  int h;
  ArrayList values;
  float dp;
  float p;
  int stripe;
  color col;
 
  Land( int maxHeight, color col ){
    values = new ArrayList( width );
    this.maxHeight = maxHeight;
    h = 20; 
    p = 1.0;
    dp = .002;
    fillValues();
    this.col = col;
  }
 
  void fillValues(){
    for( int i = 0; i < width; i++ ){
      values.add ( nextValue() );
    }
  }
 
  void display(){
    stroke( 0 );
    boolean on = false;
    Integer i;
    for( int x=0; x < width; x++ ){
      i = (Integer) values.get( x );
      if( stripe > 0 ){
        if( x % stripe == 0 ){
          on = !on;
        }
        if( on ){
          stroke( 0, 127 );
          line( x, height, x, i );
        }else{
          stroke( 200, 127 );
          line( x, height, x, i );
        }
      }else{
        stroke( col );
        line( x, height, x, i );
      }
    }
  }
 
  void displace( int amt ){
    amt = constrain( amt, 0, width-1 );
    for( int i = 0; i < amt; i++ ){
      values.remove( 0 );
      values.add( nextValue() );
    }
  }
 
  int getY( int x ){
    return (Integer) values.get( x );
  }
 
  int nextValue(){
    int yVal = height - int( noise( p ) * maxHeight );
    p += dp;
    return yVal;
  }
 
  void stripe( int gap ){
    stripe = gap;
  }
 
  void plain(){
    stripe = 0;
  }
} 
