package com.chenjie.controller;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("----");
		String data = "chenjie     12";
		int bt = data.lastIndexOf(" ");
		System.out.println(data.substring(0, bt));
		System.out.println(data.substring(bt+1,data.length()));
		
		System.out.println("------------");
		
		String[] ss = data.split(" ");
		System.out.println(ss[0]);
		System.out.println(ss[ss.length-1]);
		for(String s:ss)
			System.out.println(s);
	}

}
