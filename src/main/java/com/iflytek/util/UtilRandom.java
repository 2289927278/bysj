package com.iflytek.util;

public  class  UtilRandom {

	/*public static void main(String[] args) {
	   System.out.println(getRandomA(10));

	}*/
	
	
	 public  static String getRandomA(int num){
	    	String[] str={"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
	    		         "a","b","c","d","e" };
	    	String code="";
	    	 for(int i=0;i<num;i++){
	    		 code+=str[(int) Math.floor(Math.random()*15)];
	    	 }
	    	  return "2017"+code;
	    }
	 
	 
	 public  static String getRandomB(int num){
	    	String[] str={"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
	    		         "a","b","c","d","e","f","g","h","i","j","k","l","m",	
	    		         "n","o","p","q","r","s","t","u","v","w","x","y","z" };
	    	String code="";
	    	 for(int i=0;i<num;i++){
	    		 code+=str[(int) Math.floor(Math.random()*36)];
	    	 }
	    	  return code;
	    }

}
